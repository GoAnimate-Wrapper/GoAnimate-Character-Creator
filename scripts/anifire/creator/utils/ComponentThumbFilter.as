package anifire.creator.utils
{
   import anifire.creator.models.CcComponentThumb;
   
   public class ComponentThumbFilter
   {
      
      private static function _null_func(param1:CcComponentThumb):Boolean
      {
         return true;
      } 
      
      private var _func:Function;
      
      public function ComponentThumbFilter()
      {
         this._func = _null_func;
         super();
      }
      
      public function get filter() : Function
      {
         return this._func;
      }
      
      public function set filter(param1:Function) : void
      {
         if(param1 == null)
         {
            param1 = _null_func;
         }
         this._func = param1;
      }
   }
}
