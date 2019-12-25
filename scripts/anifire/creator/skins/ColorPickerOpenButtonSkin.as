package anifire.creator.skins
{
	import mx.binding.BindingManager;
	import mx.core.IFlexModuleFactory;
	import mx.core.IStateClient2;
	import mx.events.PropertyChangeEvent;
	import mx.graphics.SolidColor;
	import mx.graphics.SolidColorStroke;
	import mx.states.SetProperty;
	import mx.states.State;
	import spark.primitives.Ellipse;
	import spark.primitives.Rect;
	import spark.skins.SparkButtonSkin;

	public class ColorPickerOpenButtonSkin extends SparkButtonSkin implements IStateClient2
	{


		private var _766836075frameDisplay:Rect;

		private var _903579360shadow:Rect;

		private var __moduleFactoryInitialized:Boolean = false;

		public function ColorPickerOpenButtonSkin()
		{
			super();
			mx_internal::_document = this;
			this.minWidth = 20;
			this.minHeight = 20;
			this.mxmlContent = [this._ColorPickerOpenButtonSkin_Ellipse1_c(),this._ColorPickerOpenButtonSkin_Rect1_c(),this._ColorPickerOpenButtonSkin_Rect2_i(),this._ColorPickerOpenButtonSkin_Rect3_i()];
			this.currentState = "up";
			states = [new State({
					"name":"up",
					"overrides":[]
					}),new State({
						"name":"over",
						"stateGroups":["overAndDownStates"],
						"overrides":[]
						}),new State({
							"name":"down",
							"stateGroups":["overAndDownStates"],
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

		private function _ColorPickerOpenButtonSkin_Ellipse1_c() : Ellipse
		{
			var _loc1_:Ellipse = new Ellipse();
			_loc1_.height = 25;
			_loc1_.width = 25;
			_loc1_.stroke = this._ColorPickerOpenButtonSkin_SolidColorStroke1_c();
			_loc1_.fill = this._ColorPickerOpenButtonSkin_SolidColor1_c();
			_loc1_.initialized(this,null);
			return _loc1_;
		}

		private function _ColorPickerOpenButtonSkin_SolidColorStroke1_c() : SolidColorStroke
		{
			var _loc1_:SolidColorStroke = new SolidColorStroke();
			_loc1_.color = 12303291;
			return _loc1_;
		}

		private function _ColorPickerOpenButtonSkin_SolidColor1_c() : SolidColor
		{
			var _loc1_:SolidColor = new SolidColor();
			_loc1_.color = 12303291;
			return _loc1_;
		}

		private function _ColorPickerOpenButtonSkin_Rect1_c() : Rect
		{
			var _loc1_:Rect = new Rect();
			_loc1_.height = 25;
			_loc1_.width = 22;
			_loc1_.x = 13;
			_loc1_.radiusX = 4;
			_loc1_.radiusY = 4;
			_loc1_.fill = this._ColorPickerOpenButtonSkin_SolidColor2_c();
			_loc1_.initialized(this,null);
			return _loc1_;
		}

		private function _ColorPickerOpenButtonSkin_SolidColor2_c() : SolidColor
		{
			var _loc1_:SolidColor = new SolidColor();
			_loc1_.color = 12303291;
			return _loc1_;
		}

		private function _ColorPickerOpenButtonSkin_Rect2_i() : Rect
		{
			var _loc1_:Rect = new Rect();
			_loc1_.left = 0;
			_loc1_.right = 0;
			_loc1_.top = 0;
			_loc1_.bottom = 0;
			_loc1_.radiusX = 4;
			_loc1_.radiusY = 4;
			_loc1_.initialized(this,"frameDisplay");
			this.frameDisplay = _loc1_;
			BindingManager.executeBindings(this,"frameDisplay",this.frameDisplay);
			return _loc1_;
		}

		private function _ColorPickerOpenButtonSkin_Rect3_i() : Rect
		{
			var _loc1_:Rect = new Rect();
			_loc1_.left = 1;
			_loc1_.top = 1;
			_loc1_.right = 1;
			_loc1_.height = 1;
			_loc1_.radiusX = 3;
			_loc1_.initialized(this,"shadow");
			this.shadow = _loc1_;
			BindingManager.executeBindings(this,"shadow",this.shadow);
			return _loc1_;
		}

		[Bindable(event="propertyChange")]
			public function get frameDisplay() : Rect
		{
			return this._766836075frameDisplay;
		}

		public function set frameDisplay(param1:Rect) : void
		{
			var _loc2_:Object = this._766836075frameDisplay;
			if(_loc2_ !== param1)
			{
				this._766836075frameDisplay = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"frameDisplay",_loc2_,param1));
				}
			}
		}

		[Bindable(event="propertyChange")]
			public function get shadow() : Rect
		{
			return this._903579360shadow;
		}

		public function set shadow(param1:Rect) : void
		{
			var _loc2_:Object = this._903579360shadow;
			if(_loc2_ !== param1)
			{
				this._903579360shadow = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"shadow",_loc2_,param1));
				}
			}
		}
	}
}
