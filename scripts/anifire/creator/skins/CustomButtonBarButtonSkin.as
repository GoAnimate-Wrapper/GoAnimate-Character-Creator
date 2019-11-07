package anifire.creator.skins
{
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.ButtonBarButton;
   import spark.primitives.BitmapImage;
   import spark.primitives.Ellipse;
   import spark.primitives.Graphic;
   import spark.skins.SparkSkin;
   
   public class CustomButtonBarButtonSkin extends SparkSkin implements IStateClient2
   {
      
      private static const exclusions:Array = [];
       
      
      private var _1205702194_CustomButtonBarButtonSkin_Ellipse1:Ellipse;
      
      private var _1157270842_CustomButtonBarButtonSkin_SolidColor1:SolidColor;
      
      private var _3307gr:Graphic;
      
      private var _104387img:BitmapImage;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _213507019hostComponent:ButtonBarButton;
      
      public function CustomButtonBarButtonSkin()
      {
         super();
         mx_internal::_document = this;
         this.width = 45;
         this.height = 45;
         this.mxmlContent = [this._CustomButtonBarButtonSkin_Ellipse1_i(),this._CustomButtonBarButtonSkin_Graphic1_i()];
         this.currentState = "up";
         states = [new State({
            "name":"up",
            "overrides":[]
         }),new State({
            "name":"over",
            "stateGroups":["overStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_CustomButtonBarButtonSkin_Ellipse1",
               "name":"height",
               "value":35
            }),new SetProperty().initializeFromObject({
               "target":"_CustomButtonBarButtonSkin_Ellipse1",
               "name":"width",
               "value":35
            }),new SetProperty().initializeFromObject({
               "target":"_CustomButtonBarButtonSkin_SolidColor1",
               "name":"color",
               "value":367237
            }),new SetProperty().initializeFromObject({
               "target":"gr",
               "name":"width",
               "value":35
            }),new SetProperty().initializeFromObject({
               "target":"gr",
               "name":"height",
               "value":35
            })]
         }),new State({
            "name":"down",
            "stateGroups":["downStates"],
            "overrides":[]
         }),new State({
            "name":"disabled",
            "stateGroups":["disabledStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "name":"alpha",
               "value":0.5
            })]
         }),new State({
            "name":"upAndSelected",
            "stateGroups":["selectedStates","selectedUpStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_CustomButtonBarButtonSkin_Ellipse1",
               "name":"height",
               "value":45
            }),new SetProperty().initializeFromObject({
               "target":"_CustomButtonBarButtonSkin_Ellipse1",
               "name":"width",
               "value":45
            }),new SetProperty().initializeFromObject({
               "target":"_CustomButtonBarButtonSkin_SolidColor1",
               "name":"color",
               "value":15890741
            }),new SetProperty().initializeFromObject({
               "target":"gr",
               "name":"width",
               "value":45
            }),new SetProperty().initializeFromObject({
               "target":"gr",
               "name":"height",
               "value":45
            })]
         }),new State({
            "name":"overAndSelected",
            "stateGroups":["selectedStates","selectedUpStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_CustomButtonBarButtonSkin_Ellipse1",
               "name":"height",
               "value":45
            }),new SetProperty().initializeFromObject({
               "target":"_CustomButtonBarButtonSkin_Ellipse1",
               "name":"width",
               "value":45
            }),new SetProperty().initializeFromObject({
               "target":"_CustomButtonBarButtonSkin_SolidColor1",
               "name":"color",
               "value":15890741
            }),new SetProperty().initializeFromObject({
               "target":"gr",
               "name":"width",
               "value":45
            }),new SetProperty().initializeFromObject({
               "target":"gr",
               "name":"height",
               "value":45
            })]
         }),new State({
            "name":"downAndSelected",
            "stateGroups":["selectedStates","selectedUpStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_CustomButtonBarButtonSkin_Ellipse1",
               "name":"height",
               "value":45
            }),new SetProperty().initializeFromObject({
               "target":"_CustomButtonBarButtonSkin_Ellipse1",
               "name":"width",
               "value":45
            }),new SetProperty().initializeFromObject({
               "target":"_CustomButtonBarButtonSkin_SolidColor1",
               "name":"color",
               "value":15890741
            }),new SetProperty().initializeFromObject({
               "target":"gr",
               "name":"width",
               "value":45
            }),new SetProperty().initializeFromObject({
               "target":"gr",
               "name":"height",
               "value":45
            })]
         }),new State({
            "name":"disabledAndSelected",
            "stateGroups":["selectedStates","selectedUpStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_CustomButtonBarButtonSkin_Ellipse1",
               "name":"height",
               "value":45
            }),new SetProperty().initializeFromObject({
               "target":"_CustomButtonBarButtonSkin_Ellipse1",
               "name":"width",
               "value":45
            }),new SetProperty().initializeFromObject({
               "target":"_CustomButtonBarButtonSkin_SolidColor1",
               "name":"color",
               "value":15890741
            }),new SetProperty().initializeFromObject({
               "target":"gr",
               "name":"width",
               "value":45
            }),new SetProperty().initializeFromObject({
               "target":"gr",
               "name":"height",
               "value":45
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
      
      protected function gr_creationComplete(param1:FlexEvent) : void
      {
         var _loc2_:Object = this.hostComponent.data;
         this.img.source = _loc2_.icon;
      }
      
      override public function get colorizeExclusions() : Array
      {
         return exclusions;
      }
      
      private function _CustomButtonBarButtonSkin_Ellipse1_i() : Ellipse
      {
         var _loc1_:Ellipse = new Ellipse();
         _loc1_.height = 30;
         _loc1_.width = 30;
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.fill = this._CustomButtonBarButtonSkin_SolidColor1_i();
         _loc1_.initialized(this,"_CustomButtonBarButtonSkin_Ellipse1");
         this._CustomButtonBarButtonSkin_Ellipse1 = _loc1_;
         BindingManager.executeBindings(this,"_CustomButtonBarButtonSkin_Ellipse1",this._CustomButtonBarButtonSkin_Ellipse1);
         return _loc1_;
      }
      
      private function _CustomButtonBarButtonSkin_SolidColor1_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 2210726;
         this._CustomButtonBarButtonSkin_SolidColor1 = _loc1_;
         BindingManager.executeBindings(this,"_CustomButtonBarButtonSkin_SolidColor1",this._CustomButtonBarButtonSkin_SolidColor1);
         return _loc1_;
      }
      
      private function _CustomButtonBarButtonSkin_Graphic1_i() : Graphic
      {
         var _loc1_:Graphic = new Graphic();
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.width = 30;
         _loc1_.height = 30;
         _loc1_.mxmlContent = [this._CustomButtonBarButtonSkin_BitmapImage1_i()];
         _loc1_.addEventListener("creationComplete",this.__gr_creationComplete);
         _loc1_.id = "gr";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.gr = _loc1_;
         BindingManager.executeBindings(this,"gr",this.gr);
         return _loc1_;
      }
      
      private function _CustomButtonBarButtonSkin_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.smooth = true;
         _loc1_.initialized(this,"img");
         this.img = _loc1_;
         BindingManager.executeBindings(this,"img",this.img);
         return _loc1_;
      }
      
      public function __gr_creationComplete(param1:FlexEvent) : void
      {
         this.gr_creationComplete(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get _CustomButtonBarButtonSkin_Ellipse1() : Ellipse
      {
         return this._1205702194_CustomButtonBarButtonSkin_Ellipse1;
      }
      
      public function set _CustomButtonBarButtonSkin_Ellipse1(param1:Ellipse) : void
      {
         var _loc2_:Object = this._1205702194_CustomButtonBarButtonSkin_Ellipse1;
         if(_loc2_ !== param1)
         {
            this._1205702194_CustomButtonBarButtonSkin_Ellipse1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_CustomButtonBarButtonSkin_Ellipse1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _CustomButtonBarButtonSkin_SolidColor1() : SolidColor
      {
         return this._1157270842_CustomButtonBarButtonSkin_SolidColor1;
      }
      
      public function set _CustomButtonBarButtonSkin_SolidColor1(param1:SolidColor) : void
      {
         var _loc2_:Object = this._1157270842_CustomButtonBarButtonSkin_SolidColor1;
         if(_loc2_ !== param1)
         {
            this._1157270842_CustomButtonBarButtonSkin_SolidColor1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_CustomButtonBarButtonSkin_SolidColor1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get gr() : Graphic
      {
         return this._3307gr;
      }
      
      public function set gr(param1:Graphic) : void
      {
         var _loc2_:Object = this._3307gr;
         if(_loc2_ !== param1)
         {
            this._3307gr = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"gr",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get img() : BitmapImage
      {
         return this._104387img;
      }
      
      public function set img(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._104387img;
         if(_loc2_ !== param1)
         {
            this._104387img = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"img",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hostComponent() : ButtonBarButton
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:ButtonBarButton) : void
      {
         var _loc2_:Object = this._213507019hostComponent;
         if(_loc2_ !== param1)
         {
            this._213507019hostComponent = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"hostComponent",_loc2_,param1));
            }
         }
      }
   }
}
