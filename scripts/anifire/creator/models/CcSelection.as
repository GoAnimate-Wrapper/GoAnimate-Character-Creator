package anifire.creator.models
{
   public class CcSelection
   {
      
      public static const XML_NODE_NAME:String = "selection";
       
      
      private var _type:String;
      
      private var _stateId:String;
      
      private var _facialId:String;
      
      public function CcSelection()
      {
         super();
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get stateId() : String
      {
         return this._stateId;
      }
      
      public function get facialId() : String
      {
         return this._facialId;
      }
      
      public function deserialize(param1:XML) : void
      {
         this._type = param1.@type;
         this._stateId = param1.@state_id;
         this._facialId = param1.@facial_id;
      }
   }
}
