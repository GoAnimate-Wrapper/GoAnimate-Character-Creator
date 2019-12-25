package anifire.creator.components
{
	import anifire.component.CCThumb;
	import anifire.creator.core.CcConsole;
	import anifire.creator.events.CcCoreEvent;
	import anifire.creator.events.CcTemplateChooserEvent;
	import anifire.creator.models.CcCharacter;
	import anifire.util.UtilPager;
	import flash.events.MouseEvent;
	import flash.utils.getDefinitionByName;
	import mx.binding.Binding;
	import mx.binding.IBindingClient;
	import mx.binding.IWatcherSetupUtil2;
	import mx.containers.HBox;
	import mx.containers.Tile;
	import mx.containers.VBox;
	import mx.controls.Button;
	import mx.controls.Label;
	import mx.core.IFlexModuleFactory;
	import mx.core.UIComponentDescriptor;
	import mx.core.mx_internal;
	import mx.events.FlexEvent;
	import mx.events.PropertyChangeEvent;

	use namespace mx_internal;

	public class TemplateCCSelector extends VBox implements IBindingClient
	{

		private static var _watcherSetupUtil:IWatcherSetupUtil2;


		public var _TemplateCCSelector_Label1:Label;

		private var _55416058leftBut:Button;

		private var _1436107067rightBut:Button;

		private var _1329765796thumbTile:Tile;

		private var _documentDescriptor_:UIComponentDescriptor;

		private var __moduleFactoryInitialized:Boolean = false;

		private var _selectedAssetId:String = null;

		private var _1468771644_pager:UtilPager = null;

		private var _pageNumDisplayed:int = -1;

		private var _categoryDisplayed:String = "";

		private var _category:String = "";

		private var _hasHandler:Boolean = false;

		mx_internal var _bindings:Array;

		mx_internal var _watchers:Array;

		mx_internal var _bindingsByDestination:Object;

		mx_internal var _bindingsBeginWithWord:Object;

		public function TemplateCCSelector()
		{
			var target:Object = null;
			var watcherSetupUtilClass:Object = null;
			this._documentDescriptor_ = new UIComponentDescriptor({
					"type":VBox,
					"events":{"initialize":"___TemplateCCSelector_VBox1_initialize"},
					"propertiesFactory":function():Object
					{
					return {
					"width":500,
					"height":440,
					"childDescriptors":[new UIComponentDescriptor({
							"type":HBox,
							"stylesFactory":function():void
							{
							this.verticalAlign = "middle";
							},
							"propertiesFactory":function():Object
							{
							return {
							"percentWidth":100,
							"percentHeight":100,
							"childDescriptors":[new UIComponentDescriptor({
									"type":Button,
									"id":"leftBut",
									"events":{"click":"__leftBut_click"},
									"propertiesFactory":function():Object
									{
									return {
									"buttonMode":true,
									"styleName":"btnTemplateThumbChooserLeft"
									};
									}
									}),new UIComponentDescriptor({
										"type":Tile,
										"id":"thumbTile",
										"propertiesFactory":function():Object
										{
										return {
										"minWidth":406,
										"minHeight":402
										};
										}
										}),new UIComponentDescriptor({
											"type":Button,
											"id":"rightBut",
											"events":{"click":"__rightBut_click"},
											"propertiesFactory":function():Object
											{
											return {
											"buttonMode":true,
											"styleName":"btnTemplateThumbChooserRight"
											};
											}
											})]
							};
							}
					}),new UIComponentDescriptor({
						"type":Label,
						"id":"_TemplateCCSelector_Label1",
						"propertiesFactory":function():Object
						{
						return {
						"styleName":"templateBrowsePageNumber",
						"percentWidth":100
						};
						}
						})]
					};
					}
			});
			this._bindings = [];
			this._watchers = [];
			this._bindingsByDestination = {};
			this._bindingsBeginWithWord = {};
			super();
			mx_internal::_document = this;
			var bindings:Array = this._TemplateCCSelector_bindingsSetup();
			var watchers:Array = [];
			target = this;
			if(_watcherSetupUtil == null)
			{
				watcherSetupUtilClass = getDefinitionByName("_anifire_creator_components_TemplateCCSelectorWatcherSetupUtil");
				watcherSetupUtilClass["init"](null);
			}
			_watcherSetupUtil.setup(this,function(param1:String):*
					{
					return target[param1];
					},function(param1:String):*
					{
					return TemplateCCSelector[param1];
					},bindings,watchers);
			mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
			mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
			this.horizontalScrollPolicy = "off";
			this.verticalScrollPolicy = "off";
			this.width = 500;
			this.height = 440;
			this.addEventListener("initialize",this.___TemplateCCSelector_VBox1_initialize);
			var i:uint = 0;
			while(i < bindings.length)
			{
				Binding(bindings[i]).execute();
				i++;
			}
		}

		public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
		{
			TemplateCCSelector._watcherSetupUtil = param1;
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
			mx_internal::setDocumentDescriptor(this._documentDescriptor_);
			super.initialize();
		}

		public function get category() : String
		{
			return this._category;
		}

		public function set category(param1:String) : void
		{
			this._category = param1;
		}

		private function refreshHighlight() : void
		{
			var _loc1_:CCTemplateCharThumb = null;
			for each(_loc1_ in this.thumbTile.getChildren())
			{
				_loc1_.currentState = _loc1_.character.assetId == this._selectedAssetId?"selected":"";
			}
		}

		private function init() : void
		{
			addEventListener(CcTemplateChooserEvent.PREVIEW_CHARACTER_CHANGED,function(param1:CcTemplateChooserEvent):void
					{
					_selectedAssetId = (param1.getData() as CcCharacter).assetId;
					if(_pageNumDisplayed != _pager.pageNumber || _categoryDisplayed != _category)
					{
					_pageNumDisplayed = _pager.pageNumber;
					_categoryDisplayed = _category;
					CcConsole.getCcConsole().refreshTemplateCCSelector(_pager.getView(),"tile");
					thumbTile.removeAllChildren();
					}
					else
					{
					refreshHighlight();
					}
					});
		}

		private function initCreationComplete() : void
		{
			var self:TemplateCCSelector = this;
			this._hasHandler = true;
			CcConsole.getCcConsole().addEventListener(CcCoreEvent.LOAD_CHARACTER_THUMB_COMPLETE,function(param1:CcCoreEvent):void
					{
					var char:CcCharacter = null;
					var tthumb:CCTemplateCharThumb = null;
					var e:CcCoreEvent = param1;
					var data:Object = e.getData();
					var thumb:CCThumb = data.thumbnail as CCThumb;
					char = data.char as CcCharacter;
					if(data.tag != "tile" || !_pager.isItemOnCurrentPage(char) || thumbTile.getChildren().some(function(param1:CCTemplateCharThumb, param2:int, param3:Array):Boolean
								{
								return param1.character.assetId == char.assetId;
								}))
					{
					return;
					}
					tthumb = new CCTemplateCharThumb();
					tthumb.character = char;
					tthumb.thumbnail = thumb;
					tthumb.addEventListener(MouseEvent.CLICK,function(param1:MouseEvent):void
							{
							dispatchEvent(new CcTemplateChooserEvent(CcTemplateChooserEvent.USER_WANT_TO_PREVIEW,tthumb,char,true));
							});
					if(tthumb.character.assetId == _selectedAssetId)
					{
						tthumb.currentState = "selected";
					}
					thumbTile.addChildAt(tthumb,getInsertionIndex(tthumb));
					if(_pager.getView().length == thumbTile.getChildren().length)
					{
						refreshHighlight();
					}
					});
		}

		private function getInsertionIndex(param1:CCTemplateCharThumb) : int
		{
			var addedChars:Array = null;
			var iitemIndex:int = 0;
			var retval:Array = null;
			var iitem:CCTemplateCharThumb = param1;
			addedChars = this.thumbTile.getChildren().map(function(param1:CCTemplateCharThumb, param2:int, param3:Array):Object
					{
					return param1.character;
					});
			iitemIndex = 0;
			var orderings:Array = this._pager.getView().map(function(param1:CcCharacter, param2:int, param3:Array):Object
					{
					if(param1 == iitem.character)
					{
					iitemIndex = param2;
					}
					return {
					"item":param1,
					"index":param2
					};
					});
			retval = [];
			orderings.filter(function(param1:Object, param2:int, param3:Array):Boolean
					{
					return addedChars.indexOf(param1.item) >= 0;
					}).forEach(function(param1:Object, param2:int, param3:Array):void
						{
						if(param1.index - iitemIndex > 0)
						{
						retval.push(param2);
						}
						});
			return retval.length == 0?addedChars.length > 0?int(addedChars.length):0:int(retval[0]);
		}

		public function get pager() : UtilPager
		{
			return this._pager;
		}

		public function set pager(param1:UtilPager) : void
		{
			this._pager = param1;
			if(param1 != null)
			{
				this.thumbTile.removeAllChildren();
				if(!this._hasHandler)
				{
					this.initCreationComplete();
				}
				this._pageNumDisplayed = this._pager.pageNumber;
				this._categoryDisplayed = this._category;
				CcConsole.getCcConsole().refreshTemplateCCSelector(param1.getView(),"tile");
			}
		}

		private function previous() : void
		{
			var _loc1_:CcConsole = CcConsole.getCcConsole();
			var _loc2_:int = this._pager.pageNumber;
			this._pager.previous();
			if(this._pager.pageNumber != _loc2_ || this._categoryDisplayed != this._category)
			{
				this._pageNumDisplayed = this._pager.pageNumber;
				this._categoryDisplayed = this._category;
				_loc1_.refreshTemplateCCSelector(this._pager.getView(),"tile");
				this.thumbTile.removeAllChildren();
			}
		}

		private function next() : void
		{
			var _loc1_:CcConsole = CcConsole.getCcConsole();
			var _loc2_:int = this._pager.pageNumber;
			this._pager.next();
			if(this._pager.pageNumber != _loc2_ || this._categoryDisplayed != this._category)
			{
				this._pageNumDisplayed = this._pager.pageNumber;
				this._categoryDisplayed = this._category;
				_loc1_.refreshTemplateCCSelector(this._pager.getView(),"tile");
				this.thumbTile.removeAllChildren();
			}
		}

		public function ___TemplateCCSelector_VBox1_initialize(param1:FlexEvent) : void
		{
			this.init();
		}

		public function __leftBut_click(param1:MouseEvent) : void
		{
			this.previous();
		}

		public function __rightBut_click(param1:MouseEvent) : void
		{
			this.next();
		}

		private function _TemplateCCSelector_bindingsSetup() : Array
		{
			var result:Array = [];
			result[0] = new Binding(this,function():Boolean
					{
					return _pager.pageNumber > 1;
					},null,"leftBut.enabled");
			result[1] = new Binding(this,function():Boolean
					{
					return _pager.pageNumber < _pager.totalPages;
					},null,"rightBut.enabled");
			result[2] = new Binding(this,function():String
					{
					var _loc1_:* = _pager.pageNumber + " / " + _pager.totalPages;
					return _loc1_ == undefined?null:String(_loc1_);
					},null,"_TemplateCCSelector_Label1.text");
			return result;
		}

		[Bindable(event="propertyChange")]
			public function get leftBut() : Button
		{
			return this._55416058leftBut;
		}

		public function set leftBut(param1:Button) : void
		{
			var _loc2_:Object = this._55416058leftBut;
			if(_loc2_ !== param1)
			{
				this._55416058leftBut = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"leftBut",_loc2_,param1));
				}
			}
		}

		[Bindable(event="propertyChange")]
			public function get rightBut() : Button
		{
			return this._1436107067rightBut;
		}

		public function set rightBut(param1:Button) : void
		{
			var _loc2_:Object = this._1436107067rightBut;
			if(_loc2_ !== param1)
			{
				this._1436107067rightBut = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"rightBut",_loc2_,param1));
				}
			}
		}

		[Bindable(event="propertyChange")]
			public function get thumbTile() : Tile
		{
			return this._1329765796thumbTile;
		}

		public function set thumbTile(param1:Tile) : void
		{
			var _loc2_:Object = this._1329765796thumbTile;
			if(_loc2_ !== param1)
			{
				this._1329765796thumbTile = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"thumbTile",_loc2_,param1));
				}
			}
		}

		[Bindable(event="propertyChange")]
			private function get _pager() : UtilPager
		{
			return this._1468771644_pager;
		}

		private function set _pager(param1:UtilPager) : void
		{
			var _loc2_:Object = this._1468771644_pager;
			if(_loc2_ !== param1)
			{
				this._1468771644_pager = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_pager",_loc2_,param1));
				}
			}
		}
	}
}
