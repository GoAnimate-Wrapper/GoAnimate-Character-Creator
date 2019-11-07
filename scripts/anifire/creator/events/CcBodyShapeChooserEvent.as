package anifire.creator.events
{
   import anifire.creator.models.CcBodyShape;
   import anifire.event.ExtraDataEvent;
   import flash.events.Event;
   
   public class CcBodyShapeChooserEvent extends ExtraDataEvent
   {
      
      public static const BODY_SHAPE_CHOSEN:String = "body_shape_chosen";
       
      
      public var bodyShapeChosen:CcBodyShape;
      
      public function CcBodyShapeChooserEvent(param1:String, param2:Object, param3:Object = null, param4:Boolean = false, param5:Boolean = false)
      {
         super(param1,param2,param3,param4,param5);
      }
      
      override public function clone() : Event
      {
         var _loc1_:CcBodyShapeChooserEvent = new CcBodyShapeChooserEvent(this.type,this.getEventCreater(),this.getData(),this.bubbles,this.cancelable);
         _loc1_.bodyShapeChosen = this.bodyShapeChosen;
         return _loc1_;
      }
   }
}
