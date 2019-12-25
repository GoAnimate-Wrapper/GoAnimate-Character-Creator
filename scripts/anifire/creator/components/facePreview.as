package anifire.creator.components
{
	import anifire.util.UtilDict;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	import flash.utils.Proxy;
	import flash.utils.getDefinitionByName;
	import mx.binding.Binding;
	import mx.binding.BindingManager;
	import mx.binding.IBindingClient;
	import mx.binding.IWatcherSetupUtil2;
	import mx.core.IFlexModuleFactory;
	import mx.core.mx_internal;
	import mx.events.FlexEvent;
	import mx.events.PropertyChangeEvent;
	import mx.graphics.SolidColor;
	import mx.graphics.SolidColorStroke;
	import spark.components.Group;
	import spark.effects.Fade;
	import spark.effects.Move;
	import spark.primitives.Line;
	import spark.primitives.Rect;

	use namespace mx_internal;

	public class facePreview extends Group implements IBindingClient
	{

		private static var _watcherSetupUtil:IWatcherSetupUtil2;


		private var _1682788161bottomLine:Line;

		private var _789363156btnZoomIn:IconButton;

		private var _1299539841btnZoomOut:IconButton;

		private var _3135069face:CharPreviewer;

		private var _1282163838faceBg:Group;

		private var _1282133823fadeIn:Fade;

		private var _1091436750fadeOut:Fade;

		private var _104889325moveDown:Move;

		private var _1068263860moveUp:Move;

		private var _1059299688mymask:Group;

		private var __moduleFactoryInitialized:Boolean = false;

		private var _embed_mxml__styles_images_control_btn_zoomout_over_png_1686087097:Class;

		private var _embed_mxml__styles_images_control_btn_zoomin_over_png_557062261:Class;

		private var _embed_mxml__styles_images_control_btn_zoomin_init_png_640989693:Class;

		private var _embed_mxml__styles_images_control_btn_zoomout_init_png_1519735303:Class;

		mx_internal var _bindings:Array;

		mx_internal var _watchers:Array;

		mx_internal var _bindingsByDestination:Object;

		mx_internal var _bindingsBeginWithWord:Object;

		public function facePreview()
		{
			var target:Object = null;
			var watcherSetupUtilClass:Object = null;
			this._embed_mxml__styles_images_control_btn_zoomout_over_png_1686087097 = facePreview__embed_mxml__styles_images_control_btn_zoomout_over_png_1686087097;
			this._embed_mxml__styles_images_control_btn_zoomin_over_png_557062261 = facePreview__embed_mxml__styles_images_control_btn_zoomin_over_png_557062261;
			this._embed_mxml__styles_images_control_btn_zoomin_init_png_640989693 = facePreview__embed_mxml__styles_images_control_btn_zoomin_init_png_640989693;
			this._embed_mxml__styles_images_control_btn_zoomout_init_png_1519735303 = facePreview__embed_mxml__styles_images_control_btn_zoomout_init_png_1519735303;
			this._bindings = [];
			this._watchers = [];
			this._bindingsByDestination = {};
			this._bindingsBeginWithWord = {};
			super();
			mx_internal::_document = this;
			var bindings:Array = this._facePreview_bindingsSetup();
			var watchers:Array = [];
			target = this;
			if(_watcherSetupUtil == null)
			{
				watcherSetupUtilClass = getDefinitionByName("_anifire_creator_components_facePreviewWatcherSetupUtil");
				watcherSetupUtilClass["init"](null);
			}
			_watcherSetupUtil.setup(this,function(param1:String):*
					{
					return target[param1];
					},function(param1:String):*
					{
					return facePreview[param1];
					},bindings,watchers);
			mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
			mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
			this.width = 300;
			this.percentHeight = 100;
			this.mxmlContent = [this._facePreview_Group2_i(),this._facePreview_Group3_i(),this._facePreview_CharPreviewer1_i(),this._facePreview_IconButton1_i(),this._facePreview_IconButton2_i(),this._facePreview_Line1_i()];
			this._facePreview_Fade1_i();
			this._facePreview_Fade2_i();
			this._facePreview_Move2_i();
			this._facePreview_Move1_i();
			this.addEventListener("creationComplete",this.___facePreview_Group1_creationComplete);
			var i:uint = 0;
			while(i < bindings.length)
			{
				Binding(bindings[i]).execute();
				i++;
			}
		}

		public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
		{
			facePreview._watcherSetupUtil = param1;
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

		private function init() : void
		{
			this.face.mask = this.mymask;
			this.face.visible = false;
			this.faceBg.visible = false;
			this.btnZoomOut.visible = false;
			this.bottomLine.alpha = 0;
		}

		private function onZoomInClick(param1:Event) : void
		{
			this.btnZoomIn.visible = false;
			this.btnZoomOut.visible = true;
			this.faceBg.visible = true;
			this.face.visible = true;
			this.moveUp.play();
			this.fadeIn.play();
		}

		private function onZoomOutClick(param1:Event) : void
		{
			this.btnZoomIn.visible = true;
			this.btnZoomOut.visible = false;
			this.moveDown.play();
			this.fadeOut.play();
		}

		private function _facePreview_Fade1_i() : Fade
		{
			var _loc1_:Fade = new Fade();
			_loc1_.alphaFrom = 0;
			_loc1_.alphaTo = 1;
			_loc1_.duration = 200;
			this.fadeIn = _loc1_;
			BindingManager.executeBindings(this,"fadeIn",this.fadeIn);
			return _loc1_;
		}

		private function _facePreview_Fade2_i() : Fade
		{
			var _loc1_:Fade = new Fade();
			_loc1_.alphaFrom = 1;
			_loc1_.alphaTo = 0;
			_loc1_.duration = 500;
			this.fadeOut = _loc1_;
			BindingManager.executeBindings(this,"fadeOut",this.fadeOut);
			return _loc1_;
		}

		private function _facePreview_Move2_i() : Move
		{
			var _loc1_:Move = new Move();
			_loc1_.yFrom = 0;
			_loc1_.yTo = 450;
			_loc1_.duration = 500;
			this.moveDown = _loc1_;
			BindingManager.executeBindings(this,"moveDown",this.moveDown);
			return _loc1_;
		}

		private function _facePreview_Move1_i() : Move
		{
			var _loc1_:Move = new Move();
			_loc1_.yFrom = 450;
			_loc1_.yTo = 0;
			_loc1_.duration = 500;
			this.moveUp = _loc1_;
			BindingManager.executeBindings(this,"moveUp",this.moveUp);
			return _loc1_;
		}

		private function _facePreview_Group2_i() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.width = 300;
			_loc1_.percentHeight = 100;
			_loc1_.mxmlContent = [this._facePreview_Rect1_c()];
			_loc1_.id = "faceBg";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.faceBg = _loc1_;
			BindingManager.executeBindings(this,"faceBg",this.faceBg);
			return _loc1_;
		}

		private function _facePreview_Rect1_c() : Rect
		{
			var _loc1_:Rect = new Rect();
			_loc1_.width = 300;
			_loc1_.percentHeight = 100;
			_loc1_.fill = this._facePreview_SolidColor1_c();
			_loc1_.initialized(this,null);
			return _loc1_;
		}

		private function _facePreview_SolidColor1_c() : SolidColor
		{
			var _loc1_:SolidColor = new SolidColor();
			_loc1_.color = 15658734;
			return _loc1_;
		}

		private function _facePreview_Group3_i() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.width = 300;
			_loc1_.percentHeight = 100;
			_loc1_.mxmlContent = [this._facePreview_Rect2_c()];
			_loc1_.id = "mymask";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.mymask = _loc1_;
			BindingManager.executeBindings(this,"mymask",this.mymask);
			return _loc1_;
		}

		private function _facePreview_Rect2_c() : Rect
		{
			var _loc1_:Rect = new Rect();
			_loc1_.width = 300;
			_loc1_.percentHeight = 100;
			_loc1_.fill = this._facePreview_SolidColor2_c();
			_loc1_.initialized(this,null);
			return _loc1_;
		}

		private function _facePreview_SolidColor2_c() : SolidColor
		{
			var _loc1_:SolidColor = new SolidColor();
			_loc1_.color = 16711680;
			return _loc1_;
		}

		private function _facePreview_CharPreviewer1_i() : CharPreviewer
		{
			var _loc1_:CharPreviewer = new CharPreviewer();
			_loc1_.width = 300;
			_loc1_.percentHeight = 100;
			_loc1_.scaleX = 2;
			_loc1_.scaleY = 2;
			_loc1_.horizontalCenter = 0;
			_loc1_.verticalCenter = 0;
			_loc1_.showFace = true;
			_loc1_.id = "face";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.face = _loc1_;
			BindingManager.executeBindings(this,"face",this.face);
			return _loc1_;
		}

		private function _facePreview_IconButton1_i() : IconButton
		{
			var _loc1_:IconButton = new IconButton();
			_loc1_.buttonMode = true;
			_loc1_.enabled = true;
			_loc1_.bottom = 0;
			_loc1_.right = 15;
			_loc1_.setStyle("icon",this._embed_mxml__styles_images_control_btn_zoomin_init_png_640989693);
			_loc1_.setStyle("iconOver",this._embed_mxml__styles_images_control_btn_zoomin_over_png_557062261);
			_loc1_.addEventListener("click",this.__btnZoomIn_click);
			_loc1_.id = "btnZoomIn";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.btnZoomIn = _loc1_;
			BindingManager.executeBindings(this,"btnZoomIn",this.btnZoomIn);
			return _loc1_;
		}

		public function __btnZoomIn_click(param1:MouseEvent) : void
		{
			this.onZoomInClick(param1);
		}

		private function _facePreview_IconButton2_i() : IconButton
		{
			var _loc1_:IconButton = new IconButton();
			_loc1_.buttonMode = true;
			_loc1_.enabled = true;
			_loc1_.bottom = 0;
			_loc1_.right = 15;
			_loc1_.setStyle("icon",this._embed_mxml__styles_images_control_btn_zoomout_init_png_1519735303);
			_loc1_.setStyle("iconOver",this._embed_mxml__styles_images_control_btn_zoomout_over_png_1686087097);
			_loc1_.addEventListener("click",this.__btnZoomOut_click);
			_loc1_.id = "btnZoomOut";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.btnZoomOut = _loc1_;
			BindingManager.executeBindings(this,"btnZoomOut",this.btnZoomOut);
			return _loc1_;
		}

		public function __btnZoomOut_click(param1:MouseEvent) : void
		{
			this.onZoomOutClick(param1);
		}

		private function _facePreview_Line1_i() : Line
		{
			var _loc1_:Line = new Line();
			_loc1_.percentWidth = 100;
			_loc1_.bottom = 0;
			_loc1_.stroke = this._facePreview_SolidColorStroke1_c();
			_loc1_.initialized(this,"bottomLine");
			this.bottomLine = _loc1_;
			BindingManager.executeBindings(this,"bottomLine",this.bottomLine);
			return _loc1_;
		}

		private function _facePreview_SolidColorStroke1_c() : SolidColorStroke
		{
			var _loc1_:SolidColorStroke = new SolidColorStroke();
			_loc1_.color = 13421772;
			return _loc1_;
		}

		public function ___facePreview_Group1_creationComplete(param1:FlexEvent) : void
		{
			this.init();
		}

		private function _facePreview_bindingsSetup() : Array
		{
			var result:Array = [];
			result[0] = new Binding(this,function():Rectangle
					{
					return new Rectangle(0,0,this.width,this.height);
					},null,"this.scrollRect");
			result[1] = new Binding(this,function():Array
					{
					var _loc1_:* = [faceBg,mymask];
					return _loc1_ == null || _loc1_ is Array || _loc1_ is Proxy?_loc1_:[_loc1_];
					},null,"moveUp.targets");
			result[2] = new Binding(this,function():Array
					{
					var _loc1_:* = [faceBg,mymask];
					return _loc1_ == null || _loc1_ is Array || _loc1_ is Proxy?_loc1_:[_loc1_];
					},null,"moveDown.targets");
			result[3] = new Binding(this,null,null,"fadeIn.target","bottomLine");
			result[4] = new Binding(this,null,null,"fadeOut.target","bottomLine");
			result[5] = new Binding(this,function():String
					{
					var _loc1_:* = UtilDict.toDisplay("go","Zoom In");
					return _loc1_ == undefined?null:String(_loc1_);
					},null,"btnZoomIn.label");
			result[6] = new Binding(this,function():String
					{
					var _loc1_:* = UtilDict.toDisplay("go","Zoom Out");
					return _loc1_ == undefined?null:String(_loc1_);
					},null,"btnZoomOut.label");
			return result;
		}

		[Bindable(event="propertyChange")]
			public function get bottomLine() : Line
		{
			return this._1682788161bottomLine;
		}

		public function set bottomLine(param1:Line) : void
		{
			var _loc2_:Object = this._1682788161bottomLine;
			if(_loc2_ !== param1)
			{
				this._1682788161bottomLine = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bottomLine",_loc2_,param1));
				}
			}
		}

		[Bindable(event="propertyChange")]
			public function get btnZoomIn() : IconButton
		{
			return this._789363156btnZoomIn;
		}

		public function set btnZoomIn(param1:IconButton) : void
		{
			var _loc2_:Object = this._789363156btnZoomIn;
			if(_loc2_ !== param1)
			{
				this._789363156btnZoomIn = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnZoomIn",_loc2_,param1));
				}
			}
		}

		[Bindable(event="propertyChange")]
			public function get btnZoomOut() : IconButton
		{
			return this._1299539841btnZoomOut;
		}

		public function set btnZoomOut(param1:IconButton) : void
		{
			var _loc2_:Object = this._1299539841btnZoomOut;
			if(_loc2_ !== param1)
			{
				this._1299539841btnZoomOut = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnZoomOut",_loc2_,param1));
				}
			}
		}

		[Bindable(event="propertyChange")]
			public function get face() : CharPreviewer
		{
			return this._3135069face;
		}

		public function set face(param1:CharPreviewer) : void
		{
			var _loc2_:Object = this._3135069face;
			if(_loc2_ !== param1)
			{
				this._3135069face = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"face",_loc2_,param1));
				}
			}
		}

		[Bindable(event="propertyChange")]
			public function get faceBg() : Group
		{
			return this._1282163838faceBg;
		}

		public function set faceBg(param1:Group) : void
		{
			var _loc2_:Object = this._1282163838faceBg;
			if(_loc2_ !== param1)
			{
				this._1282163838faceBg = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"faceBg",_loc2_,param1));
				}
			}
		}

		[Bindable(event="propertyChange")]
			public function get fadeIn() : Fade
		{
			return this._1282133823fadeIn;
		}

		public function set fadeIn(param1:Fade) : void
		{
			var _loc2_:Object = this._1282133823fadeIn;
			if(_loc2_ !== param1)
			{
				this._1282133823fadeIn = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fadeIn",_loc2_,param1));
				}
			}
		}

		[Bindable(event="propertyChange")]
			public function get fadeOut() : Fade
		{
			return this._1091436750fadeOut;
		}

		public function set fadeOut(param1:Fade) : void
		{
			var _loc2_:Object = this._1091436750fadeOut;
			if(_loc2_ !== param1)
			{
				this._1091436750fadeOut = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fadeOut",_loc2_,param1));
				}
			}
		}

		[Bindable(event="propertyChange")]
			public function get moveDown() : Move
		{
			return this._104889325moveDown;
		}

		public function set moveDown(param1:Move) : void
		{
			var _loc2_:Object = this._104889325moveDown;
			if(_loc2_ !== param1)
			{
				this._104889325moveDown = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"moveDown",_loc2_,param1));
				}
			}
		}

		[Bindable(event="propertyChange")]
			public function get moveUp() : Move
		{
			return this._1068263860moveUp;
		}

		public function set moveUp(param1:Move) : void
		{
			var _loc2_:Object = this._1068263860moveUp;
			if(_loc2_ !== param1)
			{
				this._1068263860moveUp = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"moveUp",_loc2_,param1));
				}
			}
		}

		[Bindable(event="propertyChange")]
			public function get mymask() : Group
		{
			return this._1059299688mymask;
		}

		public function set mymask(param1:Group) : void
		{
			var _loc2_:Object = this._1059299688mymask;
			if(_loc2_ !== param1)
			{
				this._1059299688mymask = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mymask",_loc2_,param1));
				}
			}
		}
	}
}
