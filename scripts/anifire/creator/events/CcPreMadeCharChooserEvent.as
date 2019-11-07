package anifire.creator.events
{
   import anifire.creator.models.CcCharacter;
   import anifire.event.ExtraDataEvent;
   import flash.events.Event;
   
   public class CcPreMadeCharChooserEvent extends ExtraDataEvent
   {
      
      public static const PRE_MADE_CHAR_CHOSEN:String = "pre_made_char_chosen";
       
      
      public var ccCharChosen:CcCharacter;
      
      public function CcPreMadeCharChooserEvent(param1:String, param2:Object, param3:Object = null, param4:Boolean = false, param5:Boolean = false)
      {
         super(param1,param2,param3,param4,param5);
      }
      
      override public function clone() : Event
      {
         var _loc1_:CcPreMadeCharChooserEvent = new CcPreMadeCharChooserEvent(this.type,this.getEventCreater(),this.getData(),this.bubbles,this.cancelable);
         _loc1_.ccCharChosen = this.ccCharChosen;
         return _loc1_;
      }
   }
}
