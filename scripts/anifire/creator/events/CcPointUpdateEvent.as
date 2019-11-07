package anifire.creator.events
{
   import anifire.event.ExtraDataEvent;
   import flash.events.Event;
   
   public class CcPointUpdateEvent extends ExtraDataEvent
   {
      
      public static const POINT_UPDATE_COMPLETE:String = "point_update_complete";
      
      public static const ERROR_OCCUR:String = "point_update_error_occur";
       
      
      public var gopoint:Number;
      
      public var gobuck:Number;
      
      public var coupon:Boolean;
      
      public function CcPointUpdateEvent(param1:String, param2:Object, param3:Object = null, param4:Boolean = false, param5:Boolean = false)
      {
         super(param1,param2,param3,param4,param5);
      }
      
      override public function clone() : Event
      {
         var _loc1_:CcPointUpdateEvent = new CcPointUpdateEvent(this.type,this.getEventCreater(),this.getData(),this.bubbles,this.cancelable);
         _loc1_.gopoint = this.gopoint;
         _loc1_.gobuck = this.gobuck;
         _loc1_.coupon = this.coupon;
         return _loc1_;
      }
   }
}
