package anifire.creator.models
{
   public class CcRequireComponent
   {
       
      
      private var _componentType:String;
      
      private var _componentIds:Array;
      
      public function CcRequireComponent()
      {
         super();
      }
      
      public function get componentType() : String
      {
         return this._componentType;
      }
      
      public function get componentIds() : Array
      {
         return this._componentIds;
      }
      
      public function deserialize(param1:XML) : void
      {
         this._componentType = param1.@component_type;
         var _loc2_:String = param1.toString();
         this._componentIds = _loc2_.split(",");
      }
   }
}
