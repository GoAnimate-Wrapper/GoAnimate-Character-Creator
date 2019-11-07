package anifire.creator.skins
{
   import anifire.component.ColorInputPanel;
   import anifire.creator.components.ColorDisplayGroup;
   import mx.binding.BindingManager;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.states.AddItems;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.Button;
   import spark.components.DropDownList;
   import spark.components.Group;
   import spark.components.PopUpAnchor;
   import spark.primitives.Path;
   import spark.skins.SparkSkin;
   
   public class ColorPickerDropDownListSkin extends SparkSkin implements IStateClient2
   {
       
      
      private var _358089761colorDisplay:ColorDisplayGroup;
      
      private var _1161397219colorInputPanel:ColorInputPanel;
      
      private var _433014735dropDown:Group;
      
      private var _137111012openButton:Button;
      
      private var _106851532popUp:PopUpAnchor;
      
      private var _814008535triangle1:Path;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _213507019hostComponent:DropDownList;
      
      public function ColorPickerDropDownListSkin()
      {
         super();
         mx_internal::_document = this;
         this.mxmlContent = [this._ColorPickerDropDownListSkin_Button1_i(),this._ColorPickerDropDownListSkin_Group2_c()];
         this.currentState = "normal";
         var _loc1_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._ColorPickerDropDownListSkin_PopUpAnchor1_i,this._ColorPickerDropDownListSkin_PopUpAnchor1_r);
         states = [new State({
            "name":"normal",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"popUp",
               "name":"displayPopUp",
               "value":false
            })]
         }),new State({
            "name":"open",
            "overrides":[new AddItems().initializeFromObject({
               "destructionPolicy":"auto",
               "itemsFactory":_loc1_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            }),new SetProperty().initializeFromObject({
               "target":"popUp",
               "name":"displayPopUp",
               "value":true
            })]
         }),new State({
            "name":"disabled",
            "overrides":[new SetProperty().initializeFromObject({
               "name":"alpha",
               "value":0.5
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
      
      private function _ColorPickerDropDownListSkin_PopUpAnchor1_i() : PopUpAnchor
      {
         var _loc1_:PopUpAnchor = new PopUpAnchor();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.popUpPosition = "above";
         _loc1_.popUpWidthMatchesAnchorWidth = true;
         _loc1_.popUp = this._ColorPickerDropDownListSkin_Group1_i();
         _loc1_.id = "popUp";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.popUp = _loc1_;
         BindingManager.executeBindings(this,"popUp",this.popUp);
         return _loc1_;
      }
      
      private function _ColorPickerDropDownListSkin_PopUpAnchor1_r() : void
      {
      }
      
      private function _ColorPickerDropDownListSkin_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._ColorPickerDropDownListSkin_ColorInputPanel1_i()];
         _loc1_.id = "dropDown";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.dropDown = _loc1_;
         BindingManager.executeBindings(this,"dropDown",this.dropDown);
         return _loc1_;
      }
      
      private function _ColorPickerDropDownListSkin_ColorInputPanel1_i() : ColorInputPanel
      {
         var _loc1_:ColorInputPanel = new ColorInputPanel();
         _loc1_.width = 250;
         _loc1_.height = 250;
         _loc1_.right = -10;
         _loc1_.bottom = 10;
         _loc1_.id = "colorInputPanel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.colorInputPanel = _loc1_;
         BindingManager.executeBindings(this,"colorInputPanel",this.colorInputPanel);
         return _loc1_;
      }
      
      private function _ColorPickerDropDownListSkin_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.focusEnabled = false;
         _loc1_.tabEnabled = false;
         _loc1_.buttonMode = true;
         _loc1_.setStyle("skinClass",ColorPickerOpenButtonSkin);
         _loc1_.id = "openButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.openButton = _loc1_;
         BindingManager.executeBindings(this,"openButton",this.openButton);
         return _loc1_;
      }
      
      private function _ColorPickerDropDownListSkin_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.width = 35;
         _loc1_.height = 25;
         _loc1_.verticalCenter = 0;
         _loc1_.mouseChildren = false;
         _loc1_.mouseEnabled = false;
         _loc1_.mxmlContent = [this._ColorPickerDropDownListSkin_ColorDisplayGroup1_i(),this._ColorPickerDropDownListSkin_Path1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ColorPickerDropDownListSkin_ColorDisplayGroup1_i() : ColorDisplayGroup
      {
         var _loc1_:ColorDisplayGroup = new ColorDisplayGroup();
         _loc1_.width = 25;
         _loc1_.height = 25;
         _loc1_.left = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.id = "colorDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.colorDisplay = _loc1_;
         BindingManager.executeBindings(this,"colorDisplay",this.colorDisplay);
         return _loc1_;
      }
      
      private function _ColorPickerDropDownListSkin_Path1_i() : Path
      {
         var _loc1_:Path = new Path();
         _loc1_.right = 2;
         _loc1_.verticalCenter = 0;
         _loc1_.data = "m 0 0 l 6 0 l -3 3 Z";
         _loc1_.fill = this._ColorPickerDropDownListSkin_SolidColor1_c();
         _loc1_.initialized(this,"triangle1");
         this.triangle1 = _loc1_;
         BindingManager.executeBindings(this,"triangle1",this.triangle1);
         return _loc1_;
      }
      
      private function _ColorPickerDropDownListSkin_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get colorDisplay() : ColorDisplayGroup
      {
         return this._358089761colorDisplay;
      }
      
      public function set colorDisplay(param1:ColorDisplayGroup) : void
      {
         var _loc2_:Object = this._358089761colorDisplay;
         if(_loc2_ !== param1)
         {
            this._358089761colorDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"colorDisplay",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get colorInputPanel() : ColorInputPanel
      {
         return this._1161397219colorInputPanel;
      }
      
      public function set colorInputPanel(param1:ColorInputPanel) : void
      {
         var _loc2_:Object = this._1161397219colorInputPanel;
         if(_loc2_ !== param1)
         {
            this._1161397219colorInputPanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"colorInputPanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get dropDown() : Group
      {
         return this._433014735dropDown;
      }
      
      public function set dropDown(param1:Group) : void
      {
         var _loc2_:Object = this._433014735dropDown;
         if(_loc2_ !== param1)
         {
            this._433014735dropDown = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dropDown",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get openButton() : Button
      {
         return this._137111012openButton;
      }
      
      public function set openButton(param1:Button) : void
      {
         var _loc2_:Object = this._137111012openButton;
         if(_loc2_ !== param1)
         {
            this._137111012openButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"openButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get popUp() : PopUpAnchor
      {
         return this._106851532popUp;
      }
      
      public function set popUp(param1:PopUpAnchor) : void
      {
         var _loc2_:Object = this._106851532popUp;
         if(_loc2_ !== param1)
         {
            this._106851532popUp = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"popUp",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get triangle1() : Path
      {
         return this._814008535triangle1;
      }
      
      public function set triangle1(param1:Path) : void
      {
         var _loc2_:Object = this._814008535triangle1;
         if(_loc2_ !== param1)
         {
            this._814008535triangle1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"triangle1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hostComponent() : DropDownList
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:DropDownList) : void
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
