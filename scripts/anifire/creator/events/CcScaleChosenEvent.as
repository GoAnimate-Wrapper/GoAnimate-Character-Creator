package anifire.creator.events
{
   import anifire.event.ExtraDataEvent;
   import flash.geom.Point;
   
   public class CcScaleChosenEvent extends ExtraDataEvent
   {
      
      public static const SCALE_CHOSEN:String = "scale_chosen";
       
      
      public var head_scale:Number;
      
      public var body_scale:Number;
      
      public var head_pos:Point;
      
      public var head_shift:Point;
      
      public function CcScaleChosenEvent(param1:String, param2:Object, param3:Object = null, param4:Boolean = false, param5:Boolean = false)
      {
         super(param1,param2,param3,param4,param5);
      }
   }
}
