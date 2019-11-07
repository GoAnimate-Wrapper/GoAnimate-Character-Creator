package anifire.creator.components
{
   import flash.display.DisplayObjectContainer;
   import mx.core.IFlexModuleFactory;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.managers.PopUpManager;
   import spark.components.SkinnablePopUpContainer;
   
   public class DefaultPopUpContainer extends SkinnablePopUpContainer
   {
       
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      protected var _title:String;
      
      protected var _message:String;
      
      protected var _confirmText:String;
      
      protected var _cancelText:String;
      
      protected var _data:Object;
      
      public function DefaultPopUpContainer()
      {
         super();
         mx_internal::_document = this;
         this.addEventListener("creationComplete",this.___DefaultPopUpContainer_SkinnablePopUpContainer1_creationComplete);
      }
      
      override public function set moduleFactory(param1:IFlexModuleFactory) : void
      {
         super.moduleFactory = param1;
         if(this.__moduleFactoryInitialized)
         {
            return;
         }
         this.__moduleFactoryInitialized = true;
      }
      
      override public function initialize() : void
      {
         super.initialize();
      }
      
      public function set data(param1:Object) : void
      {
         this._data = param1;
      }
      
      [Bindable(event="propertyChange")]
      public function get title() : String
      {
         return this._title;
      }
      
      private function set _110371416title(param1:String) : void
      {
         if(this._title != param1)
         {
            this._title = param1;
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get message() : String
      {
         return this._message;
      }
      
      private function set _954925063message(param1:String) : void
      {
         if(this._message != param1)
         {
            this._message = param1;
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get confirmText() : String
      {
         return this._confirmText;
      }
      
      private function set _344408077confirmText(param1:String) : void
      {
         if(this._confirmText != param1)
         {
            this._confirmText = param1;
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get cancelText() : String
      {
         return this._cancelText;
      }
      
      private function set _1888623303cancelText(param1:String) : void
      {
         if(this._cancelText != param1)
         {
            this._cancelText = param1;
         }
      }
      
      protected function confirm() : void
      {
         close(true,this._data);
      }
      
      protected function cancel() : void
      {
         close(false,this._data);
      }
      
      protected function init() : void
      {
      }
      
      override public function open(param1:DisplayObjectContainer, param2:Boolean = false) : void
      {
         super.open(param1,param2);
         PopUpManager.centerPopUp(this);
      }
      
      public function ___DefaultPopUpContainer_SkinnablePopUpContainer1_creationComplete(param1:FlexEvent) : void
      {
         this.init();
      }
      
      public function set confirmText(param1:String) : void
      {
         var _loc2_:Object = this.confirmText;
         if(_loc2_ !== param1)
         {
            this._344408077confirmText = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"confirmText",_loc2_,param1));
            }
         }
      }
      
      public function set message(param1:String) : void
      {
         var _loc2_:Object = this.message;
         if(_loc2_ !== param1)
         {
            this._954925063message = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"message",_loc2_,param1));
            }
         }
      }
      
      public function set title(param1:String) : void
      {
         var _loc2_:Object = this.title;
         if(_loc2_ !== param1)
         {
            this._110371416title = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"title",_loc2_,param1));
            }
         }
      }
      
      public function set cancelText(param1:String) : void
      {
         var _loc2_:Object = this.cancelText;
         if(_loc2_ !== param1)
         {
            this._1888623303cancelText = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"cancelText",_loc2_,param1));
            }
         }
      }
   }
}
