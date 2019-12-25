package anifire.creator.models
{
	import anifire.util.UtilHashArray;

	public class CcFacial
	{

		public static const XML_NODE_NAME:String = "facial";


		private var _facialId:String;

		private var _name:String;

		private var _enable:Boolean;

		private var _selections:UtilHashArray;

		private var _require_components:Array;

		public function CcFacial()
		{
			this._selections = new UtilHashArray();
			this._require_components = new Array();
			super();
		}

		public function get facialId() : String
		{
			return this._facialId;
		}

		public function get name() : String
		{
			return this._name;
		}

		public function get enable() : Boolean
		{
			return this._enable;
		}

		public function get internalId() : String
		{
			return this._facialId;
		}

		public function get selections() : UtilHashArray
		{
			return this._selections;
		}

		public function get requireComponents() : Array
		{
			return this._require_components;
		}

		public function deserialize(param1:XML) : void
		{
			var _loc2_:XML = null;
			var _loc3_:XML = null;
			var _loc4_:CcRequireComponent = null;
			var _loc5_:CcSelection = null;
			this._facialId = param1.@id;
			this._name = param1.@name;
			this._enable = param1.@enable == "N"?false:true;
			for each(_loc2_ in param1.child(CcSelection.XML_NODE_NAME))
			{
				_loc5_ = new CcSelection();
				_loc5_.deserialize(_loc2_);
				this._selections.push(_loc5_.type,_loc5_);
			}
			for each(_loc3_ in param1.child("require_component"))
			{
				_loc4_ = new CcRequireComponent();
				_loc4_.deserialize(_loc3_);
				this._require_components.push(_loc4_);
			}
		}
	}
}
