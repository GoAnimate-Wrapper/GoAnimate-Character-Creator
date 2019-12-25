package anifire.creator.components
{
	import anifire.component.CCThumb;
	import anifire.creator.events.CcTemplateChooserEvent;
	import anifire.creator.models.CcCharacter;
	import flash.events.MouseEvent;
	import mx.containers.Canvas;
	import mx.containers.HBox;
	import mx.core.IFlexModuleFactory;
	import mx.core.UIComponentDescriptor;
	import mx.events.PropertyChangeEvent;

	public class LatestTemplates extends Canvas
	{


		private var _110363525tiles:HBox;

		private var _documentDescriptor_:UIComponentDescriptor;

		private var __moduleFactoryInitialized:Boolean = false;

		public function LatestTemplates()
		{
			this._documentDescriptor_ = new UIComponentDescriptor({
					"type":Canvas,
					"propertiesFactory":function():Object
					{
					return {"childDescriptors":[new UIComponentDescriptor({
							"type":HBox,
							"stylesFactory":function():void
							{
							this.verticalAlign = "middle";
							},
							"propertiesFactory":function():Object
							{
							return {
							"percentWidth":100,
							"childDescriptors":[new UIComponentDescriptor({
									"type":HBox,
									"id":"tiles",
									"stylesFactory":function():void
									{
									this.horizontalAlign = "center";
									this.verticalAlign = "middle";
									this.horizontalGap = -5;
									},
									"propertiesFactory":function():Object
									{
									return {"percentWidth":100};
									}
									}),new UIComponentDescriptor({
										"type":Canvas,
										"events":{"click":"___LatestTemplates_Canvas2_click"},
										"propertiesFactory":function():Object
										{
										return {
										"width":120,
										"height":123,
										"styleName":"buoyNext"
										};
										}
										})]
							};
							}
					})]};
					}
			});
			super();
			mx_internal::_document = this;
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

		public function addThumbnail(param1:CCThumb, param2:CcCharacter) : void
		{
			var tthumb:LatestTemplateCharThumb = null;
			var thumb:CCThumb = param1;
			var char:CcCharacter = param2;
			var self:LatestTemplates = this;
			if(this.tiles.getChildren().length < 6)
			{
				tthumb = new LatestTemplateCharThumb();
				tthumb.character = char;
				tthumb.thumbnail = thumb;
				tthumb.addEventListener(MouseEvent.CLICK,function(param1:MouseEvent):void
						{
						dispatchEvent(new CcTemplateChooserEvent(CcTemplateChooserEvent.USER_WANT_TO_PREVIEW,tthumb,char,true));
						});
				this.tiles.addChild(tthumb);
			}
		}

		public function ___LatestTemplates_Canvas2_click(param1:MouseEvent) : void
		{
			dispatchEvent(new CcTemplateChooserEvent(CcTemplateChooserEvent.PREVIEW_TAB_CHANGED,this,"preview_professions",true));
		}

		[Bindable(event="propertyChange")]
			public function get tiles() : HBox
		{
			return this._110363525tiles;
		}

		public function set tiles(param1:HBox) : void
		{
			var _loc2_:Object = this._110363525tiles;
			if(_loc2_ !== param1)
			{
				this._110363525tiles = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tiles",_loc2_,param1));
				}
			}
		}
	}
}
