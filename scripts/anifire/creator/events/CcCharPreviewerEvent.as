package anifire.creator.events
{
   import anifire.event.ExtraDataEvent;
   
   public class CcCharPreviewerEvent extends ExtraDataEvent
   {
      
      public static const ZOOM_EFFECT_COMPLETED:String = "zoom_complete";
       
      
      public function CcCharPreviewerEvent(param1:String, param2:Object, param3:Object = null, param4:Boolean = false, param5:Boolean = false)
      {
         super(param1,param2,param3,param4,param5);
      }
   }
}
