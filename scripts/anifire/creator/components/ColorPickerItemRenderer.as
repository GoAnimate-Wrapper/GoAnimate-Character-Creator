package anifire.creator.components
{
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
   import mx.graphics.SolidColorStroke;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.supportClasses.ItemRenderer;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class ColorPickerItemRenderer extends ItemRenderer implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _ColorPickerItemRenderer_SolidColor1:SolidColor;
      
      private var _1714788406_ColorPickerItemRenderer_SolidColorStroke1:SolidColorStroke;
      
      private var _889711556swatch:Rect;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function ColorPickerItemRenderer()
      {
         var bindings:Array = null;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         bindings = this._ColorPickerItemRenderer_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_creator_components_ColorPickerItemRendererWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return ColorPickerItemRenderer[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.autoDrawBackground = false;
         this.buttonMode = true;
         this.mxmlContent = [this._ColorPickerItemRenderer_Rect1_i()];
         this.currentState = "normal";
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"hovered",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_ColorPickerItemRenderer_SolidColorStroke1",
               "name":"alpha",
               "value":1
            })]
         }),new State({
            "name":"selected",
            "overrides":[]
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
         ColorPickerItemRenderer._watcherSetupUtil = param1;
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
      
      private function _ColorPickerItemRenderer_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.width = 10;
         _loc1_.height = 10;
         _loc1_.fill = this._ColorPickerItemRenderer_SolidColor1_i();
         _loc1_.stroke = this._ColorPickerItemRenderer_SolidColorStroke1_i();
         _loc1_.initialized(this,"swatch");
         this.swatch = _loc1_;
         BindingManager.executeBindings(this,"swatch",this.swatch);
         return _loc1_;
      }
      
      private function _ColorPickerItemRenderer_SolidColor1_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         this._ColorPickerItemRenderer_SolidColor1 = _loc1_;
         BindingManager.executeBindings(this,"_ColorPickerItemRenderer_SolidColor1",this._ColorPickerItemRenderer_SolidColor1);
         return _loc1_;
      }
      
      private function _ColorPickerItemRenderer_SolidColorStroke1_i() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 16776960;
         _loc1_.alpha = 0;
         this._ColorPickerItemRenderer_SolidColorStroke1 = _loc1_;
         BindingManager.executeBindings(this,"_ColorPickerItemRenderer_SolidColorStroke1",this._ColorPickerItemRenderer_SolidColorStroke1);
         return _loc1_;
      }
      
      private function _ColorPickerItemRenderer_bindingsSetup() : Array
      {
         var _loc1_:Array = [];
         _loc1_[0] = new Binding(this,null,null,"_ColorPickerItemRenderer_SolidColor1.color","data");
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get _ColorPickerItemRenderer_SolidColorStroke1() : SolidColorStroke
      {
         return this._1714788406_ColorPickerItemRenderer_SolidColorStroke1;
      }
      
      public function set _ColorPickerItemRenderer_SolidColorStroke1(param1:SolidColorStroke) : void
      {
         var _loc2_:Object = this._1714788406_ColorPickerItemRenderer_SolidColorStroke1;
         if(_loc2_ !== param1)
         {
            this._1714788406_ColorPickerItemRenderer_SolidColorStroke1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_ColorPickerItemRenderer_SolidColorStroke1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get swatch() : Rect
      {
         return this._889711556swatch;
      }
      
      public function set swatch(param1:Rect) : void
      {
         var _loc2_:Object = this._889711556swatch;
         if(_loc2_ !== param1)
         {
            this._889711556swatch = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"swatch",_loc2_,param1));
            }
         }
      }
   }
}
