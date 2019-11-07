package anifire.creator.events
{
   import anifire.event.ExtraDataEvent;
   import flash.events.Event;
   
   public class CcActionChosenEvent extends ExtraDataEvent
   {
      
      public static const ACTION_CHOSEN:String = "action_chosen";
      
      public static const FACIAL_CHOSEN:String = "facial_chosen";
       
      
      public var action_id:String;
      
      public var facial_id:String;
      
      public function CcActionChosenEvent(param1:String, param2:Object, param3:Object = null, param4:Boolean = false, param5:Boolean = false)
      {
         super(param1,param2,param3,param4,param5);
      }
      
      override public function clone() : Event
      {
         var _loc1_:CcActionChosenEvent = new CcActionChosenEvent(this.type,this.getEventCreater(),this.getData(),this.bubbles,this.cancelable);
         _loc1_.action_id = this.action_id;
         _loc1_.facial_id = this.facial_id;
         return _loc1_;
      }
   }
}
