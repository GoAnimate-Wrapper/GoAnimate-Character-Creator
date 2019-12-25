package anifire.creator.components
{
	import anifire.constant.CcLibConstant;
	import anifire.constant.ServerConstants;
	import anifire.creator.events.CcBodyShapeChooserEvent;
	import anifire.creator.models.CcBodyShape;
	import anifire.creator.models.CcTheme;
	import anifire.managers.AppConfigManager;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import mx.containers.HBox;
	import mx.containers.VBox;
	import mx.controls.Button;
	import mx.core.IFlexModuleFactory;
	import mx.core.UIComponentDescriptor;
	import mx.events.PropertyChangeEvent;

	public class BodyShapeChooser extends VBox
	{

		private static var _configManager:AppConfigManager = AppConfigManager.instance;


		private var _207474244bodyShapeBtnContainer:HBox;

		private var _documentDescriptor_:UIComponentDescriptor;

		private var __moduleFactoryInitialized:Boolean = false;

		private var _ccTheme:CcTheme;

		private var _defaultShape:String;

		public function BodyShapeChooser()
		{
			this._documentDescriptor_ = new UIComponentDescriptor({
					"type":VBox,
					"stylesFactory":function():void
					{
					this.verticalAlign = "middle";
					this.horizontalAlign = "center";
					},
					"propertiesFactory":function():Object
					{
					return {"childDescriptors":[new UIComponentDescriptor({
							"type":HBox,
							"id":"bodyShapeBtnContainer",
							"stylesFactory":function():void
							{
							this.verticalAlign = "middle";
							this.horizontalAlign = "center";
							}
							})]};
					}
					});
			super();
			mx_internal::_document = this;
		}

		override public function set moduleFactory(param1:IFlexModuleFactory) : void
		{
			var factory:IFlexModuleFactory = param1;
			super.moduleFactory = factory;
			if(this.__moduleFactoryInitialized)
			{
				return;
			}
			this.__moduleFactoryInitialized = true;
			if(!this.styleDeclaration)
			{
				this.styleDeclaration = new CSSStyleDeclaration(null,styleManager);
			}
			this.styleDeclaration.defaultFactory = function():void
			{
				this.verticalAlign = "middle";
				this.horizontalAlign = "center";
			};
		}

		override public function initialize() : void
		{
			mx_internal::setDocumentDescriptor(this._documentDescriptor_);
			super.initialize();
		}

		private function get ccTheme() : CcTheme
		{
			return this._ccTheme;
		}

		public function init(param1:CcTheme, param2:int, param3:Boolean = false) : void
		{
			var _loc4_:String = null;
			var _loc5_:int = 0;
			var _loc6_:CcBodyShape = null;
			var _loc7_:Button = null;
			this._ccTheme = param1;
			if(CcLibConstant.CHOOSE_TAG_TYPE_SEX)
			{
				if(param3)
				{
					if(!_configManager.getValue("ft"))
					{
						_loc4_ = "_sticky_filter_guy";
						_configManager.setValue("ft",_loc4_);
					}
					if(_configManager.getValue(ServerConstants.PARAM_BODYSHAPE))
					{
						callLater(this.tellEveryoneBodyShape_choosen,[_configManager.getValue(ServerConstants.PARAM_BODYSHAPE)]);
					}
					else
					{
						callLater(this.tellEveryoneBodyShape_choosen,["default"]);
					}
				}
				return;
			}
			if(param3)
			{
				if(param1.getBodyShapeNum() == 1)
				{
					callLater(this.tellEveryoneBodyShape_choosen,[param1.getBodyShapeByIndex(0).id]);
					return;
				}
				_loc5_ = 0;
				_loc5_ = 0;
				while(_loc5_ < param1.getBodyShapeNum())
				{
					_loc6_ = param1.getBodyShapeByIndex(_loc5_);
					_loc7_ = new Button();
					_loc7_.styleName = "btnBodyShape" + _loc6_.id;
					_loc7_.buttonMode = true;
					_loc7_.id = _loc6_.id;
					_loc7_.addEventListener(MouseEvent.CLICK,this.onButtonClick);
					this.bodyShapeBtnContainer.addChild(_loc7_);
					_loc5_++;
				}
				if(_configManager.getValue(ServerConstants.PARAM_BODYSHAPE))
				{
					callLater(this.tellEveryoneBodyShape_choosen,[_configManager.getValue(ServerConstants.PARAM_BODYSHAPE)]);
					return;
				}
				callLater(this.tellEveryoneBodyShape_choosen,[param1.getBodyShapeByIndex(0).id]);
			}
		}

		private function onDefaultButtonClick(param1:Event) : void
		{
			var _loc2_:Button = param1.target as Button;
			var _loc3_:String = _loc2_.id;
			_configManager.setValue("ft",_loc3_);
			this.tellEveryoneBodyShape_choosen("default");
		}

		private function onKidButtonClick(param1:Event) : void
		{
			var _loc2_:Button = param1.target as Button;
			var _loc3_:String = _loc2_.id;
			_configManager.setValue("ft",_loc3_);
			this.tellEveryoneBodyShape_choosen("kid");
		}

		private function onButtonClick(param1:Event) : void
		{
			var _loc2_:Button = param1.target as Button;
			var _loc3_:String = _loc2_.id;
			this.tellEveryoneBodyShape_choosen(_loc3_);
		}

		private function tellEveryoneBodyShape_choosen(param1:String) : void
		{
			var _loc2_:CcBodyShape = this.ccTheme.getBodyShapeByShapeId(param1);
			var _loc3_:CcBodyShapeChooserEvent = new CcBodyShapeChooserEvent(CcBodyShapeChooserEvent.BODY_SHAPE_CHOSEN,this);
			_loc3_.bodyShapeChosen = _loc2_;
			this.dispatchEvent(_loc3_);
		}

		[Bindable(event="propertyChange")]
			public function get bodyShapeBtnContainer() : HBox
		{
			return this._207474244bodyShapeBtnContainer;
		}

		public function set bodyShapeBtnContainer(param1:HBox) : void
		{
			var _loc2_:Object = this._207474244bodyShapeBtnContainer;
			if(_loc2_ !== param1)
			{
				this._207474244bodyShapeBtnContainer = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bodyShapeBtnContainer",_loc2_,param1));
				}
			}
		}
	}
}
