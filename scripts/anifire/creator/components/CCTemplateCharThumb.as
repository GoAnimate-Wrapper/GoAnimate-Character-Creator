package anifire.creator.components
{
   import anifire.component.CCThumb;
   import anifire.constant.CcLibConstant;
   import anifire.creator.models.CcCharacter;
   import flash.events.MouseEvent;
   import mx.containers.Canvas;
   import mx.core.FlexGlobals;
   import mx.core.IFlexModuleFactory;
   import mx.core.UIComponent;
   import mx.core.UIComponentDescriptor;
   import mx.events.FlexEvent;
   import mx.states.SetProperty;
   import mx.states.State;
   import mx.utils.ColorUtil;
   
   public class CCTemplateCharThumb extends Canvas
   {
       
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _thumb:CCThumb = null;
      
      private var _char:CcCharacter = null;
      
      public function CCTemplateCharThumb()
      {
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":Canvas,
            "events":{"creationComplete":"___CCTemplateCharThumb_Canvas1_creationComplete"}
         });
         super();
         mx_internal::_document = this;
         this.states = [this._CCTemplateCharThumb_State1_c()];
         this.addEventListener("creationComplete",this.___CCTemplateCharThumb_Canvas1_creationComplete);
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
      
      public function set thumbnail(param1:CCThumb) : void
      {
         this.removeAllChildren();
         this._thumb = param1;
         var _loc2_:UIComponent = new UIComponent();
         _loc2_.addChild(param1);
         _loc2_.width = param1.thumbWidth;
         _loc2_.height = param1.thumbHeight;
         width = CcLibConstant.TEMPLATE_CHAR_THUMB_WIDTH;
         height = CcLibConstant.TEMPLATE_CHAR_THUMB_WIDTH;
         buttonMode = true;
         mouseEnabled = true;
         useHandCursor = true;
         _loc2_.x = (width - _loc2_.width) / 2;
         _loc2_.y = (height - _loc2_.height) / 2;
         addChild(_loc2_);
         styleName = "templateCharThumbNormal";
      }
      
      public function get character() : CcCharacter
      {
         return this._char;
      }
      
      public function set character(param1:CcCharacter) : void
      {
         this._char = param1;
      }
      
      private function creationCompleteHandler() : void
      {
         var _bgColor:uint = 0;
         var brightenedColor:uint = 0;
         _bgColor = uint(FlexGlobals.topLevelApplication.styleManager.getStyleDeclaration("." + styleName).getStyle("backgroundColor"));
         brightenedColor = ColorUtil.adjustBrightness(_bgColor,32);
         var toggleHighlight:Function = function(param1:MouseEvent):void
         {
            setStyle("backgroundColor",param1.type == MouseEvent.ROLL_OVER?brightenedColor:_bgColor);
         };
         addEventListener(MouseEvent.ROLL_OVER,toggleHighlight);
         addEventListener(MouseEvent.ROLL_OUT,toggleHighlight);
      }
      
      private function _CCTemplateCharThumb_State1_c() : State
      {
         var _loc1_:State = new State();
         _loc1_.name = "selected";
         _loc1_.overrides = [this._CCTemplateCharThumb_SetProperty1_c()];
         return _loc1_;
      }
      
      private function _CCTemplateCharThumb_SetProperty1_c() : SetProperty
      {
         var _loc1_:SetProperty = new SetProperty();
         _loc1_.name = "styleName";
         _loc1_.value = "templateCharThumbSelected";
         return _loc1_;
      }
      
      public function ___CCTemplateCharThumb_Canvas1_creationComplete(param1:FlexEvent) : void
      {
         this.creationCompleteHandler();
      }
   }
}
