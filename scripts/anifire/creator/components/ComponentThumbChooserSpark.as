package anifire.creator.components
{
	import anifire.constant.CcLibConstant;
	import anifire.creator.events.CcComponentThumbChooserEvent;
	import anifire.creator.models.CcCharacter;
	import anifire.creator.models.CcComponent;
	import anifire.creator.models.CcComponentThumb;
	import anifire.creator.models.CcLibrary;
	import anifire.creator.models.CcTheme;
	import anifire.creator.utils.ComponentThumbFilter;
	import anifire.util.UtilHashArray;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import flash.utils.clearTimeout;
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
	import mx.graphics.SolidColor;
	import spark.components.Group;
	import spark.events.IndexChangeEvent;
	import spark.layouts.TileLayout;
	import spark.primitives.Rect;

	use namespace mx_internal;

	public class ComponentThumbChooserSpark extends Group implements IBindingClient
	{

		private static const EVENT_TAG_FILTER_CHANGED:String = "evt_tag_changed";

		private static var _watcherSetupUtil:IWatcherSetupUtil2;


		private var _1426573781downButt:IconButton;

		private var _1282758095downLayer:Group;

		private var _1938834755thumbnailTileSpark:ThumbList;

		private var _839839922upButt:IconButton;

		private var _256589962upLayer:Group;

		private var __moduleFactoryInitialized:Boolean = false;

		private var componentThumbs:UtilHashArray;

		private var componentType:String;

		private var currentPageNum:int = 0;

		private var moneyMode:int;

		private var timeoutId:int = -1;

		private var _biggerHeight:Number;

		private var _smallerHeight:Number;

		private var _filter:ComponentThumbFilter = null;

		private var _filteredThumbs:UtilHashArray;

		private var _480745960_thumbnailSource:ArrayCollection;

		private const DELAY_BETWEEN_LOADING_EACH_THUMB:Number = 200;

		private var scrollTimer:Timer;

		private var scrollDy:Number = 0;

		private var _embed_mxml__styles_images_thumbBox_scrollup_init_png_878607239:Class;

		private var _embed_mxml__styles_images_thumbBox_scrolldown_init_png_1145426563:Class;

		private var _embed_mxml__styles_images_thumbBox_scrollup_disabled_png_1375363271:Class;

		private var _embed_mxml__styles_images_thumbBox_scrollup_over_png_843131911:Class;

		private var _embed_mxml__styles_images_thumbBox_scrolldown_disabled_png_1737469557:Class;

		private var _embed_mxml__styles_images_thumbBox_scrolldown_over_png_1537650053:Class;

		mx_internal var _bindings:Array;

		mx_internal var _watchers:Array;

		mx_internal var _bindingsByDestination:Object;

		mx_internal var _bindingsBeginWithWord:Object;

		public function ComponentThumbChooserSpark()
		{
			var target:Object = null;
			var watcherSetupUtilClass:Object = null;
			this._embed_mxml__styles_images_thumbBox_scrollup_init_png_878607239 = ComponentThumbChooserSpark__embed_mxml__styles_images_thumbBox_scrollup_init_png_878607239;
			this._embed_mxml__styles_images_thumbBox_scrolldown_init_png_1145426563 = ComponentThumbChooserSpark__embed_mxml__styles_images_thumbBox_scrolldown_init_png_1145426563;
			this._embed_mxml__styles_images_thumbBox_scrollup_disabled_png_1375363271 = ComponentThumbChooserSpark__embed_mxml__styles_images_thumbBox_scrollup_disabled_png_1375363271;
			this._embed_mxml__styles_images_thumbBox_scrollup_over_png_843131911 = ComponentThumbChooserSpark__embed_mxml__styles_images_thumbBox_scrollup_over_png_843131911;
			this._embed_mxml__styles_images_thumbBox_scrolldown_disabled_png_1737469557 = ComponentThumbChooserSpark__embed_mxml__styles_images_thumbBox_scrolldown_disabled_png_1737469557;
			this._embed_mxml__styles_images_thumbBox_scrolldown_over_png_1537650053 = ComponentThumbChooserSpark__embed_mxml__styles_images_thumbBox_scrolldown_over_png_1537650053;
			this._bindings = [];
			this._watchers = [];
			this._bindingsByDestination = {};
			this._bindingsBeginWithWord = {};
			super();
			mx_internal::_document = this;
			var bindings:Array = this._ComponentThumbChooserSpark_bindingsSetup();
			var watchers:Array = [];
			target = this;
			if(_watcherSetupUtil == null)
			{
				watcherSetupUtilClass = getDefinitionByName("_anifire_creator_components_ComponentThumbChooserSparkWatcherSetupUtil");
				watcherSetupUtilClass["init"](null);
			}
			_watcherSetupUtil.setup(this,function(param1:String):*
					{
					return target[param1];
					},function(param1:String):*
					{
					return ComponentThumbChooserSpark[param1];
					},bindings,watchers);
			mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
			mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
			this.mxmlContent = [this._ComponentThumbChooserSpark_Rect1_c(),this._ComponentThumbChooserSpark_ThumbList1_i(),this._ComponentThumbChooserSpark_Group2_i(),this._ComponentThumbChooserSpark_Group3_i()];
			var i:uint = 0;
			while(i < bindings.length)
			{
				Binding(bindings[i]).execute();
				i++;
			}
		}

		public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
		{
			ComponentThumbChooserSpark._watcherSetupUtil = param1;
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

		private function initTagFilter() : void
		{
			this.addEventListener(EVENT_TAG_FILTER_CHANGED,function(param1:Event):void
					{
					var _loc2_:UtilHashArray = new UtilHashArray();
					var _loc3_:int = 0;
					while(_loc3_ < componentThumbs.length)
					{
					if(!_filter || _filter.filter(componentThumbs.getValueByIndex(_loc3_) as CcComponentThumb))
					{
					_loc2_.push(componentThumbs.getKey(_loc3_),componentThumbs.getValueByIndex(_loc3_));
					}
					_loc3_++;
					}
					_filteredThumbs = _loc2_;
					initPage();
					});
		}

		public function set thumbFilter(param1:ComponentThumbFilter) : void
		{
			var _loc2_:* = this._filter != param1;
			this._filter = param1;
			if(_loc2_)
			{
				this.dispatchEvent(new Event(EVENT_TAG_FILTER_CHANGED));
			}
		}

		public function set biggerHeight(param1:Number) : void
		{
			this._biggerHeight = param1;
		}

		public function set smallerHeight(param1:Number) : void
		{
			this._smallerHeight = param1;
		}

		public function init(param1:CcCharacter, param2:CcTheme, param3:String, param4:int, param5:Boolean) : void
		{
			var i:int = 0;
			var item:Object = null;
			var sLib:CcLibrary = null;
			var sComArray:Array = null;
			var sCom:CcComponent = null;
			var ccChar:CcCharacter = param1;
			var ccTheme:CcTheme = param2;
			var componentType:String = param3;
			var moneyMode:int = param4;
			var shouldUseBiggerHeight:Boolean = param5;
			this.doClearTimeOut();
			if(shouldUseBiggerHeight)
			{
				this.height = this._biggerHeight;
				this.thumbnailTileSpark.height = this._biggerHeight;
			}
			else
			{
				this.height = this._smallerHeight;
				this.thumbnailTileSpark.height = this._smallerHeight;
			}
			this.componentType = componentType;
			this.moneyMode = moneyMode;
			if(CcLibConstant.USER_CHOOSE_ABLE_HEAD_COMPONENT_TYPES.indexOf(componentType) >= 0)
			{
				this.componentThumbs = ccTheme.getComponentThumbByType(componentType);
			}
			else if(CcLibConstant.USER_CHOOSE_ABLE_BODY_COMPONENT_TYPES.indexOf(componentType) >= 0)
			{
				this.componentThumbs = ccChar.bodyShape.getComponentThumbByType(componentType);
			}
			if(this.componentThumbs == null)
			{
				this.componentThumbs = new UtilHashArray();
			}
			this.initTagFilter();
			var _componentThumbs:Array = [];
			var enabledComponentThumbs:UtilHashArray = new UtilHashArray();
			i = 0;
			while(i < this.componentThumbs.length)
			{
				if((this.componentThumbs.getValueByIndex(i) as CcComponentThumb).enable)
				{
					if(!this._filter || this._filter.filter(this.componentThumbs.getValueByIndex(i) as CcComponentThumb))
					{
						_componentThumbs.push({
								"key":this.componentThumbs.getKey(i),
								"data":this.componentThumbs.getValueByIndex(i),
								"order":i
								});
					}
				}
				i++;
			}
			_componentThumbs.sort(function(param1:Object, param2:Object):Number
					{
					var _loc3_:int = (param1.data as CcComponentThumb).displayOrder - (param2.data as CcComponentThumb).displayOrder;
					return _loc3_ == 0?Number(param1.order - param2.order):Number(_loc3_);
					});
			this._thumbnailSource = new ArrayCollection();
			var isNullThumbnailNeeded:Boolean = CcLibConstant.OPTIONAL_COMPONENTS.containsKey(componentType);
			if(isNullThumbnailNeeded)
			{
				this._thumbnailSource.addItem({
						"key":"null",
						"data":null
						});
			}
			for each(item in _componentThumbs)
			{
				this._thumbnailSource.addItem({
						"key":item.key,
						"data":item.data
						});
			}
			_componentThumbs = null;
			this.thumbnailTileSpark.setStyle("backgroundColor",null);
			this.thumbnailTileSpark.setStyle("borderStyle",null);
			this.dispatchEvent(new Event(EVENT_TAG_FILTER_CHANGED));
			this.thumbnailTileSpark.scroller.verticalScrollBar.addEventListener(Event.CHANGE,this.scrollerUpdate);
			this.thumbnailTileSpark.addEventListener(FlexEvent.UPDATE_COMPLETE,this.scrollerUpdate);
			this.scrollerUpdate();
			this.thumbnailTileSpark.scroller.addEventListener(MouseEvent.MOUSE_WHEEL,this.disableScroll,true);
			if(CcLibConstant.ALL_LIBRARY_TYPES.indexOf(this.componentType) > -1)
			{
				sLib = ccChar.getUserChosenLibraryByType(this.componentType);
				if(sLib)
				{
					i = 0;
					while(i < this._thumbnailSource.length)
					{
						if(this._thumbnailSource.getItemAt(i).key == this.componentType + "_" + sLib.component_id)
						{
							this.thumbnailTileSpark.selectedIndex = i;
							break;
						}
						i++;
					}
				}
			}
			else
			{
				sComArray = ccChar.getUserChosenComponentByComponentType(this.componentType);
				if(sComArray.length == 1)
				{
					sCom = sComArray[0] as CcComponent;
					i = 0;
					while(i < this._thumbnailSource.length)
					{
						if(this._thumbnailSource.getItemAt(i).key == sCom.componentThumb.internalId)
						{
							this.thumbnailTileSpark.selectedIndex = i;
							break;
						}
						i++;
					}
				}
			}
			this.thumbnailTileSpark.removeEventListener(MouseEvent.CLICK,this.onDecoClick);
			if(CcLibConstant.ALL_MULTIPLE_COMPONENT_TYPES.indexOf(this.componentType) > -1)
			{
				this.thumbnailTileSpark.addEventListener(MouseEvent.CLICK,this.onDecoClick);
				this.thumbnailTileSpark.itemRenderer = new ClassFactory(DecoThumbRenderer);
			}
			else
			{
				this.thumbnailTileSpark.addEventListener(IndexChangeEvent.CHANGE,this.onThumbSelect);
				this.thumbnailTileSpark.itemRenderer = new ClassFactory(ComponentItemRenderer);
			}
			callLater(this.thumbnailTileSpark.ensureIndexIsVisible,[this.thumbnailTileSpark.selectedIndex + 10 > this.thumbnailTileSpark.dataProvider.length?this.thumbnailTileSpark.selectedIndex:this.thumbnailTileSpark.selectedIndex + 10]);
		}

		private function disableScroll(param1:MouseEvent) : void
		{
			param1.stopPropagation();
		}

		private function initPage() : void
		{
			this.doClearTimeOut();
			this.currentPageNum = 0;
		}

		private function doClearTimeOut() : void
		{
			if(this.timeoutId >= 0)
			{
				clearTimeout(this.timeoutId);
			}
			this.timeoutId = -1;
		}

		private function scrollerUpdate(param1:Event = null) : void
		{
			if(this.thumbnailTileSpark.scroller.verticalScrollBar.value == 0)
			{
				this.upButt.enabled = false;
			}
			else
			{
				this.upButt.enabled = true;
			}
			if(this.thumbnailTileSpark.scroller.verticalScrollBar.value == this.thumbnailTileSpark.scroller.verticalScrollBar.maximum)
			{
				this.downButt.enabled = false;
			}
			else
			{
				this.downButt.enabled = true;
			}
			this.upLayer.visible = this.downLayer.visible = this.thumbnailTileSpark.scroller.verticalScrollBar.includeInLayout;
		}

		private function onDecoClick(param1:MouseEvent) : void
		{
			this.thumbnailTileSpark.selectedItem = null;
		}

		private function onThumbSelect(param1:IndexChangeEvent) : void
		{
			var _loc2_:CcComponentThumbChooserEvent = null;
			_loc2_ = new CcComponentThumbChooserEvent(CcComponentThumbChooserEvent.COMPONENT_THUMB_CHOSEN,this);
			_loc2_.componentThumb = param1.currentTarget.selectedItem.data;
			if(!_loc2_.componentThumb)
			{
				_loc2_ = new CcComponentThumbChooserEvent(CcComponentThumbChooserEvent.NONE_COMPONENT_THUMB_CHOSEN,this);
				_loc2_.noneComponentThumbType = this.componentType;
			}
			this.dispatchEvent(_loc2_);
		}

		private function onThumbDown(param1:Event) : void
		{
			var _loc3_:CcComponentThumbChooserEvent = null;
			var _loc2_:CcComponentThumbDetailThumbnail = param1.currentTarget as CcComponentThumbDetailThumbnail;
			if(!_loc2_.isNullThumbnail)
			{
				_loc3_ = new CcComponentThumbChooserEvent(CcComponentThumbChooserEvent.COMPONENT_THUMB_CHOSEN,this);
				_loc3_.componentThumb = _loc2_.componentThumb;
				this.dispatchEvent(_loc3_);
			}
			else
			{
				_loc3_ = new CcComponentThumbChooserEvent(CcComponentThumbChooserEvent.NONE_COMPONENT_THUMB_CHOSEN,this);
				_loc3_.noneComponentThumbType = _loc2_.componentType;
				this.dispatchEvent(_loc3_);
			}
		}

		private function initTile() : void
		{
			var _loc5_:int = 0;
			var _loc6_:int = 0;
			var _loc1_:Number = CcLibConstant.COMPONENT_THUMB_CHOOSER_TILE_PADDING_SIZE;
			var _loc2_:Number = CcLibConstant.COMPONENT_THUMB_CHOOSER_TILE_PADDING_SIZE;
			var _loc3_:Number = CcLibConstant.COMPONENT_THUMB_CHOOSER_TILE_GAP_SIZE;
			var _loc4_:Number = CcLibConstant.COMPONENT_THUMB_CHOOSER_TILE_GAP_SIZE;
			var _loc7_:Number = this.thumbnailTileSpark.width;
			var _loc8_:Number = this.thumbnailTileSpark.height;
			var _loc9_:Number = CcLibConstant.COMPONENT_THUMB_CHOOSER_THUMBNAIL_HEIGHT;
			var _loc10_:Number = CcLibConstant.COMPONENT_THUMB_CHOOSER_THUMBNAIL_WIDTH;
		}

		private function scrollUpdate(param1:TimerEvent) : void
		{
			this.thumbnailTileSpark.scroller.verticalScrollBar.value = this.thumbnailTileSpark.scroller.verticalScrollBar.value + this.scrollDy;
		}

		private function onMouseUp(param1:Event) : void
		{
			this.scrollDy = 0;
			if(this.scrollTimer)
			{
				this.scrollTimer.stop();
			}
			this.scrollerUpdate();
		}

		private function onMouseDown(param1:Event) : void
		{
			switch(param1.currentTarget)
			{
				case this.upButt:
					this.scrollDy = -10;
					break;
				case this.downButt:
					this.scrollDy = 10;
			}
			this.scrollTimer = new Timer(20);
			this.scrollTimer.addEventListener(TimerEvent.TIMER,this.scrollUpdate);
			this.scrollTimer.start();
		}

		private function _ComponentThumbChooserSpark_Rect1_c() : Rect
		{
			var _loc1_:Rect = new Rect();
			_loc1_.percentWidth = 100;
			_loc1_.percentHeight = 100;
			_loc1_.fill = this._ComponentThumbChooserSpark_SolidColor1_c();
			_loc1_.initialized(this,null);
			return _loc1_;
		}

		private function _ComponentThumbChooserSpark_SolidColor1_c() : SolidColor
		{
			var _loc1_:SolidColor = new SolidColor();
			_loc1_.color = 15658734;
			return _loc1_;
		}

		private function _ComponentThumbChooserSpark_ThumbList1_i() : ThumbList
		{
			var _loc1_:ThumbList = new ThumbList();
			_loc1_.percentWidth = 100;
			_loc1_.percentHeight = 100;
			_loc1_.useHandCursor = true;
			_loc1_.layout = this._ComponentThumbChooserSpark_TileLayout1_c();
			_loc1_.setStyle("borderVisible",false);
			_loc1_.setStyle("contentBackgroundAlpha",0);
			_loc1_.id = "thumbnailTileSpark";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.thumbnailTileSpark = _loc1_;
			BindingManager.executeBindings(this,"thumbnailTileSpark",this.thumbnailTileSpark);
			return _loc1_;
		}

		private function _ComponentThumbChooserSpark_TileLayout1_c() : TileLayout
		{
			var _loc1_:TileLayout = new TileLayout();
			_loc1_.paddingTop = 60;
			_loc1_.paddingBottom = 60;
			_loc1_.paddingLeft = 45;
			_loc1_.paddingRight = 45;
			_loc1_.verticalGap = 0;
			_loc1_.horizontalGap = 0;
			_loc1_.columnAlign = "justifyUsingGap";
			_loc1_.orientation = "rows";
			return _loc1_;
		}

		private function _ComponentThumbChooserSpark_Group2_i() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.height = 45;
			_loc1_.width = 639;
			_loc1_.top = 0;
			_loc1_.mxmlContent = [this._ComponentThumbChooserSpark_Rect2_c(),this._ComponentThumbChooserSpark_IconButton1_i()];
			_loc1_.id = "upLayer";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.upLayer = _loc1_;
			BindingManager.executeBindings(this,"upLayer",this.upLayer);
			return _loc1_;
		}

		private function _ComponentThumbChooserSpark_Rect2_c() : Rect
		{
			var _loc1_:Rect = new Rect();
			_loc1_.percentWidth = 100;
			_loc1_.percentHeight = 100;
			_loc1_.fill = this._ComponentThumbChooserSpark_SolidColor2_c();
			_loc1_.initialized(this,null);
			return _loc1_;
		}

		private function _ComponentThumbChooserSpark_SolidColor2_c() : SolidColor
		{
			var _loc1_:SolidColor = new SolidColor();
			_loc1_.color = 16777215;
			_loc1_.alpha = 0.4;
			return _loc1_;
		}

		private function _ComponentThumbChooserSpark_IconButton1_i() : IconButton
		{
			var _loc1_:IconButton = new IconButton();
			_loc1_.buttonMode = true;
			_loc1_.enabled = true;
			_loc1_.verticalCenter = 0;
			_loc1_.horizontalCenter = 0;
			_loc1_.setStyle("icon",this._embed_mxml__styles_images_thumbBox_scrollup_init_png_878607239);
			_loc1_.setStyle("iconOver",this._embed_mxml__styles_images_thumbBox_scrollup_over_png_843131911);
			_loc1_.setStyle("iconDisabled",this._embed_mxml__styles_images_thumbBox_scrollup_disabled_png_1375363271);
			_loc1_.addEventListener("mouseDown",this.__upButt_mouseDown);
			_loc1_.addEventListener("mouseOut",this.__upButt_mouseOut);
			_loc1_.addEventListener("mouseUp",this.__upButt_mouseUp);
			_loc1_.id = "upButt";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.upButt = _loc1_;
			BindingManager.executeBindings(this,"upButt",this.upButt);
			return _loc1_;
		}

		public function __upButt_mouseDown(param1:MouseEvent) : void
		{
			this.onMouseDown(param1);
		}

		public function __upButt_mouseOut(param1:MouseEvent) : void
		{
			this.onMouseUp(param1);
		}

		public function __upButt_mouseUp(param1:MouseEvent) : void
		{
			this.onMouseUp(param1);
		}

		private function _ComponentThumbChooserSpark_Group3_i() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.height = 45;
			_loc1_.width = 639;
			_loc1_.bottom = 0;
			_loc1_.mxmlContent = [this._ComponentThumbChooserSpark_Rect3_c(),this._ComponentThumbChooserSpark_IconButton2_i()];
			_loc1_.id = "downLayer";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.downLayer = _loc1_;
			BindingManager.executeBindings(this,"downLayer",this.downLayer);
			return _loc1_;
		}

		private function _ComponentThumbChooserSpark_Rect3_c() : Rect
		{
			var _loc1_:Rect = new Rect();
			_loc1_.percentWidth = 100;
			_loc1_.percentHeight = 100;
			_loc1_.fill = this._ComponentThumbChooserSpark_SolidColor3_c();
			_loc1_.initialized(this,null);
			return _loc1_;
		}

		private function _ComponentThumbChooserSpark_SolidColor3_c() : SolidColor
		{
			var _loc1_:SolidColor = new SolidColor();
			_loc1_.color = 16777215;
			_loc1_.alpha = 0.4;
			return _loc1_;
		}

		private function _ComponentThumbChooserSpark_IconButton2_i() : IconButton
		{
			var _loc1_:IconButton = new IconButton();
			_loc1_.buttonMode = true;
			_loc1_.enabled = true;
			_loc1_.verticalCenter = 0;
			_loc1_.horizontalCenter = 0;
			_loc1_.setStyle("icon",this._embed_mxml__styles_images_thumbBox_scrolldown_init_png_1145426563);
			_loc1_.setStyle("iconOver",this._embed_mxml__styles_images_thumbBox_scrolldown_over_png_1537650053);
			_loc1_.setStyle("iconDisabled",this._embed_mxml__styles_images_thumbBox_scrolldown_disabled_png_1737469557);
			_loc1_.addEventListener("mouseDown",this.__downButt_mouseDown);
			_loc1_.addEventListener("mouseOut",this.__downButt_mouseOut);
			_loc1_.addEventListener("mouseUp",this.__downButt_mouseUp);
			_loc1_.id = "downButt";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.downButt = _loc1_;
			BindingManager.executeBindings(this,"downButt",this.downButt);
			return _loc1_;
		}

		public function __downButt_mouseDown(param1:MouseEvent) : void
		{
			this.onMouseDown(param1);
		}

		public function __downButt_mouseOut(param1:MouseEvent) : void
		{
			this.onMouseUp(param1);
		}

		public function __downButt_mouseUp(param1:MouseEvent) : void
		{
			this.onMouseUp(param1);
		}

		private function _ComponentThumbChooserSpark_bindingsSetup() : Array
		{
			var result:Array = [];
			result[0] = new Binding(this,function():IList
					{
					return _thumbnailSource;
					},null,"thumbnailTileSpark.dataProvider");
			return result;
		}

		[Bindable(event="propertyChange")]
			public function get downButt() : IconButton
		{
			return this._1426573781downButt;
		}

		public function set downButt(param1:IconButton) : void
		{
			var _loc2_:Object = this._1426573781downButt;
			if(_loc2_ !== param1)
			{
				this._1426573781downButt = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"downButt",_loc2_,param1));
				}
			}
		}

		[Bindable(event="propertyChange")]
			public function get downLayer() : Group
		{
			return this._1282758095downLayer;
		}

		public function set downLayer(param1:Group) : void
		{
			var _loc2_:Object = this._1282758095downLayer;
			if(_loc2_ !== param1)
			{
				this._1282758095downLayer = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"downLayer",_loc2_,param1));
				}
			}
		}

		[Bindable(event="propertyChange")]
			public function get thumbnailTileSpark() : ThumbList
		{
			return this._1938834755thumbnailTileSpark;
		}

		public function set thumbnailTileSpark(param1:ThumbList) : void
		{
			var _loc2_:Object = this._1938834755thumbnailTileSpark;
			if(_loc2_ !== param1)
			{
				this._1938834755thumbnailTileSpark = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"thumbnailTileSpark",_loc2_,param1));
				}
			}
		}

		[Bindable(event="propertyChange")]
			public function get upButt() : IconButton
		{
			return this._839839922upButt;
		}

		public function set upButt(param1:IconButton) : void
		{
			var _loc2_:Object = this._839839922upButt;
			if(_loc2_ !== param1)
			{
				this._839839922upButt = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"upButt",_loc2_,param1));
				}
			}
		}

		[Bindable(event="propertyChange")]
			public function get upLayer() : Group
		{
			return this._256589962upLayer;
		}

		public function set upLayer(param1:Group) : void
		{
			var _loc2_:Object = this._256589962upLayer;
			if(_loc2_ !== param1)
			{
				this._256589962upLayer = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"upLayer",_loc2_,param1));
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
	}
}
