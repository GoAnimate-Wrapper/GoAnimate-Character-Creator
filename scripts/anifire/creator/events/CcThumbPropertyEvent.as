package anifire.creator.events
{
   import anifire.creator.models.CcComponent;
   import anifire.event.ExtraDataEvent;
   import flash.events.Event;
   
   public class CcThumbPropertyEvent extends ExtraDataEvent
   {
      
      public static const CCPROP_UP_BUTTON_CLICK:String = "ccprop_up_button_click";
      
      public static const CCPROP_DOWN_BUTTON_CLICK:String = "ccprop_down_button_click";
      
      public static const CCPROP_LEFT_BUTTON_CLICK:String = "ccprop_left_button_click";
      
      public static const CCPROP_RIGHT_BUTTON_CLICK:String = "ccprop_right_button_click";
      
      public static const CCPROP_SCALEUP_BUTTON_CLICK:String = "ccprop_scaleup_button_click";
      
      public static const CCPROP_SCALEDOWN_BUTTON_CLICK:String = "ccprop_scaledown_button_click";
      
      public static const CCPROP_SCALEXUP_BUTTON_CLICK:String = "ccprop_scalexup_button_click";
      
      public static const CCPROP_SCALEXDOWN_BUTTON_CLICK:String = "ccprop_scalexdown_button_click";
      
      public static const CCPROP_SCALEYUP_BUTTON_CLICK:String = "ccprop_scaleyup_button_click";
      
      public static const CCPROP_SCALEYDOWN_BUTTON_CLICK:String = "ccprop_scaleydown_button_click";
      
      public static const CCPROP_ROTATEUP_BUTTON_CLICK:String = "ccprop_rotateup_button_click";
      
      public static const CCPROP_ROTATEDOWN_BUTTON_CLICK:String = "ccprop_rotatedown_button_click";
      
      public static const CCPROP_OFFSETUP_BUTTON_CLICK:String = "ccprop_offsetup_button_click";
      
      public static const CCPROP_OFFSETDOWN_BUTTON_CLICK:String = "ccprop_offsetdown_button_click";
      
      public static const CCPROP_LOCATION_UPDATE:String = "ccprop_location_update";
       
      
      public var component:CcComponent;
      
      public function CcThumbPropertyEvent(param1:String, param2:Object, param3:Object = null, param4:Boolean = false, param5:Boolean = false)
      {
         super(param1,param2,param3,param4,param5);
      }
      
      override public function clone() : Event
      {
         var _loc1_:CcThumbPropertyEvent = new CcThumbPropertyEvent(this.type,this.getEventCreater(),this.getData(),this.bubbles,this.cancelable);
         _loc1_.component = this.component;
         return _loc1_;
      }
   }
}
