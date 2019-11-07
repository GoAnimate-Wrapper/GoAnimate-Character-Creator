package anifire.creator.models
{
   import flash.display.LoaderInfo;
   import flash.events.EventDispatcher;
   
   public class CcLibrary extends EventDispatcher
   {
      
      public static const XML_NODE_NAME:String = "library";
       
      
      private var _theme_id:String;
      
      private var _component_id:String;
      
      private var _type:String;
      
      private var _imagedata:LoaderInfo;
      
      private var _money:Number;
      
      private var _sharingPoint:Number;
      
      public function CcLibrary()
      {
         super();
      }
      
      public function get imagedata() : LoaderInfo
      {
         return this._imagedata;
      }
      
      public function set imagedata(param1:LoaderInfo) : void
      {
         this._imagedata = param1;
      }
      
      public function set theme_id(param1:String) : void
      {
         this._theme_id = param1;
      }
      
      public function get theme_id() : String
      {
         return this._theme_id;
      }
      
      public function set component_id(param1:String) : void
      {
         this._component_id = param1;
      }
      
      public function get component_id() : String
      {
         return this._component_id;
      }
      
      public function set type(param1:String) : void
      {
         this._type = param1;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get money() : Number
      {
         return this._money;
      }
      
      public function set money(param1:Number) : void
      {
         this._money = param1;
      }
      
      public function get sharingPoint() : Number
      {
         return this._sharingPoint;
      }
      
      public function set sharingPoint(param1:Number) : void
      {
         this._sharingPoint = param1;
      }
      
      public function clone() : CcLibrary
      {
         var _loc1_:CcLibrary = new CcLibrary();
         _loc1_.type = this.type;
         _loc1_.component_id = this.component_id;
         _loc1_.theme_id = this.theme_id;
         _loc1_.money = this.money;
         _loc1_.sharingPoint = this.sharingPoint;
         return _loc1_;
      }
      
      public function deserialize(param1:XML) : void
      {
         this._component_id = param1.@component_id;
         this._type = param1.@type;
         this._theme_id = param1.@theme_id;
         this._money = param1.@money;
         this._sharingPoint = param1.@sharing;
      }
      
      public function serialize() : String
      {
         var _loc1_:* = "<" + XML_NODE_NAME + " type=\"" + this._type + "\"" + " component_id=\"" + this._component_id + "\"" + " theme_id=\"" + this._theme_id + "\"" + "/>";
         return _loc1_;
      }
   }
}
