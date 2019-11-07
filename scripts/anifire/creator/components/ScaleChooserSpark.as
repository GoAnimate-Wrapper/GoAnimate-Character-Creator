package anifire.creator.components
{
   import anifire.constant.CcLibConstant;
   import anifire.creator.events.CcScaleChosenEvent;
   import anifire.creator.events.CcThumbPropertyEvent;
   import anifire.util.UtilDict;
   import anifire.util.UtilUser;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.EffectEvent;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.HSlider;
   import spark.components.Image;
   import spark.components.VGroup;
   import spark.effects.Animate;
   import spark.effects.animation.MotionPath;
   import spark.effects.animation.SimpleMotionPath;
   import spark.primitives.Rect;
   import spark.primitives.RectangularDropShadow;
   
   use namespace mx_internal;
   
   public class ScaleChooserSpark extends Group implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _200915974_ScaleChooserSpark_Group3:Group;
      
      private var _200915975_ScaleChooserSpark_Group4:Group;
      
      private var _1592476650_ScaleChooserSpark_HGroup3:HGroup;
      
      private var _1686836913btnArrowDown:IconButton;
      
      private var _1686608716btnArrowLeft:IconButton;
      
      private var _739601649btnArrowRight:IconButton;
      
      private var _1923540344btnArrowUp:IconButton;
      
      private var _2082343164btnClose:IconButton;
      
      private var _626844727btnType01:IconButton;
      
      private var _626844728btnType02:IconButton;
      
      private var _626844729btnType03:IconButton;
      
      private var _626844730btnType04:IconButton;
      
      private var _906978543dropShadow:RectangularDropShadow;
      
      private var _104889325moveDown:Animate;
      
      private var _1068263860moveUp:Animate;
      
      private var _1105645091sliderBody:HSlider;
      
      private var _1105814113sliderHead:HSlider;
      
      private var _3684698yPad:Group;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var hideFinishFlag:Boolean = true;
      
      private var _embed_mxml__styles_images_panel_btn_close_over_png_2000923769:Class;
      
      private var _embed_mxml__styles_images_details_btn_bodytype02_over_png_727082119:Class;
      
      private var _embed_mxml__styles_images_details_btn_arrowd_init_png_926693625:Class;
      
      private var _embed_mxml__styles_images_details_btn_arrowd_over_png_372004985:Class;
      
      private var _embed_mxml__styles_images_details_btn_bodytype04_over_png_528750851:Class;
      
      private var _embed_mxml__styles_images_details_btn_bodytype03_init_png_525739335:Class;
      
      private var _embed_mxml__styles_images_details_btn_arrowl_init_png_147572551:Class;
      
      private var _embed_mxml__styles_images_details_btn_bodytype03_over_png_523704647:Class;
      
      private var _embed_mxml__styles_images_details_btn_arrowr_init_png_281765451:Class;
      
      private var _embed_mxml__styles_images_details_ico_drag_head_max_png_994122617:Class;
      
      private var _embed_mxml__styles_images_details_btn_arrowu_over_png_1477683083:Class;
      
      private var _embed_mxml__styles_images_details_btn_bodytype04_init_png_1589053115:Class;
      
      private var _embed_mxml__styles_images_details_btn_bodytype01_init_png_548923715:Class;
      
      private var _embed_mxml__styles_images_details_btn_arrowu_init_png_1510196995:Class;
      
      private var _embed_mxml__styles_images_details_ico_drag_body_min_png_1489058041:Class;
      
      private var _embed_mxml__styles_images_details_ico_drag_head_min_png_1564563317:Class;
      
      private var _embed_mxml__styles_images_details_btn_arrowl_over_png_1774962567:Class;
      
      private var _embed_mxml__styles_images_details_btn_bodytype01_over_png_1018755509:Class;
      
      private var _embed_mxml__styles_images_details_btn_bodytype02_init_png_256313607:Class;
      
      private var _embed_mxml__styles_images_details_btn_arrowr_over_png_298567235:Class;
      
      private var _embed_mxml__styles_images_panel_btn_close_init_png_1805605639:Class;
      
      private var _embed_mxml__styles_images_details_ico_drag_body_max_png_1690384637:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function ScaleChooserSpark()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._embed_mxml__styles_images_panel_btn_close_over_png_2000923769 = ScaleChooserSpark__embed_mxml__styles_images_panel_btn_close_over_png_2000923769;
         this._embed_mxml__styles_images_details_btn_bodytype02_over_png_727082119 = ScaleChooserSpark__embed_mxml__styles_images_details_btn_bodytype02_over_png_727082119;
         this._embed_mxml__styles_images_details_btn_arrowd_init_png_926693625 = ScaleChooserSpark__embed_mxml__styles_images_details_btn_arrowd_init_png_926693625;
         this._embed_mxml__styles_images_details_btn_arrowd_over_png_372004985 = ScaleChooserSpark__embed_mxml__styles_images_details_btn_arrowd_over_png_372004985;
         this._embed_mxml__styles_images_details_btn_bodytype04_over_png_528750851 = ScaleChooserSpark__embed_mxml__styles_images_details_btn_bodytype04_over_png_528750851;
         this._embed_mxml__styles_images_details_btn_bodytype03_init_png_525739335 = ScaleChooserSpark__embed_mxml__styles_images_details_btn_bodytype03_init_png_525739335;
         this._embed_mxml__styles_images_details_btn_arrowl_init_png_147572551 = ScaleChooserSpark__embed_mxml__styles_images_details_btn_arrowl_init_png_147572551;
         this._embed_mxml__styles_images_details_btn_bodytype03_over_png_523704647 = ScaleChooserSpark__embed_mxml__styles_images_details_btn_bodytype03_over_png_523704647;
         this._embed_mxml__styles_images_details_btn_arrowr_init_png_281765451 = ScaleChooserSpark__embed_mxml__styles_images_details_btn_arrowr_init_png_281765451;
         this._embed_mxml__styles_images_details_ico_drag_head_max_png_994122617 = ScaleChooserSpark__embed_mxml__styles_images_details_ico_drag_head_max_png_994122617;
         this._embed_mxml__styles_images_details_btn_arrowu_over_png_1477683083 = ScaleChooserSpark__embed_mxml__styles_images_details_btn_arrowu_over_png_1477683083;
         this._embed_mxml__styles_images_details_btn_bodytype04_init_png_1589053115 = ScaleChooserSpark__embed_mxml__styles_images_details_btn_bodytype04_init_png_1589053115;
         this._embed_mxml__styles_images_details_btn_bodytype01_init_png_548923715 = ScaleChooserSpark__embed_mxml__styles_images_details_btn_bodytype01_init_png_548923715;
         this._embed_mxml__styles_images_details_btn_arrowu_init_png_1510196995 = ScaleChooserSpark__embed_mxml__styles_images_details_btn_arrowu_init_png_1510196995;
         this._embed_mxml__styles_images_details_ico_drag_body_min_png_1489058041 = ScaleChooserSpark__embed_mxml__styles_images_details_ico_drag_body_min_png_1489058041;
         this._embed_mxml__styles_images_details_ico_drag_head_min_png_1564563317 = ScaleChooserSpark__embed_mxml__styles_images_details_ico_drag_head_min_png_1564563317;
         this._embed_mxml__styles_images_details_btn_arrowl_over_png_1774962567 = ScaleChooserSpark__embed_mxml__styles_images_details_btn_arrowl_over_png_1774962567;
         this._embed_mxml__styles_images_details_btn_bodytype01_over_png_1018755509 = ScaleChooserSpark__embed_mxml__styles_images_details_btn_bodytype01_over_png_1018755509;
         this._embed_mxml__styles_images_details_btn_bodytype02_init_png_256313607 = ScaleChooserSpark__embed_mxml__styles_images_details_btn_bodytype02_init_png_256313607;
         this._embed_mxml__styles_images_details_btn_arrowr_over_png_298567235 = ScaleChooserSpark__embed_mxml__styles_images_details_btn_arrowr_over_png_298567235;
         this._embed_mxml__styles_images_panel_btn_close_init_png_1805605639 = ScaleChooserSpark__embed_mxml__styles_images_panel_btn_close_init_png_1805605639;
         this._embed_mxml__styles_images_details_ico_drag_body_max_png_1690384637 = ScaleChooserSpark__embed_mxml__styles_images_details_ico_drag_body_max_png_1690384637;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._ScaleChooserSpark_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_creator_components_ScaleChooserSparkWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return ScaleChooserSpark[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.width = 300;
         this.height = 100;
         this.mxmlContent = [this._ScaleChooserSpark_Group2_i()];
         this.currentState = "normal";
         this._ScaleChooserSpark_Animate2_i();
         this._ScaleChooserSpark_Animate1_i();
         states = [new State({
            "name":"normal",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_ScaleChooserSpark_Group3",
               "name":"mouseChildren",
               "value":false
            }),new SetProperty().initializeFromObject({
               "target":"_ScaleChooserSpark_Group3",
               "name":"alpha",
               "value":0.5
            }),new SetProperty().initializeFromObject({
               "target":"_ScaleChooserSpark_Group4",
               "name":"mouseChildren",
               "value":false
            }),new SetProperty().initializeFromObject({
               "target":"_ScaleChooserSpark_Group4",
               "name":"alpha",
               "value":0.5
            }),new SetProperty().initializeFromObject({
               "target":"_ScaleChooserSpark_HGroup3",
               "name":"mouseChildren",
               "value":false
            }),new SetProperty().initializeFromObject({
               "target":"_ScaleChooserSpark_HGroup3",
               "name":"alpha",
               "value":0.5
            })]
         }),new State({
            "name":"isPlus",
            "overrides":[]
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
         ScaleChooserSpark._watcherSetupUtil = param1;
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
      
      private function onCustomScaleUpdate() : void
      {
         var _loc1_:CcScaleChosenEvent = new CcScaleChosenEvent(CcScaleChosenEvent.SCALE_CHOSEN,this);
         _loc1_.head_scale = this.sliderHead.value;
         _loc1_.body_scale = this.sliderBody.value;
         dispatchEvent(_loc1_);
      }
      
      private function onScaleButtonClick(param1:Event) : void
      {
         var _loc2_:CcScaleChosenEvent = new CcScaleChosenEvent(CcScaleChosenEvent.SCALE_CHOSEN,this);
         switch(param1.currentTarget)
         {
            case this.btnType01:
               _loc2_.head_scale = CcLibConstant.DEFAULT_HEADSCALES[0];
               _loc2_.body_scale = CcLibConstant.DEFAULT_BODYSCALES[0];
               _loc2_.head_pos = CcLibConstant.DEFAULT_HEADPOS[0];
               break;
            case this.btnType02:
               _loc2_.head_scale = CcLibConstant.DEFAULT_HEADSCALES[1];
               _loc2_.body_scale = CcLibConstant.DEFAULT_BODYSCALES[1];
               _loc2_.head_pos = CcLibConstant.DEFAULT_HEADPOS[1];
               break;
            case this.btnType03:
               _loc2_.head_scale = CcLibConstant.DEFAULT_HEADSCALES[2];
               _loc2_.body_scale = CcLibConstant.DEFAULT_BODYSCALES[2];
               _loc2_.head_pos = CcLibConstant.DEFAULT_HEADPOS[2];
               break;
            case this.btnType04:
               _loc2_.head_scale = CcLibConstant.DEFAULT_HEADSCALES[3];
               _loc2_.body_scale = CcLibConstant.DEFAULT_BODYSCALES[3];
               _loc2_.head_pos = CcLibConstant.DEFAULT_HEADPOS[3];
         }
         this.updateSliders(_loc2_.body_scale * 100,_loc2_.head_scale * 100);
         dispatchEvent(_loc2_);
      }
      
      public function show() : void
      {
         if(UtilUser.hasPlusFeatures())
         {
            setCurrentState("isPlus");
         }
         else
         {
            setCurrentState("normal");
         }
         this.addEventListener(CcThumbPropertyEvent.CCPROP_DOWN_BUTTON_CLICK,this.updateHeadPos);
         this.addEventListener(CcThumbPropertyEvent.CCPROP_UP_BUTTON_CLICK,this.updateHeadPos);
         this.addEventListener(CcThumbPropertyEvent.CCPROP_LEFT_BUTTON_CLICK,this.updateHeadPos);
         this.addEventListener(CcThumbPropertyEvent.CCPROP_RIGHT_BUTTON_CLICK,this.updateHeadPos);
         this.moveUp.play();
      }
      
      public function close() : void
      {
         if(!this.hideFinishFlag)
         {
            this.startHide();
         }
      }
      
      public function startHide() : void
      {
         this.moveDown.play();
      }
      
      private function changeHeadSize() : void
      {
         var _loc1_:CcScaleChosenEvent = new CcScaleChosenEvent(CcScaleChosenEvent.SCALE_CHOSEN,this);
         _loc1_.head_scale = this.sliderHead.value / 100;
         dispatchEvent(_loc1_);
      }
      
      private function changeBodySize() : void
      {
         var _loc1_:CcScaleChosenEvent = new CcScaleChosenEvent(CcScaleChosenEvent.SCALE_CHOSEN,this);
         _loc1_.body_scale = this.sliderBody.value / 100;
         dispatchEvent(_loc1_);
      }
      
      private function updateHeadPos(param1:Event) : void
      {
         var _loc2_:Number = 0;
         var _loc3_:Number = 0;
         switch(param1.type)
         {
            case CcThumbPropertyEvent.CCPROP_UP_BUTTON_CLICK:
               _loc3_ = -1;
               break;
            case CcThumbPropertyEvent.CCPROP_DOWN_BUTTON_CLICK:
               _loc3_ = 1;
               break;
            case CcThumbPropertyEvent.CCPROP_LEFT_BUTTON_CLICK:
               _loc2_ = 1;
               break;
            case CcThumbPropertyEvent.CCPROP_RIGHT_BUTTON_CLICK:
               _loc2_ = -1;
         }
         var _loc4_:CcScaleChosenEvent = new CcScaleChosenEvent(CcScaleChosenEvent.SCALE_CHOSEN,this);
         _loc4_.head_shift = new Point(_loc2_,_loc3_);
         dispatchEvent(_loc4_);
      }
      
      public function updateSliders(param1:Number, param2:Number) : void
      {
         this.sliderBody.value = param1;
         this.sliderHead.value = param2;
      }
      
      private function _ScaleChooserSpark_Animate2_i() : Animate
      {
         var _loc1_:Animate = new Animate();
         _loc1_.duration = 500;
         _loc1_.motionPaths = new <MotionPath>[this._ScaleChooserSpark_SimpleMotionPath3_c(),this._ScaleChooserSpark_SimpleMotionPath4_c()];
         _loc1_.addEventListener("effectEnd",this.__moveDown_effectEnd);
         this.moveDown = _loc1_;
         BindingManager.executeBindings(this,"moveDown",this.moveDown);
         return _loc1_;
      }
      
      private function _ScaleChooserSpark_SimpleMotionPath3_c() : SimpleMotionPath
      {
         var _loc1_:SimpleMotionPath = new SimpleMotionPath();
         _loc1_.property = "y";
         _loc1_.valueFrom = 5;
         _loc1_.valueTo = 105;
         return _loc1_;
      }
      
      private function _ScaleChooserSpark_SimpleMotionPath4_c() : SimpleMotionPath
      {
         var _loc1_:SimpleMotionPath = new SimpleMotionPath();
         _loc1_.property = "alpha";
         _loc1_.valueFrom = 1;
         _loc1_.valueTo = 0;
         return _loc1_;
      }
      
      public function __moveDown_effectEnd(param1:EffectEvent) : void
      {
         this.hideFinishFlag = true;
         this.yPad.mouseChildren = false;
      }
      
      private function _ScaleChooserSpark_Animate1_i() : Animate
      {
         var _loc1_:Animate = new Animate();
         _loc1_.duration = 500;
         _loc1_.motionPaths = new <MotionPath>[this._ScaleChooserSpark_SimpleMotionPath1_c(),this._ScaleChooserSpark_SimpleMotionPath2_c()];
         _loc1_.addEventListener("effectStart",this.__moveUp_effectStart);
         this.moveUp = _loc1_;
         BindingManager.executeBindings(this,"moveUp",this.moveUp);
         return _loc1_;
      }
      
      private function _ScaleChooserSpark_SimpleMotionPath1_c() : SimpleMotionPath
      {
         var _loc1_:SimpleMotionPath = new SimpleMotionPath();
         _loc1_.property = "y";
         _loc1_.valueFrom = 105;
         _loc1_.valueTo = 5;
         return _loc1_;
      }
      
      private function _ScaleChooserSpark_SimpleMotionPath2_c() : SimpleMotionPath
      {
         var _loc1_:SimpleMotionPath = new SimpleMotionPath();
         _loc1_.property = "alpha";
         _loc1_.valueFrom = 0;
         _loc1_.valueTo = 1;
         return _loc1_;
      }
      
      public function __moveUp_effectStart(param1:EffectEvent) : void
      {
         this.hideFinishFlag = false;
         this.yPad.mouseChildren = true;
      }
      
      private function _ScaleChooserSpark_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.y = 105;
         _loc1_.alpha = 0;
         _loc1_.mouseChildren = false;
         _loc1_.mxmlContent = [this._ScaleChooserSpark_Rect1_c(),this._ScaleChooserSpark_RectangularDropShadow1_i(),this._ScaleChooserSpark_IconButton1_i(),this._ScaleChooserSpark_HGroup1_c()];
         _loc1_.id = "yPad";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.yPad = _loc1_;
         BindingManager.executeBindings(this,"yPad",this.yPad);
         return _loc1_;
      }
      
      private function _ScaleChooserSpark_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.width = 280;
         _loc1_.height = 101;
         _loc1_.radiusX = 5;
         _loc1_.radiusY = 5;
         _loc1_.fill = this._ScaleChooserSpark_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ScaleChooserSpark_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 3355443;
         return _loc1_;
      }
      
      private function _ScaleChooserSpark_RectangularDropShadow1_i() : RectangularDropShadow
      {
         var _loc1_:RectangularDropShadow = new RectangularDropShadow();
         _loc1_.blurX = 20;
         _loc1_.blurY = 20;
         _loc1_.alpha = 0.45;
         _loc1_.distance = 7;
         _loc1_.angle = 90;
         _loc1_.color = 0;
         _loc1_.blRadius = 3;
         _loc1_.brRadius = 3;
         _loc1_.tlRadius = 3;
         _loc1_.trRadius = 3;
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.id = "dropShadow";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.dropShadow = _loc1_;
         BindingManager.executeBindings(this,"dropShadow",this.dropShadow);
         return _loc1_;
      }
      
      private function _ScaleChooserSpark_IconButton1_i() : IconButton
      {
         var _loc1_:IconButton = new IconButton();
         _loc1_.buttonMode = true;
         _loc1_.enabled = true;
         _loc1_.top = 5;
         _loc1_.right = 5;
         _loc1_.setStyle("icon",this._embed_mxml__styles_images_panel_btn_close_init_png_1805605639);
         _loc1_.setStyle("iconOver",this._embed_mxml__styles_images_panel_btn_close_over_png_2000923769);
         _loc1_.addEventListener("click",this.__btnClose_click);
         _loc1_.id = "btnClose";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.btnClose = _loc1_;
         BindingManager.executeBindings(this,"btnClose",this.btnClose);
         return _loc1_;
      }
      
      public function __btnClose_click(param1:MouseEvent) : void
      {
         this.moveDown.play();
      }
      
      private function _ScaleChooserSpark_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.gap = 22;
         _loc1_.top = 15;
         _loc1_.bottom = 15;
         _loc1_.left = 15;
         _loc1_.right = 15;
         _loc1_.mxmlContent = [this._ScaleChooserSpark_VGroup1_c(),this._ScaleChooserSpark_VGroup2_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ScaleChooserSpark_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.verticalCenter = 0;
         _loc1_.mxmlContent = [this._ScaleChooserSpark_Group3_i(),this._ScaleChooserSpark_Group4_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ScaleChooserSpark_Group3_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.height = 33;
         _loc1_.alpha = 1;
         _loc1_.mouseChildren = true;
         _loc1_.mxmlContent = [this._ScaleChooserSpark_Image1_c(),this._ScaleChooserSpark_HSlider1_i(),this._ScaleChooserSpark_Image2_c()];
         _loc1_.id = "_ScaleChooserSpark_Group3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ScaleChooserSpark_Group3 = _loc1_;
         BindingManager.executeBindings(this,"_ScaleChooserSpark_Group3",this._ScaleChooserSpark_Group3);
         return _loc1_;
      }
      
      private function _ScaleChooserSpark_Image1_c() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.source = this._embed_mxml__styles_images_details_ico_drag_body_min_png_1489058041;
         _loc1_.width = 29;
         _loc1_.height = 33;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ScaleChooserSpark_HSlider1_i() : HSlider
      {
         var _loc1_:HSlider = new HSlider();
         _loc1_.x = 30;
         _loc1_.width = 20;
         _loc1_.verticalCenter = 0;
         _loc1_.minimum = 60;
         _loc1_.maximum = 140;
         _loc1_.stepSize = 1;
         _loc1_.addEventListener("changeEnd",this.__sliderBody_changeEnd);
         _loc1_.id = "sliderBody";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.sliderBody = _loc1_;
         BindingManager.executeBindings(this,"sliderBody",this.sliderBody);
         return _loc1_;
      }
      
      public function __sliderBody_changeEnd(param1:FlexEvent) : void
      {
         this.changeBodySize();
      }
      
      private function _ScaleChooserSpark_Image2_c() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.source = this._embed_mxml__styles_images_details_ico_drag_body_max_png_1690384637;
         _loc1_.x = 65;
         _loc1_.width = 29;
         _loc1_.height = 33;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ScaleChooserSpark_Group4_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.height = 33;
         _loc1_.alpha = 1;
         _loc1_.mouseChildren = true;
         _loc1_.mxmlContent = [this._ScaleChooserSpark_Image3_c(),this._ScaleChooserSpark_HSlider2_i(),this._ScaleChooserSpark_Image4_c()];
         _loc1_.id = "_ScaleChooserSpark_Group4";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ScaleChooserSpark_Group4 = _loc1_;
         BindingManager.executeBindings(this,"_ScaleChooserSpark_Group4",this._ScaleChooserSpark_Group4);
         return _loc1_;
      }
      
      private function _ScaleChooserSpark_Image3_c() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.source = this._embed_mxml__styles_images_details_ico_drag_head_min_png_1564563317;
         _loc1_.width = 29;
         _loc1_.height = 33;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ScaleChooserSpark_HSlider2_i() : HSlider
      {
         var _loc1_:HSlider = new HSlider();
         _loc1_.x = 30;
         _loc1_.width = 20;
         _loc1_.verticalCenter = 0;
         _loc1_.minimum = 60;
         _loc1_.maximum = 180;
         _loc1_.stepSize = 1;
         _loc1_.addEventListener("changeEnd",this.__sliderHead_changeEnd);
         _loc1_.id = "sliderHead";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.sliderHead = _loc1_;
         BindingManager.executeBindings(this,"sliderHead",this.sliderHead);
         return _loc1_;
      }
      
      public function __sliderHead_changeEnd(param1:FlexEvent) : void
      {
         this.changeHeadSize();
      }
      
      private function _ScaleChooserSpark_Image4_c() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.source = this._embed_mxml__styles_images_details_ico_drag_head_max_png_994122617;
         _loc1_.x = 65;
         _loc1_.width = 29;
         _loc1_.height = 33;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ScaleChooserSpark_VGroup2_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.verticalCenter = 0;
         _loc1_.percentHeight = 100;
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._ScaleChooserSpark_HGroup2_c(),this._ScaleChooserSpark_HGroup3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ScaleChooserSpark_HGroup2_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalCenter = 0;
         _loc1_.mxmlContent = [this._ScaleChooserSpark_IconButton2_i(),this._ScaleChooserSpark_IconButton3_i(),this._ScaleChooserSpark_IconButton4_i(),this._ScaleChooserSpark_IconButton5_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ScaleChooserSpark_IconButton2_i() : IconButton
      {
         var _loc1_:IconButton = new IconButton();
         _loc1_.buttonMode = true;
         _loc1_.enabled = true;
         _loc1_.setStyle("icon",this._embed_mxml__styles_images_details_btn_bodytype01_init_png_548923715);
         _loc1_.setStyle("iconOver",this._embed_mxml__styles_images_details_btn_bodytype01_over_png_1018755509);
         _loc1_.addEventListener("click",this.__btnType01_click);
         _loc1_.id = "btnType01";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.btnType01 = _loc1_;
         BindingManager.executeBindings(this,"btnType01",this.btnType01);
         return _loc1_;
      }
      
      public function __btnType01_click(param1:MouseEvent) : void
      {
         this.onScaleButtonClick(param1);
      }
      
      private function _ScaleChooserSpark_IconButton3_i() : IconButton
      {
         var _loc1_:IconButton = new IconButton();
         _loc1_.buttonMode = true;
         _loc1_.enabled = true;
         _loc1_.setStyle("icon",this._embed_mxml__styles_images_details_btn_bodytype02_init_png_256313607);
         _loc1_.setStyle("iconOver",this._embed_mxml__styles_images_details_btn_bodytype02_over_png_727082119);
         _loc1_.addEventListener("click",this.__btnType02_click);
         _loc1_.id = "btnType02";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.btnType02 = _loc1_;
         BindingManager.executeBindings(this,"btnType02",this.btnType02);
         return _loc1_;
      }
      
      public function __btnType02_click(param1:MouseEvent) : void
      {
         this.onScaleButtonClick(param1);
      }
      
      private function _ScaleChooserSpark_IconButton4_i() : IconButton
      {
         var _loc1_:IconButton = new IconButton();
         _loc1_.buttonMode = true;
         _loc1_.enabled = true;
         _loc1_.setStyle("icon",this._embed_mxml__styles_images_details_btn_bodytype03_init_png_525739335);
         _loc1_.setStyle("iconOver",this._embed_mxml__styles_images_details_btn_bodytype03_over_png_523704647);
         _loc1_.addEventListener("click",this.__btnType03_click);
         _loc1_.id = "btnType03";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.btnType03 = _loc1_;
         BindingManager.executeBindings(this,"btnType03",this.btnType03);
         return _loc1_;
      }
      
      public function __btnType03_click(param1:MouseEvent) : void
      {
         this.onScaleButtonClick(param1);
      }
      
      private function _ScaleChooserSpark_IconButton5_i() : IconButton
      {
         var _loc1_:IconButton = new IconButton();
         _loc1_.buttonMode = true;
         _loc1_.enabled = true;
         _loc1_.setStyle("icon",this._embed_mxml__styles_images_details_btn_bodytype04_init_png_1589053115);
         _loc1_.setStyle("iconOver",this._embed_mxml__styles_images_details_btn_bodytype04_over_png_528750851);
         _loc1_.addEventListener("click",this.__btnType04_click);
         _loc1_.id = "btnType04";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.btnType04 = _loc1_;
         BindingManager.executeBindings(this,"btnType04",this.btnType04);
         return _loc1_;
      }
      
      public function __btnType04_click(param1:MouseEvent) : void
      {
         this.onScaleButtonClick(param1);
      }
      
      private function _ScaleChooserSpark_HGroup3_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalCenter = 0;
         _loc1_.alpha = 1;
         _loc1_.mouseChildren = true;
         _loc1_.mxmlContent = [this._ScaleChooserSpark_IconButton6_i(),this._ScaleChooserSpark_IconButton7_i(),this._ScaleChooserSpark_IconButton8_i(),this._ScaleChooserSpark_IconButton9_i()];
         _loc1_.id = "_ScaleChooserSpark_HGroup3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ScaleChooserSpark_HGroup3 = _loc1_;
         BindingManager.executeBindings(this,"_ScaleChooserSpark_HGroup3",this._ScaleChooserSpark_HGroup3);
         return _loc1_;
      }
      
      private function _ScaleChooserSpark_IconButton6_i() : IconButton
      {
         var _loc1_:IconButton = new IconButton();
         _loc1_.buttonMode = true;
         _loc1_.enabled = true;
         _loc1_.setStyle("icon",this._embed_mxml__styles_images_details_btn_arrowl_init_png_147572551);
         _loc1_.setStyle("iconOver",this._embed_mxml__styles_images_details_btn_arrowl_over_png_1774962567);
         _loc1_.addEventListener("click",this.__btnArrowLeft_click);
         _loc1_.id = "btnArrowLeft";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.btnArrowLeft = _loc1_;
         BindingManager.executeBindings(this,"btnArrowLeft",this.btnArrowLeft);
         return _loc1_;
      }
      
      public function __btnArrowLeft_click(param1:MouseEvent) : void
      {
         dispatchEvent(new CcThumbPropertyEvent(CcThumbPropertyEvent.CCPROP_LEFT_BUTTON_CLICK,this));
      }
      
      private function _ScaleChooserSpark_IconButton7_i() : IconButton
      {
         var _loc1_:IconButton = new IconButton();
         _loc1_.buttonMode = true;
         _loc1_.enabled = true;
         _loc1_.setStyle("icon",this._embed_mxml__styles_images_details_btn_arrowr_init_png_281765451);
         _loc1_.setStyle("iconOver",this._embed_mxml__styles_images_details_btn_arrowr_over_png_298567235);
         _loc1_.addEventListener("click",this.__btnArrowRight_click);
         _loc1_.id = "btnArrowRight";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.btnArrowRight = _loc1_;
         BindingManager.executeBindings(this,"btnArrowRight",this.btnArrowRight);
         return _loc1_;
      }
      
      public function __btnArrowRight_click(param1:MouseEvent) : void
      {
         dispatchEvent(new CcThumbPropertyEvent(CcThumbPropertyEvent.CCPROP_RIGHT_BUTTON_CLICK,this));
      }
      
      private function _ScaleChooserSpark_IconButton8_i() : IconButton
      {
         var _loc1_:IconButton = new IconButton();
         _loc1_.buttonMode = true;
         _loc1_.enabled = true;
         _loc1_.setStyle("icon",this._embed_mxml__styles_images_details_btn_arrowu_init_png_1510196995);
         _loc1_.setStyle("iconOver",this._embed_mxml__styles_images_details_btn_arrowu_over_png_1477683083);
         _loc1_.addEventListener("click",this.__btnArrowUp_click);
         _loc1_.id = "btnArrowUp";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.btnArrowUp = _loc1_;
         BindingManager.executeBindings(this,"btnArrowUp",this.btnArrowUp);
         return _loc1_;
      }
      
      public function __btnArrowUp_click(param1:MouseEvent) : void
      {
         dispatchEvent(new CcThumbPropertyEvent(CcThumbPropertyEvent.CCPROP_UP_BUTTON_CLICK,this));
      }
      
      private function _ScaleChooserSpark_IconButton9_i() : IconButton
      {
         var _loc1_:IconButton = new IconButton();
         _loc1_.buttonMode = true;
         _loc1_.enabled = true;
         _loc1_.setStyle("icon",this._embed_mxml__styles_images_details_btn_arrowd_init_png_926693625);
         _loc1_.setStyle("iconOver",this._embed_mxml__styles_images_details_btn_arrowd_over_png_372004985);
         _loc1_.addEventListener("click",this.__btnArrowDown_click);
         _loc1_.id = "btnArrowDown";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.btnArrowDown = _loc1_;
         BindingManager.executeBindings(this,"btnArrowDown",this.btnArrowDown);
         return _loc1_;
      }
      
      public function __btnArrowDown_click(param1:MouseEvent) : void
      {
         dispatchEvent(new CcThumbPropertyEvent(CcThumbPropertyEvent.CCPROP_DOWN_BUTTON_CLICK,this));
      }
      
      private function _ScaleChooserSpark_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,null,null,"moveUp.target","yPad");
         result[1] = new Binding(this,null,null,"moveDown.target","yPad");
         result[2] = new Binding(this,function():Number
         {
            return (this.width - yPad.width) / 2;
         },null,"yPad.x");
         result[3] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Close");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"btnClose.label");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _ScaleChooserSpark_Group3() : Group
      {
         return this._200915974_ScaleChooserSpark_Group3;
      }
      
      public function set _ScaleChooserSpark_Group3(param1:Group) : void
      {
         var _loc2_:Object = this._200915974_ScaleChooserSpark_Group3;
         if(_loc2_ !== param1)
         {
            this._200915974_ScaleChooserSpark_Group3 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_ScaleChooserSpark_Group3",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _ScaleChooserSpark_Group4() : Group
      {
         return this._200915975_ScaleChooserSpark_Group4;
      }
      
      public function set _ScaleChooserSpark_Group4(param1:Group) : void
      {
         var _loc2_:Object = this._200915975_ScaleChooserSpark_Group4;
         if(_loc2_ !== param1)
         {
            this._200915975_ScaleChooserSpark_Group4 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_ScaleChooserSpark_Group4",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _ScaleChooserSpark_HGroup3() : HGroup
      {
         return this._1592476650_ScaleChooserSpark_HGroup3;
      }
      
      public function set _ScaleChooserSpark_HGroup3(param1:HGroup) : void
      {
         var _loc2_:Object = this._1592476650_ScaleChooserSpark_HGroup3;
         if(_loc2_ !== param1)
         {
            this._1592476650_ScaleChooserSpark_HGroup3 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_ScaleChooserSpark_HGroup3",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnArrowDown() : IconButton
      {
         return this._1686836913btnArrowDown;
      }
      
      public function set btnArrowDown(param1:IconButton) : void
      {
         var _loc2_:Object = this._1686836913btnArrowDown;
         if(_loc2_ !== param1)
         {
            this._1686836913btnArrowDown = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnArrowDown",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnArrowLeft() : IconButton
      {
         return this._1686608716btnArrowLeft;
      }
      
      public function set btnArrowLeft(param1:IconButton) : void
      {
         var _loc2_:Object = this._1686608716btnArrowLeft;
         if(_loc2_ !== param1)
         {
            this._1686608716btnArrowLeft = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnArrowLeft",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnArrowRight() : IconButton
      {
         return this._739601649btnArrowRight;
      }
      
      public function set btnArrowRight(param1:IconButton) : void
      {
         var _loc2_:Object = this._739601649btnArrowRight;
         if(_loc2_ !== param1)
         {
            this._739601649btnArrowRight = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnArrowRight",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnArrowUp() : IconButton
      {
         return this._1923540344btnArrowUp;
      }
      
      public function set btnArrowUp(param1:IconButton) : void
      {
         var _loc2_:Object = this._1923540344btnArrowUp;
         if(_loc2_ !== param1)
         {
            this._1923540344btnArrowUp = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnArrowUp",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnClose() : IconButton
      {
         return this._2082343164btnClose;
      }
      
      public function set btnClose(param1:IconButton) : void
      {
         var _loc2_:Object = this._2082343164btnClose;
         if(_loc2_ !== param1)
         {
            this._2082343164btnClose = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnClose",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnType01() : IconButton
      {
         return this._626844727btnType01;
      }
      
      public function set btnType01(param1:IconButton) : void
      {
         var _loc2_:Object = this._626844727btnType01;
         if(_loc2_ !== param1)
         {
            this._626844727btnType01 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnType01",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnType02() : IconButton
      {
         return this._626844728btnType02;
      }
      
      public function set btnType02(param1:IconButton) : void
      {
         var _loc2_:Object = this._626844728btnType02;
         if(_loc2_ !== param1)
         {
            this._626844728btnType02 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnType02",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnType03() : IconButton
      {
         return this._626844729btnType03;
      }
      
      public function set btnType03(param1:IconButton) : void
      {
         var _loc2_:Object = this._626844729btnType03;
         if(_loc2_ !== param1)
         {
            this._626844729btnType03 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnType03",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnType04() : IconButton
      {
         return this._626844730btnType04;
      }
      
      public function set btnType04(param1:IconButton) : void
      {
         var _loc2_:Object = this._626844730btnType04;
         if(_loc2_ !== param1)
         {
            this._626844730btnType04 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnType04",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get dropShadow() : RectangularDropShadow
      {
         return this._906978543dropShadow;
      }
      
      public function set dropShadow(param1:RectangularDropShadow) : void
      {
         var _loc2_:Object = this._906978543dropShadow;
         if(_loc2_ !== param1)
         {
            this._906978543dropShadow = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dropShadow",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get moveDown() : Animate
      {
         return this._104889325moveDown;
      }
      
      public function set moveDown(param1:Animate) : void
      {
         var _loc2_:Object = this._104889325moveDown;
         if(_loc2_ !== param1)
         {
            this._104889325moveDown = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"moveDown",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get moveUp() : Animate
      {
         return this._1068263860moveUp;
      }
      
      public function set moveUp(param1:Animate) : void
      {
         var _loc2_:Object = this._1068263860moveUp;
         if(_loc2_ !== param1)
         {
            this._1068263860moveUp = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"moveUp",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get sliderBody() : HSlider
      {
         return this._1105645091sliderBody;
      }
      
      public function set sliderBody(param1:HSlider) : void
      {
         var _loc2_:Object = this._1105645091sliderBody;
         if(_loc2_ !== param1)
         {
            this._1105645091sliderBody = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sliderBody",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get sliderHead() : HSlider
      {
         return this._1105814113sliderHead;
      }
      
      public function set sliderHead(param1:HSlider) : void
      {
         var _loc2_:Object = this._1105814113sliderHead;
         if(_loc2_ !== param1)
         {
            this._1105814113sliderHead = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sliderHead",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get yPad() : Group
      {
         return this._3684698yPad;
      }
      
      public function set yPad(param1:Group) : void
      {
         var _loc2_:Object = this._3684698yPad;
         if(_loc2_ !== param1)
         {
            this._3684698yPad = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"yPad",_loc2_,param1));
            }
         }
      }
   }
}
