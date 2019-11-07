package anifire.creator.events
{
   import anifire.creator.models.CcComponent;
   import anifire.event.ExtraDataEvent;
   
   public class CcSelectedDecorationEvent extends ExtraDataEvent
   {
      
      public static const DECORATION_MOUSE_OVER:String = "decoration_mouse_over";
      
      public static const DECORATION_MOUSE_OUT:String = "decoration_mouse_out";
      
      public static const DECORATION_CHOOSEN:String = "decoration_choosen";
      
      public static const DECORATION_DELETED:String = "decoration_deleted";
       
      
      public var ccComponent:CcComponent;
      
      public function CcSelectedDecorationEvent(param1:String, param2:Object, param3:Object = null, param4:Boolean = false, param5:Boolean = false)
      {
         super(param1,param2,param3,param4,param5);
      }
   }
}
