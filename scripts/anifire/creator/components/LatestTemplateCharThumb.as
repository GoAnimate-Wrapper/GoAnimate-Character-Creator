package anifire.creator.components
{
	import anifire.component.CCThumb;
	import anifire.creator.models.CcCharacter;
	import flash.events.MouseEvent;
	import flash.filters.GlowFilter;
	import mx.containers.Canvas;
	import mx.core.IFlexModuleFactory;
	import mx.core.UIComponent;
	import mx.core.UIComponentDescriptor;
	import mx.events.FlexEvent;
	import mx.events.PropertyChangeEvent;

	public class LatestTemplateCharThumb extends Canvas
	{


		private var _3492669raft:Canvas;

		private var _documentDescriptor_:UIComponentDescriptor;

		private var __moduleFactoryInitialized:Boolean = false;

		private var _thumb:CCThumb = null;

		private var _char:CcCharacter = null;

		public function LatestTemplateCharThumb()
		{
			this._documentDescriptor_ = new UIComponentDescriptor({
					"type":Canvas,
					"events":{"creationComplete":"___LatestTemplateCharThumb_Canvas1_creationComplete"},
					"propertiesFactory":function():Object
					{
					return {"childDescriptors":[new UIComponentDescriptor({
							"type":Canvas,
							"id":"raft",
							"propertiesFactory":function():Object
							{
							return {
							"styleName":"templateCharThumbRaft",
							"x":0,
							"y":115,
							"width":128,
							"height":40
							};
							}
							})]};
					}
					});
			super();
			mx_internal::_document = this;
			this.verticalScrollPolicy = "off";
			this.addEventListener("creationComplete",this.___LatestTemplateCharThumb_Canvas1_creationComplete);
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

		private function toggleGlow(param1:MouseEvent) : void
		{
			if(param1.type == MouseEvent.ROLL_OVER)
			{
				if(this._thumb)
				{
					this._thumb.filters = [new GlowFilter(16777215,1,8,8,3)];
				}
			}
			else if(param1.type == MouseEvent.ROLL_OUT)
			{
				if(this._thumb)
				{
					this._thumb.filters = [];
				}
			}
		}

		public function set thumbnail(param1:CCThumb) : void
		{
			this.removeAllChildren();
			this._thumb = param1;
			var _loc2_:UIComponent = new UIComponent();
			_loc2_.addChild(param1);
			_loc2_.width = param1.thumbWidth;
			_loc2_.height = param1.thumbHeight;
			width = 128;
			height = 150;
			buttonMode = true;
			mouseEnabled = true;
			useHandCursor = true;
			_loc2_.x = (width - _loc2_.width) / 2;
			_loc2_.y = (height - _loc2_.height) / 2;
			addChild(_loc2_);
		}

		public function get character() : CcCharacter
		{
			return this._char;
		}

		public function set character(param1:CcCharacter) : void
		{
			this._char = param1;
		}

		public function creationCompleteHandler() : void
		{
			setChildIndex(this.raft,0);
			addEventListener(MouseEvent.ROLL_OVER,this.toggleGlow);
			addEventListener(MouseEvent.ROLL_OUT,this.toggleGlow);
		}

		public function ___LatestTemplateCharThumb_Canvas1_creationComplete(param1:FlexEvent) : void
		{
			this.creationCompleteHandler();
		}

		[Bindable(event="propertyChange")]
			public function get raft() : Canvas
		{
			return this._3492669raft;
		}

		public function set raft(param1:Canvas) : void
		{
			var _loc2_:Object = this._3492669raft;
			if(_loc2_ !== param1)
			{
				this._3492669raft = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"raft",_loc2_,param1));
				}
			}
		}
	}
}
