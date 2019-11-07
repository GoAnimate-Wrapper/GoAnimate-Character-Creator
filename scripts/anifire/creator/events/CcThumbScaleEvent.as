package anifire.creator.events
{
   import anifire.event.ExtraDataEvent;
   
   public class CcThumbScaleEvent extends ExtraDataEvent
   {
      
      public static const CCTHUMB_SCALE_UPDATE:String = "ccthumb_scale_update";
       
      
      public var part:String;
      
      public var scale:Number;
      
      public function CcThumbScaleEvent(param1:String, param2:Object, param3:Object = null, param4:Boolean = false, param5:Boolean = false)
      {
         super(param1,param2,param3,param4,param5);
      }
   }
}
