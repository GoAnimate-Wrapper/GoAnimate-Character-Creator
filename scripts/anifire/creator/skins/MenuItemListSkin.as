package anifire.creator.skins
{
   import anifire.creator.components.MenuItemList;
   import anifire.creator.components.MenuItemRenderer;
   import mx.binding.BindingManager;
   import mx.core.ClassFactory;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.DataGroup;
   import spark.layouts.VerticalLayout;
   import spark.skins.SparkSkin;
   
   public class MenuItemListSkin extends SparkSkin implements IStateClient2
   {
       
      
      private var _385593099dataGroup:DataGroup;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _213507019hostComponent:MenuItemList;
      
      public function MenuItemListSkin()
      {
         super();
         mx_internal::_document = this;
         this.minWidth = 112;
         this.minHeight = 0;
         this.blendMode = "normal";
         this.mxmlContent = [this._MenuItemListSkin_DataGroup1_i()];
         this.currentState = "normal";
         states = [new State({
            "name":"normal",
            "overrides":[]
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
      
      private function _MenuItemListSkin_DataGroup1_i() : DataGroup
      {
         var _loc1_:DataGroup = new DataGroup();
         _loc1_.itemRenderer = this._MenuItemListSkin_ClassFactory1_c();
         _loc1_.layout = this._MenuItemListSkin_VerticalLayout1_c();
         _loc1_.id = "dataGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.dataGroup = _loc1_;
         BindingManager.executeBindings(this,"dataGroup",this.dataGroup);
         return _loc1_;
      }
      
      private function _MenuItemListSkin_ClassFactory1_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = MenuItemRenderer;
         return _loc1_;
      }
      
      private function _MenuItemListSkin_VerticalLayout1_c() : VerticalLayout
      {
         var _loc1_:VerticalLayout = new VerticalLayout();
         _loc1_.gap = 0;
         _loc1_.horizontalAlign = "contentJustify";
         _loc1_.variableRowHeight = true;
         _loc1_.requestedMinRowCount = 1;
         _loc1_.requestedRowCount = -1;
         return _loc1_;
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
      public function get hostComponent() : MenuItemList
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:MenuItemList) : void
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
