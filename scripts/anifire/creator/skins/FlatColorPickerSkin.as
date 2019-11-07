package anifire.creator.skins
{
   import anifire.creator.components.ArrowTipContainer;
   import anifire.creator.components.ColorDisplayGroup;
   import anifire.creator.components.ColorPicker;
   import anifire.creator.components.ColorPickerItemRenderer;
   import anifire.creator.components.IconButton;
   import anifire.util.UtilDict;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.ClassFactory;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.states.AddItems;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.Button;
   import spark.components.DataGroup;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.PopUpAnchor;
   import spark.components.TextInput;
   import spark.components.VGroup;
   import spark.layouts.TileLayout;
   import spark.primitives.Path;
   import spark.primitives.Rect;
   import spark.skins.SparkSkin;
   
   use namespace mx_internal;
   
   public class FlatColorPickerSkin extends SparkSkin implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _FlatColorPickerSkin_Group2:Group;
      
      private var _358089761colorDisplay:ColorDisplayGroup;
      
      private var _1269194279colorInput:TextInput;
      
      private var _385593099dataGroup:DataGroup;
      
      private var _433014735dropDown:Group;
      
      private var _137111012openButton:Button;
      
      private var _106851532popUp:PopUpAnchor;
      
      private var _446482375previewColorDisplay:ColorDisplayGroup;
      
      private var _575718584swatchpanel:VGroup;
      
      private var _1583353795transparentColorButton:IconButton;
      
      private var _814008535triangle1:Path;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml__styles_images_panel_text_nocolor_png_2012769295:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _213507019hostComponent:ColorPicker;
      
      public function FlatColorPickerSkin()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._embed_mxml__styles_images_panel_text_nocolor_png_2012769295 = FlatColorPickerSkin__embed_mxml__styles_images_panel_text_nocolor_png_2012769295;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._FlatColorPickerSkin_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_creator_skins_FlatColorPickerSkinWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return FlatColorPickerSkin[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.minWidth = 32;
         this.mxmlContent = [this._FlatColorPickerSkin_Button1_i(),this._FlatColorPickerSkin_Group4_c()];
         this.currentState = "normal";
         var _FlatColorPickerSkin_PopUpAnchor1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._FlatColorPickerSkin_PopUpAnchor1_i,this._FlatColorPickerSkin_PopUpAnchor1_r);
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
               "itemsFactory":_FlatColorPickerSkin_PopUpAnchor1_factory,
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
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         FlatColorPickerSkin._watcherSetupUtil = param1;
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
      
      private function _FlatColorPickerSkin_PopUpAnchor1_i() : PopUpAnchor
      {
         var _loc1_:PopUpAnchor = new PopUpAnchor();
         _loc1_.right = 40;
         _loc1_.percentHeight = 100;
         _loc1_.popUpPosition = "above";
         _loc1_.popUpWidthMatchesAnchorWidth = false;
         _loc1_.popUp = this._FlatColorPickerSkin_Group1_i();
         _loc1_.id = "popUp";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.popUp = _loc1_;
         BindingManager.executeBindings(this,"popUp",this.popUp);
         return _loc1_;
      }
      
      private function _FlatColorPickerSkin_PopUpAnchor1_r() : void
      {
      }
      
      private function _FlatColorPickerSkin_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._FlatColorPickerSkin_ArrowTipContainer1_c()];
         _loc1_.id = "dropDown";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.dropDown = _loc1_;
         BindingManager.executeBindings(this,"dropDown",this.dropDown);
         return _loc1_;
      }
      
      private function _FlatColorPickerSkin_ArrowTipContainer1_c() : ArrowTipContainer
      {
         var _loc1_:ArrowTipContainer = new ArrowTipContainer();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.tipPosition = "aboveRight";
         _loc1_.targetWidth = 20;
         _loc1_.offset = 15;
         _loc1_.content = [this._FlatColorPickerSkin_VGroup1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FlatColorPickerSkin_VGroup1_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.left = 0;
         _loc1_.top = 0;
         _loc1_.right = 0;
         _loc1_.bottom = 0;
         _loc1_.paddingLeft = 10;
         _loc1_.paddingRight = 10;
         _loc1_.paddingTop = 10;
         _loc1_.paddingBottom = 10;
         _loc1_.mxmlContent = [this._FlatColorPickerSkin_HGroup1_c(),this._FlatColorPickerSkin_Group3_c()];
         _loc1_.id = "swatchpanel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.swatchpanel = _loc1_;
         BindingManager.executeBindings(this,"swatchpanel",this.swatchpanel);
         return _loc1_;
      }
      
      private function _FlatColorPickerSkin_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._FlatColorPickerSkin_ColorDisplayGroup1_i(),this._FlatColorPickerSkin_TextInput1_i(),this._FlatColorPickerSkin_Group2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FlatColorPickerSkin_ColorDisplayGroup1_i() : ColorDisplayGroup
      {
         var _loc1_:ColorDisplayGroup = new ColorDisplayGroup();
         _loc1_.width = 20;
         _loc1_.height = 20;
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.id = "previewColorDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.previewColorDisplay = _loc1_;
         BindingManager.executeBindings(this,"previewColorDisplay",this.previewColorDisplay);
         return _loc1_;
      }
      
      private function _FlatColorPickerSkin_TextInput1_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         _loc1_.width = 80;
         _loc1_.id = "colorInput";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.colorInput = _loc1_;
         BindingManager.executeBindings(this,"colorInput",this.colorInput);
         return _loc1_;
      }
      
      private function _FlatColorPickerSkin_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._FlatColorPickerSkin_IconButton1_i()];
         _loc1_.id = "_FlatColorPickerSkin_Group2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._FlatColorPickerSkin_Group2 = _loc1_;
         BindingManager.executeBindings(this,"_FlatColorPickerSkin_Group2",this._FlatColorPickerSkin_Group2);
         return _loc1_;
      }
      
      private function _FlatColorPickerSkin_IconButton1_i() : IconButton
      {
         var _loc1_:IconButton = new IconButton();
         _loc1_.buttonMode = true;
         _loc1_.bottom = 0;
         _loc1_.right = 0;
         _loc1_.setStyle("icon",this._embed_mxml__styles_images_panel_text_nocolor_png_2012769295);
         _loc1_.id = "transparentColorButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.transparentColorButton = _loc1_;
         BindingManager.executeBindings(this,"transparentColorButton",this.transparentColorButton);
         return _loc1_;
      }
      
      private function _FlatColorPickerSkin_Group3_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._FlatColorPickerSkin_Rect1_c(),this._FlatColorPickerSkin_DataGroup1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FlatColorPickerSkin_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.top = 0;
         _loc1_.right = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._FlatColorPickerSkin_SolidColor1_c();
         _loc1_.stroke = this._FlatColorPickerSkin_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _FlatColorPickerSkin_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 0;
         return _loc1_;
      }
      
      private function _FlatColorPickerSkin_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 0;
         return _loc1_;
      }
      
      private function _FlatColorPickerSkin_DataGroup1_i() : DataGroup
      {
         var _loc1_:DataGroup = new DataGroup();
         _loc1_.left = 1;
         _loc1_.top = 1;
         _loc1_.right = 0;
         _loc1_.bottom = 0;
         _loc1_.itemRenderer = this._FlatColorPickerSkin_ClassFactory1_c();
         _loc1_.layout = this._FlatColorPickerSkin_TileLayout1_c();
         _loc1_.id = "dataGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.dataGroup = _loc1_;
         BindingManager.executeBindings(this,"dataGroup",this.dataGroup);
         return _loc1_;
      }
      
      private function _FlatColorPickerSkin_ClassFactory1_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = ColorPickerItemRenderer;
         return _loc1_;
      }
      
      private function _FlatColorPickerSkin_TileLayout1_c() : TileLayout
      {
         var _loc1_:TileLayout = new TileLayout();
         _loc1_.verticalGap = 0;
         _loc1_.horizontalGap = 0;
         _loc1_.requestedColumnCount = 20;
         _loc1_.requestedRowCount = 12;
         return _loc1_;
      }
      
      private function _FlatColorPickerSkin_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.width = 35;
         _loc1_.height = 25;
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.buttonMode = true;
         _loc1_.focusEnabled = false;
         _loc1_.tabEnabled = false;
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
      
      private function _FlatColorPickerSkin_Group4_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.width = 35;
         _loc1_.height = 25;
         _loc1_.verticalCenter = 0;
         _loc1_.mouseChildren = false;
         _loc1_.mouseEnabled = false;
         _loc1_.mxmlContent = [this._FlatColorPickerSkin_ColorDisplayGroup2_i(),this._FlatColorPickerSkin_Path1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FlatColorPickerSkin_ColorDisplayGroup2_i() : ColorDisplayGroup
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
      
      private function _FlatColorPickerSkin_Path1_i() : Path
      {
         var _loc1_:Path = new Path();
         _loc1_.right = 2;
         _loc1_.verticalCenter = 0;
         _loc1_.data = "m 0 0 l 6 0 l -3 3 Z";
         _loc1_.fill = this._FlatColorPickerSkin_SolidColor2_c();
         _loc1_.initialized(this,"triangle1");
         this.triangle1 = _loc1_;
         BindingManager.executeBindings(this,"triangle1",this.triangle1);
         return _loc1_;
      }
      
      private function _FlatColorPickerSkin_SolidColor2_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         return _loc1_;
      }
      
      private function _FlatColorPickerSkin_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():uint
         {
            return hostComponent.previewColor;
         },null,"previewColorDisplay.color");
         result[1] = new Binding(this,function():Boolean
         {
            return hostComponent.allowTransparent;
         },null,"_FlatColorPickerSkin_Group2.includeInLayout");
         result[2] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","No Color");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"transparentColorButton.toolTip");
         result[3] = new Binding(this,function():uint
         {
            return hostComponent.selectedItem;
         },null,"colorDisplay.color");
         return result;
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
      public function get colorInput() : TextInput
      {
         return this._1269194279colorInput;
      }
      
      public function set colorInput(param1:TextInput) : void
      {
         var _loc2_:Object = this._1269194279colorInput;
         if(_loc2_ !== param1)
         {
            this._1269194279colorInput = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"colorInput",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get dataGroup() : DataGroup
      {
         return this._385593099dataGroup;
      }
      
      public function set dataGroup(param1:DataGroup) : void
      {
         var _loc2_:Object = this._385593099dataGroup;
         if(_loc2_ !== param1)
         {
            this._385593099dataGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dataGroup",_loc2_,param1));
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
      public function get previewColorDisplay() : ColorDisplayGroup
      {
         return this._446482375previewColorDisplay;
      }
      
      public function set previewColorDisplay(param1:ColorDisplayGroup) : void
      {
         var _loc2_:Object = this._446482375previewColorDisplay;
         if(_loc2_ !== param1)
         {
            this._446482375previewColorDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"previewColorDisplay",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get swatchpanel() : VGroup
      {
         return this._575718584swatchpanel;
      }
      
      public function set swatchpanel(param1:VGroup) : void
      {
         var _loc2_:Object = this._575718584swatchpanel;
         if(_loc2_ !== param1)
         {
            this._575718584swatchpanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"swatchpanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get transparentColorButton() : IconButton
      {
         return this._1583353795transparentColorButton;
      }
      
      public function set transparentColorButton(param1:IconButton) : void
      {
         var _loc2_:Object = this._1583353795transparentColorButton;
         if(_loc2_ !== param1)
         {
            this._1583353795transparentColorButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"transparentColorButton",_loc2_,param1));
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
      public function get hostComponent() : ColorPicker
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:ColorPicker) : void
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
