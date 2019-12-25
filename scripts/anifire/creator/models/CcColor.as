package anifire.creator.models
{
	import anifire.constant.CcLibConstant;
	import anifire.util.UtilUnitConvert;
	import anifire.util.UtilXmlInfo;

	public class CcColor
	{

		public static const XML_NODE_NAME:String = "color";


		public var ccColorThumb:CcColorThumb;

		public var colorValue:uint;

		public var ccComponent:CcComponent;

		public function CcColor()
		{
			super();
		}

		public function clone() : CcColor
		{
			var _loc1_:CcColor = new CcColor();
			_loc1_.ccColorThumb = this.ccColorThumb;
			_loc1_.colorValue = this.colorValue;
			_loc1_.ccComponent = this.ccComponent;
			return _loc1_;
		}

		public function serialize() : String
		{
			var _loc1_:* = "";
			if(!(CcLibConstant.ALL_MULTIPLE_COMPONENT_TYPES.indexOf(this.ccColorThumb.componentType) > -1 && this.ccComponent == null))
			{
				_loc1_ = "<color" + " r=\"" + UtilXmlInfo.xmlEscape(this.ccColorThumb.colorReference) + "\"" + (!!this.ccColorThumb.isOriginalColorExist?" oc=\"" + UtilUnitConvert.uintToColorHexString(this.ccColorThumb.originalColor) + "\"":"") + (this.ccComponent != null?" targetComponent=\"" + this.ccComponent.id + "\"":"") + ">" + UtilUnitConvert.uintToColorHexString(this.colorValue) + "</color>";
			}
			return _loc1_;
		}

		public function deserialize(param1:XML, param2:CcTheme, param3:CcCharacter) : Boolean
		{
			this.colorValue = uint(Number(param1.toString()));
			this.ccColorThumb = param2.getColorThumbByInternalId(CcColorThumb.generateInternalId(param1.@r));
			var _loc4_:Number = param3.getUserChosenComponentSize();
			var _loc5_:int = 0;
			while(_loc5_ < _loc4_)
			{
				if(param3.getUserChosenComponentByIndex(_loc5_).id == param1.@targetComponent)
				{
					this.ccComponent = param3.getUserChosenComponentByIndex(_loc5_);
					break;
				}
				_loc5_++;
			}
			if(!this.ccColorThumb)
			{
				return false;
			}
			return true;
		}
	}
}
