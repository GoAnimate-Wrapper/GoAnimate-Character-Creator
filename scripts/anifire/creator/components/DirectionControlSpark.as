package anifire.creator.components
{
   import anifire.creator.events.CcThumbPropertyEvent;
   import anifire.creator.models.CcComponent;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import spark.components.Group;
   import spark.components.Image;
   
   public class DirectionControlSpark extends Group
   {
       
      
      private var _205752606btnDown:IconButton;
      
      private var _205980803btnLeft:IconButton;
      
      private var _2096098592btnRight:IconButton;
      
      private var _94069271btnUp:IconButton;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _component:CcComponent;
      
      private var _timer:Timer;
      
      private var _type:String;
      
      private var _embed_mxml__styles_images_details_arrow_right_over_png_1436963749:Class;
      
      private var _embed_mxml__styles_images_details_arrow_right_init_png_1972087997:Class;
      
      private var _embed_mxml__styles_images_details_arrow_down_init_png_658249917:Class;
      
      private var _embed_mxml__styles_images_details_arrow_left_init_png_641472697:Class;
      
      private var _embed_mxml__styles_images_details_arrow_right_down_png_2074750393:Class;
      
      private var _embed_mxml__styles_images_details_arrow_down_over_png_638434213:Class;
      
      private var _embed_mxml__styles_images_details_arrow_left_over_png_556579001:Class;
      
      private var _embed_mxml__styles_images_details_arrow_left_down_png_1371776587:Class;
      
      private var _embed_mxml__styles_images_details_arrow_up_down_png_1026025411:Class;
      
      private var _embed_mxml__styles_images_details_arrow_up_init_png_782509959:Class;
      
      private var _embed_mxml__styles_images_details_arrow_up_over_png_223823367:Class;
      
      private var _embed_mxml__styles_images_details_bg_cross_png_1281283403:Class;
      
      private var _embed_mxml__styles_images_details_arrow_down_down_png_1317250631:Class;
      
      public function DirectionControlSpark()
      {
         this._embed_mxml__styles_images_details_arrow_right_over_png_1436963749 = DirectionControlSpark__embed_mxml__styles_images_details_arrow_right_over_png_1436963749;
         this._embed_mxml__styles_images_details_arrow_right_init_png_1972087997 = DirectionControlSpark__embed_mxml__styles_images_details_arrow_right_init_png_1972087997;
         this._embed_mxml__styles_images_details_arrow_down_init_png_658249917 = DirectionControlSpark__embed_mxml__styles_images_details_arrow_down_init_png_658249917;
         this._embed_mxml__styles_images_details_arrow_left_init_png_641472697 = DirectionControlSpark__embed_mxml__styles_images_details_arrow_left_init_png_641472697;
         this._embed_mxml__styles_images_details_arrow_right_down_png_2074750393 = DirectionControlSpark__embed_mxml__styles_images_details_arrow_right_down_png_2074750393;
         this._embed_mxml__styles_images_details_arrow_down_over_png_638434213 = DirectionControlSpark__embed_mxml__styles_images_details_arrow_down_over_png_638434213;
         this._embed_mxml__styles_images_details_arrow_left_over_png_556579001 = DirectionControlSpark__embed_mxml__styles_images_details_arrow_left_over_png_556579001;
         this._embed_mxml__styles_images_details_arrow_left_down_png_1371776587 = DirectionControlSpark__embed_mxml__styles_images_details_arrow_left_down_png_1371776587;
         this._embed_mxml__styles_images_details_arrow_up_down_png_1026025411 = DirectionControlSpark__embed_mxml__styles_images_details_arrow_up_down_png_1026025411;
         this._embed_mxml__styles_images_details_arrow_up_init_png_782509959 = DirectionControlSpark__embed_mxml__styles_images_details_arrow_up_init_png_782509959;
         this._embed_mxml__styles_images_details_arrow_up_over_png_223823367 = DirectionControlSpark__embed_mxml__styles_images_details_arrow_up_over_png_223823367;
         this._embed_mxml__styles_images_details_bg_cross_png_1281283403 = DirectionControlSpark__embed_mxml__styles_images_details_bg_cross_png_1281283403;
         this._embed_mxml__styles_images_details_arrow_down_down_png_1317250631 = DirectionControlSpark__embed_mxml__styles_images_details_arrow_down_down_png_1317250631;
         super();
         mx_internal::_document = this;
         this.width = 65;
         this.height = 65;
         this.mxmlContent = [this._DirectionControlSpark_Image1_c(),this._DirectionControlSpark_IconButton1_i(),this._DirectionControlSpark_IconButton2_i(),this._DirectionControlSpark_IconButton3_i(),this._DirectionControlSpark_IconButton4_i()];
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
      
      private function onMouseDown(param1:Event) : void
      {
         var _loc2_:CcThumbPropertyEvent = null;
         this._type = this.getTypeByEventTarget(param1.currentTarget);
         _loc2_ = new CcThumbPropertyEvent(this._type,this);
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
         this.dispatch(_loc3_);
      }
      
      private function onClick(param1:Event) : void
      {
         var _loc3_:CcThumbPropertyEvent = null;
         var _loc2_:String = this.getTypeByEventTarget(param1.currentTarget);
         _loc3_ = new CcThumbPropertyEvent(_loc2_,this);
         this.dispatch(_loc3_);
      }
      
      public function destroy() : void
      {
         this.visible = false;
      }
      
      private function dispatch(param1:Event) : void
      {
         this.dispatchEvent(param1);
      }
      
      private function getTypeByEventTarget(param1:Object) : String
      {
         var _loc2_:String = "";
         switch(param1)
         {
            case this.btnUp:
               _loc2_ = CcThumbPropertyEvent.CCPROP_UP_BUTTON_CLICK;
               break;
            case this.btnDown:
               _loc2_ = CcThumbPropertyEvent.CCPROP_DOWN_BUTTON_CLICK;
               break;
            case this.btnLeft:
               _loc2_ = CcThumbPropertyEvent.CCPROP_LEFT_BUTTON_CLICK;
               break;
            case this.btnRight:
               _loc2_ = CcThumbPropertyEvent.CCPROP_RIGHT_BUTTON_CLICK;
         }
         return _loc2_;
      }
      
      private function _DirectionControlSpark_Image1_c() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.source = this._embed_mxml__styles_images_details_bg_cross_png_1281283403;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _DirectionControlSpark_IconButton1_i() : IconButton
      {
         var _loc1_:IconButton = new IconButton();
         _loc1_.buttonMode = true;
         _loc1_.enabled = true;
         _loc1_.horizontalCenter = 0;
         _loc1_.top = 0;
         _loc1_.setStyle("icon",this._embed_mxml__styles_images_details_arrow_up_init_png_782509959);
         _loc1_.setStyle("iconOver",this._embed_mxml__styles_images_details_arrow_up_over_png_223823367);
         _loc1_.setStyle("iconDown",this._embed_mxml__styles_images_details_arrow_up_down_png_1026025411);
         _loc1_.addEventListener("mouseDown",this.__btnUp_mouseDown);
         _loc1_.addEventListener("mouseOut",this.__btnUp_mouseOut);
         _loc1_.addEventListener("mouseUp",this.__btnUp_mouseUp);
         _loc1_.id = "btnUp";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.btnUp = _loc1_;
         BindingManager.executeBindings(this,"btnUp",this.btnUp);
         return _loc1_;
      }
      
      public function __btnUp_mouseDown(param1:MouseEvent) : void
      {
         this.onMouseDown(param1);
      }
      
      public function __btnUp_mouseOut(param1:MouseEvent) : void
      {
         this.onMouseUp(param1);
      }
      
      public function __btnUp_mouseUp(param1:MouseEvent) : void
      {
         this.onMouseUp(param1);
      }
      
      private function _DirectionControlSpark_IconButton2_i() : IconButton
      {
         var _loc1_:IconButton = new IconButton();
         _loc1_.buttonMode = true;
         _loc1_.enabled = true;
         _loc1_.horizontalCenter = 0;
         _loc1_.bottom = 0;
         _loc1_.setStyle("icon",this._embed_mxml__styles_images_details_arrow_down_init_png_658249917);
         _loc1_.setStyle("iconOver",this._embed_mxml__styles_images_details_arrow_down_over_png_638434213);
         _loc1_.setStyle("iconDown",this._embed_mxml__styles_images_details_arrow_down_down_png_1317250631);
         _loc1_.addEventListener("mouseDown",this.__btnDown_mouseDown);
         _loc1_.addEventListener("mouseOut",this.__btnDown_mouseOut);
         _loc1_.addEventListener("mouseUp",this.__btnDown_mouseUp);
         _loc1_.id = "btnDown";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.btnDown = _loc1_;
         BindingManager.executeBindings(this,"btnDown",this.btnDown);
         return _loc1_;
      }
      
      public function __btnDown_mouseDown(param1:MouseEvent) : void
      {
         this.onMouseDown(param1);
      }
      
      public function __btnDown_mouseOut(param1:MouseEvent) : void
      {
         this.onMouseUp(param1);
      }
      
      public function __btnDown_mouseUp(param1:MouseEvent) : void
      {
         this.onMouseUp(param1);
      }
      
      private function _DirectionControlSpark_IconButton3_i() : IconButton
      {
         var _loc1_:IconButton = new IconButton();
         _loc1_.buttonMode = true;
         _loc1_.enabled = true;
         _loc1_.verticalCenter = 0;
         _loc1_.left = 0;
         _loc1_.setStyle("icon",this._embed_mxml__styles_images_details_arrow_left_init_png_641472697);
         _loc1_.setStyle("iconOver",this._embed_mxml__styles_images_details_arrow_left_over_png_556579001);
         _loc1_.setStyle("iconDown",this._embed_mxml__styles_images_details_arrow_left_down_png_1371776587);
         _loc1_.addEventListener("mouseDown",this.__btnLeft_mouseDown);
         _loc1_.addEventListener("mouseOut",this.__btnLeft_mouseOut);
         _loc1_.addEventListener("mouseUp",this.__btnLeft_mouseUp);
         _loc1_.id = "btnLeft";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.btnLeft = _loc1_;
         BindingManager.executeBindings(this,"btnLeft",this.btnLeft);
         return _loc1_;
      }
      
      public function __btnLeft_mouseDown(param1:MouseEvent) : void
      {
         this.onMouseDown(param1);
      }
      
      public function __btnLeft_mouseOut(param1:MouseEvent) : void
      {
         this.onMouseUp(param1);
      }
      
      public function __btnLeft_mouseUp(param1:MouseEvent) : void
      {
         this.onMouseUp(param1);
      }
      
      private function _DirectionControlSpark_IconButton4_i() : IconButton
      {
         var _loc1_:IconButton = new IconButton();
         _loc1_.buttonMode = true;
         _loc1_.enabled = true;
         _loc1_.verticalCenter = 0;
         _loc1_.right = 0;
         _loc1_.setStyle("icon",this._embed_mxml__styles_images_details_arrow_right_init_png_1972087997);
         _loc1_.setStyle("iconOver",this._embed_mxml__styles_images_details_arrow_right_over_png_1436963749);
         _loc1_.setStyle("iconDown",this._embed_mxml__styles_images_details_arrow_right_down_png_2074750393);
         _loc1_.addEventListener("mouseDown",this.__btnRight_mouseDown);
         _loc1_.addEventListener("mouseOut",this.__btnRight_mouseOut);
         _loc1_.addEventListener("mouseUp",this.__btnRight_mouseUp);
         _loc1_.id = "btnRight";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.btnRight = _loc1_;
         BindingManager.executeBindings(this,"btnRight",this.btnRight);
         return _loc1_;
      }
      
      public function __btnRight_mouseDown(param1:MouseEvent) : void
      {
         this.onMouseDown(param1);
      }
      
      public function __btnRight_mouseOut(param1:MouseEvent) : void
      {
         this.onMouseUp(param1);
      }
      
      public function __btnRight_mouseUp(param1:MouseEvent) : void
      {
         this.onMouseUp(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get btnDown() : IconButton
      {
         return this._205752606btnDown;
      }
      
      public function set btnDown(param1:IconButton) : void
      {
         var _loc2_:Object = this._205752606btnDown;
         if(_loc2_ !== param1)
         {
            this._205752606btnDown = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnDown",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnLeft() : IconButton
      {
         return this._205980803btnLeft;
      }
      
      public function set btnLeft(param1:IconButton) : void
      {
         var _loc2_:Object = this._205980803btnLeft;
         if(_loc2_ !== param1)
         {
            this._205980803btnLeft = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnLeft",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnRight() : IconButton
      {
         return this._2096098592btnRight;
      }
      
      public function set btnRight(param1:IconButton) : void
      {
         var _loc2_:Object = this._2096098592btnRight;
         if(_loc2_ !== param1)
         {
            this._2096098592btnRight = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnRight",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnUp() : IconButton
      {
         return this._94069271btnUp;
      }
      
      public function set btnUp(param1:IconButton) : void
      {
         var _loc2_:Object = this._94069271btnUp;
         if(_loc2_ !== param1)
         {
            this._94069271btnUp = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnUp",_loc2_,param1));
            }
         }
      }
   }
}
