package anifire.creator.events
{
   import anifire.creator.models.CcComponentThumb;
   import anifire.event.ExtraDataEvent;
   import flash.events.Event;
   
   public class CcComponentThumbChooserEvent extends ExtraDataEvent
   {
      
      public static const COMPONENT_THUMB_CHOSEN:String = "component_thumb_chosen";
      
      public static const NONE_COMPONENT_THUMB_CHOSEN:String = "none_component_thumb_chosen";
       
      
      public var componentThumb:CcComponentThumb;
      
      public var noneComponentThumbType:String;
      
      public function CcComponentThumbChooserEvent(param1:String, param2:Object, param3:Object = null, param4:Boolean = false, param5:Boolean = false)
      {
         super(param1,param2,param3,param4,param5);
      }
      
      override public function clone() : Event
      {
         var _loc1_:CcComponentThumbChooserEvent = new CcComponentThumbChooserEvent(this.type,this.getEventCreater(),this.getData(),this.bubbles,this.cancelable);
         _loc1_.componentThumb = this.componentThumb;
         _loc1_.noneComponentThumbType = this.noneComponentThumbType;
         return _loc1_;
      }
   }
}
