package anifire.creator.components
{
   import anifire.creator.events.CcActionChosenEvent;
   import anifire.creator.events.CcCoreEvent;
   import anifire.creator.models.CcAction;
   import anifire.creator.models.CcCharacter;
   import anifire.creator.models.CcComponent;
   import anifire.creator.models.CcFacial;
   import anifire.creator.models.CcRequireComponent;
   import anifire.creator.models.CcTheme;
   import anifire.creator.skins.ActionDropDownListSkin;
   import anifire.util.UtilDict;
   import flash.events.Event;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.collections.ArrayCollection;
   import mx.collections.ICollectionView;
   import mx.collections.IViewCursor;
   import mx.collections.Sort;
   import mx.collections.SortField;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import spark.components.DropDownList;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.events.IndexChangeEvent;
   import spark.layouts.VerticalLayout;
   
   use namespace mx_internal;
   
   public class CharPreviewOption extends Group implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _CharPreviewOption_Label1:Label;
      
      public var _CharPreviewOption_Label2:Label;
      
      private var _1033188906acitonList:DropDownList;
      
      private var _223341834facialList:DropDownList;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function CharPreviewOption()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._CharPreviewOption_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_creator_components_CharPreviewOptionWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return CharPreviewOption[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._CharPreviewOption_HGroup1_c()];
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         CharPreviewOption._watcherSetupUtil = param1;
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
      
      private function creationcomplete(param1:Event) : void
      {
      }
      
      public function init(param1:CcCharacter, param2:CcTheme) : void
      {
         var _loc11_:CcAction = null;
         var _loc12_:String = null;
         var _loc13_:CcFacial = null;
         var _loc3_:Number = param1.bodyShape.getActionNum();
         var _loc4_:ArrayCollection = new ArrayCollection();
         _loc4_.disableAutoUpdate();
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            _loc11_ = param1.bodyShape.getActionByIndex(_loc5_);
            if(_loc11_.requireComponents.length <= 0 || this.checkIfRequiredComponentExist(param1,_loc11_.requireComponents))
            {
               if(_loc11_.enable)
               {
                  _loc12_ = _loc11_.name;
                  if(_loc11_.group)
                  {
                     _loc12_ = _loc11_.group;
                  }
                  else if(_loc11_.category)
                  {
                     _loc12_ = _loc11_.category + " - " + _loc12_;
                  }
                  _loc4_.addItem({
                     "label":UtilDict.toDisplay("store",_loc12_),
                     "data":_loc11_.id
                  });
               }
            }
            _loc5_++;
         }
         var _loc6_:Number = param2.getFacialNum();
         var _loc7_:ArrayCollection = new ArrayCollection();
         _loc7_.disableAutoUpdate();
         var _loc8_:int = 0;
         while(_loc8_ < _loc6_)
         {
            _loc13_ = param2.getFacialByIndex(_loc8_);
            if(_loc13_.requireComponents.length <= 0 || this.checkIfRequiredComponentExist(param1,_loc13_.requireComponents))
            {
               _loc7_.addItem({
                  "label":UtilDict.toDisplay("store",_loc13_.name),
                  "data":_loc13_.facialId
               });
            }
            _loc8_++;
         }
         var _loc9_:SortField = new SortField();
         _loc9_.name = "label";
         _loc9_.caseInsensitive = true;
         var _loc10_:Sort = new Sort();
         _loc10_.fields = [_loc9_];
         _loc4_.sort = _loc10_;
         _loc4_.refresh();
         _loc7_.sort = _loc10_;
         _loc7_.refresh();
         _loc4_.enableAutoUpdate();
         _loc7_.enableAutoUpdate();
         this.acitonList.dataProvider = _loc4_;
         this.facialList.dataProvider = _loc7_;
         this.acitonList.validateNow();
         this.facialList.validateNow();
      }
      
      private function checkIfRequiredComponentExist(param1:CcCharacter, param2:Array) : Boolean
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Boolean = false;
         var _loc6_:CcRequireComponent = null;
         var _loc7_:Array = null;
         var _loc8_:CcComponent = null;
         var _loc9_:Boolean = false;
         _loc3_ = 0;
         while(true)
         {
            if(_loc3_ >= param2.length)
            {
               return true;
            }
            _loc6_ = param2[_loc3_] as CcRequireComponent;
            _loc7_ = param1.getUserChosenComponentByComponentType(_loc6_.componentType);
            if(_loc7_ == null || _loc7_.length <= 0)
            {
               return false;
            }
            _loc9_ = false;
            _loc4_ = 0;
            while(_loc4_ < _loc7_.length)
            {
               _loc8_ = _loc7_[_loc4_] as CcComponent;
               if(_loc6_.componentIds.indexOf(_loc8_.componentThumb.componentId) >= 0)
               {
                  _loc9_ = true;
                  break;
               }
               _loc4_++;
            }
            if(!_loc9_)
            {
               break;
            }
            _loc3_++;
         }
         return false;
      }
      
      public function set action(param1:String) : void
      {
         var _loc2_:ICollectionView = this.acitonList.dataProvider as ICollectionView;
         var _loc3_:IViewCursor = _loc2_.createCursor();
         while(!_loc3_.afterLast)
         {
            if(_loc3_.current.data == param1)
            {
               this.acitonList.selectedItem = _loc3_.current;
               return;
            }
            _loc3_.moveNext();
         }
      }
      
      public function set facial(param1:String) : void
      {
         var _loc2_:ICollectionView = this.facialList.dataProvider as ICollectionView;
         var _loc3_:IViewCursor = _loc2_.createCursor();
         while(!_loc3_.afterLast)
         {
            if(_loc3_.current.data == param1)
            {
               this.facialList.selectedItem = _loc3_.current;
               return;
            }
            _loc3_.moveNext();
         }
      }
      
      public function set saveEnabled(param1:Boolean) : void
      {
      }
      
      private function actionSelected(param1:Event) : void
      {
         var _loc2_:CcActionChosenEvent = new CcActionChosenEvent(CcActionChosenEvent.ACTION_CHOSEN,this);
         if(this.acitonList.selectedItem && this.facialList.selectedItem)
         {
            _loc2_.action_id = this.acitonList.selectedItem.data;
            _loc2_.facial_id = this.facialList.selectedItem.data;
            this.dispatchEvent(_loc2_);
         }
      }
      
      private function facialSelected(param1:Event) : void
      {
         var _loc2_:CcActionChosenEvent = new CcActionChosenEvent(CcActionChosenEvent.FACIAL_CHOSEN,this);
         if(this.acitonList.selectedItem && this.facialList.selectedItem)
         {
            _loc2_.action_id = this.acitonList.selectedItem.data;
            _loc2_.facial_id = this.facialList.selectedItem.data;
            this.dispatchEvent(_loc2_);
         }
      }
      
      private function onSaveButtonClick() : void
      {
         var _loc1_:CcCoreEvent = new CcCoreEvent(CcCoreEvent.USER_WANT_TO_SAVE,this);
         this.dispatchEvent(_loc1_);
      }
      
      private function onModifyButtonClick(param1:Event = null) : void
      {
         var _loc2_:CcCoreEvent = new CcCoreEvent(CcCoreEvent.USER_WANT_TO_CANCEL,this);
         this.dispatchEvent(_loc2_);
      }
      
      private function _CharPreviewOption_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._CharPreviewOption_Label1_i(),this._CharPreviewOption_DropDownList1_i(),this._CharPreviewOption_Label2_i(),this._CharPreviewOption_DropDownList2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _CharPreviewOption_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.maxDisplayedLines = 1;
         _loc1_.right = 0;
         _loc1_.top = 2;
         _loc1_.bottom = 4;
         _loc1_.width = 130;
         _loc1_.setStyle("verticalAlign","middle");
         _loc1_.setStyle("paddingTop",6);
         _loc1_.setStyle("color",5331305);
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.setStyle("fontSize",14);
         _loc1_.setStyle("textAlign","right");
         _loc1_.id = "_CharPreviewOption_Label1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CharPreviewOption_Label1 = _loc1_;
         BindingManager.executeBindings(this,"_CharPreviewOption_Label1",this._CharPreviewOption_Label1);
         return _loc1_;
      }
      
      private function _CharPreviewOption_DropDownList1_i() : DropDownList
      {
         var _loc1_:DropDownList = new DropDownList();
         _loc1_.buttonMode = true;
         _loc1_.top = 10;
         _loc1_.bottom = 5;
         _loc1_.width = 300;
         _loc1_.layout = this._CharPreviewOption_VerticalLayout1_c();
         _loc1_.setStyle("skinClass",ActionDropDownListSkin);
         _loc1_.addEventListener("change",this.__acitonList_change);
         _loc1_.id = "acitonList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.acitonList = _loc1_;
         BindingManager.executeBindings(this,"acitonList",this.acitonList);
         return _loc1_;
      }
      
      private function _CharPreviewOption_VerticalLayout1_c() : VerticalLayout
      {
         var _loc1_:VerticalLayout = new VerticalLayout();
         _loc1_.requestedMaxRowCount = -1;
         _loc1_.horizontalAlign = "contentJustify";
         _loc1_.gap = 0;
         return _loc1_;
      }
      
      public function __acitonList_change(param1:IndexChangeEvent) : void
      {
         this.actionSelected(param1);
      }
      
      private function _CharPreviewOption_Label2_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.maxDisplayedLines = 1;
         _loc1_.right = 0;
         _loc1_.top = 2;
         _loc1_.bottom = 4;
         _loc1_.width = 130;
         _loc1_.setStyle("verticalAlign","middle");
         _loc1_.setStyle("paddingTop",6);
         _loc1_.setStyle("color",5331305);
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.setStyle("fontSize",14);
         _loc1_.setStyle("textAlign","right");
         _loc1_.id = "_CharPreviewOption_Label2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CharPreviewOption_Label2 = _loc1_;
         BindingManager.executeBindings(this,"_CharPreviewOption_Label2",this._CharPreviewOption_Label2);
         return _loc1_;
      }
      
      private function _CharPreviewOption_DropDownList2_i() : DropDownList
      {
         var _loc1_:DropDownList = new DropDownList();
         _loc1_.buttonMode = true;
         _loc1_.top = 10;
         _loc1_.bottom = 5;
         _loc1_.width = 200;
         _loc1_.layout = this._CharPreviewOption_VerticalLayout2_c();
         _loc1_.setStyle("skinClass",ActionDropDownListSkin);
         _loc1_.addEventListener("change",this.__facialList_change);
         _loc1_.id = "facialList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.facialList = _loc1_;
         BindingManager.executeBindings(this,"facialList",this.facialList);
         return _loc1_;
      }
      
      private function _CharPreviewOption_VerticalLayout2_c() : VerticalLayout
      {
         var _loc1_:VerticalLayout = new VerticalLayout();
         _loc1_.requestedMaxRowCount = -1;
         _loc1_.horizontalAlign = "contentJustify";
         _loc1_.gap = 0;
         return _loc1_;
      }
      
      public function __facialList_change(param1:IndexChangeEvent) : void
      {
         this.facialSelected(param1);
      }
      
      private function _CharPreviewOption_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("cc","Action:");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_CharPreviewOption_Label1.text");
         result[1] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("cc","Facial expression:");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_CharPreviewOption_Label2.text");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get acitonList() : DropDownList
      {
         return this._1033188906acitonList;
      }
      
      public function set acitonList(param1:DropDownList) : void
      {
         var _loc2_:Object = this._1033188906acitonList;
         if(_loc2_ !== param1)
         {
            this._1033188906acitonList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"acitonList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get facialList() : DropDownList
      {
         return this._223341834facialList;
      }
      
      public function set facialList(param1:DropDownList) : void
      {
         var _loc2_:Object = this._223341834facialList;
         if(_loc2_ !== param1)
         {
            this._223341834facialList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"facialList",_loc2_,param1));
            }
         }
      }
   }
}
