package anifire.creator.components
{
   import anifire.creator.events.CcComponentLoadEvent;
   import anifire.creator.models.CcComponentThumb;
   import anifire.util.UtilUser;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Loader;
   import flash.events.Event;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import flash.utils.ByteArray;
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColorStroke;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.Group;
   import spark.components.Image;
   import spark.components.supportClasses.ItemRenderer;
   import spark.primitives.BitmapImage;
   import spark.primitives.Rect;
   
   public class DecoThumbRenderer extends ItemRenderer implements IStateClient2
   {
       
      
      private var _1510438808_DecoThumbRenderer_Image1:Image;
      
      private var _1510438807_DecoThumbRenderer_Image2:Image;
      
      private var _1010479525_DecoThumbRenderer_Rect1:Rect;
      
      private var _1600092163_loading:BusyIndicator;
      
      private var _2024940825imageDisplay:BitmapImage;
      
      private var _1906681184nullIcon:Group;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var cid:String;
      
      private var thumb:CcComponentThumb;
      
      private var _1180261935isNull:Boolean = false;
      
      protected var _loader:Loader;
      
      protected var _bitmapData:BitmapData;
      
      protected var _displayWidth:Number = 105;
      
      protected var _displayHeight:Number = 105;
      
      protected var _displayMatrix:Matrix;
      
      private var _embed_mxml__styles_images_thumbBox_btn_remove_init_png_1733973271:Class;
      
      private var _embed_mxml__styles_images_thumbBox_btn_remove_over_png_1717937423:Class;
      
      public function DecoThumbRenderer()
      {
         this._loader = new Loader();
         this._displayMatrix = new Matrix();
         this._embed_mxml__styles_images_thumbBox_btn_remove_init_png_1733973271 = DecoThumbRenderer__embed_mxml__styles_images_thumbBox_btn_remove_init_png_1733973271;
         this._embed_mxml__styles_images_thumbBox_btn_remove_over_png_1717937423 = DecoThumbRenderer__embed_mxml__styles_images_thumbBox_btn_remove_over_png_1717937423;
         super();
         mx_internal::_document = this;
         this.autoDrawBackground = false;
         this.width = 105;
         this.height = 105;
         this.useHandCursor = true;
         this.buttonMode = true;
         this.mxmlContent = [this._DecoThumbRenderer_Group1_i(),this._DecoThumbRenderer_BusyIndicator1_i(),this._DecoThumbRenderer_BitmapImage1_i(),this._DecoThumbRenderer_Rect1_i()];
         this.currentState = "normal";
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"hovered",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_DecoThumbRenderer_Image1",
               "name":"visible",
               "value":false
            }),new SetProperty().initializeFromObject({
               "target":"_DecoThumbRenderer_Image2",
               "name":"visible",
               "value":true
            }),new SetProperty().initializeFromObject({
               "target":"imageDisplay",
               "name":"width",
               "value":105
            }),new SetProperty().initializeFromObject({
               "target":"imageDisplay",
               "name":"height",
               "value":105
            }),new SetProperty().initializeFromObject({
               "target":"_DecoThumbRenderer_Rect1",
               "name":"visible",
               "value":true
            })]
         })];
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
         if(!param1)
         {
            super.data = param1;
            return;
         }
         this.cid = param1.key;
         this.thumb = param1.data;
         super.data = this.thumb;
         if(!this.thumb)
         {
            this.isNull = true;
            this.nullIcon.visible = true;
         }
         else
         {
            this.isNull = false;
            this.nullIcon.visible = false;
         }
         if(this.thumb)
         {
            this.imageDisplay.source = null;
            this.updateThumbData();
         }
         else
         {
            this.imageDisplay.source = null;
         }
         if(UtilUser.hasAdminFeatures)
         {
            this.toolTip = this.cid;
         }
      }
      
      private function updateThumbData() : void
      {
         this.thumb.addEventListener(CcComponentLoadEvent.LOAD_THUMBNAIL_IMAGE_DATA_COMPLETE,this.onLoadThumbImage);
         this.thumb.loadThumbnailImageData();
         this._loading.visible = true;
      }
      
      private function onLoadThumbImage(param1:Event) : void
      {
         if(this.thumb && this.thumb.thumbnailImageData is ByteArray)
         {
            this._loader.contentLoaderInfo.addEventListener(Event.INIT,this.onImageLoaderInit);
            this._loader.loadBytes(this.thumb.thumbnailImageData);
         }
         else
         {
            this.imageDisplay.source = null;
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
         this._displayMatrix.a = this._displayWidth / 60;
         this._displayMatrix.d = this._displayHeight / 60;
         this._bitmapData.draw(param1,this._displayMatrix,new ColorTransform(),null,null,true);
         this.imageDisplay.source = this._bitmapData;
      }
      
      private function _DecoThumbRenderer_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.visible = false;
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.mxmlContent = [this._DecoThumbRenderer_Image1_i(),this._DecoThumbRenderer_Image2_i()];
         _loc1_.id = "nullIcon";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.nullIcon = _loc1_;
         BindingManager.executeBindings(this,"nullIcon",this.nullIcon);
         return _loc1_;
      }
      
      private function _DecoThumbRenderer_Image1_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.source = this._embed_mxml__styles_images_thumbBox_btn_remove_init_png_1733973271;
         _loc1_.visible = true;
         _loc1_.id = "_DecoThumbRenderer_Image1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._DecoThumbRenderer_Image1 = _loc1_;
         BindingManager.executeBindings(this,"_DecoThumbRenderer_Image1",this._DecoThumbRenderer_Image1);
         return _loc1_;
      }
      
      private function _DecoThumbRenderer_Image2_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.source = this._embed_mxml__styles_images_thumbBox_btn_remove_over_png_1717937423;
         _loc1_.visible = false;
         _loc1_.id = "_DecoThumbRenderer_Image2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._DecoThumbRenderer_Image2 = _loc1_;
         BindingManager.executeBindings(this,"_DecoThumbRenderer_Image2",this._DecoThumbRenderer_Image2);
         return _loc1_;
      }
      
      private function _DecoThumbRenderer_BusyIndicator1_i() : BusyIndicator
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
      
      private function _DecoThumbRenderer_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.width = 90;
         _loc1_.height = 90;
         _loc1_.scaleX = -1;
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.smoothingQuality = "high";
         _loc1_.smooth = true;
         _loc1_.initialized(this,"imageDisplay");
         this.imageDisplay = _loc1_;
         BindingManager.executeBindings(this,"imageDisplay",this.imageDisplay);
         return _loc1_;
      }
      
      private function _DecoThumbRenderer_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.visible = false;
         _loc1_.stroke = this._DecoThumbRenderer_SolidColorStroke1_c();
         _loc1_.initialized(this,"_DecoThumbRenderer_Rect1");
         this._DecoThumbRenderer_Rect1 = _loc1_;
         BindingManager.executeBindings(this,"_DecoThumbRenderer_Rect1",this._DecoThumbRenderer_Rect1);
         return _loc1_;
      }
      
      private function _DecoThumbRenderer_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 2210726;
         _loc1_.weight = 1;
         _loc1_.alpha = 1;
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get _DecoThumbRenderer_Image1() : Image
      {
         return this._1510438808_DecoThumbRenderer_Image1;
      }
      
      public function set _DecoThumbRenderer_Image1(param1:Image) : void
      {
         var _loc2_:Object = this._1510438808_DecoThumbRenderer_Image1;
         if(_loc2_ !== param1)
         {
            this._1510438808_DecoThumbRenderer_Image1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_DecoThumbRenderer_Image1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _DecoThumbRenderer_Image2() : Image
      {
         return this._1510438807_DecoThumbRenderer_Image2;
      }
      
      public function set _DecoThumbRenderer_Image2(param1:Image) : void
      {
         var _loc2_:Object = this._1510438807_DecoThumbRenderer_Image2;
         if(_loc2_ !== param1)
         {
            this._1510438807_DecoThumbRenderer_Image2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_DecoThumbRenderer_Image2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _DecoThumbRenderer_Rect1() : Rect
      {
         return this._1010479525_DecoThumbRenderer_Rect1;
      }
      
      public function set _DecoThumbRenderer_Rect1(param1:Rect) : void
      {
         var _loc2_:Object = this._1010479525_DecoThumbRenderer_Rect1;
         if(_loc2_ !== param1)
         {
            this._1010479525_DecoThumbRenderer_Rect1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_DecoThumbRenderer_Rect1",_loc2_,param1));
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
      
      [Bindable(event="propertyChange")]
      public function get nullIcon() : Group
      {
         return this._1906681184nullIcon;
      }
      
      public function set nullIcon(param1:Group) : void
      {
         var _loc2_:Object = this._1906681184nullIcon;
         if(_loc2_ !== param1)
         {
            this._1906681184nullIcon = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"nullIcon",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get isNull() : Boolean
      {
         return this._1180261935isNull;
      }
      
      private function set isNull(param1:Boolean) : void
      {
         var _loc2_:Object = this._1180261935isNull;
         if(_loc2_ !== param1)
         {
            this._1180261935isNull = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"isNull",_loc2_,param1));
            }
         }
      }
   }
}
