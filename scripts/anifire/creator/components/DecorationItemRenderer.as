package anifire.creator.components
{
   import anifire.creator.events.CcComponentLoadEvent;
   import anifire.creator.events.CcSelectedDecorationEvent;
   import anifire.creator.models.CcComponent;
   import anifire.util.UtilDict;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Loader;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import flash.utils.ByteArray;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.supportClasses.ItemRenderer;
   import spark.primitives.BitmapImage;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class DecorationItemRenderer extends ItemRenderer implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _1830212877_DecorationItemRenderer_Rect1:Rect;
      
      private var _563382433_DecorationItemRenderer_SolidColor1:SolidColor;
      
      private var _1600092163_loading:BusyIndicator;
      
      private var _150190887btnDelete:IconButton;
      
      private var _2024940825imageDisplay:BitmapImage;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var component:CcComponent;
      
      protected var _loader:Loader;
      
      protected var _bitmapData:BitmapData;
      
      protected var _displayWidth:Number = 60;
      
      protected var _displayHeight:Number = 60;
      
      protected var _displayMatrix:Matrix;
      
      private var _embed_mxml__styles_images_control_btn_delete_over_png_1240721219:Class;
      
      private var _embed_mxml__styles_images_control_btn_delete_init_png_1753458267:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function DecorationItemRenderer()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._loader = new Loader();
         this._displayMatrix = new Matrix();
         this._embed_mxml__styles_images_control_btn_delete_over_png_1240721219 = DecorationItemRenderer__embed_mxml__styles_images_control_btn_delete_over_png_1240721219;
         this._embed_mxml__styles_images_control_btn_delete_init_png_1753458267 = DecorationItemRenderer__embed_mxml__styles_images_control_btn_delete_init_png_1753458267;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._DecorationItemRenderer_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_creator_components_DecorationItemRendererWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return DecorationItemRenderer[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.autoDrawBackground = false;
         this.width = 70;
         this.height = 70;
         this.mxmlContent = [this._DecorationItemRenderer_Rect1_i(),this._DecorationItemRenderer_BusyIndicator1_i(),this._DecorationItemRenderer_BitmapImage1_i(),this._DecorationItemRenderer_IconButton1_i()];
         this.currentState = "normal";
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"hovered",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_DecorationItemRenderer_Rect1",
               "name":"width",
               "value":70
            }),new SetProperty().initializeFromObject({
               "target":"_DecorationItemRenderer_Rect1",
               "name":"height",
               "value":70
            }),new SetProperty().initializeFromObject({
               "target":"_DecorationItemRenderer_Rect1",
               "name":"radiusX",
               "value":10
            }),new SetProperty().initializeFromObject({
               "target":"_DecorationItemRenderer_Rect1",
               "name":"radiusY",
               "value":10
            }),new SetProperty().initializeFromObject({
               "target":"_DecorationItemRenderer_SolidColor1",
               "name":"color",
               "value":14870509
            }),new SetProperty().initializeFromObject({
               "target":"imageDisplay",
               "name":"width",
               "value":70
            }),new SetProperty().initializeFromObject({
               "target":"imageDisplay",
               "name":"height",
               "value":70
            })]
         }),new State({
            "name":"selected",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_DecorationItemRenderer_SolidColor1",
               "name":"color",
               "value":14870509
            })]
         }),new State({
            "name":"normalAndShowsCaret",
            "overrides":[]
         }),new State({
            "name":"hoveredAndShowsCaret",
            "overrides":[]
         }),new State({
            "name":"selectedAndShowsCaret",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_DecorationItemRenderer_Rect1",
               "name":"width",
               "value":70
            }),new SetProperty().initializeFromObject({
               "target":"_DecorationItemRenderer_Rect1",
               "name":"height",
               "value":70
            }),new SetProperty().initializeFromObject({
               "target":"_DecorationItemRenderer_SolidColor1",
               "name":"color",
               "value":14870509
            }),new SetProperty().initializeFromObject({
               "target":"imageDisplay",
               "name":"width",
               "value":70
            }),new SetProperty().initializeFromObject({
               "target":"imageDisplay",
               "name":"height",
               "value":70
            }),new SetProperty().initializeFromObject({
               "target":"btnDelete",
               "name":"visible",
               "value":true
            })]
         })];
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         DecorationItemRenderer._watcherSetupUtil = param1;
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
      
      override public function set data(param1:Object) : void
      {
         super.data = param1;
         this.component = param1 as CcComponent;
         if(this.component)
         {
            this.imageDisplay.source = null;
            this.updateThumbData();
         }
         else
         {
            this.imageDisplay.source = null;
         }
      }
      
      private function updateThumbData() : void
      {
         this.component.componentThumb.addEventListener(CcComponentLoadEvent.LOAD_THUMBNAIL_IMAGE_DATA_COMPLETE,this.onLoadThumbImage);
         this.component.componentThumb.loadThumbnailImageData();
         this._loading.visible = true;
      }
      
      private function onLoadThumbImage(param1:Event) : void
      {
         var e:Event = param1;
         try
         {
            if(this.component.componentThumb && this.component.componentThumb.thumbnailImageData is ByteArray)
            {
               this._loader.contentLoaderInfo.addEventListener(Event.INIT,this.onImageLoaderInit);
               this._loader.loadBytes(this.component.componentThumb.thumbnailImageData);
            }
            else
            {
               this.imageDisplay.source = null;
            }
            return;
         }
         catch(e:Error)
         {
            return;
         }
      }
      
      protected function onImageLoaderInit(param1:Event = null) : void
      {
         if(this._loader.content is DisplayObject)
         {
            this.createBitmap(this._loader.content);
         }
         else
         {
            this.imageDisplay.source = this._loader.content;
         }
         this._loading.visible = false;
      }
      
      protected function createBitmap(param1:DisplayObject) : void
      {
         this._bitmapData = new BitmapData(this._displayWidth,this._displayHeight,true,16711680);
         this._bitmapData.draw(param1,this._displayMatrix,new ColorTransform(),null,null,true);
         this.imageDisplay.source = this._bitmapData;
      }
      
      private function onDeleteClick(param1:Event) : void
      {
         owner.dispatchEvent(new CcSelectedDecorationEvent(CcSelectedDecorationEvent.DECORATION_DELETED,this));
      }
      
      private function _DecorationItemRenderer_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.width = 50;
         _loc1_.height = 50;
         _loc1_.radiusX = 5;
         _loc1_.radiusY = 5;
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.fill = this._DecorationItemRenderer_SolidColor1_i();
         _loc1_.initialized(this,"_DecorationItemRenderer_Rect1");
         this._DecorationItemRenderer_Rect1 = _loc1_;
         BindingManager.executeBindings(this,"_DecorationItemRenderer_Rect1",this._DecorationItemRenderer_Rect1);
         return _loc1_;
      }
      
      private function _DecorationItemRenderer_SolidColor1_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         this._DecorationItemRenderer_SolidColor1 = _loc1_;
         BindingManager.executeBindings(this,"_DecorationItemRenderer_SolidColor1",this._DecorationItemRenderer_SolidColor1);
         return _loc1_;
      }
      
      private function _DecorationItemRenderer_BusyIndicator1_i() : BusyIndicator
      {
         var _loc1_:BusyIndicator = new BusyIndicator();
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.visible = false;
         _loc1_.setStyle("symbolColor",0);
         _loc1_.id = "_loading";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._loading = _loc1_;
         BindingManager.executeBindings(this,"_loading",this._loading);
         return _loc1_;
      }
      
      private function _DecorationItemRenderer_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.width = 50;
         _loc1_.height = 50;
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.smoothingQuality = "high";
         _loc1_.smooth = true;
         _loc1_.initialized(this,"imageDisplay");
         this.imageDisplay = _loc1_;
         BindingManager.executeBindings(this,"imageDisplay",this.imageDisplay);
         return _loc1_;
      }
      
      private function _DecorationItemRenderer_IconButton1_i() : IconButton
      {
         var _loc1_:IconButton = new IconButton();
         _loc1_.buttonMode = true;
         _loc1_.visible = false;
         _loc1_.enabled = true;
         _loc1_.bottom = 10;
         _loc1_.right = 10;
         _loc1_.setStyle("icon",this._embed_mxml__styles_images_control_btn_delete_init_png_1753458267);
         _loc1_.setStyle("iconOver",this._embed_mxml__styles_images_control_btn_delete_over_png_1240721219);
         _loc1_.addEventListener("click",this.__btnDelete_click);
         _loc1_.id = "btnDelete";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.btnDelete = _loc1_;
         BindingManager.executeBindings(this,"btnDelete",this.btnDelete);
         return _loc1_;
      }
      
      public function __btnDelete_click(param1:MouseEvent) : void
      {
         this.onDeleteClick(param1);
      }
      
      private function _DecorationItemRenderer_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Delete");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"btnDelete.label");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _DecorationItemRenderer_Rect1() : Rect
      {
         return this._1830212877_DecorationItemRenderer_Rect1;
      }
      
      public function set _DecorationItemRenderer_Rect1(param1:Rect) : void
      {
         var _loc2_:Object = this._1830212877_DecorationItemRenderer_Rect1;
         if(_loc2_ !== param1)
         {
            this._1830212877_DecorationItemRenderer_Rect1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_DecorationItemRenderer_Rect1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _DecorationItemRenderer_SolidColor1() : SolidColor
      {
         return this._563382433_DecorationItemRenderer_SolidColor1;
      }
      
      public function set _DecorationItemRenderer_SolidColor1(param1:SolidColor) : void
      {
         var _loc2_:Object = this._563382433_DecorationItemRenderer_SolidColor1;
         if(_loc2_ !== param1)
         {
            this._563382433_DecorationItemRenderer_SolidColor1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_DecorationItemRenderer_SolidColor1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _loading() : BusyIndicator
      {
         return this._1600092163_loading;
      }
      
      public function set _loading(param1:BusyIndicator) : void
      {
         var _loc2_:Object = this._1600092163_loading;
         if(_loc2_ !== param1)
         {
            this._1600092163_loading = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_loading",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnDelete() : IconButton
      {
         return this._150190887btnDelete;
      }
      
      public function set btnDelete(param1:IconButton) : void
      {
         var _loc2_:Object = this._150190887btnDelete;
         if(_loc2_ !== param1)
         {
            this._150190887btnDelete = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnDelete",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get imageDisplay() : BitmapImage
      {
         return this._2024940825imageDisplay;
      }
      
      public function set imageDisplay(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._2024940825imageDisplay;
         if(_loc2_ !== param1)
         {
            this._2024940825imageDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"imageDisplay",_loc2_,param1));
            }
         }
      }
   }
}
