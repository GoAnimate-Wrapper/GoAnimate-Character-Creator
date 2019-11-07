package anifire.creator.events
{
   import anifire.event.ExtraDataEvent;
   
   public class CcComponentThumbnailMouseEvent extends ExtraDataEvent
   {
      
      public static const DELETE_RELEASED:String = "delete_released";
      
      public static const MOUSE_REALLY_OUT:String = "mouse_really_out";
       
      
      public function CcComponentThumbnailMouseEvent(param1:String, param2:Object, param3:Object = null, param4:Boolean = false, param5:Boolean = false)
      {
         super(param1,param2,param3,param4,param5);
      }
   }
}
