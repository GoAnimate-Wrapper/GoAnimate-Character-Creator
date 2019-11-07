package anifire.creator.events
{
   import flash.events.Event;
   
   public class ColorPickerDropDownListEvent extends Event
   {
      
      public static const COLOR_CHANGE:String = "colorChange";
      
      public static const COLOR_COMMIT:String = "colorCommit";
       
      
      public var color:uint;
      
      public function ColorPickerDropDownListEvent(param1:String, param2:uint = 0, param3:Boolean = false, param4:Boolean = false)
      {
         super(param1,param3,param4);
         this.color = param2;
      }
   }
}
