package anifire.creator.skins
{
	import mx.binding.BindingManager;
	import mx.core.ClassFactory;
	import mx.core.IFlexModuleFactory;
	import mx.core.IStateClient2;
	import mx.events.PropertyChangeEvent;
	import mx.states.SetProperty;
	import mx.states.State;
	import spark.components.ButtonBar;
	import spark.components.DataGroup;
	import spark.components.supportClasses.Skin;
	import spark.layouts.HorizontalLayout;

	public class HButtonBarSkin extends Skin implements IStateClient2
	{


		private var _385593099dataGroup:DataGroup;

		private var _1518788094firstButton:ClassFactory;

		private var _1454038376lastButton:ClassFactory;

		private var _654857945middleButton:ClassFactory;

		private var __moduleFactoryInitialized:Boolean = false;

		private var _213507019hostComponent:ButtonBar;

		public function HButtonBarSkin()
		{
			super();
			mx_internal::_document = this;
			this.mxmlContent = [this._HButtonBarSkin_DataGroup1_i()];
			this.currentState = "normal";
			this._HButtonBarSkin_ClassFactory1_i();
			this._HButtonBarSkin_ClassFactory2_i();
			this._HButtonBarSkin_ClassFactory3_i();
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

		private function _HButtonBarSkin_ClassFactory1_i() : ClassFactory
		{
			var _loc1_:ClassFactory = new ClassFactory();
			_loc1_.generator = HButtonBarSkinInnerClass0;
			_loc1_.properties = {"outerDocument":this};
			this.firstButton = _loc1_;
			BindingManager.executeBindings(this,"firstButton",this.firstButton);
			return _loc1_;
		}

		private function _HButtonBarSkin_ClassFactory2_i() : ClassFactory
		{
			var _loc1_:ClassFactory = new ClassFactory();
			_loc1_.generator = HButtonBarSkinInnerClass1;
			_loc1_.properties = {"outerDocument":this};
			this.lastButton = _loc1_;
			BindingManager.executeBindings(this,"lastButton",this.lastButton);
			return _loc1_;
		}

		private function _HButtonBarSkin_ClassFactory3_i() : ClassFactory
		{
			var _loc1_:ClassFactory = new ClassFactory();
			_loc1_.generator = HButtonBarSkinInnerClass2;
			_loc1_.properties = {"outerDocument":this};
			this.middleButton = _loc1_;
			BindingManager.executeBindings(this,"middleButton",this.middleButton);
			return _loc1_;
		}

		private function _HButtonBarSkin_DataGroup1_i() : DataGroup
		{
			var _loc1_:DataGroup = new DataGroup();
			_loc1_.percentWidth = 100;
			_loc1_.percentHeight = 100;
			_loc1_.layout = this._HButtonBarSkin_HorizontalLayout1_c();
			_loc1_.id = "dataGroup";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.dataGroup = _loc1_;
			BindingManager.executeBindings(this,"dataGroup",this.dataGroup);
			return _loc1_;
		}

		private function _HButtonBarSkin_HorizontalLayout1_c() : HorizontalLayout
		{
			var _loc1_:HorizontalLayout = new HorizontalLayout();
			_loc1_.gap = -4;
			_loc1_.columnWidth = 45;
			_loc1_.variableColumnWidth = false;
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
			public function get firstButton() : ClassFactory
		{
			return this._1518788094firstButton;
		}

		public function set firstButton(param1:ClassFactory) : void
		{
			var _loc2_:Object = this._1518788094firstButton;
			if(_loc2_ !== param1)
			{
				this._1518788094firstButton = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"firstButton",_loc2_,param1));
				}
			}
		}

		[Bindable(event="propertyChange")]
			public function get lastButton() : ClassFactory
		{
			return this._1454038376lastButton;
		}

		public function set lastButton(param1:ClassFactory) : void
		{
			var _loc2_:Object = this._1454038376lastButton;
			if(_loc2_ !== param1)
			{
				this._1454038376lastButton = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lastButton",_loc2_,param1));
				}
			}
		}

		[Bindable(event="propertyChange")]
			public function get middleButton() : ClassFactory
		{
			return this._654857945middleButton;
		}

		public function set middleButton(param1:ClassFactory) : void
		{
			var _loc2_:Object = this._654857945middleButton;
			if(_loc2_ !== param1)
			{
				this._654857945middleButton = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"middleButton",_loc2_,param1));
				}
			}
		}

		[Bindable(event="propertyChange")]
			public function get hostComponent() : ButtonBar
		{
			return this._213507019hostComponent;
		}

		public function set hostComponent(param1:ButtonBar) : void
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
