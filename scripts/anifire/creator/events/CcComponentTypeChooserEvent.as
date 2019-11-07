package anifire.creator.events
{
   import anifire.event.ExtraDataEvent;
   import flash.events.Event;
   
   public class CcComponentTypeChooserEvent extends ExtraDataEvent
   {
      
      public static const COMPONENT_TYPE_CHOSEN:String = "component_type_chosen";
       
      
      public var componentType:String;
      
      public function CcComponentTypeChooserEvent(param1:String, param2:Object, param3:Object = null, param4:Boolean = false, param5:Boolean = false)
      {
         super(param1,param2,param3,param4,param5);
      }
      
      override public function clone() : Event
      {
         var _loc1_:CcComponentTypeChooserEvent = new CcComponentTypeChooserEvent(this.type,this.getEventCreater(),this.getData(),this.bubbles,this.cancelable);
         _loc1_.componentType = this.componentType;
         return _loc1_;
      }
   }
}
