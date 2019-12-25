package anifire.creator.models
{
	import anifire.constant.CcLibConstant;
	import anifire.creator.events.CcCoreEvent;
	import anifire.util.UtilHashArray;
	import anifire.util.UtilNetwork;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;

	public class CcTheme extends EventDispatcher
	{


		private var _id:String;

		private var _studioThemeId:String;

		private var _componentThumbs:UtilHashArray;

		private var _componentsByType:UtilHashArray;

		private var _ccColors:UtilHashArray;

		private var _facials:UtilHashArray;

		private var _bodyshapes:UtilHashArray;

		private var _templates:UtilHashArray;

		private var _preMadeChars:Array;

		private var _availableLibrary:Array;

		public function CcTheme(param1:IEventDispatcher = null)
		{
			this._componentThumbs = new UtilHashArray();
			this._componentsByType = new UtilHashArray();
			this._ccColors = new UtilHashArray();
			this._facials = new UtilHashArray();
			this._bodyshapes = new UtilHashArray();
			this._templates = new UtilHashArray();
			this._availableLibrary = new Array();
			super(param1);
		}

		public function get studioThemeId() : String
		{
			return this._studioThemeId;
		}

		public function get preMadeChars() : Array
		{
			return this._preMadeChars;
		}

		public function getLibraryNum() : Number
		{
			return this._availableLibrary.length;
		}

		public function getComponentThumbByInternalId(param1:String) : CcComponentThumb
		{
			return this._componentThumbs.getValueByKey(param1);
		}

		public function getComponentThumbByType(param1:String) : UtilHashArray
		{
			return this._componentsByType.getValueByKey(param1);
		}

		public function getComponentThumbWithinBodyshapeByType(param1:String) : UtilHashArray
		{
			var _loc2_:int = 0;
			var _loc3_:CcBodyShape = null;
			var _loc4_:UtilHashArray = new UtilHashArray();
			_loc2_ = 0;
			while(_loc2_ < this.getBodyShapeNum())
			{
				_loc3_ = this.getBodyShapeByIndex(_loc2_);
				_loc4_.insert(0,_loc3_.getComponentThumbByType(param1));
				_loc2_++;
			}
			return _loc4_;
		}

		public function addComponentThumb(param1:CcComponentThumb) : void
		{
			this._componentThumbs.push(param1.internalId,param1);
			var _loc2_:UtilHashArray = this._componentsByType.getValueByKey(param1.type);
			if(_loc2_ == null)
			{
				_loc2_ = new UtilHashArray();
				this._componentsByType.push(param1.type,_loc2_);
				if(CcLibConstant.ALL_LIBRARY_TYPES.indexOf(param1.type) > -1)
				{
					this._availableLibrary.push(param1.type);
				}
			}
			_loc2_.push(param1.internalId,param1);
		}

		private function addBodyShape(param1:CcBodyShape) : void
		{
			this._bodyshapes.push(param1.id,param1);
		}

		public function getBodyShapeNum() : Number
		{
			return this._bodyshapes.length;
		}

		public function getBodyShapeByIndex(param1:int) : CcBodyShape
		{
			return this._bodyshapes.getValueByIndex(param1) as CcBodyShape;
		}

		public function getBodyShapeByShapeId(param1:String) : CcBodyShape
		{
			return this._bodyshapes.getValueByKey(param1) as CcBodyShape;
		}

		public function getBodyShapeTypes() : Array
		{
			var _loc1_:CcBodyShape = null;
			var _loc2_:UtilHashArray = new UtilHashArray();
			var _loc3_:int = 0;
			while(_loc3_ < this.getBodyShapeNum())
			{
				_loc1_ = this.getBodyShapeByIndex(_loc3_);
				_loc2_.push(_loc1_.bodyType,_loc1_.bodyType);
				_loc3_++;
			}
			return _loc2_.getArray();
		}

		public function getBodyShapesByShapeType(param1:String) : Array
		{
			var _loc3_:CcBodyShape = null;
			var _loc2_:Array = new Array();
			var _loc4_:int = 0;
			while(_loc4_ < this.getBodyShapeNum())
			{
				_loc3_ = this.getBodyShapeByIndex(_loc4_);
				if(_loc3_.bodyType == param1)
				{
					_loc2_.push(_loc3_);
				}
				_loc4_++;
			}
			return _loc2_;
		}

		private function addFacial(param1:CcFacial) : void
		{
			this._facials.push(param1.internalId,param1);
		}

		public function getFacialNum() : Number
		{
			return this._facials.length;
		}

		public function getFacialByIndex(param1:int) : CcFacial
		{
			return this._facials.getValueByIndex(param1) as CcFacial;
		}

		public function getFacialById(param1:String) : CcFacial
		{
			return this._facials.getValueByKey(param1) as CcFacial;
		}

		private function addTemplate(param1:CcTemplate) : void
		{
			this._templates.push(param1.id,param1);
		}

		public function getTemplateById(param1:String) : CcTemplate
		{
			return this._templates.getValueByKey(param1) as CcTemplate;
		}

		public function set id(param1:String) : void
		{
			this._id = param1;
		}

		public function get id() : String
		{
			return this._id;
		}

		private function addColorThumb(param1:CcColorThumb) : void
		{
			this._ccColors.push(param1.internalId,param1);
		}

		public function getColorThumbNum() : int
		{
			return this._ccColors.length;
		}

		public function getColorThumbByIndex(param1:int) : CcColorThumb
		{
			return this._ccColors.getValueByIndex(param1) as CcColorThumb;
		}

		public function getColorThumbByInternalId(param1:String) : CcColorThumb
		{
			return this._ccColors.getValueByKey(param1) as CcColorThumb;
		}

		public function getAvailableComponentTypes() : Array
		{
			var _loc1_:Array = new Array();
			return CcLibConstant.USER_CHOOSE_ABLE_BODY_COMPONENT_TYPES.concat(CcLibConstant.USER_CHOOSE_ABLE_HEAD_COMPONENT_TYPES);
		}

		public function initCcThemeByLoadThemeFile(param1:String) : void
		{
			this.id = param1;
			var _loc2_:URLLoader = new URLLoader();
			_loc2_.dataFormat = URLLoaderDataFormat.TEXT;
			var _loc3_:URLRequest = UtilNetwork.getGetCcThemeRequest(param1);
			_loc2_.addEventListener(Event.COMPLETE,this.onLoadThemeComplete);
			_loc2_.load(_loc3_);
		}

		public function initCcThemePreMadeChar() : void
		{
			var _loc1_:URLLoader = new URLLoader();
			_loc1_.dataFormat = URLLoaderDataFormat.TEXT;
			var _loc2_:URLRequest = UtilNetwork.getGetCcThemePreMadeCharRequest(this.id);
			_loc1_.addEventListener(Event.COMPLETE,this.onLoadCcThemePreMadeCharComplete);
			_loc1_.load(_loc2_);
		}

		private function onLoadCcThemePreMadeCharComplete(param1:Event) : void
		{
			var _loc5_:XML = null;
			var _loc6_:CcCoreEvent = null;
			var _loc7_:CcCharacter = null;
			var _loc8_:UtilHashArray = null;
			(param1.target as IEventDispatcher).removeEventListener(param1.type,this.onLoadCcThemePreMadeCharComplete);
			var _loc2_:URLLoader = param1.target as URLLoader;
			var _loc3_:* = _loc2_.data as String;
			_loc3_ = "<?xml version=\"1.0\"?><chars>" + _loc3_ + "</chars>";
			var _loc4_:XML = new XML(_loc3_);
			this._preMadeChars = new Array();
			for each(_loc5_ in _loc4_.child(CcCharacter.XML_NODE_NAME))
			{
				_loc7_ = new CcCharacter();
				_loc8_ = new UtilHashArray();
				_loc8_.push(this.id,this);
				_loc7_.deserialize(_loc5_,_loc8_);
				this._preMadeChars.push(_loc7_);
			}
			_loc6_ = new CcCoreEvent(CcCoreEvent.LOAD_PRE_MADE_CHARACTER_COMPLETE,this);
			this.dispatchEvent(_loc6_);
		}

		public function initCcThemeByXml(param1:String) : void
		{
			var _loc2_:XML = new XML(param1);
			this.id = _loc2_.@id;
			this.doHandleLoadedThemeXml(_loc2_);
		}

		private function onLoadThemeComplete(param1:Event) : void
		{
			(param1.target as IEventDispatcher).removeEventListener(param1.type,this.onLoadThemeComplete);
			var _loc2_:URLLoader = param1.target as URLLoader;
			var _loc3_:XML = new XML(_loc2_.data as String);
			this.doHandleLoadedThemeXml(_loc3_);
			this.dispatchEvent(new CcCoreEvent(CcCoreEvent.LOAD_THEME_COMPLETE,this));
		}

		private function doHandleLoadedThemeXml(param1:XML) : void
		{
			this.deserialize(param1);
		}

		private function deserialize(param1:XML) : void
		{
			var _loc2_:XML = null;
			var _loc3_:CcColorThumb = null;
			var _loc4_:CcComponentThumb = null;
			var _loc5_:CcFacial = null;
			var _loc6_:CcBodyShape = null;
			var _loc7_:CcTemplate = null;
			var _loc8_:UtilHashArray = null;
			this._studioThemeId = param1.@studio_theme_id;
			for each(_loc2_ in param1.child(CcColorThumb.XML_NODE_NAME))
			{
				_loc3_ = new CcColorThumb();
				_loc3_.deSerialize(_loc2_);
				this.addColorThumb(_loc3_);
			}
			for each(_loc2_ in param1.child(CcComponentThumb.XML_NODE_NAME))
			{
				_loc4_ = new CcComponentThumb();
				_loc4_.deSerialize(_loc2_,this.id,CcComponentThumb.PARENT_TYPE_THEME,this.id);
				this.addComponentThumb(_loc4_);
			}
			for each(_loc2_ in param1.child(CcFacial.XML_NODE_NAME))
			{
				_loc5_ = new CcFacial();
				_loc5_.deserialize(_loc2_);
				this.addFacial(_loc5_);
			}
			for each(_loc2_ in param1.child(CcBodyShape.XML_NODE_NAME))
			{
				_loc6_ = new CcBodyShape();
				_loc6_.deserialize(_loc2_,this.id,this);
				this.addBodyShape(_loc6_);
			}
			for each(_loc2_ in param1.child(CcTemplate.XML_NODE_NAME))
			{
				_loc7_ = new CcTemplate();
				_loc8_ = new UtilHashArray();
				_loc8_.push(this.id,this);
				_loc7_.deserialize(_loc2_,_loc8_);
				this.addTemplate(_loc7_);
			}
		}
	}
}
