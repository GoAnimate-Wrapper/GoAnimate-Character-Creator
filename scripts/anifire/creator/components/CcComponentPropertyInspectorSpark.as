package anifire.creator.components
{
   import anifire.constant.CcLibConstant;
   import anifire.creator.events.CcThumbPropertyEvent;
   import anifire.creator.models.CcComponent;
   import anifire.util.UtilDict;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.EffectEvent;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.states.AddItems;
   import mx.states.State;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.VGroup;
   import spark.effects.Animate;
   import spark.effects.animation.MotionPath;
   import spark.effects.animation.SimpleMotionPath;
   import spark.primitives.Rect;
   import spark.primitives.RectangularDropShadow;
   
   use namespace mx_internal;
   
   public class CcComponentPropertyInspectorSpark extends Group implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _760107692_CcComponentPropertyInspectorSpark_HGroup1:HGroup;
      
      public var _CcComponentPropertyInspectorSpark_VGroup1:VGroup;
      
      public var _CcComponentPropertyInspectorSpark_VGroup2:VGroup;
      
      public var _CcComponentPropertyInspectorSpark_VGroup3:VGroup;
      
      private var _204767493bgCross:DirectionControlSpark;
      
      private var _2082343164btnClose:IconButton;
      
      private var _196605078btnExtend:IconButton;
      
      private var _349934417btnOffsetDown:IconButton;
      
      private var _1023827210btnOffsetUp:IconButton;
      
      private var _923101209btnRotateDown:IconButton;
      
      private var _1739506642btnRotateUp:IconButton;
      
      private var _1756165648btnScaleDown:IconButton;
      
      private var _721380233btnScaleUp:IconButton;
      
      private var _978900240btnXScaleDown:IconButton;
      
      private var _255766423btnXScaleUp:IconButton;
      
      private var _1175413745btnYScaleDown:IconButton;
      
      private var _1487043912btnYScaleUp:IconButton;
      
      private var _906978543dropShadow:RectangularDropShadow;
      
      private var _104889325moveDown:Animate;
      
      private var _1068263860moveUp:Animate;
      
      private var _3684698yPad:Group;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _component:CcComponent;
      
      private var _timer:Timer;
      
      private var _type:String;
      
      private var hideFinishFlag:Boolean = true;
      
      private var _embed_mxml__styles_images_details_btn_scale_down_init_png_60286471:Class;
      
      private var _embed_mxml__styles_images_panel_btn_close_over_png_2000923769:Class;
      
      private var _embed_mxml__styles_images_details_btn_rotate_left_init_png_545166073:Class;
      
      private var _embed_mxml__styles_images_details_btn_closer_over_png_1861461063:Class;
      
      private var _embed_mxml__styles_images_details_btn_anchor_disabled_png_1132750411:Class;
      
      private var _embed_mxml__styles_images_details_btn_scale_up_over_png_1478670653:Class;
      
      private var _embed_mxml__styles_images_details_btn_closer_init_png_159598407:Class;
      
      private var _embed_mxml__styles_images_details_btn_anchor_init_png_804542717:Class;
      
      private var _embed_mxml__styles_images_details_btn_scale_up_y_over_png_56092231:Class;
      
      private var _embed_mxml__styles_images_details_btn_scale_up_x_over_png_524746883:Class;
      
      private var _embed_mxml__styles_images_details_btn_scale_down_x_init_png_928933339:Class;
      
      private var _embed_mxml__styles_images_details_btn_scale_down_y_init_png_927008027:Class;
      
      private var _embed_mxml__styles_images_details_btn_wider_over_png_867826631:Class;
      
      private var _embed_mxml__styles_images_panel_btn_close_init_png_1805605639:Class;
      
      private var _embed_mxml__styles_images_details_btn_anchor_over_png_770455653:Class;
      
      private var _embed_mxml__styles_images_details_btn_rotate_right_init_png_884865483:Class;
      
      private var _embed_mxml__styles_images_details_btn_scale_down_y_over_png_884736387:Class;
      
      private var _embed_mxml__styles_images_details_btn_rotate_right_over_png_934815171:Class;
      
      private var _embed_mxml__styles_images_details_btn_scale_up_x_init_png_456549387:Class;
      
      private var _embed_mxml__styles_images_details_btn_scale_down_over_png_545719943:Class;
      
      private var _embed_mxml__styles_images_details_btn_scale_down_x_over_png_859906499:Class;
      
      private var _embed_mxml__styles_images_details_btn_scale_up_init_png_953104677:Class;
      
      private var _embed_mxml__styles_images_details_btn_wider_init_png_850996167:Class;
      
      private var _embed_mxml__styles_images_details_btn_scale_up_y_init_png_591857223:Class;
      
      private var _embed_mxml__styles_images_details_btn_rotate_left_over_png_1871588985:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function CcComponentPropertyInspectorSpark()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._embed_mxml__styles_images_details_btn_scale_down_init_png_60286471 = CcComponentPropertyInspectorSpark__embed_mxml__styles_images_details_btn_scale_down_init_png_60286471;
         this._embed_mxml__styles_images_panel_btn_close_over_png_2000923769 = CcComponentPropertyInspectorSpark__embed_mxml__styles_images_panel_btn_close_over_png_2000923769;
         this._embed_mxml__styles_images_details_btn_rotate_left_init_png_545166073 = CcComponentPropertyInspectorSpark__embed_mxml__styles_images_details_btn_rotate_left_init_png_545166073;
         this._embed_mxml__styles_images_details_btn_closer_over_png_1861461063 = CcComponentPropertyInspectorSpark__embed_mxml__styles_images_details_btn_closer_over_png_1861461063;
         this._embed_mxml__styles_images_details_btn_anchor_disabled_png_1132750411 = CcComponentPropertyInspectorSpark__embed_mxml__styles_images_details_btn_anchor_disabled_png_1132750411;
         this._embed_mxml__styles_images_details_btn_scale_up_over_png_1478670653 = CcComponentPropertyInspectorSpark__embed_mxml__styles_images_details_btn_scale_up_over_png_1478670653;
         this._embed_mxml__styles_images_details_btn_closer_init_png_159598407 = CcComponentPropertyInspectorSpark__embed_mxml__styles_images_details_btn_closer_init_png_159598407;
         this._embed_mxml__styles_images_details_btn_anchor_init_png_804542717 = CcComponentPropertyInspectorSpark__embed_mxml__styles_images_details_btn_anchor_init_png_804542717;
         this._embed_mxml__styles_images_details_btn_scale_up_y_over_png_56092231 = CcComponentPropertyInspectorSpark__embed_mxml__styles_images_details_btn_scale_up_y_over_png_56092231;
         this._embed_mxml__styles_images_details_btn_scale_up_x_over_png_524746883 = CcComponentPropertyInspectorSpark__embed_mxml__styles_images_details_btn_scale_up_x_over_png_524746883;
         this._embed_mxml__styles_images_details_btn_scale_down_x_init_png_928933339 = CcComponentPropertyInspectorSpark__embed_mxml__styles_images_details_btn_scale_down_x_init_png_928933339;
         this._embed_mxml__styles_images_details_btn_scale_down_y_init_png_927008027 = CcComponentPropertyInspectorSpark__embed_mxml__styles_images_details_btn_scale_down_y_init_png_927008027;
         this._embed_mxml__styles_images_details_btn_wider_over_png_867826631 = CcComponentPropertyInspectorSpark__embed_mxml__styles_images_details_btn_wider_over_png_867826631;
         this._embed_mxml__styles_images_panel_btn_close_init_png_1805605639 = CcComponentPropertyInspectorSpark__embed_mxml__styles_images_panel_btn_close_init_png_1805605639;
         this._embed_mxml__styles_images_details_btn_anchor_over_png_770455653 = CcComponentPropertyInspectorSpark__embed_mxml__styles_images_details_btn_anchor_over_png_770455653;
         this._embed_mxml__styles_images_details_btn_rotate_right_init_png_884865483 = CcComponentPropertyInspectorSpark__embed_mxml__styles_images_details_btn_rotate_right_init_png_884865483;
         this._embed_mxml__styles_images_details_btn_scale_down_y_over_png_884736387 = CcComponentPropertyInspectorSpark__embed_mxml__styles_images_details_btn_scale_down_y_over_png_884736387;
         this._embed_mxml__styles_images_details_btn_rotate_right_over_png_934815171 = CcComponentPropertyInspectorSpark__embed_mxml__styles_images_details_btn_rotate_right_over_png_934815171;
         this._embed_mxml__styles_images_details_btn_scale_up_x_init_png_456549387 = CcComponentPropertyInspectorSpark__embed_mxml__styles_images_details_btn_scale_up_x_init_png_456549387;
         this._embed_mxml__styles_images_details_btn_scale_down_over_png_545719943 = CcComponentPropertyInspectorSpark__embed_mxml__styles_images_details_btn_scale_down_over_png_545719943;
         this._embed_mxml__styles_images_details_btn_scale_down_x_over_png_859906499 = CcComponentPropertyInspectorSpark__embed_mxml__styles_images_details_btn_scale_down_x_over_png_859906499;
         this._embed_mxml__styles_images_details_btn_scale_up_init_png_953104677 = CcComponentPropertyInspectorSpark__embed_mxml__styles_images_details_btn_scale_up_init_png_953104677;
         this._embed_mxml__styles_images_details_btn_wider_init_png_850996167 = CcComponentPropertyInspectorSpark__embed_mxml__styles_images_details_btn_wider_init_png_850996167;
         this._embed_mxml__styles_images_details_btn_scale_up_y_init_png_591857223 = CcComponentPropertyInspectorSpark__embed_mxml__styles_images_details_btn_scale_up_y_init_png_591857223;
         this._embed_mxml__styles_images_details_btn_rotate_left_over_png_1871588985 = CcComponentPropertyInspectorSpark__embed_mxml__styles_images_details_btn_rotate_left_over_png_1871588985;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._CcComponentPropertyInspectorSpark_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_creator_components_CcComponentPropertyInspectorSparkWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return CcComponentPropertyInspectorSpark[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.width = 300;
         this.height = 100;
         this.mxmlContent = [this._CcComponentPropertyInspectorSpark_IconButton1_i(),this._CcComponentPropertyInspectorSpark_Group2_i()];
         this.currentState = "keep_pro";
         this._CcComponentPropertyInspectorSpark_Animate2_i();
         this._CcComponentPropertyInspectorSpark_Animate1_i();
         var _CcComponentPropertyInspectorSpark_VGroup1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._CcComponentPropertyInspectorSpark_VGroup1_i);
         var _CcComponentPropertyInspectorSpark_VGroup2_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._CcComponentPropertyInspectorSpark_VGroup2_i);
         var _CcComponentPropertyInspectorSpark_VGroup3_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._CcComponentPropertyInspectorSpark_VGroup3_i);
         states = [new State({
            "name":"keep_pro",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_CcComponentPropertyInspectorSpark_VGroup1_factory,
               "destination":"_CcComponentPropertyInspectorSpark_HGroup1",
               "propertyName":"mxmlContent",
               "position":"first"
            })]
         }),new State({
            "name":"no_pro",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_CcComponentPropertyInspectorSpark_VGroup3_factory,
               "destination":"_CcComponentPropertyInspectorSpark_HGroup1",
               "propertyName":"mxmlContent",
               "position":"first"
            }),new AddItems().initializeFromObject({
               "itemsFactory":_CcComponentPropertyInspectorSpark_VGroup2_factory,
               "destination":"_CcComponentPropertyInspectorSpark_HGroup1",
               "propertyName":"mxmlContent",
               "position":"first"
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
         CcComponentPropertyInspectorSpark._watcherSetupUtil = param1;
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
      
      public function init(param1:CcComponent, param2:int = 0) : void
      {
         if(!CcLibConstant.HAS_DETAIL_CONTROL)
         {
            return;
         }
         this._timer = new Timer(200,1);
         this._component = param1;
         if(CcLibConstant.ALL_HEAD_COMPONENT_TYPES.indexOf(this._component.componentThumb.type) > -1)
         {
            this.btnExtend.enabled = true;
         }
         else
         {
            this.btnExtend.enabled = false;
         }
         if(CcLibConstant.ALL_OFFSETABLE_COMPONENT_TYPES.indexOf(this._component.componentThumb.type) > -1)
         {
            this.btnOffsetUp.visible = true;
            this.btnOffsetDown.visible = true;
         }
         else
         {
            this.btnOffsetUp.visible = false;
            this.btnOffsetDown.visible = false;
         }
         if(param2 == 0)
         {
            setCurrentState("keep_pro");
         }
         else
         {
            setCurrentState("no_pro");
         }
         this.bgCross.addEventListener(CcThumbPropertyEvent.CCPROP_UP_BUTTON_CLICK,this.onCrossDown);
         this.bgCross.addEventListener(CcThumbPropertyEvent.CCPROP_DOWN_BUTTON_CLICK,this.onCrossDown);
         this.bgCross.addEventListener(CcThumbPropertyEvent.CCPROP_LEFT_BUTTON_CLICK,this.onCrossDown);
         this.bgCross.addEventListener(CcThumbPropertyEvent.CCPROP_RIGHT_BUTTON_CLICK,this.onCrossDown);
      }
      
      private function onCrossDown(param1:Event) : void
      {
         CcThumbPropertyEvent(param1).component = this._component;
         this.dispatch(param1);
      }
      
      private function onMouseDown(param1:Event) : void
      {
         var _loc2_:CcThumbPropertyEvent = null;
         this._type = this.getTypeByEventTarget(param1.currentTarget);
         _loc2_ = new CcThumbPropertyEvent(this._type,this);
         _loc2_.component = this._component;
         this.dispatch(_loc2_);
         this._timer = new Timer(1000,1);
         this._timer.addEventListener(TimerEvent.TIMER,this.doFirstTimer);
         this._timer.start();
      }
      
      private function onMouseUp(param1:Event) : void
      {
         var _loc2_:CcThumbPropertyEvent = null;
         if(this._timer != null && this._timer.running)
         {
            this._timer.stop();
            this._timer.removeEventListener(TimerEvent.TIMER,this.doTimer);
            _loc2_ = new CcThumbPropertyEvent(CcThumbPropertyEvent.CCPROP_LOCATION_UPDATE,this);
            this.dispatch(_loc2_);
         }
      }
      
      private function doFirstTimer(param1:TimerEvent) : void
      {
         this._timer.stop();
         this._timer.removeEventListener(TimerEvent.TIMER,this.doFirstTimer);
         this._timer = new Timer(20);
         this._timer.addEventListener(TimerEvent.TIMER,this.doTimer);
         this._timer.start();
      }
      
      private function doTimer(param1:TimerEvent) : void
      {
         var _loc2_:String = null;
         var _loc3_:CcThumbPropertyEvent = null;
         _loc2_ = this._type;
         _loc3_ = new CcThumbPropertyEvent(_loc2_,this);
         _loc3_.component = this._component;
         this.dispatch(_loc3_);
      }
      
      private function onClick(param1:Event) : void
      {
         var _loc3_:CcThumbPropertyEvent = null;
         var _loc2_:String = this.getTypeByEventTarget(param1.currentTarget);
         _loc3_ = new CcThumbPropertyEvent(_loc2_,this);
         _loc3_.component = this._component;
         this.dispatch(_loc3_);
      }
      
      public function destroy() : void
      {
         this.btnExtend.enabled = false;
      }
      
      public function close() : void
      {
         if(!this.hideFinishFlag)
         {
            this.startHide();
         }
      }
      
      private function startHide() : void
      {
         this.moveDown.play();
      }
      
      private function dispatch(param1:Event) : void
      {
         var _loc2_:CcThumbPropertyEvent = CcThumbPropertyEvent(param1).clone() as CcThumbPropertyEvent;
         _loc2_.component = this._component;
         this.dispatchEvent(_loc2_);
      }
      
      private function getTypeByEventTarget(param1:Object) : String
      {
         var _loc2_:String = "";
         switch(param1)
         {
            case this.btnRotateUp:
               _loc2_ = CcThumbPropertyEvent.CCPROP_ROTATEUP_BUTTON_CLICK;
               break;
            case this.btnRotateDown:
               _loc2_ = CcThumbPropertyEvent.CCPROP_ROTATEDOWN_BUTTON_CLICK;
               break;
            case this.btnScaleUp:
               _loc2_ = CcThumbPropertyEvent.CCPROP_SCALEUP_BUTTON_CLICK;
               break;
            case this.btnScaleDown:
               _loc2_ = CcThumbPropertyEvent.CCPROP_SCALEDOWN_BUTTON_CLICK;
               break;
            case this.btnXScaleUp:
               _loc2_ = CcThumbPropertyEvent.CCPROP_SCALEXUP_BUTTON_CLICK;
               break;
            case this.btnXScaleDown:
               _loc2_ = CcThumbPropertyEvent.CCPROP_SCALEXDOWN_BUTTON_CLICK;
               break;
            case this.btnYScaleUp:
               _loc2_ = CcThumbPropertyEvent.CCPROP_SCALEYUP_BUTTON_CLICK;
               break;
            case this.btnYScaleDown:
               _loc2_ = CcThumbPropertyEvent.CCPROP_SCALEYDOWN_BUTTON_CLICK;
               break;
            case this.btnOffsetUp:
               _loc2_ = CcThumbPropertyEvent.CCPROP_OFFSETUP_BUTTON_CLICK;
               break;
            case this.btnOffsetDown:
               _loc2_ = CcThumbPropertyEvent.CCPROP_OFFSETDOWN_BUTTON_CLICK;
         }
         return _loc2_;
      }
      
      private function _CcComponentPropertyInspectorSpark_Animate2_i() : Animate
      {
         var _loc1_:Animate = new Animate();
         _loc1_.duration = 500;
         _loc1_.motionPaths = new <MotionPath>[this._CcComponentPropertyInspectorSpark_SimpleMotionPath3_c(),this._CcComponentPropertyInspectorSpark_SimpleMotionPath4_c()];
         _loc1_.addEventListener("effectEnd",this.__moveDown_effectEnd);
         this.moveDown = _loc1_;
         BindingManager.executeBindings(this,"moveDown",this.moveDown);
         return _loc1_;
      }
      
      private function _CcComponentPropertyInspectorSpark_SimpleMotionPath3_c() : SimpleMotionPath
      {
         var _loc1_:SimpleMotionPath = new SimpleMotionPath();
         _loc1_.property = "y";
         _loc1_.valueFrom = 5;
         _loc1_.valueTo = 105;
         return _loc1_;
      }
      
      private function _CcComponentPropertyInspectorSpark_SimpleMotionPath4_c() : SimpleMotionPath
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
      
      private function _CcComponentPropertyInspectorSpark_Animate1_i() : Animate
      {
         var _loc1_:Animate = new Animate();
         _loc1_.duration = 500;
         _loc1_.motionPaths = new <MotionPath>[this._CcComponentPropertyInspectorSpark_SimpleMotionPath1_c(),this._CcComponentPropertyInspectorSpark_SimpleMotionPath2_c()];
         _loc1_.addEventListener("effectStart",this.__moveUp_effectStart);
         this.moveUp = _loc1_;
         BindingManager.executeBindings(this,"moveUp",this.moveUp);
         return _loc1_;
      }
      
      private function _CcComponentPropertyInspectorSpark_SimpleMotionPath1_c() : SimpleMotionPath
      {
         var _loc1_:SimpleMotionPath = new SimpleMotionPath();
         _loc1_.property = "y";
         _loc1_.valueFrom = 105;
         _loc1_.valueTo = 5;
         return _loc1_;
      }
      
      private function _CcComponentPropertyInspectorSpark_SimpleMotionPath2_c() : SimpleMotionPath
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
      
      private function _CcComponentPropertyInspectorSpark_IconButton1_i() : IconButton
      {
         var _loc1_:IconButton = new IconButton();
         _loc1_.buttonMode = true;
         _loc1_.enabled = true;
         _loc1_.right = 15;
         _loc1_.bottom = 27;
         _loc1_.setStyle("icon",this._embed_mxml__styles_images_details_btn_anchor_init_png_804542717);
         _loc1_.setStyle("iconOver",this._embed_mxml__styles_images_details_btn_anchor_over_png_770455653);
         _loc1_.setStyle("iconDisabled",this._embed_mxml__styles_images_details_btn_anchor_disabled_png_1132750411);
         _loc1_.addEventListener("click",this.__btnExtend_click);
         _loc1_.id = "btnExtend";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.btnExtend = _loc1_;
         BindingManager.executeBindings(this,"btnExtend",this.btnExtend);
         return _loc1_;
      }
      
      public function __btnExtend_click(param1:MouseEvent) : void
      {
         this.moveUp.play();
      }
      
      private function _CcComponentPropertyInspectorSpark_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.y = 105;
         _loc1_.alpha = 0;
         _loc1_.mouseChildren = false;
         _loc1_.mxmlContent = [this._CcComponentPropertyInspectorSpark_Rect1_c(),this._CcComponentPropertyInspectorSpark_RectangularDropShadow1_i(),this._CcComponentPropertyInspectorSpark_IconButton2_i(),this._CcComponentPropertyInspectorSpark_HGroup1_i()];
         _loc1_.id = "yPad";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.yPad = _loc1_;
         BindingManager.executeBindings(this,"yPad",this.yPad);
         return _loc1_;
      }
      
      private function _CcComponentPropertyInspectorSpark_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.width = 280;
         _loc1_.height = 101;
         _loc1_.radiusX = 5;
         _loc1_.radiusY = 5;
         _loc1_.fill = this._CcComponentPropertyInspectorSpark_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _CcComponentPropertyInspectorSpark_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 3355443;
         return _loc1_;
      }
      
      private function _CcComponentPropertyInspectorSpark_RectangularDropShadow1_i() : RectangularDropShadow
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
      
      private function _CcComponentPropertyInspectorSpark_IconButton2_i() : IconButton
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
         this.startHide();
      }
      
      private function _CcComponentPropertyInspectorSpark_HGroup1_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.top = 15;
         _loc1_.bottom = 15;
         _loc1_.left = 15;
         _loc1_.right = 15;
         _loc1_.gap = 8;
         _loc1_.horizontalAlign = "center";
         _loc1_.mxmlContent = [this._CcComponentPropertyInspectorSpark_VGroup4_c(),this._CcComponentPropertyInspectorSpark_VGroup5_c(),this._CcComponentPropertyInspectorSpark_DirectionControlSpark1_i()];
         _loc1_.id = "_CcComponentPropertyInspectorSpark_HGroup1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CcComponentPropertyInspectorSpark_HGroup1 = _loc1_;
         BindingManager.executeBindings(this,"_CcComponentPropertyInspectorSpark_HGroup1",this._CcComponentPropertyInspectorSpark_HGroup1);
         return _loc1_;
      }
      
      private function _CcComponentPropertyInspectorSpark_VGroup1_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.gap = 8;
         _loc1_.mxmlContent = [this._CcComponentPropertyInspectorSpark_IconButton3_i(),this._CcComponentPropertyInspectorSpark_IconButton4_i()];
         _loc1_.id = "_CcComponentPropertyInspectorSpark_VGroup1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CcComponentPropertyInspectorSpark_VGroup1 = _loc1_;
         BindingManager.executeBindings(this,"_CcComponentPropertyInspectorSpark_VGroup1",this._CcComponentPropertyInspectorSpark_VGroup1);
         return _loc1_;
      }
      
      private function _CcComponentPropertyInspectorSpark_IconButton3_i() : IconButton
      {
         var _loc1_:IconButton = new IconButton();
         _loc1_.buttonMode = true;
         _loc1_.enabled = true;
         _loc1_.setStyle("icon",this._embed_mxml__styles_images_details_btn_scale_up_init_png_953104677);
         _loc1_.setStyle("iconOver",this._embed_mxml__styles_images_details_btn_scale_up_over_png_1478670653);
         _loc1_.addEventListener("mouseDown",this.__btnScaleUp_mouseDown);
         _loc1_.addEventListener("mouseOut",this.__btnScaleUp_mouseOut);
         _loc1_.addEventListener("mouseUp",this.__btnScaleUp_mouseUp);
         _loc1_.id = "btnScaleUp";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.btnScaleUp = _loc1_;
         BindingManager.executeBindings(this,"btnScaleUp",this.btnScaleUp);
         return _loc1_;
      }
      
      public function __btnScaleUp_mouseDown(param1:MouseEvent) : void
      {
         this.onMouseDown(param1);
      }
      
      public function __btnScaleUp_mouseOut(param1:MouseEvent) : void
      {
         this.onMouseUp(param1);
      }
      
      public function __btnScaleUp_mouseUp(param1:MouseEvent) : void
      {
         this.onMouseUp(param1);
      }
      
      private function _CcComponentPropertyInspectorSpark_IconButton4_i() : IconButton
      {
         var _loc1_:IconButton = new IconButton();
         _loc1_.buttonMode = true;
         _loc1_.enabled = true;
         _loc1_.setStyle("icon",this._embed_mxml__styles_images_details_btn_scale_down_init_png_60286471);
         _loc1_.setStyle("iconOver",this._embed_mxml__styles_images_details_btn_scale_down_over_png_545719943);
         _loc1_.addEventListener("mouseDown",this.__btnScaleDown_mouseDown);
         _loc1_.addEventListener("mouseOut",this.__btnScaleDown_mouseOut);
         _loc1_.addEventListener("mouseUp",this.__btnScaleDown_mouseUp);
         _loc1_.id = "btnScaleDown";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.btnScaleDown = _loc1_;
         BindingManager.executeBindings(this,"btnScaleDown",this.btnScaleDown);
         return _loc1_;
      }
      
      public function __btnScaleDown_mouseDown(param1:MouseEvent) : void
      {
         this.onMouseDown(param1);
      }
      
      public function __btnScaleDown_mouseOut(param1:MouseEvent) : void
      {
         this.onMouseUp(param1);
      }
      
      public function __btnScaleDown_mouseUp(param1:MouseEvent) : void
      {
         this.onMouseUp(param1);
      }
      
      private function _CcComponentPropertyInspectorSpark_VGroup2_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.gap = 8;
         _loc1_.mxmlContent = [this._CcComponentPropertyInspectorSpark_IconButton5_i(),this._CcComponentPropertyInspectorSpark_IconButton6_i()];
         _loc1_.id = "_CcComponentPropertyInspectorSpark_VGroup2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CcComponentPropertyInspectorSpark_VGroup2 = _loc1_;
         BindingManager.executeBindings(this,"_CcComponentPropertyInspectorSpark_VGroup2",this._CcComponentPropertyInspectorSpark_VGroup2);
         return _loc1_;
      }
      
      private function _CcComponentPropertyInspectorSpark_IconButton5_i() : IconButton
      {
         var _loc1_:IconButton = new IconButton();
         _loc1_.buttonMode = true;
         _loc1_.enabled = true;
         _loc1_.setStyle("icon",this._embed_mxml__styles_images_details_btn_scale_up_x_init_png_456549387);
         _loc1_.setStyle("iconOver",this._embed_mxml__styles_images_details_btn_scale_up_x_over_png_524746883);
         _loc1_.addEventListener("mouseDown",this.__btnXScaleUp_mouseDown);
         _loc1_.addEventListener("mouseOut",this.__btnXScaleUp_mouseOut);
         _loc1_.addEventListener("mouseUp",this.__btnXScaleUp_mouseUp);
         _loc1_.id = "btnXScaleUp";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.btnXScaleUp = _loc1_;
         BindingManager.executeBindings(this,"btnXScaleUp",this.btnXScaleUp);
         return _loc1_;
      }
      
      public function __btnXScaleUp_mouseDown(param1:MouseEvent) : void
      {
         this.onMouseDown(param1);
      }
      
      public function __btnXScaleUp_mouseOut(param1:MouseEvent) : void
      {
         this.onMouseUp(param1);
      }
      
      public function __btnXScaleUp_mouseUp(param1:MouseEvent) : void
      {
         this.onMouseUp(param1);
      }
      
      private function _CcComponentPropertyInspectorSpark_IconButton6_i() : IconButton
      {
         var _loc1_:IconButton = new IconButton();
         _loc1_.buttonMode = true;
         _loc1_.enabled = true;
         _loc1_.setStyle("icon",this._embed_mxml__styles_images_details_btn_scale_down_x_init_png_928933339);
         _loc1_.setStyle("iconOver",this._embed_mxml__styles_images_details_btn_scale_down_x_over_png_859906499);
         _loc1_.addEventListener("mouseDown",this.__btnXScaleDown_mouseDown);
         _loc1_.addEventListener("mouseOut",this.__btnXScaleDown_mouseOut);
         _loc1_.addEventListener("mouseUp",this.__btnXScaleDown_mouseUp);
         _loc1_.id = "btnXScaleDown";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.btnXScaleDown = _loc1_;
         BindingManager.executeBindings(this,"btnXScaleDown",this.btnXScaleDown);
         return _loc1_;
      }
      
      public function __btnXScaleDown_mouseDown(param1:MouseEvent) : void
      {
         this.onMouseDown(param1);
      }
      
      public function __btnXScaleDown_mouseOut(param1:MouseEvent) : void
      {
         this.onMouseUp(param1);
      }
      
      public function __btnXScaleDown_mouseUp(param1:MouseEvent) : void
      {
         this.onMouseUp(param1);
      }
      
      private function _CcComponentPropertyInspectorSpark_VGroup3_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.gap = 8;
         _loc1_.mxmlContent = [this._CcComponentPropertyInspectorSpark_IconButton7_i(),this._CcComponentPropertyInspectorSpark_IconButton8_i()];
         _loc1_.id = "_CcComponentPropertyInspectorSpark_VGroup3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CcComponentPropertyInspectorSpark_VGroup3 = _loc1_;
         BindingManager.executeBindings(this,"_CcComponentPropertyInspectorSpark_VGroup3",this._CcComponentPropertyInspectorSpark_VGroup3);
         return _loc1_;
      }
      
      private function _CcComponentPropertyInspectorSpark_IconButton7_i() : IconButton
      {
         var _loc1_:IconButton = new IconButton();
         _loc1_.buttonMode = true;
         _loc1_.enabled = true;
         _loc1_.setStyle("icon",this._embed_mxml__styles_images_details_btn_scale_up_y_init_png_591857223);
         _loc1_.setStyle("iconOver",this._embed_mxml__styles_images_details_btn_scale_up_y_over_png_56092231);
         _loc1_.addEventListener("mouseDown",this.__btnYScaleUp_mouseDown);
         _loc1_.addEventListener("mouseOut",this.__btnYScaleUp_mouseOut);
         _loc1_.addEventListener("mouseUp",this.__btnYScaleUp_mouseUp);
         _loc1_.id = "btnYScaleUp";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.btnYScaleUp = _loc1_;
         BindingManager.executeBindings(this,"btnYScaleUp",this.btnYScaleUp);
         return _loc1_;
      }
      
      public function __btnYScaleUp_mouseDown(param1:MouseEvent) : void
      {
         this.onMouseDown(param1);
      }
      
      public function __btnYScaleUp_mouseOut(param1:MouseEvent) : void
      {
         this.onMouseUp(param1);
      }
      
      public function __btnYScaleUp_mouseUp(param1:MouseEvent) : void
      {
         this.onMouseUp(param1);
      }
      
      private function _CcComponentPropertyInspectorSpark_IconButton8_i() : IconButton
      {
         var _loc1_:IconButton = new IconButton();
         _loc1_.buttonMode = true;
         _loc1_.enabled = true;
         _loc1_.setStyle("icon",this._embed_mxml__styles_images_details_btn_scale_down_y_init_png_927008027);
         _loc1_.setStyle("iconOver",this._embed_mxml__styles_images_details_btn_scale_down_y_over_png_884736387);
         _loc1_.addEventListener("mouseDown",this.__btnYScaleDown_mouseDown);
         _loc1_.addEventListener("mouseOut",this.__btnYScaleDown_mouseOut);
         _loc1_.addEventListener("mouseUp",this.__btnYScaleDown_mouseUp);
         _loc1_.id = "btnYScaleDown";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.btnYScaleDown = _loc1_;
         BindingManager.executeBindings(this,"btnYScaleDown",this.btnYScaleDown);
         return _loc1_;
      }
      
      public function __btnYScaleDown_mouseDown(param1:MouseEvent) : void
      {
         this.onMouseDown(param1);
      }
      
      public function __btnYScaleDown_mouseOut(param1:MouseEvent) : void
      {
         this.onMouseUp(param1);
      }
      
      public function __btnYScaleDown_mouseUp(param1:MouseEvent) : void
      {
         this.onMouseUp(param1);
      }
      
      private function _CcComponentPropertyInspectorSpark_VGroup4_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.gap = 8;
         _loc1_.mxmlContent = [this._CcComponentPropertyInspectorSpark_IconButton9_i(),this._CcComponentPropertyInspectorSpark_IconButton10_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _CcComponentPropertyInspectorSpark_IconButton9_i() : IconButton
      {
         var _loc1_:IconButton = new IconButton();
         _loc1_.buttonMode = true;
         _loc1_.enabled = true;
         _loc1_.setStyle("icon",this._embed_mxml__styles_images_details_btn_rotate_left_init_png_545166073);
         _loc1_.setStyle("iconOver",this._embed_mxml__styles_images_details_btn_rotate_left_over_png_1871588985);
         _loc1_.addEventListener("mouseDown",this.__btnRotateUp_mouseDown);
         _loc1_.addEventListener("mouseOut",this.__btnRotateUp_mouseOut);
         _loc1_.addEventListener("mouseUp",this.__btnRotateUp_mouseUp);
         _loc1_.id = "btnRotateUp";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.btnRotateUp = _loc1_;
         BindingManager.executeBindings(this,"btnRotateUp",this.btnRotateUp);
         return _loc1_;
      }
      
      public function __btnRotateUp_mouseDown(param1:MouseEvent) : void
      {
         this.onMouseDown(param1);
      }
      
      public function __btnRotateUp_mouseOut(param1:MouseEvent) : void
      {
         this.onMouseUp(param1);
      }
      
      public function __btnRotateUp_mouseUp(param1:MouseEvent) : void
      {
         this.onMouseUp(param1);
      }
      
      private function _CcComponentPropertyInspectorSpark_IconButton10_i() : IconButton
      {
         var _loc1_:IconButton = new IconButton();
         _loc1_.buttonMode = true;
         _loc1_.enabled = true;
         _loc1_.setStyle("icon",this._embed_mxml__styles_images_details_btn_rotate_right_init_png_884865483);
         _loc1_.setStyle("iconOver",this._embed_mxml__styles_images_details_btn_rotate_right_over_png_934815171);
         _loc1_.addEventListener("mouseDown",this.__btnRotateDown_mouseDown);
         _loc1_.addEventListener("mouseOut",this.__btnRotateDown_mouseOut);
         _loc1_.addEventListener("mouseUp",this.__btnRotateDown_mouseUp);
         _loc1_.id = "btnRotateDown";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.btnRotateDown = _loc1_;
         BindingManager.executeBindings(this,"btnRotateDown",this.btnRotateDown);
         return _loc1_;
      }
      
      public function __btnRotateDown_mouseDown(param1:MouseEvent) : void
      {
         this.onMouseDown(param1);
      }
      
      public function __btnRotateDown_mouseOut(param1:MouseEvent) : void
      {
         this.onMouseUp(param1);
      }
      
      public function __btnRotateDown_mouseUp(param1:MouseEvent) : void
      {
         this.onMouseUp(param1);
      }
      
      private function _CcComponentPropertyInspectorSpark_VGroup5_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.gap = 8;
         _loc1_.mxmlContent = [this._CcComponentPropertyInspectorSpark_IconButton11_i(),this._CcComponentPropertyInspectorSpark_IconButton12_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _CcComponentPropertyInspectorSpark_IconButton11_i() : IconButton
      {
         var _loc1_:IconButton = new IconButton();
         _loc1_.buttonMode = true;
         _loc1_.enabled = true;
         _loc1_.setStyle("icon",this._embed_mxml__styles_images_details_btn_closer_init_png_159598407);
         _loc1_.setStyle("iconOver",this._embed_mxml__styles_images_details_btn_closer_over_png_1861461063);
         _loc1_.addEventListener("mouseDown",this.__btnOffsetUp_mouseDown);
         _loc1_.addEventListener("mouseOut",this.__btnOffsetUp_mouseOut);
         _loc1_.addEventListener("mouseUp",this.__btnOffsetUp_mouseUp);
         _loc1_.id = "btnOffsetUp";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.btnOffsetUp = _loc1_;
         BindingManager.executeBindings(this,"btnOffsetUp",this.btnOffsetUp);
         return _loc1_;
      }
      
      public function __btnOffsetUp_mouseDown(param1:MouseEvent) : void
      {
         this.onMouseDown(param1);
      }
      
      public function __btnOffsetUp_mouseOut(param1:MouseEvent) : void
      {
         this.onMouseUp(param1);
      }
      
      public function __btnOffsetUp_mouseUp(param1:MouseEvent) : void
      {
         this.onMouseUp(param1);
      }
      
      private function _CcComponentPropertyInspectorSpark_IconButton12_i() : IconButton
      {
         var _loc1_:IconButton = new IconButton();
         _loc1_.buttonMode = true;
         _loc1_.enabled = true;
         _loc1_.setStyle("icon",this._embed_mxml__styles_images_details_btn_wider_init_png_850996167);
         _loc1_.setStyle("iconOver",this._embed_mxml__styles_images_details_btn_wider_over_png_867826631);
         _loc1_.addEventListener("mouseDown",this.__btnOffsetDown_mouseDown);
         _loc1_.addEventListener("mouseOut",this.__btnOffsetDown_mouseOut);
         _loc1_.addEventListener("mouseUp",this.__btnOffsetDown_mouseUp);
         _loc1_.id = "btnOffsetDown";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.btnOffsetDown = _loc1_;
         BindingManager.executeBindings(this,"btnOffsetDown",this.btnOffsetDown);
         return _loc1_;
      }
      
      public function __btnOffsetDown_mouseDown(param1:MouseEvent) : void
      {
         this.onMouseDown(param1);
      }
      
      public function __btnOffsetDown_mouseOut(param1:MouseEvent) : void
      {
         this.onMouseUp(param1);
      }
      
      public function __btnOffsetDown_mouseUp(param1:MouseEvent) : void
      {
         this.onMouseUp(param1);
      }
      
      private function _CcComponentPropertyInspectorSpark_DirectionControlSpark1_i() : DirectionControlSpark
      {
         var _loc1_:DirectionControlSpark = new DirectionControlSpark();
         _loc1_.verticalCenter = 0;
         _loc1_.right = 0;
         _loc1_.id = "bgCross";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.bgCross = _loc1_;
         BindingManager.executeBindings(this,"bgCross",this.bgCross);
         return _loc1_;
      }
      
      private function _CcComponentPropertyInspectorSpark_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,null,null,"moveUp.target","yPad");
         result[1] = new Binding(this,null,null,"moveDown.target","yPad");
         result[2] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Fine-tune size and position");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"btnExtend.label");
         result[3] = new Binding(this,function():Number
         {
            return (this.width - yPad.width) / 2;
         },null,"yPad.x");
         result[4] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Close");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"btnClose.label");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _CcComponentPropertyInspectorSpark_HGroup1() : HGroup
      {
         return this._760107692_CcComponentPropertyInspectorSpark_HGroup1;
      }
      
      public function set _CcComponentPropertyInspectorSpark_HGroup1(param1:HGroup) : void
      {
         var _loc2_:Object = this._760107692_CcComponentPropertyInspectorSpark_HGroup1;
         if(_loc2_ !== param1)
         {
            this._760107692_CcComponentPropertyInspectorSpark_HGroup1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_CcComponentPropertyInspectorSpark_HGroup1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get bgCross() : DirectionControlSpark
      {
         return this._204767493bgCross;
      }
      
      public function set bgCross(param1:DirectionControlSpark) : void
      {
         var _loc2_:Object = this._204767493bgCross;
         if(_loc2_ !== param1)
         {
            this._204767493bgCross = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bgCross",_loc2_,param1));
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
      public function get btnExtend() : IconButton
      {
         return this._196605078btnExtend;
      }
      
      public function set btnExtend(param1:IconButton) : void
      {
         var _loc2_:Object = this._196605078btnExtend;
         if(_loc2_ !== param1)
         {
            this._196605078btnExtend = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnExtend",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnOffsetDown() : IconButton
      {
         return this._349934417btnOffsetDown;
      }
      
      public function set btnOffsetDown(param1:IconButton) : void
      {
         var _loc2_:Object = this._349934417btnOffsetDown;
         if(_loc2_ !== param1)
         {
            this._349934417btnOffsetDown = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnOffsetDown",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnOffsetUp() : IconButton
      {
         return this._1023827210btnOffsetUp;
      }
      
      public function set btnOffsetUp(param1:IconButton) : void
      {
         var _loc2_:Object = this._1023827210btnOffsetUp;
         if(_loc2_ !== param1)
         {
            this._1023827210btnOffsetUp = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnOffsetUp",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnRotateDown() : IconButton
      {
         return this._923101209btnRotateDown;
      }
      
      public function set btnRotateDown(param1:IconButton) : void
      {
         var _loc2_:Object = this._923101209btnRotateDown;
         if(_loc2_ !== param1)
         {
            this._923101209btnRotateDown = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnRotateDown",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnRotateUp() : IconButton
      {
         return this._1739506642btnRotateUp;
      }
      
      public function set btnRotateUp(param1:IconButton) : void
      {
         var _loc2_:Object = this._1739506642btnRotateUp;
         if(_loc2_ !== param1)
         {
            this._1739506642btnRotateUp = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnRotateUp",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnScaleDown() : IconButton
      {
         return this._1756165648btnScaleDown;
      }
      
      public function set btnScaleDown(param1:IconButton) : void
      {
         var _loc2_:Object = this._1756165648btnScaleDown;
         if(_loc2_ !== param1)
         {
            this._1756165648btnScaleDown = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnScaleDown",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnScaleUp() : IconButton
      {
         return this._721380233btnScaleUp;
      }
      
      public function set btnScaleUp(param1:IconButton) : void
      {
         var _loc2_:Object = this._721380233btnScaleUp;
         if(_loc2_ !== param1)
         {
            this._721380233btnScaleUp = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnScaleUp",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnXScaleDown() : IconButton
      {
         return this._978900240btnXScaleDown;
      }
      
      public function set btnXScaleDown(param1:IconButton) : void
      {
         var _loc2_:Object = this._978900240btnXScaleDown;
         if(_loc2_ !== param1)
         {
            this._978900240btnXScaleDown = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnXScaleDown",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnXScaleUp() : IconButton
      {
         return this._255766423btnXScaleUp;
      }
      
      public function set btnXScaleUp(param1:IconButton) : void
      {
         var _loc2_:Object = this._255766423btnXScaleUp;
         if(_loc2_ !== param1)
         {
            this._255766423btnXScaleUp = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnXScaleUp",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnYScaleDown() : IconButton
      {
         return this._1175413745btnYScaleDown;
      }
      
      public function set btnYScaleDown(param1:IconButton) : void
      {
         var _loc2_:Object = this._1175413745btnYScaleDown;
         if(_loc2_ !== param1)
         {
            this._1175413745btnYScaleDown = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnYScaleDown",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnYScaleUp() : IconButton
      {
         return this._1487043912btnYScaleUp;
      }
      
      public function set btnYScaleUp(param1:IconButton) : void
      {
         var _loc2_:Object = this._1487043912btnYScaleUp;
         if(_loc2_ !== param1)
         {
            this._1487043912btnYScaleUp = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnYScaleUp",_loc2_,param1));
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
