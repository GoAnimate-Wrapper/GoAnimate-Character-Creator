package anifire.creator.components
{
	import anifire.util.UtilDict;
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.FocusEvent;
	import flash.events.MouseEvent;
	import mx.controls.colorPickerClasses.WebSafePalette;
	import mx.core.FlexVersion;
	import mx.core.IVisualElement;
	import mx.events.FlexEvent;
	import mx.events.PropertyChangeEvent;
	import mx.events.StateChangeEvent;
	import spark.components.ComboBox;
	import spark.components.IItemRenderer;
	import spark.components.Label;
	import spark.components.TextInput;
	import spark.components.supportClasses.ButtonBase;
	import spark.events.DropDownEvent;
	import spark.events.IndexChangeEvent;
	import spark.events.RendererExistenceEvent;

	public class ColorPicker extends ComboBox
	{

		public static const TRANSPARENT_COLOR:uint = uint.MAX_VALUE;


		private var wsp:WebSafePalette;

		[SkinPart(required="false")]
			public var labelDisplay:Label;

		[SkinPart(required="true")]
			public var colorInput:TextInput;

		[SkinPart(required="false")]
			public var transparentColorButton:ButtonBase;

		protected var _previewColor:uint;

		private var _860736679columnCount:int = 20;

		protected var _allowTransparent:Boolean;

		public function ColorPicker()
		{
			super();
			this.wsp = new WebSafePalette();
			dataProvider = this.wsp.getList();
			labelFunction = this.colorDetail;
			labelToItemFunction = this.colorFunction;
			openOnInput = false;
			this.addEventListener(StateChangeEvent.CURRENT_STATE_CHANGE,this.onStateChange);
		}

		[Bindable(event="propertyChange")]
			public function get previewColor() : uint
		{
			return this._previewColor;
		}

		private function set _1388676997previewColor(param1:uint) : void
		{
			this._previewColor = param1;
		}

		[Bindable(event="propertyChange")]
			public function get allowTransparent() : Boolean
		{
			return this._allowTransparent;
		}

		private function set _1521440183allowTransparent(param1:Boolean) : void
		{
			if(this._allowTransparent != param1)
			{
				this._allowTransparent = param1;
				if(this.transparentColorButton)
				{
					this.transparentColorButton.visible = param1;
					this.transparentColorButton.includeInLayout = param1;
				}
			}
		}

		override public function set selectedItem(param1:*) : void
		{
			super.selectedItem = param1;
			this.previewColor = param1;
		}

		protected function colorFunction(param1:String) : *
		{
			return uint(param1);
		}

		public function colorDetail(param1:Object) : String
		{
			var _loc2_:uint = param1 as uint;
			if(_loc2_ == TRANSPARENT_COLOR)
			{
				return UtilDict.toDisplay("go","No Color");
			}
			var _loc3_:String = "00000" + _loc2_.toString(16);
			_loc3_ = _loc3_.substr(_loc3_.length - 6);
			return "#" + _loc3_.toUpperCase();
		}

		protected function onColorInputFocus(param1:FocusEvent) : void
		{
			this.colorInput.selectAll();
		}

		protected function onColorInputChange(param1:Event) : void
		{
			this.previewColor = parseInt(this.colorInput.text,16);
		}

		protected function onColorInputEnter(param1:FlexEvent) : void
		{
			this.selectedItem = this.previewColor;
			closeDropDown(true);
			dispatchEvent(new IndexChangeEvent(IndexChangeEvent.CHANGE));
		}

		protected function onRendererRollOver(param1:MouseEvent) : void
		{
			this.previewColor = (param1.currentTarget as IItemRenderer).data as uint;
			this.colorInput.text = itemToLabel(this.previewColor);
			this.colorInput.selectAll();
		}

		protected function onTransparentColorButtonRollOver(param1:MouseEvent) : void
		{
			this.previewColor = TRANSPARENT_COLOR;
			this.colorInput.text = itemToLabel(this.previewColor);
			this.colorInput.selectAll();
		}

		protected function onTransparentColorButtonClick(param1:MouseEvent) : void
		{
			this.selectTransparentColor();
			closeDropDown(true);
		}

		override public function setFocus() : void
		{
			stage.focus = this;
		}

		override protected function isOurFocus(param1:DisplayObject) : Boolean
		{
			return param1 == this;
		}

		override protected function dropDownController_closeHandler(param1:DropDownEvent) : void
		{
			param1.preventDefault();
			super.dropDownController_closeHandler(param1);
		}

		override protected function partAdded(param1:String, param2:Object) : void
		{
			super.partAdded(param1,param2);
			if(param2 == this.colorInput)
			{
				this.colorInput.maxChars = 6;
				this.colorInput.restrict = "0123456789abcdefABCDEF";
				this.colorInput.text = itemToLabel(this.previewColor);
				this.colorInput.addEventListener(FocusEvent.FOCUS_IN,this.onColorInputFocus);
				this.colorInput.addEventListener(Event.CHANGE,this.onColorInputChange);
				this.colorInput.addEventListener(FlexEvent.ENTER,this.onColorInputEnter);
				this.colorInput.callLater(this.colorInput.setFocus);
			}
			else if(param2 == this.transparentColorButton)
			{
				this.transparentColorButton.addEventListener(MouseEvent.CLICK,this.onTransparentColorButtonClick);
				this.transparentColorButton.addEventListener(MouseEvent.ROLL_OVER,this.onTransparentColorButtonRollOver);
				this.transparentColorButton.visible = this._allowTransparent;
				this.transparentColorButton.includeInLayout = this._allowTransparent;
			}
		}

		override protected function partRemoved(param1:String, param2:Object) : void
		{
			super.partRemoved(param1,param2);
			if(param2 == this.colorInput)
			{
				this.colorInput.removeEventListener(FocusEvent.FOCUS_IN,this.onColorInputFocus);
				this.colorInput.removeEventListener(Event.CHANGE,this.onColorInputChange);
				this.colorInput.removeEventListener(FlexEvent.ENTER,this.onColorInputEnter);
			}
			else if(param2 == this.transparentColorButton)
			{
				this.transparentColorButton.removeEventListener(MouseEvent.CLICK,this.onTransparentColorButtonClick);
				this.transparentColorButton.removeEventListener(MouseEvent.ROLL_OVER,this.onTransparentColorButtonRollOver);
			}
		}

		override protected function dataGroup_rendererAddHandler(param1:RendererExistenceEvent) : void
		{
			super.dataGroup_rendererAddHandler(param1);
			param1.renderer.addEventListener(MouseEvent.ROLL_OVER,this.onRendererRollOver);
		}

		override protected function dataGroup_rendererRemoveHandler(param1:RendererExistenceEvent) : void
		{
			super.dataGroup_rendererRemoveHandler(param1);
			param1.renderer.removeEventListener(MouseEvent.ROLL_OVER,this.onRendererRollOver);
		}

		protected function onStateChange(param1:StateChangeEvent) : void
		{
			if(currentState == "open")
			{
				this.previewColor = selectedItem as uint;
				this.colorInput.callLater(this.colorInput.setFocus);
				this.colorInput.text = itemToLabel(this.previewColor);
			}
		}

		public function restoreDefaultColors() : void
		{
			dataProvider = this.wsp.getList();
			this.columnCount = 20;
		}

		public function selectTransparentColor() : void
		{
			this.selectedItem = TRANSPARENT_COLOR;
			dispatchEvent(new IndexChangeEvent(IndexChangeEvent.CHANGE));
		}

		override public function get baselinePosition() : Number
		{
			if(FlexVersion.compatibilityVersion < FlexVersion.VERSION_4_5)
			{
				return super.baselinePosition;
			}
			var _loc1_:IVisualElement = this.labelDisplay;
			if(_loc1_)
			{
				return _loc1_.baselinePosition + _loc1_.y;
			}
			return super.baselinePosition;
		}

		public function get isTransparent() : Boolean
		{
			return selectedItem == TRANSPARENT_COLOR;
		}

		[Bindable(event="propertyChange")]
			public function get columnCount() : int
		{
			return this._860736679columnCount;
		}

		public function set columnCount(param1:int) : void
		{
			var _loc2_:Object = this._860736679columnCount;
			if(_loc2_ !== param1)
			{
				this._860736679columnCount = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"columnCount",_loc2_,param1));
				}
			}
		}

		public function set previewColor(param1:uint) : void
		{
			var _loc2_:Object = this.previewColor;
			if(_loc2_ !== param1)
			{
				this._1388676997previewColor = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"previewColor",_loc2_,param1));
				}
			}
		}

		public function set allowTransparent(param1:Boolean) : void
		{
			var _loc2_:Object = this.allowTransparent;
			if(_loc2_ !== param1)
			{
				this._1521440183allowTransparent = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"allowTransparent",_loc2_,param1));
				}
			}
		}
	}
}
