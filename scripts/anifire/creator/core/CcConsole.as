package anifire.creator.core
{
   import anifire.component.CCThumb;
   import anifire.constant.CcLibConstant;
   import anifire.constant.CcServerConstant;
   import anifire.constant.LicenseConstants;
   import anifire.constant.ServerConstants;
   import anifire.constant.ThemeConstants;
   import anifire.creator.components.ConfirmPopUp;
   import anifire.creator.events.CcCoreEvent;
   import anifire.creator.events.CcPointUpdateEvent;
   import anifire.creator.events.CcSaveCharEvent;
   import anifire.creator.interfaces.ICcCharEditorContainer;
   import anifire.creator.interfaces.ICcMainUiContainer;
   import anifire.creator.interfaces.ICcPreviewAndSaveContainer;
   import anifire.creator.interfaces.IConfiguration;
   import anifire.creator.models.CcCharacter;
   import anifire.creator.models.CcTheme;
   import anifire.event.LoadEmbedMovieEvent;
   import anifire.event.StudioEvent;
   import anifire.managers.AmplitudeAnalyticsManager;
   import anifire.managers.AppConfigManager;
   import anifire.managers.ExternalLinkManager;
   import anifire.managers.NativeCursorManager;
   import anifire.managers.ServerConnector;
   import anifire.util.UtilCrypto;
   import anifire.util.UtilDict;
   import anifire.util.UtilErrorLogger;
   import anifire.util.UtilHashArray;
   import anifire.util.UtilNetwork;
   import anifire.util.UtilSite;
   import anifire.util.UtilURLStream;
   import anifire.util.UtilUser;
   import com.adobe.serialization.json.JS0N;
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.external.ExternalInterface;
   import flash.net.URLLoader;
   import flash.net.URLLoaderDataFormat;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   import flash.net.URLStream;
   import flash.net.URLVariables;
   import flash.utils.ByteArray;
   import flash.utils.setTimeout;
   import mx.core.FlexGlobals;
   import mx.core.IFlexDisplayObject;
   import mx.utils.Base64Encoder;
   import mx.utils.StringUtil;
   import nochump.util.zip.ZipEntry;
   import spark.events.PopUpEvent;
   
   public class CcConsole implements IEventDispatcher
   {
      
      private static var _cc_console:CcConsole;
      
      private static var _themeId:String = "";
      
      private static var _cfg:IConfiguration;
      
      private static var _configManager:AppConfigManager = AppConfigManager.instance;
      
      private static var _updatePopUp:IFlexDisplayObject;
       
      
      private var _eventDispatcher:EventDispatcher;
      
      private var _ccCharEditorController:CcCharEditorController;
      
      private var _ccPreviewAndSaveController:CcPreviewAndSaveController;
      
      private var _ccChar:CcCharacter;
      
      private var _themes:UtilHashArray;
      
      private var _currentThemeId:String;
      
      private var _ui_mainUiContainer:ICcMainUiContainer;
      
      private var _moneyMode:int;
      
      private var _isUserLogined:Boolean;
      
      private var _userLevel:int;
      
      private var _original_assetId:String;
      
      private var _coupon:int = 0;
      
      private var _upsellHookId:String;
      
      private var _expectedUserType:Number = -1;
      
      private var _serverConnector:ServerConnector;
      
      private var _modeInEdit:Boolean = true;
      
      public function CcConsole(param1:ICcMainUiContainer, param2:ICcCharEditorContainer, param3:ICcPreviewAndSaveContainer)
      {
         super();
         this._ui_mainUiContainer = param1;
         this._eventDispatcher = new EventDispatcher();
         this._themes = new UtilHashArray();
         var _loc4_:String = _configManager.getValue(ServerConstants.PARAM_THEME_ID);
         if(_loc4_ == null || _loc4_.length <= 0)
         {
            _loc4_ = ThemeConstants.BUSINESS_THEME_ID;
         }
         else if(ThemeConstants.isThemeRetired(_loc4_))
         {
            _loc4_ = "";
            return;
         }
         setThemeId(_loc4_);
         this.originalAssetId = _configManager.getValue("original_asset_id") as String;
         if(this.originalAssetId == null || this.originalAssetId.length <= 0)
         {
            this.originalAssetId = null;
         }
         var _loc5_:String = _configManager.getValue(ServerConstants.FLASHVAR_IS_USER_LOGIN_MODE) as String;
         if(_loc5_ == "Y")
         {
            this._isUserLogined = true;
         }
         else
         {
            this._isUserLogined = false;
         }
         this.addCallBacks();
         var _loc6_:String = _configManager.getValue(ServerConstants.FLASHVAR_MONEY_MODE) as String;
         this.initMoneyMode(_loc6_);
         var _loc7_:String = _configManager.getValue(ServerConstants.FLASHVAR_IS_ADMIN) as String;
         if(_loc7_ == "1")
         {
            this._userLevel = CcLibConstant.USER_LEVEL_SUPER;
         }
         else
         {
            this._userLevel = CcLibConstant.USER_LEVEL_NORMAL;
         }
         this._ccCharEditorController = new CcCharEditorController();
         this.ccCharEditorController.configuration = _cfg;
         this.ccCharEditorController.initUi(param2);
         this.ccCharEditorController.addEventListener(CcCoreEvent.USER_WANT_TO_PREVIEW,this.onUserWantToPreview);
         this.ccCharEditorController.addEventListener(CcCoreEvent.USER_WANT_TO_MODIFY,this.onUserWantToModify);
         this.ccCharEditorController.addEventListener(CcCoreEvent.USER_WANT_TO_SAVE,this.onUserWantToSave);
         this._ccPreviewAndSaveController = new CcPreviewAndSaveController();
         this._ccPreviewAndSaveController.configuration = _cfg;
         this.ccPreviewAndSaveController.initUi(param3);
         this.ccPreviewAndSaveController.addEventListener(CcCoreEvent.USER_WANT_TO_CANCEL,this.onUserWantToEditAgain);
         this.ccPreviewAndSaveController.addEventListener(CcCoreEvent.USER_WANT_TO_CONFIRM,this.onUserWantToConfirm);
         this.ccPreviewAndSaveController.addEventListener(CcCoreEvent.USER_WANT_TO_MODIFY,this.onUserWantToModify);
         this.ccPreviewAndSaveController.addEventListener(CcCoreEvent.USER_WANT_TO_SAVE,this.onUserWantToSave);
         this._serverConnector = ServerConnector.instance;
         this._serverConnector.addEventListener(StudioEvent.UPGRADE_PENDING,this.onUpgradePending);
         this._serverConnector.addEventListener(StudioEvent.UPGRADE_COMPLETE,this.onUpgradeComplete);
         this._serverConnector.addEventListener(StudioEvent.UPGRADE_ERROR,this.onUpgradeError);
         this.loadCcThemeList();
      }
      
      public static function setThemeId(param1:String) : void
      {
         _themeId = param1;
      }
      
      public static function setConfiguration(param1:IConfiguration) : void
      {
         _cfg = param1;
      }
      
      public static function initializeCcConsole(param1:ICcMainUiContainer, param2:ICcCharEditorContainer, param3:ICcPreviewAndSaveContainer) : CcConsole
      {
         if(_cc_console == null)
         {
            _cc_console = new CcConsole(param1,param2,param3);
         }
         return _cc_console;
      }
      
      public static function getCcConsole() : CcConsole
      {
         if(_cc_console != null)
         {
            return _cc_console;
         }
         throw new Error("CcConsole must be intialized first");
      }
      
      public function get configuration() : IConfiguration
      {
         return _cfg;
      }
      
      private function get coupon() : int
      {
         return this._coupon;
      }
      
      private function get originalAssetId() : String
      {
         return this._original_assetId;
      }
      
      private function set originalAssetId(param1:String) : void
      {
         this._original_assetId = param1;
      }
      
      private function get isUserLogined() : Boolean
      {
         return this._isUserLogined;
      }
      
      private function get moneyMode() : int
      {
         return this._moneyMode;
      }
      
      private function get userLevel() : int
      {
         return this._userLevel;
      }
      
      private function get ui_mainUiContainer() : ICcMainUiContainer
      {
         return this._ui_mainUiContainer;
      }
      
      private function get ccCharEditorController() : CcCharEditorController
      {
         return this._ccCharEditorController;
      }
      
      private function get ccPreviewAndSaveController() : CcPreviewAndSaveController
      {
         return this._ccPreviewAndSaveController;
      }
      
      private function get ccChar() : CcCharacter
      {
         return this._ccChar;
      }
      
      public function resetExpectedUserType() : void
      {
         this._expectedUserType = -1;
         this._upsellHookId = null;
      }
      
      private function initMoneyMode(param1:String) : void
      {
         if(param1 == "free")
         {
            this._moneyMode = CcLibConstant.MONEY_MODE_NORMAL;
            this._coupon = CcLibConstant.COUPON_VALUE;
         }
         else if(param1 == "noneed")
         {
            this._moneyMode = CcLibConstant.MONEY_MODE_DONT_NEED_MONEY;
         }
         else if(param1 == "school")
         {
            this._moneyMode = CcLibConstant.MONEY_MODE_SCHOOL;
         }
         else
         {
            this._moneyMode = CcLibConstant.MONEY_MODE_NORMAL;
         }
      }
      
      private function onUpgradeComplete(param1:Event) : void
      {
         this.ccCharEditorController.updateTopButtonOnRole();
         this.ccPreviewAndSaveController.updateTopButtonOnRole();
      }
      
      private function onUpgradeError(param1:Event) : void
      {
         UtilErrorLogger.getInstance().appendCustomError("Failed to refresh user type: " + param1);
      }
      
      private function onUpgradePending(param1:Event) : void
      {
         var _loc2_:ConfirmPopUp = new ConfirmPopUp();
         _loc2_.message = UtilDict.toDisplay("go","Once you complete your purchase, please save this character.");
         _loc2_.title = UtilDict.toDisplay("go","Refresh to Unlock Features");
         _loc2_.confirmText = UtilDict.toDisplay("go","OK");
         _loc2_.addEventListener(StudioEvent.POPUP_CONFIRM,this.onConfirmAlert);
         _loc2_.showCancelButton = false;
         _loc2_.showCloseButton = false;
         _loc2_.open(FlexGlobals.topLevelApplication as DisplayObjectContainer,true);
      }
      
      private function onConfirmAlert(param1:Event) : void
      {
         ServerConnector.instance.refreshUserType();
      }
      
      private function addCallBacks() : void
      {
         if(ExternalInterface.available)
         {
            ExternalInterface.addCallback("ccUpgradePending",this.onUpgradeActived);
         }
      }
      
      private function addTheme(param1:CcTheme) : void
      {
         this._themes.push(param1.id,param1);
      }
      
      private function getTheme(param1:String) : CcTheme
      {
         return this._themes.getValueByKey(param1) as CcTheme;
      }
      
      private function setCurrentThemeId(param1:String) : void
      {
         this._currentThemeId = param1;
      }
      
      private function getCurrentThemeId() : String
      {
         return this._currentThemeId;
      }
      
      private function loadCcThemeList() : void
      {
         this.onLoadCcThemeListComplete();
      }
      
      public function isCopyingChar() : Boolean
      {
         return this.originalAssetId == null?false:true;
      }
      
      public function getTemplateCCPreMadeChars() : Array
      {
         var _loc1_:CcTheme = this.getTheme(this.getCurrentThemeId());
         return _loc1_.preMadeChars;
      }
      
      public function refreshTemplateCCSelector(param1:Array, param2:String = "default") : void
      {
         var _console:CcConsole = null;
         var char:CcCharacter = null;
         var chars:Array = param1;
         var tag:String = param2;
         _console = this;
         var _numCC:int = chars.length;
         var numCCStarted:int = 0;
         if(chars.length == 0)
         {
            return;
         }
         for each(char in chars)
         {
            function():void
            {
               var _ccChar:* = undefined;
               var stream:* = undefined;
               var request:* = undefined;
               var _ccActionHandler:* = undefined;
               _ccChar = char;
               stream = new UtilURLStream();
               _ccActionHandler = function(param1:Event):void
               {
                  stream.removeEventListener(Event.COMPLETE,_ccActionHandler);
                  parseCCActionZipEventHandler({
                     "char":_ccChar,
                     "streamEvent":param1,
                     "tag":tag
                  });
               };
               request = UtilNetwork.getGetCcActionRequest(char.assetId,char.thumbnailActionId + ".zip");
               stream.addEventListener(Event.COMPLETE,_ccActionHandler);
               addEventListener(CcCoreEvent.LOAD_CHARACTER_THUMB_COMPLETE,function(param1:CcCoreEvent):void
               {
                  if(--_numCC <= 0)
                  {
                     _console.dispatchEvent(new CcCoreEvent(CcCoreEvent.LOAD_CHARACTER_THUMB_ALL_COMPLETE,_console,{
                        "tag":tag,
                        "total":chars.length
                     }));
                  }
               });
               stream.load(request);
            }();
         }
      }
      
      private function onUserWantToStart(param1:Event) : void
      {
         this.ccCharEditorController.initTheme(this.getTheme(this.getCurrentThemeId()));
         this.ccCharEditorController.initMode(this.moneyMode,this.isUserLogined,this.userLevel,this.coupon);
         this.ccCharEditorController.start(this.ccChar,!this.isCopyingChar());
         this.ccPreviewAndSaveController.initTheme(this.getTheme(this.getCurrentThemeId()));
         this.ccPreviewAndSaveController.initMode();
         this.ccPreviewAndSaveController.initChar(this.ccChar);
         this._modeInEdit = true;
         if(_configManager.getValue(ServerConstants.FLASHVAR_CC_START_PAGE) == "save")
         {
            this.onUserWantToPreview(param1);
         }
         this.dispatchEvent(new CcCoreEvent(CcCoreEvent.LOAD_EVERYTHING_COMPLETE,this));
      }
      
      private function onUserWantToModify(param1:Event) : void
      {
         this._modeInEdit = true;
         this.ui_mainUiContainer.ui_main_ccCharEditor.visible = true;
         this.ui_mainUiContainer.ui_main_ccCharPreviewAndSaveScreen.visible = false;
         this.ccCharEditorController.proceedToShow();
      }
      
      private function onUserWantToPreview(param1:Event) : void
      {
         this._modeInEdit = false;
         this.ui_mainUiContainer.ui_main_ccCharEditor.visible = false;
         this.ui_mainUiContainer.ui_main_ccCharPreviewAndSaveScreen.visible = true;
         this.ccPreviewAndSaveController.proceedToShow();
      }
      
      private function onUserWantToGoToStudio(param1:Event) : void
      {
         var _loc4_:Object = null;
         if(UtilSite.siteId == UtilSite.YOUTUBE || UtilSite.siteId == UtilSite.SKOLETUBE)
         {
            ExternalLinkManager.instance.navigate(ServerConstants.YOUTUBE_CREATE_MOVIE_PATH);
            return;
         }
         var _loc2_:CcTheme = this.getTheme(this.getCurrentThemeId());
         var _loc3_:String = ServerConstants.STUDIO_PAGE_PATH;
         if(_loc2_.studioThemeId)
         {
            LicenseConstants.visitStudioByTheme(_loc2_.studioThemeId);
            return;
         }
         if(param1 is CcCoreEvent)
         {
            _loc4_ = (param1 as CcCoreEvent).getData();
            if(_loc4_ != null && String(_loc4_) != "")
            {
               _loc3_ = String(_loc4_);
            }
         }
         ExternalLinkManager.instance.navigateWithSession(_loc3_);
      }
      
      private function doUpdatePreviewStatus(param1:CcPointUpdateEvent) : void
      {
         (param1.target as IEventDispatcher).removeEventListener(param1.type,this.doUpdatePreviewStatus);
      }
      
      private function doUpdatePreviewStatusAndConfirm(param1:CcPointUpdateEvent) : void
      {
         (param1.target as IEventDispatcher).removeEventListener(param1.type,this.doUpdatePreviewStatusAndConfirm);
      }
      
      private function onUserWantToConfirm(param1:Event) : void
      {
         if(CcLibConstant.IS_BUSINESS_THEME && !UtilUser.hasBusinessFeatures)
         {
            this._expectedUserType = UtilUser.PUBLISH_USER;
         }
         else if(UtilUser.userType == UtilUser.BASIC_USER)
         {
            this._expectedUserType = UtilUser.PLUS_USER;
         }
         if(this._expectedUserType > -1)
         {
            this._serverConnector.refreshUserType();
            return;
         }
         this.onUserWantToSave(null);
      }
      
      private function onUserWantToSave(param1:Event) : void
      {
         this.addEventListener(CcSaveCharEvent.SAVE_CHAR_COMPLETE,this.doTellUserSaveStatus);
         this.addEventListener(CcSaveCharEvent.SAVE_CHAR_NOT_ENOUGH_MONEY_POINT,this.doTellUserSaveStatus);
         this.addEventListener(CcSaveCharEvent.SAVE_CHAR_ERROR_OCCUR,this.doTellUserSaveStatus);
         if(this._modeInEdit)
         {
            this.ccCharEditorController.addEventListener(LoadEmbedMovieEvent.COMPLETE_EVENT,this.doSave);
            this.ccCharEditorController.resetCCAction();
         }
         else
         {
            this.ccPreviewAndSaveController.addEventListener(LoadEmbedMovieEvent.COMPLETE_EVENT,this.doSave);
            this.ccPreviewAndSaveController.resetCCAction();
         }
      }
      
      private function doSave(param1:Event) : void
      {
         NativeCursorManager.instance.setBusyCursor();
         FlexGlobals.topLevelApplication.enabled = false;
         setTimeout(this.save,5000);
      }
      
      private function doTellUserSaveStatus(param1:CcSaveCharEvent) : void
      {
         var isTemplate:Boolean = false;
         var js:String = null;
         var event:CcSaveCharEvent = param1;
         this.removeEventListener(CcSaveCharEvent.SAVE_CHAR_COMPLETE,this.doTellUserSaveStatus);
         this.removeEventListener(CcSaveCharEvent.SAVE_CHAR_NOT_ENOUGH_MONEY_POINT,this.doTellUserSaveStatus);
         this.removeEventListener(CcSaveCharEvent.SAVE_CHAR_ERROR_OCCUR,this.doTellUserSaveStatus);
         if(event.type == CcSaveCharEvent.SAVE_CHAR_COMPLETE)
         {
            this.ccPreviewAndSaveController.proceedToSaveComplete(event.gopoint,event.gobuck,event.assetId);
            try
            {
               isTemplate = false;
               if(this.ccChar.copiedFromTemplate)
               {
                  try
                  {
                     isTemplate = !this.ccChar.isTemplateModified();
                  }
                  catch(e2:Error)
                  {
                  }
               }
               js = StringUtil.substitute("CCStandaloneBannerAdUI.gaLogTx.logCCPartsNormal({0}, {1}, {2})",event.assetId,JS0N.encode(event.gaTrackModel.parts.filter(function(param1:*, param2:int, param3:Array):Boolean
               {
                  return (["GoUpper","GoLower","upper_body","lower_body","hair"] as Array).indexOf(param1.ctype) >= 0;
               })),!!isTemplate?this.ccChar.templateId:"0");
               ExternalInterface.call(js);
            }
            catch(e:Error)
            {
            }
         }
         else if(event.type == CcSaveCharEvent.SAVE_CHAR_NOT_ENOUGH_MONEY_POINT)
         {
            this.ccPreviewAndSaveController.proceedToSaveNotEnoughMoney(event.gopoint,event.gobuck);
         }
         else if(event.type == CcSaveCharEvent.SAVE_CHAR_ERROR_OCCUR)
         {
            this.ccPreviewAndSaveController.proceedToSaveError();
         }
      }
      
      private function onUserWantToEditAgain(param1:Event) : void
      {
      }
      
      private function onLoadCcThemeListComplete() : void
      {
         this.setCurrentThemeId(_themeId);
         this.addEventListener(CcCoreEvent.LOAD_THEME_COMPLETE,this.doLoadPreMadeChar);
         this.loadCcTheme(this.getCurrentThemeId());
      }
      
      private function loadLatestPreMadeChars(param1:Event) : void
      {
         var e:Event = param1;
         (e.currentTarget as CcTheme).removeEventListener(CcCoreEvent.LOAD_PRE_MADE_CHARACTER_COMPLETE,this.loadLatestPreMadeChars);
         var preMadeChars:Array = (e.currentTarget as CcTheme).preMadeChars.slice().filter(function(param1:CcCharacter, param2:int, param3:Array):Boolean
         {
            return "professions" == param1.category;
         });
         preMadeChars.sortOn("createDateTime",Array.DESCENDING);
         this.refreshTemplateCCSelector(preMadeChars.slice(0,6),"latest");
      }
      
      private function loadRandomPreMadeChars(param1:Event) : void
      {
         var idx:int = 0;
         var e:Event = param1;
         (e.currentTarget as CcTheme).removeEventListener(CcCoreEvent.LOAD_PRE_MADE_CHARACTER_COMPLETE,this.loadRandomPreMadeChars);
         var preMadeChars:Array = (e.currentTarget as CcTheme).preMadeChars.slice().filter(function(param1:CcCharacter, param2:int, param3:Array):Boolean
         {
            return "professions" == param1.category;
         });
         var randCharList:Array = [];
         if(preMadeChars.length <= 6)
         {
            randCharList = preMadeChars.slice(0,6);
         }
         else
         {
            while(randCharList.length < 6)
            {
               idx = int(Math.random() * preMadeChars.length);
               if(randCharList.indexOf(preMadeChars[idx]) < 0)
               {
                  randCharList.push(preMadeChars[idx]);
               }
            }
         }
         this.refreshTemplateCCSelector(randCharList,"latest");
      }
      
      private function doLoadPreMadeChar(param1:Event) : void
      {
         (param1.target as IEventDispatcher).removeEventListener(param1.type,this.doLoadPreMadeChar);
         var _loc2_:CcTheme = this.getTheme(this.getCurrentThemeId());
         if(this.originalAssetId != null)
         {
            _loc2_.addEventListener(CcCoreEvent.LOAD_PRE_MADE_CHARACTER_COMPLETE,this.doLoadExistingCcChar);
         }
         else
         {
            _loc2_.addEventListener(CcCoreEvent.LOAD_PRE_MADE_CHARACTER_COMPLETE,this.doPrepareCcChar);
         }
         _loc2_.addEventListener(CcCoreEvent.LOAD_PRE_MADE_CHARACTER_COMPLETE,this.doEnableUserToStartUseCC);
         if(_cfg.loadPreMadeCharsEnabled())
         {
            _loc2_.addEventListener(CcCoreEvent.LOAD_PRE_MADE_CHARACTER_COMPLETE,this.loadLatestPreMadeChars);
            _loc2_.initCcThemePreMadeChar();
         }
         else
         {
            _loc2_.dispatchEvent(new CcCoreEvent(CcCoreEvent.LOAD_PRE_MADE_CHARACTER_COMPLETE,this,null));
         }
      }
      
      private function doEnableUserToStartUseCC(param1:Event) : void
      {
         var self:CcConsole = null;
         var proceedHandler:Function = null;
         var event:Event = param1;
         (event.target as IEventDispatcher).removeEventListener(event.type,this.doEnableUserToStartUseCC);
         self = this;
         proceedHandler = function(param1:CcCoreEvent):void
         {
            self.removeEventListener(CcCoreEvent.LOAD_EXISTING_CHAR_COMPLETE,proceedHandler);
            onUserWantToStart(event);
         };
         if(this.originalAssetId != null)
         {
            this.addEventListener(CcCoreEvent.LOAD_EXISTING_CHAR_COMPLETE,proceedHandler);
         }
         else
         {
            this.onUserWantToStart(event);
         }
      }
      
      private function doPrepareCcChar(param1:Event) : void
      {
         (param1.target as IEventDispatcher).removeEventListener(param1.type,this.doPrepareCcChar);
         this._ccChar = new CcCharacter();
         if(_themeId == "cc2" || _themeId == "chibi" || _themeId == "ninja")
         {
            this._ccChar.ver = 2;
         }
         var _loc2_:CcTheme = this.getTheme(this.getCurrentThemeId());
         var _loc3_:Array = _loc2_.getBodyShapeTypes();
         var _loc4_:String = _loc3_[int(Math.floor(Math.random() * _loc2_.getBodyShapeTypes().length))] as String;
      }
      
      private function doLoadExistingCcChar(param1:Event) : void
      {
         (param1.target as IEventDispatcher).removeEventListener(param1.type,this.doLoadExistingCcChar);
         this.addEventListener(CcCoreEvent.LOAD_EXISTING_CHAR_COMPLETE,this.doPrepareExistingCcChar);
         this.loadExistingCharCompositionXml(_configManager.getValue("original_asset_id") as String);
      }
      
      private function prepareExistingCcChar(param1:String) : void
      {
         this._ccChar = new CcCharacter();
         var _loc2_:UtilHashArray = new UtilHashArray();
         _loc2_.push(this.getCurrentThemeId(),this.getTheme(this.getCurrentThemeId()));
         this._ccChar.deserialize(new XML(param1),_loc2_);
      }
      
      private function doPrepareExistingCcChar(param1:CcCoreEvent) : void
      {
         (param1.target as IEventDispatcher).removeEventListener(param1.type,this.doPrepareExistingCcChar);
         this.prepareExistingCcChar(param1.getData() as String);
      }
      
      private function save() : void
      {
         var _loc1_:ByteArray = null;
         var _loc2_:Base64Encoder = null;
         var _loc3_:ByteArray = null;
         var _loc4_:Base64Encoder = null;
         NativeCursorManager.instance.setBusyCursor();
         AmplitudeAnalyticsManager.instance.log(AmplitudeAnalyticsManager.EVENT_NAME_CREATED_CHARACTER);
         if(this._modeInEdit)
         {
            _loc1_ = this._ccCharEditorController.saveSnapShot();
            _loc3_ = this._ccCharEditorController.saveSnapShot(true);
         }
         else
         {
            _loc1_ = this._ccPreviewAndSaveController.saveSnapShot();
            _loc3_ = this._ccPreviewAndSaveController.saveSnapShot(true);
         }
         _loc2_ = new Base64Encoder();
         _loc2_.encodeBytes(_loc1_);
         _loc4_ = new Base64Encoder();
         _loc4_.encodeBytes(_loc3_);
         var _loc5_:URLLoader = new URLLoader();
         var _loc6_:URLRequest = new URLRequest(CcServerConstant.ACTION_SAVE_CC_CHAR);
         var _loc7_:URLVariables = new URLVariables();
         _configManager.appendURLVariables(_loc7_);
         _loc7_["body"] = this.serialize();
         _loc7_["title"] = "Untitled";
         _loc7_["imagedata"] = _loc2_.flush();
         _loc7_["thumbdata"] = _loc4_.flush();
         if(this.ccChar.assetId != "")
         {
            _loc7_["assetId"] = this.ccChar.assetId;
         }
         _loc6_.data = _loc7_;
         _loc6_.method = URLRequestMethod.POST;
         _loc5_.dataFormat = URLLoaderDataFormat.TEXT;
         _loc5_.addEventListener(Event.COMPLETE,this.saveCharacter_completeHandler);
         _loc5_.addEventListener(IOErrorEvent.IO_ERROR,this.saveCharacter_errorHandler);
         _loc5_.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.saveCharacter_errorHandler);
         _loc5_.load(_loc6_);
      }
      
      private function saveCharacter_completeHandler(param1:Event) : void
      {
         NativeCursorManager.instance.removeBusyCursor();
         var _loc2_:URLLoader = param1.target as URLLoader;
         var _loc3_:String = _loc2_.data as String;
         _loc2_.removeEventListener(Event.COMPLETE,this.saveCharacter_completeHandler);
         _loc2_.removeEventListener(IOErrorEvent.IO_ERROR,this.saveCharacter_errorHandler);
         _loc2_.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,this.saveCharacter_errorHandler);
         var _loc4_:String = _loc3_.slice(0,1);
         var _loc5_:String = _loc3_.slice(1);
         if(_loc4_ == "1" && _loc5_ == ServerConstants.ERROR_CODE_LOGGED_OUT)
         {
            this.showLoggedOutPopUp();
         }
         else if(ExternalInterface.available)
         {
            ExternalInterface.call("characterSaved");
         }
      }
      
      private function saveCharacter_errorHandler(param1:Event) : void
      {
         var _loc2_:URLLoader = param1.target as URLLoader;
         _loc2_.removeEventListener(Event.COMPLETE,this.saveCharacter_completeHandler);
         _loc2_.removeEventListener(IOErrorEvent.IO_ERROR,this.saveCharacter_errorHandler);
         _loc2_.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,this.saveCharacter_errorHandler);
         this.dispatchEvent(new CcSaveCharEvent(CcSaveCharEvent.SAVE_CHAR_ERROR_OCCUR,this));
      }
      
      private function showLoggedOutPopUp() : void
      {
         var _loc1_:ConfirmPopUp = new ConfirmPopUp();
         _loc1_.title = UtilDict.translate("Logged out");
         _loc1_.message = UtilDict.translate("Login again to continue.\nUnsaved changes may have been lost.");
         _loc1_.confirmText = UtilDict.translate("Login");
         _loc1_.iconType = ConfirmPopUp.CONFIRM_POPUP_NO_ICON;
         _loc1_.showCancelButton = false;
         _loc1_.showCloseButton = false;
         _loc1_.addEventListener(PopUpEvent.CLOSE,this.loggedOutPopUp_closeHandler);
         _loc1_.open(FlexGlobals.topLevelApplication as DisplayObjectContainer,true);
      }
      
      private function loggedOutPopUp_closeHandler(param1:PopUpEvent) : void
      {
         ExternalLinkManager.instance.navigate(ServerConstants.LOGIN_PAGE_PATH);
      }
      
      private function serialize() : String
      {
         var _loc1_:String = "<?xml version=\"1.0\" encoding=\"utf-8\"?>" + this.ccChar.serialize();
         return _loc1_;
      }
      
      private function loadCcTheme(param1:String) : void
      {
         var _loc2_:CcTheme = new CcTheme();
         _loc2_.id = param1;
         this.addTheme(_loc2_);
         _loc2_.addEventListener(CcCoreEvent.LOAD_THEME_COMPLETE,this.onLoadCcThemeComplete);
         _loc2_.initCcThemeByLoadThemeFile(param1);
      }
      
      private function onLoadCcThemeComplete(param1:Event) : void
      {
         (param1.target as IEventDispatcher).removeEventListener(param1.type,this.onLoadCcThemeComplete);
         this.dispatchEvent(new CcCoreEvent(CcCoreEvent.LOAD_THEME_COMPLETE,this));
      }
      
      private function loadExistingCharCompositionXml(param1:String) : void
      {
         var _loc2_:URLRequest = null;
         var _loc3_:URLLoader = null;
         _loc2_ = new URLRequest(ServerConstants.ACTION_GET_CC_CHAR_COMPOSITION_XML);
         _loc2_.method = URLRequestMethod.POST;
         var _loc4_:URLVariables = new URLVariables();
         _configManager.appendURLVariables(_loc4_);
         _loc4_["assetId"] = param1;
         _loc2_.data = _loc4_;
         _loc3_ = new URLLoader();
         _loc3_.dataFormat = URLLoaderDataFormat.TEXT;
         _loc3_.addEventListener(Event.COMPLETE,this.onLoadExistingCharCompositionXmlComplete);
         _loc3_.load(_loc2_);
      }
      
      private function onLoadExistingCharCompositionXmlComplete(param1:Event) : void
      {
         var _loc4_:String = null;
         var _loc5_:CcCoreEvent = null;
         (param1.target as IEventDispatcher).removeEventListener(param1.type,this.onLoadExistingCharCompositionXmlComplete);
         var _loc2_:URLLoader = param1.target as URLLoader;
         var _loc3_:String = _loc2_.data as String;
         if(_loc3_.charAt(0) == "0")
         {
            _loc4_ = _loc3_.substr(1);
            _loc5_ = new CcCoreEvent(CcCoreEvent.LOAD_EXISTING_CHAR_COMPLETE,this,_loc4_);
            this.dispatchEvent(_loc5_);
         }
      }
      
      public function parseCCActionZipEventHandler(param1:Object) : void
      {
         var ccChar:CcCharacter = null;
         var decryptEngine:UtilCrypto = null;
         var swfBytes:ByteArray = null;
         var j:int = 0;
         var ccZipEntry:ZipEntry = null;
         var args:Object = null;
         var thumb:CCThumb = null;
         var ccConsole:CcConsole = null;
         var data:Object = param1;
         ccChar = data.char as CcCharacter;
         var event:Event = data.streamEvent as Event;
         var stream:URLStream = URLStream(event.target);
         swfBytes = new ByteArray();
         stream.readBytes(swfBytes,0,stream.bytesAvailable);
         try
         {
            args = new Object();
            thumb = new CCThumb();
            ccConsole = this;
            thumb.cellWidth = thumb.cellHeight = CcLibConstant.TEMPLATE_CCTHUMB_WIDTH;
            thumb.initByXml(XML(swfBytes));
         }
         catch(e:Error)
         {
            thumb.initByXml(XML(swfBytes));
         }
         thumb.addEventListener(LoadEmbedMovieEvent.COMPLETE_EVENT,function(param1:Event):void
         {
            ccConsole.dispatchEvent(new CcCoreEvent(CcCoreEvent.LOAD_CHARACTER_THUMB_COMPLETE,this,{
               "char":ccChar,
               "thumbnail":thumb,
               "tag":data.tag
            }));
         });
      }
      
      public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         this._eventDispatcher.addEventListener(param1,param2,param3,param4,param5);
      }
      
      public function dispatchEvent(param1:Event) : Boolean
      {
         return this._eventDispatcher.dispatchEvent(param1);
      }
      
      public function hasEventListener(param1:String) : Boolean
      {
         return this._eventDispatcher.hasEventListener(param1);
      }
      
      public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         return this._eventDispatcher.removeEventListener(param1,param2,param3);
      }
      
      public function willTrigger(param1:String) : Boolean
      {
         return this._eventDispatcher.willTrigger(param1);
      }
      
      private function onUpgradeActived(param1:Event = null) : void
      {
      }
   }
}
