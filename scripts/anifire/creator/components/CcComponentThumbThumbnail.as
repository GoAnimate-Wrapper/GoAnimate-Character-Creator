package anifire.creator.components
{
   import anifire.constant.CcServerConstant;
   import anifire.creator.events.CcComponentLoadEvent;
   import anifire.creator.events.CcComponentThumbnailMouseEvent;
   import anifire.creator.models.CcComponent;
   import anifire.creator.models.CcComponentThumb;
   import anifire.util.UtilColor;
   import flash.display.DisplayObject;
   import flash.display.Loader;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.events.MouseEvent;
   import mx.containers.Canvas;
   import mx.controls.Button;
   import mx.controls.Label;
   import mx.core.IFlexModuleFactory;
   import mx.core.UIComponent;
   import mx.core.UIComponentDescriptor;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   
   public class CcComponentThumbThumbnail extends Canvas
   {
       
      
      private var _1378836465btnDel:Button;
      
      private var _2097929434btnThumb:Button;
      
      private var _951543133control:Canvas;
      
      private var _1905040139thumbnailContainer:Canvas;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private const THUMBNAIL_SIZE:Number = 60;
      
      public var componentThumb:CcComponentThumb = null;
      
      private var targetWidth:Number;
      
      private var targetHeight:Number;
      
      private var loader:Loader;
      
      private var moneyMode:int;
      
      private var bgStyleName:String;
      
      public var componentThumbDetailThumbnail:CcComponentThumbDetailThumbnail;
      
      public var componentType:String;
      
      public var component:CcComponent;
      
      public function CcComponentThumbThumbnail()
      {
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":Button,
                  "id":"btnThumb",
                  "events":{"initialize":"__btnThumb_initialize"},
                  "propertiesFactory":function():Object
                  {
                     return {
                        "x":0,
                        "y":0
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":Canvas,
                  "id":"control",
                  "events":{"creationComplete":"__control_creationComplete"},
                  "propertiesFactory":function():Object
                  {
                     return {
                        "x":0,
                        "y":0,
                        "visible":false,
                        "clipContent":false,
                        "childDescriptors":[new UIComponentDescriptor({
                           "type":Button,
                           "id":"btnDel",
                           "events":{
                              "click":"__btnDel_click",
                              "mouseOver":"__btnDel_mouseOver",
                              "mouseOut":"__btnDel_mouseOut"
                           },
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "styleName":"btnDelDec",
                                 "y":-5,
                                 "width":10,
                                 "height":10
                              };
                           }
                        })]
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":Canvas,
                  "id":"thumbnailContainer",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "x":0,
                        "y":0,
                        "clipContent":false
                     };
                  }
               })]};
            }
         });
         super();
         mx_internal::_document = this;
         this.clipContent = false;
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
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         super.initialize();
      }
      
      public function get isNullComponent() : Boolean
      {
         return this.componentThumb == null?true:false;
      }
      
      public function init(param1:CcComponentThumbDetailThumbnail, param2:Number, param3:Number, param4:CcComponentThumb) : void
      {
         if(this.thumbnailContainer != null)
         {
            this.thumbnailContainer.removeAllChildren();
         }
         this.componentThumb = param4;
         this.componentType = this.componentThumb.type;
         this.targetWidth = param2;
         this.targetHeight = param3;
         this.componentThumbDetailThumbnail = param1;
         this.moneyMode = this.moneyMode;
         this.width = this.targetWidth;
         this.height = this.targetHeight;
         this.componentThumb.addEventListener(CcComponentLoadEvent.LOAD_THUMBNAIL_IMAGE_DATA_COMPLETE,this.onThumbnailLoadFromNetwork);
         this.componentThumb.loadThumbnailImageData();
      }
      
      public function initNullThumbnail(param1:CcComponentThumbDetailThumbnail, param2:Number, param3:Number, param4:String) : void
      {
         if(this.thumbnailContainer != null)
         {
            this.thumbnailContainer.removeAllChildren();
         }
         this.componentThumb = null;
         this.componentType = param4;
         this.targetWidth = param2;
         this.targetHeight = param3;
         this.componentThumbDetailThumbnail = param1;
         this.width = this.targetWidth;
         this.height = this.targetHeight;
      }
      
      public function setBgStyleName(param1:String) : void
      {
         this.bgStyleName = param1;
         if(this.btnThumb != null)
         {
            this.btnThumb.styleName = param1;
         }
      }
      
      private function onNullThumbnailReady(param1:Event) : void
      {
         (param1.target as IEventDispatcher).removeEventListener(param1.type,this.onNullThumbnailReady);
         var _loc2_:DisplayObject = param1.target as DisplayObject;
         this.placeThumbnail(_loc2_);
      }
      
      private function onThumbnailLoadFromNetwork(param1:CcComponentLoadEvent) : void
      {
         (param1.target as IEventDispatcher).removeEventListener(param1.type,this.onThumbnailLoadFromNetwork);
         this.loader = new Loader();
         this.loader.mouseChildren = false;
         this.loader.mouseEnabled = false;
         this.loader.contentLoaderInfo.addEventListener(Event.COMPLETE,this.onThumbImageDataLoadByteComplete);
         this.loader.loadBytes(this.componentThumb.thumbnailImageData);
      }
      
      private function onThumbImageDataLoadByteComplete(param1:Event) : void
      {
         (param1.target as IEventDispatcher).removeEventListener(param1.type,this.onThumbImageDataLoadByteComplete);
         this.placeThumbnail(this.loader);
      }
      
      private function placeThumbnail(param1:DisplayObject) : void
      {
         var _loc3_:Canvas = null;
         var _loc4_:Label = null;
         param1.scaleX = -1;
         param1.x = 1 * this.THUMBNAIL_SIZE;
         var _loc2_:UIComponent = new UIComponent();
         if(CcServerConstant.displayThumbnailId())
         {
            _loc3_ = new Canvas();
            _loc3_.styleName = "thumbnailIdBackdrop";
            _loc3_.width = this.THUMBNAIL_SIZE - 2;
            _loc3_.x = _loc3_.y = 1;
            _loc4_ = new Label();
            _loc4_.text = this.componentThumb.componentId.replace(/^.*_/,"");
            _loc4_.percentHeight = _loc4_.percentWidth = 100;
            _loc4_.styleName = "thumbnailId";
            _loc3_.addChild(_loc4_);
         }
         _loc2_.addChild(param1);
         this.thumbnailContainer.addChild(_loc2_);
         if(CcServerConstant.displayThumbnailId())
         {
            this.thumbnailContainer.addChild(_loc3_);
         }
      }
      
      private function drawControlBg() : void
      {
         this.control.graphics.clear();
         this.control.graphics.lineStyle(2,16744749);
         this.control.graphics.beginFill(13421772,1);
         this.control.graphics.moveTo(0,0);
         this.control.graphics.lineTo(0,this.height);
         this.control.graphics.lineTo(this.width,this.height);
         this.control.graphics.lineTo(this.width,10);
         this.drawMyCircle(this.control,10,this.width,0);
         this.control.graphics.lineTo(0,0);
         this.control.graphics.endFill();
      }
      
      private function onReleaseDelete() : void
      {
         var _loc1_:CcComponentThumbnailMouseEvent = new CcComponentThumbnailMouseEvent(CcComponentThumbnailMouseEvent.DELETE_RELEASED,this);
         this.dispatchEvent(_loc1_);
      }
      
      private function drawMyCircle(param1:Sprite, param2:Number, param3:Number, param4:Number) : void
      {
         param1.graphics.curveTo(0.4142 * param2 + param3,param2 + param4,0.7071 * param2 + param3,0.7071 * param2 + param4);
         param1.graphics.curveTo(param2 + param3,0.4142 * param2 + param4,param2 + param3,param4);
         param1.graphics.curveTo(param2 + param3,-0.4142 * param2 + param4,0.7071 * param2 + param3,-0.7071 * param2 + param4);
         param1.graphics.curveTo(0.4142 * param2 + param3,-param2 + param4,param3,-param2 + param4);
         param1.graphics.curveTo(-0.4142 * param2 + param3,-param2 + param4,-0.7071 * param2 + param3,-0.7071 * param2 + param4);
         param1.graphics.curveTo(-param2 + param3,-0.4142 * param2 + param4,-param2 + param3,param4);
      }
      
      private function onOverDel() : void
      {
         UtilColor.setRGB(this.btnDel,16744749);
      }
      
      private function onOutDel() : void
      {
         UtilColor.setRGB(this.btnDel);
      }
      
      public function __btnThumb_initialize(param1:FlexEvent) : void
      {
         this.btnThumb.styleName = this.bgStyleName;
         this.btnThumb.width = this.targetWidth;
         this.btnThumb.height = this.targetHeight;
      }
      
      public function __control_creationComplete(param1:FlexEvent) : void
      {
         this.control.width = this.targetWidth;
         this.control.height = this.targetHeight;
         this.btnDel.x = this.control.width - this.btnDel.width / 2;
         this.drawControlBg();
      }
      
      public function __btnDel_click(param1:MouseEvent) : void
      {
         this.onReleaseDelete();
      }
      
      public function __btnDel_mouseOver(param1:MouseEvent) : void
      {
         this.onOverDel();
      }
      
      public function __btnDel_mouseOut(param1:MouseEvent) : void
      {
         this.onOutDel();
      }
      
      [Bindable(event="propertyChange")]
      public function get btnDel() : Button
      {
         return this._1378836465btnDel;
      }
      
      public function set btnDel(param1:Button) : void
      {
         var _loc2_:Object = this._1378836465btnDel;
         if(_loc2_ !== param1)
         {
            this._1378836465btnDel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnDel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnThumb() : Button
      {
         return this._2097929434btnThumb;
      }
      
      public function set btnThumb(param1:Button) : void
      {
         var _loc2_:Object = this._2097929434btnThumb;
         if(_loc2_ !== param1)
         {
            this._2097929434btnThumb = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnThumb",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get control() : Canvas
      {
         return this._951543133control;
      }
      
      public function set control(param1:Canvas) : void
      {
         var _loc2_:Object = this._951543133control;
         if(_loc2_ !== param1)
         {
            this._951543133control = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"control",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get thumbnailContainer() : Canvas
      {
         return this._1905040139thumbnailContainer;
      }
      
      public function set thumbnailContainer(param1:Canvas) : void
      {
         var _loc2_:Object = this._1905040139thumbnailContainer;
         if(_loc2_ !== param1)
         {
            this._1905040139thumbnailContainer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"thumbnailContainer",_loc2_,param1));
            }
         }
      }
   }
}
