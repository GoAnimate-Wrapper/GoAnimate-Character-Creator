package anifire.creator.components
{
	import anifire.component.ColorInputPanel;
	import anifire.creator.events.ColorPickerDropDownListEvent;
	import anifire.creator.skins.ColorPickerDropDownListSkin;
	import anifire.event.ColorPaletteEvent;
	import mx.events.FlexEvent;
	import spark.components.DropDownList;
	import spark.events.DropDownEvent;

	public class ColorPickerDropDownList extends DropDownList
	{


		[SkinPart(required="false")]
			public var colorInputPanel:ColorInputPanel;

		[SkinPart(required="false")]
			public var colorDisplay:ColorDisplayGroup;

		public function ColorPickerDropDownList()
		{
			super();
			setStyle("skinClass",ColorPickerDropDownListSkin);
		}

		override protected function partAdded(param1:String, param2:Object) : void
		{
			super.partAdded(param1,param2);
			if(param2 == this.colorInputPanel)
			{
				this.colorInputPanel.addEventListener(ColorPaletteEvent.COLOR_PREVIEW,this.colorInputPanel_colorPreviewHandler);
				this.colorInputPanel.addEventListener(ColorPaletteEvent.COLOR_CHANGE,this.colorInputPanel_colorChangeHandler);
				this.colorInputPanel.addEventListener(FlexEvent.CREATION_COMPLETE,this.colorInputPanel_creationCompleteHandler);
			}
		}

		override protected function partRemoved(param1:String, param2:Object) : void
		{
			super.partRemoved(param1,param2);
			if(param2 == this.colorInputPanel)
			{
				this.colorInputPanel.removeEventListener(ColorPaletteEvent.COLOR_PREVIEW,this.colorInputPanel_colorPreviewHandler);
				this.colorInputPanel.removeEventListener(ColorPaletteEvent.COLOR_CHANGE,this.colorInputPanel_colorChangeHandler);
				this.colorInputPanel.removeEventListener(FlexEvent.CREATION_COMPLETE,this.colorInputPanel_creationCompleteHandler);
			}
		}

		private function colorInputPanel_creationCompleteHandler(param1:FlexEvent) : void
		{
			this.colorInputPanel.currentColor = this.colorDisplay.color;
		}

		private function colorInputPanel_colorChangeHandler(param1:ColorPaletteEvent) : void
		{
			this.updateColorFromColorInputPanel();
		}

		private function colorInputPanel_colorPreviewHandler(param1:ColorPaletteEvent) : void
		{
			this.updateColorFromColorInputPanel();
		}

		private function updateColorFromColorInputPanel() : void
		{
			if(this.colorInputPanel)
			{
				if(this.colorDisplay)
				{
					this.colorDisplay.color = this.colorInputPanel.currentColor;
				}
				this.dispatchEvent(new ColorPickerDropDownListEvent(ColorPickerDropDownListEvent.COLOR_CHANGE,this.colorInputPanel.currentColor));
			}
		}

		override protected function dropDownController_closeHandler(param1:DropDownEvent) : void
		{
			if(this.colorInputPanel)
			{
				this.dispatchEvent(new ColorPickerDropDownListEvent(ColorPickerDropDownListEvent.COLOR_COMMIT,this.colorInputPanel.currentColor));
			}
			super.dropDownController_closeHandler(param1);
		}
	}
}
