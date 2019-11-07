package anifire.creator.events
{
   import anifire.event.ExtraDataEvent;
   import flash.events.Event;
   
   public class CcComponentLoadEvent extends ExtraDataEvent
   {
      
      public static const LOAD_ACTION_IMAGE_DATA_COMPLETE:String = "load_action_image_data_complete";
      
      public static const LOAD_STATE_IMAGE_DATA_COMPLETE:String = "load_state_image_data_complete";
      
      public static const LOAD_THUMBNAIL_IMAGE_DATA_COMPLETE:String = "load_thumbnail_image_data_complete";
       
      
      public var stateId:String;
      
      public function CcComponentLoadEvent(param1:String, param2:Object, param3:String, param4:Object = null, param5:Boolean = false, param6:Boolean = false)
      {
         super(param1,param2,param4,param5,param6);
         this.stateId = param3;
      }
      
      override public function clone() : Event
      {
         return new CcComponentLoadEvent(this.type,this.getEventCreater(),this.stateId,this.getData(),this.bubbles,this.cancelable);
      }
   }
}
