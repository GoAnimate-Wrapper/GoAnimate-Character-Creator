package
{
   import anifire.component.EyeDropperScreenOverlay;
   import anifire.constant.ServerConstants;
   import anifire.creator.components.BodyShapeChooser;
   import anifire.creator.components.BodyShapeMegaChooser;
   import anifire.creator.components.CCLoadingScreen;
   import anifire.creator.components.CcColorPickers;
   import anifire.creator.components.CcComponentPropertyInspectorSpark;
   import anifire.creator.components.CharPreviewOption;
   import anifire.creator.components.CharPreviewer;
   import anifire.creator.components.ClothesChooser;
   import anifire.creator.components.ComponentThumbChooserSpark;
   import anifire.creator.components.DecorationPanel;
   import anifire.creator.components.ScaleChooserSpark;
   import anifire.creator.components.TopButtons;
   import anifire.creator.components.TypeChooserSpark;
   import anifire.creator.components.facePreview;
   import anifire.creator.config.GoAnimate;
   import anifire.creator.core.CcConsole;
   import anifire.creator.events.CcCoreEvent;
   import anifire.creator.interfaces.ICcCharEditorContainer;
   import anifire.creator.interfaces.ICcMainUiContainer;
   import anifire.creator.interfaces.ICcPreviewAndSaveContainer;
   import anifire.creator.skins.ArrowTipContainerSkin;
   import anifire.creator.skins.ConfirmPanelSkin;
   import anifire.creator.skins.ConfirmPopUpSkin;
   import anifire.creator.skins.DefaultButtonSkin;
   import anifire.creator.skins.DefaultDropDownListSkin;
   import anifire.creator.skins.DefaultHScrollBarSkin;
   import anifire.creator.skins.DefaultTextInputSkin;
   import anifire.creator.skins.DefaultVScrollBarSkin;
   import anifire.creator.skins.FlatColorPickerSkin;
   import anifire.creator.skins.IconButtonSkin;
   import anifire.creator.skins.MenuItemListSkin;
   import anifire.creator.skins.PrimaryButtonSkin;
   import anifire.creator.skins.TopToolBarButtonSkin;
   import anifire.managers.AppConfigManager;
   import anifire.util.Util;
   import anifire.util.UtilErrorLogger;
   import anifire.utils.SecurityUtils;
   import flash.events.Event;
   import flash.events.UncaughtErrorEvent;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.states.AddItems;
   import mx.states.SetProperty;
   import mx.states.State;
   import mx.styles.CSSCondition;
   import mx.styles.CSSSelector;
   import mx.styles.CSSStyleDeclaration;
   import spark.components.Application;
   import spark.components.Group;
   import spark.primitives.Line;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class creator extends Application implements ICcCharEditorContainer, ICcMainUiContainer, ICcPreviewAndSaveContainer, IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      {
         SecurityUtils.init();
      }
      
      private var _267076680_ce_bodyShapeMegaChooser:BodyShapeMegaChooser;
      
      private var _495053373_ce_buttonBar:TopButtons;
      
      private var _1957548724_ce_buttonBar_preview:TopButtons;
      
      private var _1163196673_ce_charPreviewer:CharPreviewer;
      
      private var _1041579653_ce_charScaleChooser:ScaleChooserSpark;
      
      private var _931590865_ce_clothesChooser:ClothesChooser;
      
      private var _627432557_ce_colorPicker:CcColorPickers;
      
      private var _1243488953_ce_componentChooserViewStack:Group;
      
      private var _740228964_ce_componentThumbChooser:ComponentThumbChooserSpark;
      
      private var _309190686_ce_componentTypeChooser:TypeChooserSpark;
      
      private var _1659818534_ce_facePreviewer:facePreview;
      
      private var _678855911_ce_mainEditorComponentsContainer:Group;
      
      private var _164421228_ce_mainViewStack:Group;
      
      private var _580013481_ce_selectedDecoration:DecorationPanel;
      
      private var _614936982_ce_thumbPropertyInspector:CcComponentPropertyInspectorSpark;
      
      public var _creator_CCLoadingScreen1:CCLoadingScreen;
      
      private var _1246058471_topControl:Group;
      
      private var _361540722ccCharPreviewAndSaveScreen:Group;
      
      private var _1393817655eyedropperScreenCap:EyeDropperScreenOverlay;
      
      private var _1703153366mainViewStack:Group;
      
      private var _1262756942ps_charPreviewCanvas:Group;
      
      private var _1970784ps_charPreviewOptionBox:CharPreviewOption;
      
      private var _1263293821ps_charPreviewer:CharPreviewer;
      
      private var _1995015763ps_interactionViewStack:Group;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _ccConsole:CcConsole;
      
      private var _componentInit:Boolean;
      
      private var _resourceInit:Boolean;
      
      protected var pendingStyleSheets:int;
      
      protected var localFlashVars:Boolean;
      
      protected var skipLocale:Boolean;
      
      protected var localClientTheme:Boolean;
      
      mx_internal var _creator_StylesInit_done:Boolean = false;
      
      private var _embed__font_StudioSparkMain_medium_normal_1328217743:Class;
      
      private var _embed__font_StudioSparkMain_medium_italic_932513666:Class;
      
      private var _embed__font_StudioSparkMain_bold_normal_252592600:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function creator()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._embed__font_StudioSparkMain_medium_normal_1328217743 = creator__embed__font_StudioSparkMain_medium_normal_1328217743;
         this._embed__font_StudioSparkMain_medium_italic_932513666 = creator__embed__font_StudioSparkMain_medium_italic_932513666;
         this._embed__font_StudioSparkMain_bold_normal_252592600 = creator__embed__font_StudioSparkMain_bold_normal_252592600;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._creator_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_creatorWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return creator[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.width = 960;
         this.height = 600;
         this.creationPolicy = "auto";
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this._creator_Array2_c);
         this.currentState = "loading";
         this.addEventListener("preinitialize",this.___creator_Application1_preinitialize);
         this.addEventListener("applicationComplete",this.___creator_Application1_applicationComplete);
         var _creator_CCLoadingScreen1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._creator_CCLoadingScreen1_i);
         states = [new State({
            "name":"loading",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_creator_CCLoadingScreen1_factory,
               "destination":null,
               "position":"after",
               "relativeTo":["eyedropperScreenCap"]
            })]
         }),new State({
            "name":"ready",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"mainViewStack",
               "name":"visible",
               "value":true
            })]
         })];
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         creator._watcherSetupUtil = param1;
      }
      
      override public function set moduleFactory(param1:IFlexModuleFactory) : void
      {
         var factory:IFlexModuleFactory = param1;
         super.moduleFactory = factory;
         if(this.__moduleFactoryInitialized)
         {
            return;
         }
         this.__moduleFactoryInitialized = true;
         if(!this.styleDeclaration)
         {
            this.styleDeclaration = new CSSStyleDeclaration(null,styleManager);
         }
         this.styleDeclaration.defaultFactory = function():void
         {
            this.backgroundAlpha = 0;
            this.backgroundColor = 16645629;
         };
         mx_internal::_creator_StylesInit();
      }
      
      override public function initialize() : void
      {
         super.initialize();
      }
      
      private function initApp() : void
      {
         if(this.skipLocale)
         {
            this.onClientLocaleComplete();
         }
         else
         {
            Util.loadClientLocale("go",this.onClientLocaleComplete);
         }
      }
      
      private function onClientLocaleComplete(param1:Event = null) : void
      {
         this.resourceComplete();
      }
      
      private function uncaughtErrorHandler(param1:UncaughtErrorEvent) : void
      {
         UtilErrorLogger.getInstance().fatal("uncaughtErrorHandler: " + new Error().getStackTrace());
      }
      
      private function onApplicationComplete() : void
      {
         this._componentInit = true;
         if(this._resourceInit)
         {
            this.initialConsole();
         }
      }
      
      private function resourceComplete() : void
      {
         this._resourceInit = true;
         if(this._componentInit)
         {
            this.initialConsole();
         }
      }
      
      private function initialConsole() : void
      {
         var _loc1_:AppConfigManager = AppConfigManager.instance;
         var _loc2_:String = _loc1_.getValue(ServerConstants.FLASHVAR_SITE_ID);
         CcConsole.setConfiguration(new GoAnimate());
         CcConsole.initializeCcConsole(this,this,this);
         this._ccConsole = CcConsole.getCcConsole();
         this._ccConsole.addEventListener(CcCoreEvent.LOAD_EVERYTHING_COMPLETE,this.loadComplete);
      }
      
      private function loadComplete(param1:Event) : void
      {
         this.setCurrentState("ready");
      }
      
      public function get ui_main_ViewStack() : Group
      {
         return this.mainViewStack;
      }
      
      public function get ui_main_ccCharEditor() : Group
      {
         return this._ce_mainViewStack;
      }
      
      public function get ui_main_ccCharPreviewAndSaveScreen() : Group
      {
         return this.ccCharPreviewAndSaveScreen;
      }
      
      public function get ui_ps_charPreviewer() : CharPreviewer
      {
         return this.ps_charPreviewer;
      }
      
      public function get ui_ps_interactionViewStack() : Group
      {
         return this.ps_interactionViewStack;
      }
      
      public function get ui_ps_charPreviewCanvas() : Group
      {
         return this.ps_charPreviewCanvas;
      }
      
      public function get ui_ps_charPreviewOptionBox() : CharPreviewOption
      {
         return this.ps_charPreviewOptionBox;
      }
      
      public function get ui_ce_bodyShapeMegaChooser() : BodyShapeMegaChooser
      {
         return this._ce_bodyShapeMegaChooser;
      }
      
      public function get ui_ce_bodyShapeChooser() : BodyShapeChooser
      {
         return this._ce_bodyShapeMegaChooser.bodyShapeChooser;
      }
      
      public function get ui_ce_componentTypeChooser() : TypeChooserSpark
      {
         return this._ce_componentTypeChooser;
      }
      
      public function get ui_ce_charPreviewer() : CharPreviewer
      {
         return this._ce_charPreviewer;
      }
      
      public function get ui_ce_facePreviewer() : CharPreviewer
      {
         return this._ce_facePreviewer.face;
      }
      
      public function get ui_ce_colorPicker() : CcColorPickers
      {
         return this._ce_colorPicker;
      }
      
      public function get ui_ce_buttonBar() : TopButtons
      {
         return this._ce_buttonBar;
      }
      
      public function get ui_ps_buttonBar() : TopButtons
      {
         return this._ce_buttonBar_preview;
      }
      
      public function get ui_ce_componentChooserViewStack() : Group
      {
         return this._ce_componentChooserViewStack;
      }
      
      public function get ui_ce_componentThumbChooser() : ComponentThumbChooserSpark
      {
         return this._ce_componentThumbChooser;
      }
      
      public function get ui_ce_clothesChooser() : ClothesChooser
      {
         return this._ce_clothesChooser;
      }
      
      public function get ui_ce_thumbPropertyInspector() : CcComponentPropertyInspectorSpark
      {
         return this._ce_thumbPropertyInspector;
      }
      
      public function get ui_ce_selectedDecoration() : DecorationPanel
      {
         return this._ce_selectedDecoration;
      }
      
      public function get ui_ce_mainViewStack() : Group
      {
         return this._ce_mainViewStack;
      }
      
      public function get ui_ce_mainEditorComponentsContainer() : Group
      {
         return this._ce_mainEditorComponentsContainer;
      }
      
      public function get ui_ce_charScaleChooser() : ScaleChooserSpark
      {
         return this._ce_charScaleChooser;
      }
      
      private function _creator_Array2_c() : Array
      {
         var _loc1_:Array = [this._creator_Group1_i(),this._creator_EyeDropperScreenOverlay1_i()];
         return _loc1_;
      }
      
      private function _creator_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.visible = false;
         _loc1_.clipAndEnableScrolling = true;
         _loc1_.mxmlContent = [this._creator_Rect1_c(),this._creator_Group2_i(),this._creator_Group6_i()];
         _loc1_.id = "mainViewStack";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.mainViewStack = _loc1_;
         BindingManager.executeBindings(this,"mainViewStack",this.mainViewStack);
         return _loc1_;
      }
      
      private function _creator_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.fill = this._creator_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _creator_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 15658734;
         return _loc1_;
      }
      
      private function _creator_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._creator_BodyShapeMegaChooser1_i(),this._creator_Group3_i()];
         _loc1_.id = "_ce_mainViewStack";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ce_mainViewStack = _loc1_;
         BindingManager.executeBindings(this,"_ce_mainViewStack",this._ce_mainViewStack);
         return _loc1_;
      }
      
      private function _creator_BodyShapeMegaChooser1_i() : BodyShapeMegaChooser
      {
         var _loc1_:BodyShapeMegaChooser = new BodyShapeMegaChooser();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.visible = false;
         _loc1_.id = "_ce_bodyShapeMegaChooser";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ce_bodyShapeMegaChooser = _loc1_;
         BindingManager.executeBindings(this,"_ce_bodyShapeMegaChooser",this._ce_bodyShapeMegaChooser);
         return _loc1_;
      }
      
      private function _creator_Group3_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.width = 960;
         _loc1_.height = 600;
         _loc1_.styleName = "bgCharEditor";
         _loc1_.mxmlContent = [this._creator_CharPreviewer1_i(),this._creator_facePreview1_i(),this._creator_Group4_i(),this._creator_CcColorPickers1_i(),this._creator_CcComponentPropertyInspectorSpark1_i(),this._creator_Group5_i(),this._creator_DecorationPanel1_i(),this._creator_ScaleChooserSpark1_i()];
         _loc1_.id = "_ce_mainEditorComponentsContainer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ce_mainEditorComponentsContainer = _loc1_;
         BindingManager.executeBindings(this,"_ce_mainEditorComponentsContainer",this._ce_mainEditorComponentsContainer);
         return _loc1_;
      }
      
      private function _creator_CharPreviewer1_i() : CharPreviewer
      {
         var _loc1_:CharPreviewer = new CharPreviewer();
         _loc1_.x = 609;
         _loc1_.y = 68;
         _loc1_.width = 300;
         _loc1_.height = 315;
         _loc1_.scaleX = 1.3;
         _loc1_.scaleY = 1.3;
         _loc1_.id = "_ce_charPreviewer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ce_charPreviewer = _loc1_;
         BindingManager.executeBindings(this,"_ce_charPreviewer",this._ce_charPreviewer);
         return _loc1_;
      }
      
      private function _creator_facePreview1_i() : facePreview
      {
         var _loc1_:facePreview = new facePreview();
         _loc1_.x = 654;
         _loc1_.y = 68;
         _loc1_.width = 300;
         _loc1_.height = 430;
         _loc1_.id = "_ce_facePreviewer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ce_facePreviewer = _loc1_;
         BindingManager.executeBindings(this,"_ce_facePreviewer",this._ce_facePreviewer);
         return _loc1_;
      }
      
      private function _creator_Group4_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.top = 0;
         _loc1_.left = 0;
         _loc1_.width = 960;
         _loc1_.height = 68;
         _loc1_.mxmlContent = [this._creator_Rect2_c(),this._creator_TypeChooserSpark1_i(),this._creator_TopButtons1_i(),this._creator_Line1_c(),this._creator_Line2_c()];
         _loc1_.id = "_topControl";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._topControl = _loc1_;
         BindingManager.executeBindings(this,"_topControl",this._topControl);
         return _loc1_;
      }
      
      private function _creator_Rect2_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.fill = this._creator_SolidColor2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _creator_SolidColor2_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 15658734;
         return _loc1_;
      }
      
      private function _creator_TypeChooserSpark1_i() : TypeChooserSpark
      {
         var _loc1_:TypeChooserSpark = new TypeChooserSpark();
         _loc1_.left = 4;
         _loc1_.top = 0;
         _loc1_.width = 640;
         _loc1_.height = 68;
         _loc1_.id = "_ce_componentTypeChooser";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ce_componentTypeChooser = _loc1_;
         BindingManager.executeBindings(this,"_ce_componentTypeChooser",this._ce_componentTypeChooser);
         return _loc1_;
      }
      
      private function _creator_TopButtons1_i() : TopButtons
      {
         var _loc1_:TopButtons = new TopButtons();
         _loc1_.right = 0;
         _loc1_.width = 300;
         _loc1_.height = 68;
         _loc1_.id = "_ce_buttonBar";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ce_buttonBar = _loc1_;
         BindingManager.executeBindings(this,"_ce_buttonBar",this._ce_buttonBar);
         return _loc1_;
      }
      
      private function _creator_Line1_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.percentWidth = 100;
         _loc1_.top = 0;
         _loc1_.stroke = this._creator_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _creator_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 13421772;
         return _loc1_;
      }
      
      private function _creator_Line2_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.percentWidth = 100;
         _loc1_.bottom = 0;
         _loc1_.stroke = this._creator_SolidColorStroke2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _creator_SolidColorStroke2_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 13421772;
         return _loc1_;
      }
      
      private function _creator_CcColorPickers1_i() : CcColorPickers
      {
         var _loc1_:CcColorPickers = new CcColorPickers();
         _loc1_.bottom = 10;
         _loc1_.right = 45;
         _loc1_.width = 248;
         _loc1_.height = 62;
         _loc1_.biggerElementWidth = 248;
         _loc1_.smallerElementWidth = 248;
         _loc1_.id = "_ce_colorPicker";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ce_colorPicker = _loc1_;
         BindingManager.executeBindings(this,"_ce_colorPicker",this._ce_colorPicker);
         return _loc1_;
      }
      
      private function _creator_CcComponentPropertyInspectorSpark1_i() : CcComponentPropertyInspectorSpark
      {
         var _loc1_:CcComponentPropertyInspectorSpark = new CcComponentPropertyInspectorSpark();
         _loc1_.bottom = 0;
         _loc1_.right = 0;
         _loc1_.id = "_ce_thumbPropertyInspector";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ce_thumbPropertyInspector = _loc1_;
         BindingManager.executeBindings(this,"_ce_thumbPropertyInspector",this._ce_thumbPropertyInspector);
         return _loc1_;
      }
      
      private function _creator_Group5_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.top = 68;
         _loc1_.left = 0;
         _loc1_.width = 654;
         _loc1_.height = 532;
         _loc1_.mxmlContent = [this._creator_Rect3_c(),this._creator_ComponentThumbChooserSpark1_i(),this._creator_ClothesChooser1_i()];
         _loc1_.id = "_ce_componentChooserViewStack";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ce_componentChooserViewStack = _loc1_;
         BindingManager.executeBindings(this,"_ce_componentChooserViewStack",this._ce_componentChooserViewStack);
         return _loc1_;
      }
      
      private function _creator_Rect3_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.fill = this._creator_SolidColor3_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _creator_SolidColor3_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 15658734;
         _loc1_.alpha = 0;
         return _loc1_;
      }
      
      private function _creator_ComponentThumbChooserSpark1_i() : ComponentThumbChooserSpark
      {
         var _loc1_:ComponentThumbChooserSpark = new ComponentThumbChooserSpark();
         _loc1_.biggerHeight = 532;
         _loc1_.width = 654;
         _loc1_.height = 532;
         _loc1_.id = "_ce_componentThumbChooser";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ce_componentThumbChooser = _loc1_;
         BindingManager.executeBindings(this,"_ce_componentThumbChooser",this._ce_componentThumbChooser);
         return _loc1_;
      }
      
      private function _creator_ClothesChooser1_i() : ClothesChooser
      {
         var _loc1_:ClothesChooser = new ClothesChooser();
         _loc1_.y = 10;
         _loc1_.percentWidth = 100;
         _loc1_.height = 250;
         _loc1_.visible = false;
         _loc1_.clipContent = false;
         _loc1_.thumbChooserWidth = 463;
         _loc1_.biggerHeight = 70;
         _loc1_.smallerHeight = 70;
         _loc1_.creationPolicy = "all";
         _loc1_.setStyle("verticalGap",50);
         _loc1_.id = "_ce_clothesChooser";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ce_clothesChooser = _loc1_;
         BindingManager.executeBindings(this,"_ce_clothesChooser",this._ce_clothesChooser);
         return _loc1_;
      }
      
      private function _creator_DecorationPanel1_i() : DecorationPanel
      {
         var _loc1_:DecorationPanel = new DecorationPanel();
         _loc1_.left = 0;
         _loc1_.bottom = 0;
         _loc1_.width = 654;
         _loc1_.height = 90;
         _loc1_.id = "_ce_selectedDecoration";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ce_selectedDecoration = _loc1_;
         BindingManager.executeBindings(this,"_ce_selectedDecoration",this._ce_selectedDecoration);
         return _loc1_;
      }
      
      private function _creator_ScaleChooserSpark1_i() : ScaleChooserSpark
      {
         var _loc1_:ScaleChooserSpark = new ScaleChooserSpark();
         _loc1_.bottom = 0;
         _loc1_.right = 0;
         _loc1_.id = "_ce_charScaleChooser";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ce_charScaleChooser = _loc1_;
         BindingManager.executeBindings(this,"_ce_charScaleChooser",this._ce_charScaleChooser);
         return _loc1_;
      }
      
      private function _creator_Group6_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.visible = false;
         _loc1_.mxmlContent = [this._creator_Group7_i()];
         _loc1_.id = "ccCharPreviewAndSaveScreen";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.ccCharPreviewAndSaveScreen = _loc1_;
         BindingManager.executeBindings(this,"ccCharPreviewAndSaveScreen",this.ccCharPreviewAndSaveScreen);
         return _loc1_;
      }
      
      private function _creator_Group7_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.x = 0;
         _loc1_.y = 0;
         _loc1_.percentWidth = 100;
         _loc1_.height = 600;
         _loc1_.mxmlContent = [this._creator_CharPreviewer2_i(),this._creator_Group8_i()];
         _loc1_.id = "ps_interactionViewStack";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.ps_interactionViewStack = _loc1_;
         BindingManager.executeBindings(this,"ps_interactionViewStack",this.ps_interactionViewStack);
         return _loc1_;
      }
      
      private function _creator_CharPreviewer2_i() : CharPreviewer
      {
         var _loc1_:CharPreviewer = new CharPreviewer();
         _loc1_.width = 300;
         _loc1_.height = 200;
         _loc1_.scaleX = 1.5;
         _loc1_.scaleY = 1.5;
         _loc1_.clipContent = false;
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 20;
         _loc1_.id = "ps_charPreviewer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.ps_charPreviewer = _loc1_;
         BindingManager.executeBindings(this,"ps_charPreviewer",this.ps_charPreviewer);
         return _loc1_;
      }
      
      private function _creator_Group8_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._creator_CharPreviewOption1_i(),this._creator_Group9_c()];
         _loc1_.id = "ps_charPreviewCanvas";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.ps_charPreviewCanvas = _loc1_;
         BindingManager.executeBindings(this,"ps_charPreviewCanvas",this.ps_charPreviewCanvas);
         return _loc1_;
      }
      
      private function _creator_CharPreviewOption1_i() : CharPreviewOption
      {
         var _loc1_:CharPreviewOption = new CharPreviewOption();
         _loc1_.bottom = 15;
         _loc1_.horizontalCenter = 0;
         _loc1_.id = "ps_charPreviewOptionBox";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.ps_charPreviewOptionBox = _loc1_;
         BindingManager.executeBindings(this,"ps_charPreviewOptionBox",this.ps_charPreviewOptionBox);
         return _loc1_;
      }
      
      private function _creator_Group9_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.top = 0;
         _loc1_.left = 0;
         _loc1_.width = 960;
         _loc1_.height = 68;
         _loc1_.mxmlContent = [this._creator_TopButtons2_i(),this._creator_Line3_c(),this._creator_Line4_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _creator_TopButtons2_i() : TopButtons
      {
         var _loc1_:TopButtons = new TopButtons();
         _loc1_.right = 0;
         _loc1_.width = 300;
         _loc1_.height = 68;
         _loc1_.id = "_ce_buttonBar_preview";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ce_buttonBar_preview = _loc1_;
         BindingManager.executeBindings(this,"_ce_buttonBar_preview",this._ce_buttonBar_preview);
         return _loc1_;
      }
      
      private function _creator_Line3_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.percentWidth = 100;
         _loc1_.top = 0;
         _loc1_.stroke = this._creator_SolidColorStroke3_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _creator_SolidColorStroke3_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 13421772;
         return _loc1_;
      }
      
      private function _creator_Line4_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.percentWidth = 100;
         _loc1_.bottom = 0;
         _loc1_.stroke = this._creator_SolidColorStroke4_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _creator_SolidColorStroke4_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 13421772;
         return _loc1_;
      }
      
      private function _creator_EyeDropperScreenOverlay1_i() : EyeDropperScreenOverlay
      {
         var _loc1_:EyeDropperScreenOverlay = new EyeDropperScreenOverlay();
         _loc1_.id = "eyedropperScreenCap";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.eyedropperScreenCap = _loc1_;
         BindingManager.executeBindings(this,"eyedropperScreenCap",this.eyedropperScreenCap);
         return _loc1_;
      }
      
      private function _creator_CCLoadingScreen1_i() : CCLoadingScreen
      {
         var _loc1_:CCLoadingScreen = new CCLoadingScreen();
         _loc1_.id = "_creator_CCLoadingScreen1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._creator_CCLoadingScreen1 = _loc1_;
         BindingManager.executeBindings(this,"_creator_CCLoadingScreen1",this._creator_CCLoadingScreen1);
         return _loc1_;
      }
      
      public function ___creator_Application1_preinitialize(param1:FlexEvent) : void
      {
         this.initApp();
      }
      
      public function ___creator_Application1_applicationComplete(param1:FlexEvent) : void
      {
         this.onApplicationComplete();
      }
      
      private function _creator_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Number
         {
            return 532 - _ce_selectedDecoration.height;
         },null,"_ce_componentThumbChooser.smallerHeight");
         return result;
      }
      
      mx_internal function _creator_StylesInit() : void
      {
         var style:CSSStyleDeclaration = null;
         var effects:Array = null;
         var conditions:Array = null;
         var condition:CSSCondition = null;
         var selector:CSSSelector = null;
         if(mx_internal::_creator_StylesInit_done)
         {
            return;
         }
         mx_internal::_creator_StylesInit_done = true;
         selector = null;
         conditions = null;
         conditions = null;
         selector = new CSSSelector("global",conditions,selector);
         style = styleManager.getStyleDeclaration("global");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.layoutDirection = "ltr";
            };
         }
         selector = null;
         conditions = null;
         conditions = null;
         selector = new CSSSelector("spark.components.Application",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Application");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.fontSize = 13;
            };
         }
         selector = null;
         conditions = null;
         conditions = null;
         selector = new CSSSelector("spark.components.HScrollBar",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.HScrollBar");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.skinClass = DefaultHScrollBarSkin;
            };
         }
         selector = null;
         conditions = null;
         conditions = null;
         selector = new CSSSelector("spark.components.VScrollBar",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.VScrollBar");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.skinClass = DefaultVScrollBarSkin;
            };
         }
         selector = null;
         conditions = null;
         conditions = null;
         selector = new CSSSelector("spark.components.supportClasses.TextBase",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.supportClasses.TextBase");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.fontLookup = "embeddedCFF";
               this.color = 5331305;
               this.fontStyle = "normal";
               this.fontFamily = "StudioSparkMain";
            };
         }
         selector = null;
         conditions = null;
         conditions = null;
         selector = new CSSSelector("spark.components.supportClasses.SkinnableTextBase",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.supportClasses.SkinnableTextBase");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.fontLookup = "embeddedCFF";
               this.color = 5331305;
               this.fontStyle = "normal";
               this.fontFamily = "StudioSparkMain";
            };
         }
         selector = null;
         conditions = null;
         conditions = null;
         selector = new CSSSelector("spark.components.RichEditableText",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.RichEditableText");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.fontLookup = "embeddedCFF";
               this.color = 5331305;
               this.fontStyle = "normal";
               this.fontFamily = "StudioSparkMain";
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("id","promptDisplay");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label#promptDisplay");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 13421772;
               this.fontStyle = "normal";
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("id","errorTextDisplay");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.RichText",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.RichText#errorTextDisplay");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.fontSize = 11;
            };
         }
         selector = null;
         conditions = null;
         conditions = null;
         selector = new CSSSelector("spark.components.TextInput",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.TextInput");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.borderColor = 13290196;
               this.skinClass = DefaultTextInputSkin;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","primary");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.primary");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.skinClass = PrimaryButtonSkin;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","default");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.default");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.skinClass = DefaultButtonSkin;
            };
         }
         selector = null;
         conditions = null;
         conditions = null;
         selector = new CSSSelector("anifire.creator.components.IconButton",conditions,selector);
         style = styleManager.getStyleDeclaration("anifire.creator.components.IconButton");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.skinClass = IconButtonSkin;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","topToolBar");
         conditions.push(condition);
         selector = new CSSSelector("anifire.components.IconButton",conditions,selector);
         style = styleManager.getStyleDeclaration("anifire.components.IconButton.topToolBar");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.skinClass = TopToolBarButtonSkin;
            };
         }
         selector = null;
         conditions = null;
         conditions = null;
         selector = new CSSSelector("anifire.creator.components.MenuItemList",conditions,selector);
         style = styleManager.getStyleDeclaration("anifire.creator.components.MenuItemList");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.skinClass = MenuItemListSkin;
            };
         }
         selector = null;
         conditions = null;
         conditions = null;
         selector = new CSSSelector("anifire.creator.components.ColorPicker",conditions,selector);
         style = styleManager.getStyleDeclaration("anifire.creator.components.ColorPicker");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.skinClass = FlatColorPickerSkin;
            };
         }
         selector = null;
         conditions = null;
         conditions = null;
         selector = new CSSSelector("anifire.creator.components.ArrowTipContainer",conditions,selector);
         style = styleManager.getStyleDeclaration("anifire.creator.components.ArrowTipContainer");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.skinClass = ArrowTipContainerSkin;
            };
         }
         selector = null;
         conditions = null;
         conditions = null;
         selector = new CSSSelector("spark.components.DropDownList",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.DropDownList");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.skinClass = DefaultDropDownListSkin;
            };
         }
         selector = null;
         conditions = null;
         conditions = null;
         selector = new CSSSelector("anifire.creator.components.ConfirmPopUp",conditions,selector);
         style = styleManager.getStyleDeclaration("anifire.creator.components.ConfirmPopUp");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.skinClass = ConfirmPopUpSkin;
               this.fontSize = 14;
            };
         }
         selector = null;
         conditions = null;
         conditions = null;
         selector = new CSSSelector("spark.components.Panel",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Panel");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.skinClass = ConfirmPanelSkin;
            };
         }
         styleManager.initProtoChainRoots();
      }
      
      [Bindable(event="propertyChange")]
      public function get _ce_bodyShapeMegaChooser() : BodyShapeMegaChooser
      {
         return this._267076680_ce_bodyShapeMegaChooser;
      }
      
      public function set _ce_bodyShapeMegaChooser(param1:BodyShapeMegaChooser) : void
      {
         var _loc2_:Object = this._267076680_ce_bodyShapeMegaChooser;
         if(_loc2_ !== param1)
         {
            this._267076680_ce_bodyShapeMegaChooser = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_ce_bodyShapeMegaChooser",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _ce_buttonBar() : TopButtons
      {
         return this._495053373_ce_buttonBar;
      }
      
      public function set _ce_buttonBar(param1:TopButtons) : void
      {
         var _loc2_:Object = this._495053373_ce_buttonBar;
         if(_loc2_ !== param1)
         {
            this._495053373_ce_buttonBar = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_ce_buttonBar",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _ce_buttonBar_preview() : TopButtons
      {
         return this._1957548724_ce_buttonBar_preview;
      }
      
      public function set _ce_buttonBar_preview(param1:TopButtons) : void
      {
         var _loc2_:Object = this._1957548724_ce_buttonBar_preview;
         if(_loc2_ !== param1)
         {
            this._1957548724_ce_buttonBar_preview = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_ce_buttonBar_preview",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _ce_charPreviewer() : CharPreviewer
      {
         return this._1163196673_ce_charPreviewer;
      }
      
      public function set _ce_charPreviewer(param1:CharPreviewer) : void
      {
         var _loc2_:Object = this._1163196673_ce_charPreviewer;
         if(_loc2_ !== param1)
         {
            this._1163196673_ce_charPreviewer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_ce_charPreviewer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _ce_charScaleChooser() : ScaleChooserSpark
      {
         return this._1041579653_ce_charScaleChooser;
      }
      
      public function set _ce_charScaleChooser(param1:ScaleChooserSpark) : void
      {
         var _loc2_:Object = this._1041579653_ce_charScaleChooser;
         if(_loc2_ !== param1)
         {
            this._1041579653_ce_charScaleChooser = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_ce_charScaleChooser",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _ce_clothesChooser() : ClothesChooser
      {
         return this._931590865_ce_clothesChooser;
      }
      
      public function set _ce_clothesChooser(param1:ClothesChooser) : void
      {
         var _loc2_:Object = this._931590865_ce_clothesChooser;
         if(_loc2_ !== param1)
         {
            this._931590865_ce_clothesChooser = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_ce_clothesChooser",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _ce_colorPicker() : CcColorPickers
      {
         return this._627432557_ce_colorPicker;
      }
      
      public function set _ce_colorPicker(param1:CcColorPickers) : void
      {
         var _loc2_:Object = this._627432557_ce_colorPicker;
         if(_loc2_ !== param1)
         {
            this._627432557_ce_colorPicker = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_ce_colorPicker",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _ce_componentChooserViewStack() : Group
      {
         return this._1243488953_ce_componentChooserViewStack;
      }
      
      public function set _ce_componentChooserViewStack(param1:Group) : void
      {
         var _loc2_:Object = this._1243488953_ce_componentChooserViewStack;
         if(_loc2_ !== param1)
         {
            this._1243488953_ce_componentChooserViewStack = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_ce_componentChooserViewStack",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _ce_componentThumbChooser() : ComponentThumbChooserSpark
      {
         return this._740228964_ce_componentThumbChooser;
      }
      
      public function set _ce_componentThumbChooser(param1:ComponentThumbChooserSpark) : void
      {
         var _loc2_:Object = this._740228964_ce_componentThumbChooser;
         if(_loc2_ !== param1)
         {
            this._740228964_ce_componentThumbChooser = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_ce_componentThumbChooser",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _ce_componentTypeChooser() : TypeChooserSpark
      {
         return this._309190686_ce_componentTypeChooser;
      }
      
      public function set _ce_componentTypeChooser(param1:TypeChooserSpark) : void
      {
         var _loc2_:Object = this._309190686_ce_componentTypeChooser;
         if(_loc2_ !== param1)
         {
            this._309190686_ce_componentTypeChooser = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_ce_componentTypeChooser",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _ce_facePreviewer() : facePreview
      {
         return this._1659818534_ce_facePreviewer;
      }
      
      public function set _ce_facePreviewer(param1:facePreview) : void
      {
         var _loc2_:Object = this._1659818534_ce_facePreviewer;
         if(_loc2_ !== param1)
         {
            this._1659818534_ce_facePreviewer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_ce_facePreviewer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _ce_mainEditorComponentsContainer() : Group
      {
         return this._678855911_ce_mainEditorComponentsContainer;
      }
      
      public function set _ce_mainEditorComponentsContainer(param1:Group) : void
      {
         var _loc2_:Object = this._678855911_ce_mainEditorComponentsContainer;
         if(_loc2_ !== param1)
         {
            this._678855911_ce_mainEditorComponentsContainer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_ce_mainEditorComponentsContainer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _ce_mainViewStack() : Group
      {
         return this._164421228_ce_mainViewStack;
      }
      
      public function set _ce_mainViewStack(param1:Group) : void
      {
         var _loc2_:Object = this._164421228_ce_mainViewStack;
         if(_loc2_ !== param1)
         {
            this._164421228_ce_mainViewStack = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_ce_mainViewStack",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _ce_selectedDecoration() : DecorationPanel
      {
         return this._580013481_ce_selectedDecoration;
      }
      
      public function set _ce_selectedDecoration(param1:DecorationPanel) : void
      {
         var _loc2_:Object = this._580013481_ce_selectedDecoration;
         if(_loc2_ !== param1)
         {
            this._580013481_ce_selectedDecoration = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_ce_selectedDecoration",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _ce_thumbPropertyInspector() : CcComponentPropertyInspectorSpark
      {
         return this._614936982_ce_thumbPropertyInspector;
      }
      
      public function set _ce_thumbPropertyInspector(param1:CcComponentPropertyInspectorSpark) : void
      {
         var _loc2_:Object = this._614936982_ce_thumbPropertyInspector;
         if(_loc2_ !== param1)
         {
            this._614936982_ce_thumbPropertyInspector = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_ce_thumbPropertyInspector",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _topControl() : Group
      {
         return this._1246058471_topControl;
      }
      
      public function set _topControl(param1:Group) : void
      {
         var _loc2_:Object = this._1246058471_topControl;
         if(_loc2_ !== param1)
         {
            this._1246058471_topControl = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_topControl",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ccCharPreviewAndSaveScreen() : Group
      {
         return this._361540722ccCharPreviewAndSaveScreen;
      }
      
      public function set ccCharPreviewAndSaveScreen(param1:Group) : void
      {
         var _loc2_:Object = this._361540722ccCharPreviewAndSaveScreen;
         if(_loc2_ !== param1)
         {
            this._361540722ccCharPreviewAndSaveScreen = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ccCharPreviewAndSaveScreen",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get eyedropperScreenCap() : EyeDropperScreenOverlay
      {
         return this._1393817655eyedropperScreenCap;
      }
      
      public function set eyedropperScreenCap(param1:EyeDropperScreenOverlay) : void
      {
         var _loc2_:Object = this._1393817655eyedropperScreenCap;
         if(_loc2_ !== param1)
         {
            this._1393817655eyedropperScreenCap = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"eyedropperScreenCap",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get mainViewStack() : Group
      {
         return this._1703153366mainViewStack;
      }
      
      public function set mainViewStack(param1:Group) : void
      {
         var _loc2_:Object = this._1703153366mainViewStack;
         if(_loc2_ !== param1)
         {
            this._1703153366mainViewStack = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mainViewStack",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ps_charPreviewCanvas() : Group
      {
         return this._1262756942ps_charPreviewCanvas;
      }
      
      public function set ps_charPreviewCanvas(param1:Group) : void
      {
         var _loc2_:Object = this._1262756942ps_charPreviewCanvas;
         if(_loc2_ !== param1)
         {
            this._1262756942ps_charPreviewCanvas = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ps_charPreviewCanvas",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ps_charPreviewOptionBox() : CharPreviewOption
      {
         return this._1970784ps_charPreviewOptionBox;
      }
      
      public function set ps_charPreviewOptionBox(param1:CharPreviewOption) : void
      {
         var _loc2_:Object = this._1970784ps_charPreviewOptionBox;
         if(_loc2_ !== param1)
         {
            this._1970784ps_charPreviewOptionBox = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ps_charPreviewOptionBox",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ps_charPreviewer() : CharPreviewer
      {
         return this._1263293821ps_charPreviewer;
      }
      
      public function set ps_charPreviewer(param1:CharPreviewer) : void
      {
         var _loc2_:Object = this._1263293821ps_charPreviewer;
         if(_loc2_ !== param1)
         {
            this._1263293821ps_charPreviewer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ps_charPreviewer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ps_interactionViewStack() : Group
      {
         return this._1995015763ps_interactionViewStack;
      }
      
      public function set ps_interactionViewStack(param1:Group) : void
      {
         var _loc2_:Object = this._1995015763ps_interactionViewStack;
         if(_loc2_ !== param1)
         {
            this._1995015763ps_interactionViewStack = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ps_interactionViewStack",_loc2_,param1));
            }
         }
      }
   }
}
