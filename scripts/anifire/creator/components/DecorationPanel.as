package anifire.creator.components
{
	import anifire.constant.CcLibConstant;
	import anifire.creator.events.CcSelectedDecorationEvent;
	import anifire.creator.models.CcCharacter;
	import anifire.creator.models.CcComponent;
	import flash.events.Event;
	import flash.utils.getDefinitionByName;
	import mx.binding.Binding;
	import mx.binding.BindingManager;
	import mx.binding.IBindingClient;
	import mx.binding.IWatcherSetupUtil2;
	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	import mx.core.ClassFactory;
	import mx.core.IFlexModuleFactory;
	import mx.core.mx_internal;
	import mx.events.FlexEvent;
	import mx.events.PropertyChangeEvent;
	import spark.components.Group;
	import spark.components.List;
	import spark.events.IndexChangeEvent;
	import spark.events.ListEvent;
	import spark.layouts.HorizontalLayout;

	use namespace mx_internal;

	public class DecorationPanel extends Group implements IBindingClient
	{

		public static const THUMB_INIT:String = "Init";

		public static const THUMB_OVER:String = "Over";

		private static var _watcherSetupUtil:IWatcherSetupUtil2;


		private var _1754705447selectedList:List;

		private var __moduleFactoryInitialized:Boolean = false;

		private var _selectedThumb:CcComponentThumbThumbnail;

		private var _480745960_thumbnailSource:ArrayCollection;

		private var _1829184970_decoratedList:Array;

		mx_internal var _bindings:Array;

		mx_internal var _watchers:Array;

		mx_internal var _bindingsByDestination:Object;

		mx_internal var _bindingsBeginWithWord:Object;

		public function DecorationPanel()
		{
			var target:Object = null;
			var watcherSetupUtilClass:Object = null;
			this._1829184970_decoratedList = new Array();
			this._bindings = [];
			this._watchers = [];
			this._bindingsByDestination = {};
			this._bindingsBeginWithWord = {};
			super();
			mx_internal::_document = this;
			var bindings:Array = this._DecorationPanel_bindingsSetup();
			var watchers:Array = [];
			target = this;
			if(_watcherSetupUtil == null)
			{
				watcherSetupUtilClass = getDefinitionByName("_anifire_creator_components_DecorationPanelWatcherSetupUtil");
				watcherSetupUtilClass["init"](null);
			}
			_watcherSetupUtil.setup(this,function(param1:String):*
					{
					return target[param1];
					},function(param1:String):*
					{
					return DecorationPanel[param1];
					},bindings,watchers);
			mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
			mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
			this.percentWidth = 100;
			this.height = 80;
			this.mxmlContent = [this._DecorationPanel_List1_i()];
			this.addEventListener("creationComplete",this.___DecorationPanel_Group1_creationComplete);
			var i:uint = 0;
			while(i < bindings.length)
			{
				Binding(bindings[i]).execute();
				i++;
			}
		}

		public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
		{
			DecorationPanel._watcherSetupUtil = param1;
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

		override public function set visible(param1:Boolean) : void
		{
			super.visible = param1;
			var _loc2_:Number = this.selectedList.numChildren;
			if(param1)
			{
				this.selectedList.addEventListener(ListEvent.ITEM_ROLL_OVER,this.onThumbMouseOver);
				this.selectedList.addEventListener(ListEvent.ITEM_ROLL_OUT,this.onThumbMouseOut);
				this.selectedList.addEventListener(IndexChangeEvent.CARET_CHANGE,this.onThumbDown);
				this.selectedList.addEventListener(CcSelectedDecorationEvent.DECORATION_DELETED,this.onThumbDelete);
			}
			else
			{
				this.selectedList.removeEventListener(ListEvent.ITEM_ROLL_OVER,this.onThumbMouseOver);
				this.selectedList.removeEventListener(ListEvent.ITEM_ROLL_OUT,this.onThumbMouseOut);
				this.selectedList.removeEventListener(IndexChangeEvent.CARET_CHANGE,this.onThumbDown);
				this.selectedList.removeEventListener(CcSelectedDecorationEvent.DECORATION_DELETED,this.onThumbDelete);
			}
		}

		public function set selectedThumb(param1:CcComponentThumbThumbnail) : void
		{
			var _loc2_:Number = this.selectedList.numChildren;
			var _loc3_:int = 0;
			while(_loc3_ < _loc2_)
			{
				_loc3_++;
			}
			this._selectedThumb = param1;
		}

		public function init() : void
		{
			this._decoratedList = new Array();
			this._thumbnailSource = new ArrayCollection();
			this._thumbnailSource.source = this._decoratedList;
		}

		public function initByCcChar(param1:CcCharacter) : void
		{
			var _loc3_:CcComponent = null;
			this.init();
			var _loc2_:int = 0;
			while(_loc2_ < param1.getUserChosenComponentSize())
			{
				_loc3_ = param1.getUserChosenComponentByIndex(_loc2_);
				if(CcLibConstant.ALL_MULTIPLE_COMPONENT_TYPES.indexOf(_loc3_.componentThumb.type) > -1)
				{
					this.addComponent(_loc3_);
				}
				_loc2_++;
			}
		}

		public function addComponent(param1:CcComponent) : void
		{
			this.addThumbnail(param1,param1.componentThumb.type);
		}

		private function onThumbDelete(param1:Event) : void
		{
			var _loc2_:CcSelectedDecorationEvent = null;
			_loc2_ = new CcSelectedDecorationEvent(CcSelectedDecorationEvent.DECORATION_DELETED,this);
			_loc2_.ccComponent = this._decoratedList[this.selectedList.selectedIndex];
			this.dispatchEvent(_loc2_);
			this._decoratedList.splice(this.selectedList.selectedIndex,1);
			if(this._decoratedList.length <= 0)
			{
				this._thumbnailSource = null;
			}
			else
			{
				this._thumbnailSource = new ArrayCollection();
				this._thumbnailSource.source = this._decoratedList;
			}
			this.selectedList.validateNow();
		}

		private function addThumbnail(param1:CcComponent, param2:String) : void
		{
			this._decoratedList.push(param1);
			this._thumbnailSource = new ArrayCollection();
			this._thumbnailSource.source = this._decoratedList;
			this.selectedList.validateNow();
			this.selectedList.selectedIndex = this.selectedList.dataProvider.length - 1;
			this.selectedList.ensureIndexIsVisible(this.selectedList.dataProvider.length - 1);
		}

		private function onThumbDown(param1:IndexChangeEvent) : void
		{
			var _loc2_:CcComponent = null;
			var _loc3_:CcSelectedDecorationEvent = null;
			if(param1.newIndex > -1)
			{
				_loc2_ = this._decoratedList[param1.newIndex];
				_loc3_ = new CcSelectedDecorationEvent(CcSelectedDecorationEvent.DECORATION_CHOOSEN,this);
				_loc3_.ccComponent = _loc2_;
				this.dispatchEvent(_loc3_);
			}
		}

		private function onThumbMouseOver(param1:ListEvent) : void
		{
			var _loc2_:CcComponent = null;
			var _loc3_:CcSelectedDecorationEvent = null;
			try
			{
				_loc2_ = this._decoratedList[param1.itemIndex];
				_loc3_ = new CcSelectedDecorationEvent(CcSelectedDecorationEvent.DECORATION_MOUSE_OVER,this);
				_loc3_.ccComponent = _loc2_;
				this.dispatchEvent(_loc3_);
				return;
			}
			catch(e:Error)
			{
				return;
			}
		}

		private function onThumbMouseOut(param1:ListEvent) : void
		{
			var _loc2_:CcComponent = null;
			var _loc3_:CcSelectedDecorationEvent = null;
			try
			{
				_loc2_ = this._decoratedList[param1.itemIndex];
				_loc3_ = new CcSelectedDecorationEvent(CcSelectedDecorationEvent.DECORATION_MOUSE_OUT,this);
				_loc3_.ccComponent = _loc2_;
				this.dispatchEvent(_loc3_);
				return;
			}
			catch(e:Error)
			{
				return;
			}
		}

		private function _DecorationPanel_List1_i() : List
		{
			var _loc1_:List = new List();
			_loc1_.itemRenderer = this._DecorationPanel_ClassFactory1_c();
			_loc1_.percentWidth = 100;
			_loc1_.percentHeight = 100;
			_loc1_.layout = this._DecorationPanel_HorizontalLayout1_c();
			_loc1_.setStyle("borderVisible",false);
			_loc1_.setStyle("contentBackgroundAlpha",0);
			_loc1_.setStyle("verticalScrollPolicy","off");
			_loc1_.id = "selectedList";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.selectedList = _loc1_;
			BindingManager.executeBindings(this,"selectedList",this.selectedList);
			return _loc1_;
		}

		private function _DecorationPanel_ClassFactory1_c() : ClassFactory
		{
			var _loc1_:ClassFactory = new ClassFactory();
			_loc1_.generator = DecorationItemRenderer;
			return _loc1_;
		}

		private function _DecorationPanel_HorizontalLayout1_c() : HorizontalLayout
		{
			var _loc1_:HorizontalLayout = new HorizontalLayout();
			_loc1_.paddingTop = 5;
			_loc1_.paddingBottom = 5;
			_loc1_.paddingLeft = 15;
			_loc1_.paddingRight = 15;
			_loc1_.gap = 10;
			return _loc1_;
		}

		public function ___DecorationPanel_Group1_creationComplete(param1:FlexEvent) : void
		{
			this.init();
		}

		private function _DecorationPanel_bindingsSetup() : Array
		{
			var result:Array = [];
			result[0] = new Binding(this,function():IList
					{
					return _thumbnailSource;
					},null,"selectedList.dataProvider");
			return result;
		}

		[Bindable(event="propertyChange")]
			public function get selectedList() : List
		{
			return this._1754705447selectedList;
		}

		public function set selectedList(param1:List) : void
		{
			var _loc2_:Object = this._1754705447selectedList;
			if(_loc2_ !== param1)
			{
				this._1754705447selectedList = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"selectedList",_loc2_,param1));
				}
			}
		}

		[Bindable(event="propertyChange")]
			private function get _thumbnailSource() : ArrayCollection
		{
			return this._480745960_thumbnailSource;
		}

		private function set _thumbnailSource(param1:ArrayCollection) : void
		{
			var _loc2_:Object = this._480745960_thumbnailSource;
			if(_loc2_ !== param1)
			{
				this._480745960_thumbnailSource = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_thumbnailSource",_loc2_,param1));
				}
			}
		}

		[Bindable(event="propertyChange")]
			private function get _decoratedList() : Array
		{
			return this._1829184970_decoratedList;
		}

		private function set _decoratedList(param1:Array) : void
		{
			var _loc2_:Object = this._1829184970_decoratedList;
			if(_loc2_ !== param1)
			{
				this._1829184970_decoratedList = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_decoratedList",_loc2_,param1));
				}
			}
		}
	}
}
