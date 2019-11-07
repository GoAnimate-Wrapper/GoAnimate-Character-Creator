package anifire.util
{
   import flash.utils.Timer;
   
   public class ExtraDataTimer extends Timer
   {
       
      
      private var _data:Object;
      
      public function ExtraDataTimer(param1:Number, param2:int = 0.0, param3:Object = null)
      {
         super(param1,param2);
         this.setData(param3);
      }
      
      public function getData() : Object
      {
         return this._data;
      }
      
      private function setData(param1:Object) : void
      {
         this._data = param1;
      }
   }
}
