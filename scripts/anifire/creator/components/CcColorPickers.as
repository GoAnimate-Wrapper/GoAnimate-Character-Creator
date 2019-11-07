package anifire.creator.components
{
   import anifire.creator.events.CcColorPickerEvent;
   import anifire.creator.models.CcCharacter;
   import anifire.creator.models.CcColor;
   import anifire.creator.models.CcColorThumb;
   import anifire.creator.models.CcComponent;
   import anifire.creator.models.CcComponentThumb;
   import anifire.creator.models.CcLibrary;
   import anifire.creator.models.CcTheme;
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import spark.components.Group;
   import spark.components.VGroup;
   
   public class CcColorPickers extends Group
   {
       
      
      private var _1780199526_pickers:VGroup;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var colorThumb:CcColorThumb;
      
      private var _biggerElementWidth:Number;
      
      private var _smallerElementWidth:Number;
      
      private const DELAY_BETWEEN_LOADING_EACH_THUMB:Number = 200;
      
      public function CcColorPickers()
      {
         super();
         mx_internal::_document = this;
         this.mxmlContent = [this._CcColorPickers_VGroup1_i()];
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
      
      public function set biggerElementWidth(param1:Number) : void
      {
         this._biggerElementWidth = param1;
      }
      
      public function set smallerElementWidth(param1:Number) : void
      {
         this._smallerElementWidth = param1;
      }
      
      public function addLibraryType(param1:CcLibrary, param2:CcTheme, param3:CcCharacter) : void
      {
         var _loc5_:CcColorThumb = null;
         var _loc7_:int = 0;
         var _loc4_:Array = new Array();
         var _loc6_:int = 0;
         while(_loc6_ < param2.getColorThumbNum())
         {
            _loc5_ = param2.getColorThumbByIndex(_loc6_);
            if(_loc5_.componentType == param1.type)
            {
               _loc4_.push(_loc5_);
            }
            _loc6_++;
         }
         if(_loc4_.length > 0)
         {
            _loc7_ = 0;
            while(_loc7_ < _loc4_.length)
            {
               _loc5_ = _loc4_[_loc7_] as CcColorThumb;
               this.addColorPicker(_loc5_,null,param2,param3);
               _loc7_++;
            }
         }
      }
      
      public function addComponentType(param1:CcComponent, param2:String, param3:CcTheme, param4:CcCharacter) : void
      {
         var _loc6_:CcColorThumb = null;
         var _loc8_:CcColorPickerElementSpark = null;
         var _loc9_:int = 0;
         var _loc5_:Array = new Array();
         var _loc7_:int = 0;
         while(_loc7_ < param3.getColorThumbNum())
         {
            _loc6_ = param3.getColorThumbByIndex(_loc7_);
            if(_loc6_.componentType == param2)
            {
               _loc5_.push(_loc6_);
            }
            _loc7_++;
         }
         if(_loc5_.length > 0)
         {
            _loc9_ = 0;
            while(_loc9_ < _loc5_.length)
            {
               _loc6_ = _loc5_[_loc9_] as CcColorThumb;
               this.addColorPicker(_loc6_,param1,param3,param4);
               _loc9_++;
            }
         }
      }
      
      public function addComponentThumb(param1:CcComponent, param2:CcComponentThumb, param3:CcTheme, param4:CcCharacter) : void
      {
         var _loc5_:CcColorPickerElementSpark = null;
         var _loc6_:int = 0;
         var _loc7_:CcColorThumb = null;
         if(param2.getMyOwnColorNum() > 0)
         {
            _loc6_ = 0;
            while(_loc6_ < param2.getMyOwnColorNum())
            {
               _loc7_ = param2.getMyOwnColorByIndex(_loc6_);
               this.addColorPicker(_loc7_,param1,param3,param4);
               _loc6_++;
            }
         }
      }
      
      private function addColorPicker(param1:CcColorThumb, param2:CcComponent, param3:CcTheme, param4:CcCharacter) : void
      {
         var _loc5_:CcColorPickerElementSpark = null;
         if(!param1.enable)
         {
            return;
         }
         _loc5_ = new CcColorPickerElementSpark();
         if(param1.colorChoices.length > 4)
         {
            _loc5_.width = this._biggerElementWidth;
         }
         else
         {
            _loc5_.width = this._smallerElementWidth;
         }
         _loc5_.height = 30;
         _loc5_.addEventListener(CcColorPickerEvent.COLOR_CHOSEN,this.onUserChooseColor);
         _loc5_.callLater(_loc5_.initByColorThumb,[param2,param1,param3,param4]);
         this._pickers.addElement(_loc5_);
      }
      
      private function onUserChooseColor(param1:CcColorPickerEvent) : void
      {
         this.tellEveryBodyColorChosen(param1.colorChosen,param1.undoable);
      }
      
      private function tellEveryBodyColorChosen(param1:CcColor, param2:Boolean = true) : void
      {
         var _loc3_:CcColorPickerEvent = new CcColorPickerEvent(CcColorPickerEvent.COLOR_CHOSEN,this);
         _loc3_.colorChosen = param1;
         _loc3_.undoable = param2;
         this.dispatchEvent(_loc3_);
      }
      
      public function destroy() : void
      {
         var _loc1_:int = 0;
         var _loc2_:CcColorPickerElementSpark = null;
         while(_loc1_ < this._pickers.numChildren)
         {
            _loc2_ = this._pickers.getChildAt(_loc1_) as CcColorPickerElementSpark;
            _loc2_.removeEventListener(CcColorPickerEvent.COLOR_CHOSEN,this.onUserChooseColor);
            _loc1_++;
         }
         this._pickers.removeAllElements();
      }
      
      private function _CcColorPickers_VGroup1_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.id = "_pickers";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._pickers = _loc1_;
         BindingManager.executeBindings(this,"_pickers",this._pickers);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get _pickers() : VGroup
      {
         return this._1780199526_pickers;
      }
      
      public function set _pickers(param1:VGroup) : void
      {
         var _loc2_:Object = this._1780199526_pickers;
         if(_loc2_ !== param1)
         {
            this._1780199526_pickers = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_pickers",_loc2_,param1));
            }
         }
      }
   }
}
