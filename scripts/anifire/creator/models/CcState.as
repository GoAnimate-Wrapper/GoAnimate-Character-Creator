package anifire.creator.models
{
   import anifire.creator.events.CcComponentLoadEvent;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import flash.net.URLLoader;
   import flash.net.URLLoaderDataFormat;
   import flash.net.URLRequest;
   import flash.utils.ByteArray;
   
   public class CcState extends EventDispatcher
   {
      
      public static const XML_NODE_NAME:String = "state";
       
      
      public var stateId:String;
      
      public var filename:String;
      
      public var imageData:ByteArray = null;
      
      private var _isLoadingImageData:Boolean = false;
      
      public function CcState()
      {
         super();
      }
      
      public function deserialize(param1:XML) : void
      {
         this.stateId = param1.@id;
         this.filename = param1.@filename;
      }
      
      public function loadImageData(param1:URLRequest) : void
      {
         var _loc2_:URLLoader = null;
         if(this.imageData != null)
         {
            this.dispatchLoadCompleteEvent();
         }
         else if(!this._isLoadingImageData)
         {
            _loc2_ = new URLLoader();
            _loc2_.dataFormat = URLLoaderDataFormat.BINARY;
            _loc2_.addEventListener(Event.COMPLETE,this.onLoadImageDataComplete);
            _loc2_.load(param1);
         }
      }
      
      private function onLoadImageDataComplete(param1:Event) : void
      {
         (param1.target as IEventDispatcher).removeEventListener(param1.type,this.onLoadImageDataComplete);
         var _loc2_:URLLoader = param1.target as URLLoader;
         this.imageData = _loc2_.data as ByteArray;
         this.dispatchLoadCompleteEvent();
      }
      
      private function dispatchLoadCompleteEvent() : void
      {
         this.dispatchEvent(new CcComponentLoadEvent(CcComponentLoadEvent.LOAD_STATE_IMAGE_DATA_COMPLETE,this,this.stateId));
      }
   }
}
