package anifire.creator.components
{
   import mx.core.IFlexModuleFactory;
   import spark.components.Group;
   import spark.components.VGroup;
   import spark.primitives.BitmapImage;
   
   public class CCLoadingScreen extends Group
   {
       
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml__styles_images_preloader_loading_logo_png_878298051:Class;
      
      private var _embed_mxml__styles_images_preloader_loading_fill_png_876464899:Class;
      
      private var _embed_mxml__styles_images_preloader_loading_track_png_775182565:Class;
      
      public function CCLoadingScreen()
      {
         this._embed_mxml__styles_images_preloader_loading_logo_png_878298051 = CCLoadingScreen__embed_mxml__styles_images_preloader_loading_logo_png_878298051;
         this._embed_mxml__styles_images_preloader_loading_fill_png_876464899 = CCLoadingScreen__embed_mxml__styles_images_preloader_loading_fill_png_876464899;
         this._embed_mxml__styles_images_preloader_loading_track_png_775182565 = CCLoadingScreen__embed_mxml__styles_images_preloader_loading_track_png_775182565;
         super();
         mx_internal::_document = this;
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.mxmlContent = [this._CCLoadingScreen_VGroup1_c()];
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
      
      private function _CCLoadingScreen_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = -1;
         _loc1_.horizontalAlign = "center";
         _loc1_.gap = 20;
         _loc1_.mxmlContent = [this._CCLoadingScreen_BitmapImage1_c(),this._CCLoadingScreen_Group2_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _CCLoadingScreen_BitmapImage1_c() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml__styles_images_preloader_loading_logo_png_878298051;
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _CCLoadingScreen_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._CCLoadingScreen_BitmapImage2_c(),this._CCLoadingScreen_BitmapImage3_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _CCLoadingScreen_BitmapImage2_c() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml__styles_images_preloader_loading_track_png_775182565;
         _loc1_.smooth = true;
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _CCLoadingScreen_BitmapImage3_c() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml__styles_images_preloader_loading_fill_png_876464899;
         _loc1_.smooth = true;
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.initialized(this,null);
         return _loc1_;
      }
   }
}
