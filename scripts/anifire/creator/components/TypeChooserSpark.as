package anifire.creator.components
{
   import anifire.constant.CcLibConstant;
   import anifire.creator.core.CcConsole;
   import anifire.creator.events.CcComponentTypeChooserEvent;
   import anifire.creator.models.CcCharacter;
   import anifire.creator.models.CcComponentThumb;
   import anifire.creator.models.CcTheme;
   import anifire.creator.skins.HButtonBarSkin;
   import anifire.util.UtilDict;
   import anifire.util.UtilHashArray;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.collections.ArrayList;
   import mx.controls.Spacer;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import spark.components.ButtonBar;
   import spark.components.HGroup;
   import spark.events.IndexChangeEvent;
   
   use namespace mx_internal;
   
   public class TypeChooserSpark extends HGroup implements IBindingClient
   {
      
      private static var TRANSITION:String = "easeOut";
      
      private static var CAN_BG:String = "bg";
      
      private static var CAN_CIRCLE:String = "circle";
      
      private static var CAN_CURRENTICON:String = "currentIcon";
      
      private static var CAN_ICONIMAGE:String = "iconImage";
      
      private static var CAN_ICONPREVIOUS:String = "iconPrevious";
      
      private static var CAN_ICONNEXT:String = "iconNext";
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _206040943btnNext:IconButton;
      
      private var _506036595btnPrevious:IconButton;
      
      private var _1644785962canQuickBar:ButtonBar;
      
      private var _323293656confirmTypeList:ArrayList;
      
      private var _676559112typeList:ArrayList;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var components:Array;
      
      private var currentComponentIndex:int;
      
      private var STEP_BUTTONS:Object;
      
      private var _propChanged:Object;
      
      private var _embed_mxml__styles_images_assets_ico_hair_png_568588401:Class;
      
      private var _embed_mxml__styles_images_assets_ico_face_dec_png_993584527:Class;
      
      private var _embed_mxml__styles_images_assets_ico_shoe_png_1056716433:Class;
      
      private var _embed_mxml__styles_images_assets_ico_glasses_png_778597383:Class;
      
      private var _embed_mxml__styles_images_assets_ico_mouth_png_1871714575:Class;
      
      private var _embed_mxml__styles_images_typebar_step_arrowl_init_png_777661207:Class;
      
      private var _embed_mxml__styles_images_typebar_step_arrowr_over_png_1377950441:Class;
      
      private var _embed_mxml__styles_images_typebar_step_arrowr_init_png_1379232273:Class;
      
      private var _embed_mxml__styles_images_assets_ico_mustache_png_85452817:Class;
      
      private var _embed_mxml__styles_images_assets_ico_ear_png_285215279:Class;
      
      private var _embed_mxml__styles_images_typebar_step_arrowr_disabled_png_1206832903:Class;
      
      private var _embed_mxml__styles_images_assets_ico_nose_png_972289873:Class;
      
      private var _embed_mxml__styles_images_assets_icon_upperbody_png_381444503:Class;
      
      private var _embed_mxml__styles_images_assets_ico_upper_body_png_246182023:Class;
      
      private var _embed_mxml__styles_images_assets_ico_lower_body_png_246706063:Class;
      
      private var _embed_mxml__styles_images_typebar_step_arrowl_disabled_png_1347800335:Class;
      
      private var _embed_mxml__styles_images_typebar_step_arrowl_over_png_560871183:Class;
      
      private var _embed_mxml__styles_images_assets_ico_hand_png_14365849:Class;
      
      private var _embed_mxml__styles_images_assets_ico_face_png_970077817:Class;
      
      private var _embed_mxml__styles_images_assets_ico_beard_png_1737554191:Class;
      
      private var _embed_mxml__styles_images_assets_ico_back_prop_png_539571047:Class;
      
      private var _embed_mxml__styles_images_assets_ico_eyebrow_png_289958927:Class;
      
      private var _embed_mxml__styles_images_assets_ico_eye_png_2124397041:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function TypeChooserSpark()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this.components = new Array();
         this._propChanged = {};
         this._embed_mxml__styles_images_assets_ico_hair_png_568588401 = TypeChooserSpark__embed_mxml__styles_images_assets_ico_hair_png_568588401;
         this._embed_mxml__styles_images_assets_ico_face_dec_png_993584527 = TypeChooserSpark__embed_mxml__styles_images_assets_ico_face_dec_png_993584527;
         this._embed_mxml__styles_images_assets_ico_shoe_png_1056716433 = TypeChooserSpark__embed_mxml__styles_images_assets_ico_shoe_png_1056716433;
         this._embed_mxml__styles_images_assets_ico_glasses_png_778597383 = TypeChooserSpark__embed_mxml__styles_images_assets_ico_glasses_png_778597383;
         this._embed_mxml__styles_images_assets_ico_mouth_png_1871714575 = TypeChooserSpark__embed_mxml__styles_images_assets_ico_mouth_png_1871714575;
         this._embed_mxml__styles_images_typebar_step_arrowl_init_png_777661207 = TypeChooserSpark__embed_mxml__styles_images_typebar_step_arrowl_init_png_777661207;
         this._embed_mxml__styles_images_typebar_step_arrowr_over_png_1377950441 = TypeChooserSpark__embed_mxml__styles_images_typebar_step_arrowr_over_png_1377950441;
         this._embed_mxml__styles_images_typebar_step_arrowr_init_png_1379232273 = TypeChooserSpark__embed_mxml__styles_images_typebar_step_arrowr_init_png_1379232273;
         this._embed_mxml__styles_images_assets_ico_mustache_png_85452817 = TypeChooserSpark__embed_mxml__styles_images_assets_ico_mustache_png_85452817;
         this._embed_mxml__styles_images_assets_ico_ear_png_285215279 = TypeChooserSpark__embed_mxml__styles_images_assets_ico_ear_png_285215279;
         this._embed_mxml__styles_images_typebar_step_arrowr_disabled_png_1206832903 = TypeChooserSpark__embed_mxml__styles_images_typebar_step_arrowr_disabled_png_1206832903;
         this._embed_mxml__styles_images_assets_ico_nose_png_972289873 = TypeChooserSpark__embed_mxml__styles_images_assets_ico_nose_png_972289873;
         this._embed_mxml__styles_images_assets_icon_upperbody_png_381444503 = TypeChooserSpark__embed_mxml__styles_images_assets_icon_upperbody_png_381444503;
         this._embed_mxml__styles_images_assets_ico_upper_body_png_246182023 = TypeChooserSpark__embed_mxml__styles_images_assets_ico_upper_body_png_246182023;
         this._embed_mxml__styles_images_assets_ico_lower_body_png_246706063 = TypeChooserSpark__embed_mxml__styles_images_assets_ico_lower_body_png_246706063;
         this._embed_mxml__styles_images_typebar_step_arrowl_disabled_png_1347800335 = TypeChooserSpark__embed_mxml__styles_images_typebar_step_arrowl_disabled_png_1347800335;
         this._embed_mxml__styles_images_typebar_step_arrowl_over_png_560871183 = TypeChooserSpark__embed_mxml__styles_images_typebar_step_arrowl_over_png_560871183;
         this._embed_mxml__styles_images_assets_ico_hand_png_14365849 = TypeChooserSpark__embed_mxml__styles_images_assets_ico_hand_png_14365849;
         this._embed_mxml__styles_images_assets_ico_face_png_970077817 = TypeChooserSpark__embed_mxml__styles_images_assets_ico_face_png_970077817;
         this._embed_mxml__styles_images_assets_ico_beard_png_1737554191 = TypeChooserSpark__embed_mxml__styles_images_assets_ico_beard_png_1737554191;
         this._embed_mxml__styles_images_assets_ico_back_prop_png_539571047 = TypeChooserSpark__embed_mxml__styles_images_assets_ico_back_prop_png_539571047;
         this._embed_mxml__styles_images_assets_ico_eyebrow_png_289958927 = TypeChooserSpark__embed_mxml__styles_images_assets_ico_eyebrow_png_289958927;
         this._embed_mxml__styles_images_assets_ico_eye_png_2124397041 = TypeChooserSpark__embed_mxml__styles_images_assets_ico_eye_png_2124397041;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._TypeChooserSpark_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_creator_components_TypeChooserSparkWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return TypeChooserSpark[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.verticalAlign = "middle";
         this.horizontalAlign = "center";
         this.mxmlContent = [this._TypeChooserSpark_IconButton1_i(),this._TypeChooserSpark_Spacer1_c(),this._TypeChooserSpark_ButtonBar1_i(),this._TypeChooserSpark_Spacer2_c(),this._TypeChooserSpark_IconButton2_i()];
         this._TypeChooserSpark_ArrayList1_i();
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         TypeChooserSpark._watcherSetupUtil = param1;
      }
      
      override public function set moduleFactory(param1:IFlexModuleFactory) : void
      {
         super.moduleFactory = param1;
         if(this.__moduleFactoryInitialized)
         {
            return;
         }
         this.__moduleFactoryInitialized = true;
      }
      
      override public function initialize() : void
      {
         super.initialize();
      }
      
      override protected function createChildren() : void
      {
         super.createChildren();
      }
      
      public function init(param1:CcTheme, param2:CcCharacter, param3:Boolean = true) : void
      {
         var _loc6_:Array = null;
         var _loc7_:* = null;
         var _loc8_:String = null;
         var _loc9_:Boolean = false;
         var _loc10_:UtilHashArray = null;
         var _loc11_:UtilHashArray = null;
         var _loc12_:int = 0;
         var _loc13_:Function = null;
         var _loc14_:Number = NaN;
         var _loc4_:Array = new Array();
         var _loc5_:* = param1.getBodyShapeNum() > 1;
         this.components = new Array();
         if(param2.bodyShape.getLibraryNum() == 0)
         {
            _loc6_ = CcLibConstant.COMPONENT_TYPE_CHOOSER_ORDERING_VER1;
         }
         else
         {
            _loc6_ = CcLibConstant.COMPONENT_TYPE_CHOOSER_ORDERING_VER2;
         }
         for(_loc7_ in this.typeList.source)
         {
            _loc8_ = this.typeList.source[_loc7_].label;
            _loc9_ = false;
            if(CcLibConstant.COMPONENT_TYPE_CHOOSER_COMPONENT_GROUP.indexOf(_loc8_) >= 0 || param1.getAvailableComponentTypes().indexOf(_loc8_) > -1)
            {
               if(_loc8_ == CcLibConstant.COMPONENT_TYPE_BODYSHAPE)
               {
                  if(_loc5_ && CcLibConstant.BODYSHAPE_CHOOSABLE || CcLibConstant.CHOOSE_TAG_TYPE_SEX)
                  {
                     _loc9_ = true;
                  }
               }
               else
               {
                  _loc10_ = param2.bodyShape.getComponentThumbByType(_loc8_);
                  if(!_loc10_)
                  {
                     _loc10_ = param1.getComponentThumbByType(_loc8_);
                  }
                  _loc11_ = new UtilHashArray();
                  if(_loc10_)
                  {
                     _loc12_ = 0;
                     while(_loc12_ < _loc10_.length)
                     {
                        if(CcComponentThumb(_loc10_.getValueByIndex(_loc12_)).enable)
                        {
                           _loc13_ = CcConsole.getCcConsole().configuration.defaultThumbFilter.filter;
                           if(_loc13_(CcComponentThumb(_loc10_.getValueByIndex(_loc12_))))
                           {
                              _loc11_.push(_loc10_.getKey(_loc12_),_loc10_.getValueByIndex(_loc12_));
                           }
                        }
                        _loc12_++;
                     }
                  }
                  else
                  {
                     _loc11_ = null;
                  }
                  if(CcLibConstant.COMPONENT_TYPE_CHOOSER_COMPONENT_GROUP.indexOf(_loc8_) >= 0)
                  {
                     _loc9_ = true;
                  }
                  else
                  {
                     _loc14_ = CcLibConstant.ALL_MULTIPLE_COMPONENT_TYPES.indexOf(_loc8_) > -1?Number(0):Number(1);
                     if(param1.getAvailableComponentTypes().indexOf(_loc8_) > -1 && _loc11_ && _loc11_.length > _loc14_)
                     {
                        _loc9_ = true;
                     }
                  }
               }
            }
            if(_loc9_ && _loc6_.indexOf(_loc8_) > -1)
            {
               this.components.push(_loc8_);
               _loc4_.push(this.typeList.source[_loc7_]);
            }
         }
         this.confirmTypeList.source = _loc4_;
         this.currentComponentIndex = 0;
         this.switchToComponentType(this.components[this.currentComponentIndex],param3);
      }
      
      override public function styleChanged(param1:String) : void
      {
         var _loc3_:String = null;
         var _loc4_:* = undefined;
         super.styleChanged(param1);
         var _loc2_:Array = ["percentWidth","navMarginRight"];
         if(param1 == null || _loc2_.indexOf(param1) >= 0)
         {
            for each(_loc3_ in _loc2_)
            {
               _loc4_ = getStyle(_loc3_);
               if(_loc4_ != undefined)
               {
                  this._propChanged[_loc3_] = _loc4_;
               }
            }
         }
      }
      
      private function prepare() : void
      {
      }
      
      public function switchToComponentType(param1:String = "", param2:Boolean = true) : void
      {
         this.currentComponentIndex = this.components.indexOf(param1);
         this.canQuickBar.selectedIndex = this.currentComponentIndex;
         if(this.components.indexOf(param1) == 0)
         {
            this.btnPrevious.enabled = false;
         }
         else
         {
            this.btnPrevious.enabled = true;
         }
         if(this.components.indexOf(param1) == this.components.length - 1)
         {
            this.btnNext.enabled = false;
         }
         else
         {
            this.btnNext.enabled = true;
         }
         if(param2)
         {
            this.tellEverybodyComponentTypeChosen(param1);
         }
      }
      
      private function tellEverybodyComponentTypeChosen(param1:String) : void
      {
         var _loc2_:CcComponentTypeChooserEvent = new CcComponentTypeChooserEvent(CcComponentTypeChooserEvent.COMPONENT_TYPE_CHOSEN,this);
         _loc2_.componentType = param1;
         this.dispatchEvent(_loc2_);
      }
      
      private function onBtnClick(param1:Event) : void
      {
         var _loc2_:int = 0;
         if(param1.currentTarget == this.btnPrevious)
         {
            _loc2_ = this.currentComponentIndex - 1;
         }
         else if(param1.currentTarget == this.btnNext)
         {
            _loc2_ = this.currentComponentIndex + 1;
         }
         if(_loc2_ < this.components.length)
         {
            this.switchToComponentType(this.components[_loc2_]);
         }
      }
      
      private function onButtonBarChange(param1:IndexChangeEvent) : void
      {
         var _loc3_:String = null;
         var _loc2_:int = param1.newIndex;
         if(_loc2_ >= 0)
         {
            _loc3_ = this.confirmTypeList.source[_loc2_].label;
            this.switchToComponentType(_loc3_);
         }
      }
      
      private function _TypeChooserSpark_ArrayList1_i() : ArrayList
      {
         var _loc1_:ArrayList = new ArrayList();
         _loc1_.source = [{
            "label":"componentGroupClothes",
            "icon":this._embed_mxml__styles_images_assets_icon_upperbody_png_381444503
         },{
            "label":"GoUpper",
            "icon":this._embed_mxml__styles_images_assets_ico_upper_body_png_246182023
         },{
            "label":"GoLower",
            "icon":this._embed_mxml__styles_images_assets_ico_lower_body_png_246706063
         },{
            "label":"GoHands",
            "icon":this._embed_mxml__styles_images_assets_ico_hand_png_14365849
         },{
            "label":"GoFeet",
            "icon":this._embed_mxml__styles_images_assets_ico_shoe_png_1056716433
         },{
            "label":"GoBehindBody",
            "icon":this._embed_mxml__styles_images_assets_ico_back_prop_png_539571047
         },{
            "label":"GoHair",
            "icon":this._embed_mxml__styles_images_assets_ico_hair_png_568588401
         },{
            "label":"upper_body",
            "icon":this._embed_mxml__styles_images_assets_ico_upper_body_png_246182023
         },{
            "label":"lower_body",
            "icon":this._embed_mxml__styles_images_assets_ico_lower_body_png_246706063
         },{
            "label":"faceshape",
            "icon":this._embed_mxml__styles_images_assets_ico_face_png_970077817
         },{
            "label":"hair",
            "icon":this._embed_mxml__styles_images_assets_ico_hair_png_568588401
         },{
            "label":"beard",
            "icon":this._embed_mxml__styles_images_assets_ico_beard_png_1737554191
         },{
            "label":"mouth",
            "icon":this._embed_mxml__styles_images_assets_ico_mouth_png_1871714575
         },{
            "label":"ear",
            "icon":this._embed_mxml__styles_images_assets_ico_ear_png_285215279
         },{
            "label":"mustache",
            "icon":this._embed_mxml__styles_images_assets_ico_mustache_png_85452817
         },{
            "label":"eye",
            "icon":this._embed_mxml__styles_images_assets_ico_eye_png_2124397041
         },{
            "label":"eyebrow",
            "icon":this._embed_mxml__styles_images_assets_ico_eyebrow_png_289958927
         },{
            "label":"nose",
            "icon":this._embed_mxml__styles_images_assets_ico_nose_png_972289873
         },{
            "label":"glasses",
            "icon":this._embed_mxml__styles_images_assets_ico_glasses_png_778597383
         },{
            "label":"facedecoration",
            "icon":this._embed_mxml__styles_images_assets_ico_face_dec_png_993584527
         }];
         this.typeList = _loc1_;
         BindingManager.executeBindings(this,"typeList",this.typeList);
         return _loc1_;
      }
      
      private function _TypeChooserSpark_IconButton1_i() : IconButton
      {
         var _loc1_:IconButton = new IconButton();
         _loc1_.buttonMode = true;
         _loc1_.enabled = false;
         _loc1_.setStyle("icon",this._embed_mxml__styles_images_typebar_step_arrowl_init_png_777661207);
         _loc1_.setStyle("iconOver",this._embed_mxml__styles_images_typebar_step_arrowl_over_png_560871183);
         _loc1_.setStyle("iconDisabled",this._embed_mxml__styles_images_typebar_step_arrowl_disabled_png_1347800335);
         _loc1_.addEventListener("click",this.__btnPrevious_click);
         _loc1_.id = "btnPrevious";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.btnPrevious = _loc1_;
         BindingManager.executeBindings(this,"btnPrevious",this.btnPrevious);
         return _loc1_;
      }
      
      public function __btnPrevious_click(param1:MouseEvent) : void
      {
         this.onBtnClick(param1);
      }
      
      private function _TypeChooserSpark_Spacer1_c() : Spacer
      {
         var _loc1_:Spacer = new Spacer();
         _loc1_.width = 18;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TypeChooserSpark_ButtonBar1_i() : ButtonBar
      {
         var _loc1_:ButtonBar = new ButtonBar();
         _loc1_.x = 0;
         _loc1_.height = 45;
         _loc1_.visible = true;
         _loc1_.verticalCenter = 0;
         _loc1_.requireSelection = true;
         _loc1_.dataProvider = this._TypeChooserSpark_ArrayList2_i();
         _loc1_.setStyle("skinClass",HButtonBarSkin);
         _loc1_.addEventListener("change",this.__canQuickBar_change);
         _loc1_.id = "canQuickBar";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.canQuickBar = _loc1_;
         BindingManager.executeBindings(this,"canQuickBar",this.canQuickBar);
         return _loc1_;
      }
      
      private function _TypeChooserSpark_ArrayList2_i() : ArrayList
      {
         var _loc1_:ArrayList = new ArrayList();
         this.confirmTypeList = _loc1_;
         BindingManager.executeBindings(this,"confirmTypeList",this.confirmTypeList);
         return _loc1_;
      }
      
      public function __canQuickBar_change(param1:IndexChangeEvent) : void
      {
         this.onButtonBarChange(param1);
      }
      
      private function _TypeChooserSpark_Spacer2_c() : Spacer
      {
         var _loc1_:Spacer = new Spacer();
         _loc1_.width = 18;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TypeChooserSpark_IconButton2_i() : IconButton
      {
         var _loc1_:IconButton = new IconButton();
         _loc1_.buttonMode = true;
         _loc1_.enabled = false;
         _loc1_.setStyle("icon",this._embed_mxml__styles_images_typebar_step_arrowr_init_png_1379232273);
         _loc1_.setStyle("iconOver",this._embed_mxml__styles_images_typebar_step_arrowr_over_png_1377950441);
         _loc1_.setStyle("iconDisabled",this._embed_mxml__styles_images_typebar_step_arrowr_disabled_png_1206832903);
         _loc1_.addEventListener("click",this.__btnNext_click);
         _loc1_.id = "btnNext";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.btnNext = _loc1_;
         BindingManager.executeBindings(this,"btnNext",this.btnNext);
         return _loc1_;
      }
      
      public function __btnNext_click(param1:MouseEvent) : void
      {
         this.onBtnClick(param1);
      }
      
      private function _TypeChooserSpark_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Previous");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"btnPrevious.label");
         result[1] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Next");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"btnNext.label");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get btnNext() : IconButton
      {
         return this._206040943btnNext;
      }
      
      public function set btnNext(param1:IconButton) : void
      {
         var _loc2_:Object = this._206040943btnNext;
         if(_loc2_ !== param1)
         {
            this._206040943btnNext = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnNext",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnPrevious() : IconButton
      {
         return this._506036595btnPrevious;
      }
      
      public function set btnPrevious(param1:IconButton) : void
      {
         var _loc2_:Object = this._506036595btnPrevious;
         if(_loc2_ !== param1)
         {
            this._506036595btnPrevious = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnPrevious",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get canQuickBar() : ButtonBar
      {
         return this._1644785962canQuickBar;
      }
      
      public function set canQuickBar(param1:ButtonBar) : void
      {
         var _loc2_:Object = this._1644785962canQuickBar;
         if(_loc2_ !== param1)
         {
            this._1644785962canQuickBar = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"canQuickBar",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get confirmTypeList() : ArrayList
      {
         return this._323293656confirmTypeList;
      }
      
      public function set confirmTypeList(param1:ArrayList) : void
      {
         var _loc2_:Object = this._323293656confirmTypeList;
         if(_loc2_ !== param1)
         {
            this._323293656confirmTypeList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"confirmTypeList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get typeList() : ArrayList
      {
         return this._676559112typeList;
      }
      
      public function set typeList(param1:ArrayList) : void
      {
         var _loc2_:Object = this._676559112typeList;
         if(_loc2_ !== param1)
         {
            this._676559112typeList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"typeList",_loc2_,param1));
            }
         }
      }
   }
}
