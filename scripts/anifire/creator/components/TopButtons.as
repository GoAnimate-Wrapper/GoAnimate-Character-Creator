package anifire.creator.components
{
	import anifire.constant.CcLibConstant;
	import anifire.constant.ServerConstants;
	import anifire.creator.events.CcButtonBarEvent;
	import anifire.creator.events.MenuItemEvent;
	import anifire.creator.models.MenuItemModel;
	import anifire.creator.skins.SubscribeTipContainerSkin;
	import anifire.managers.ExternalLinkManager;
	import anifire.managers.ServerConnector;
	import anifire.util.UtilDict;
	import anifire.util.UtilUser;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.utils.getDefinitionByName;
	import flashx.textLayout.elements.LinkElement;
	import flashx.textLayout.elements.ParagraphElement;
	import flashx.textLayout.elements.SpanElement;
	import flashx.textLayout.elements.TextFlow;
	import flashx.textLayout.events.FlowElementMouseEvent;
	import mx.binding.Binding;
	import mx.binding.BindingManager;
	import mx.binding.IBindingClient;
	import mx.binding.IWatcherSetupUtil2;
	import mx.collections.ArrayCollection;
	import mx.controls.Spacer;
	import mx.core.IFlexModuleFactory;
	import mx.core.IStateClient2;
	import mx.core.mx_internal;
	import mx.events.FlexEvent;
	import mx.events.PropertyChangeEvent;
	import mx.graphics.SolidColor;
	import mx.states.SetProperty;
	import mx.states.State;
	import spark.components.Button;
	import spark.components.Group;
	import spark.components.HGroup;
	import spark.components.RichEditableText;
	import spark.effects.Fade;
	import spark.primitives.Rect;

	use namespace mx_internal;

	public class TopButtons extends Group implements IBindingClient, IStateClient2
	{

		private static var _watcherSetupUtil:IWatcherSetupUtil2;


		private var _2126924263_TopButtons_HGroup2:HGroup;

		private var _2126924264_TopButtons_HGroup3:HGroup;

		private var _2093656596btnOther:IconButton;

		private var _206159482btnRedo:IconButton;

		private var _206185977btnSave:IconButton;

		private var _1357233045btnSaveDisabled:IconButton;

		private var _206257504btnUndo:IconButton;

		private var _433014735dropDown:ArrowTipContainer;

		private var _253520497extraMenu:MenuItemList;

		private var _1233089485extraMenuDisplay:PopUpAnchor;

		private var _1282133823fadeIn:Fade;

		private var _295724916modifyButton:Button;

		private var _122158822previewButton:Button;

		private var _2239512subscribeDisplay:PopUpAnchor;

		private var _327806705subscribeTip:ArrowTipContainer;

		private var _1766219762warnLabel:RichEditableText;

		private var __moduleFactoryInitialized:Boolean = false;

		private var _embed_mxml__styles_images_toolbar_btn_redo_init_png_1025927043:Class;

		private var _embed_mxml__styles_images_toolbar_btn_gear_over_png_760727495:Class;

		private var _embed_mxml__styles_images_toolbar_btn_undo_init_png_1035347911:Class;

		private var _embed_mxml__styles_images_toolbar_btn_undo_disabled_png_1489156409:Class;

		private var _embed_mxml__styles_images_toolbar_btn_redo_over_png_1027024699:Class;

		private var _embed_mxml__styles_images_toolbar_btn_save_over_png_757483579:Class;

		private var _embed_mxml__styles_images_toolbar_btn_save_init_png_220669891:Class;

		private var _embed_mxml__styles_images_toolbar_btn_redo_disabled_png_1489476469:Class;

		private var _embed_mxml__styles_images_toolbar_btn_undo_over_png_1017636807:Class;

		private var _embed_mxml__styles_images_toolbar_btn_save_disabled_png_941857077:Class;

		private var _embed_mxml__styles_images_toolbar_btn_gear_init_png_1294223303:Class;

		mx_internal var _bindings:Array;

		mx_internal var _watchers:Array;

		mx_internal var _bindingsByDestination:Object;

		mx_internal var _bindingsBeginWithWord:Object;

		public function TopButtons()
		{
			var target:Object = null;
			var watcherSetupUtilClass:Object = null;
			this._embed_mxml__styles_images_toolbar_btn_redo_init_png_1025927043 = TopButtons__embed_mxml__styles_images_toolbar_btn_redo_init_png_1025927043;
			this._embed_mxml__styles_images_toolbar_btn_gear_over_png_760727495 = TopButtons__embed_mxml__styles_images_toolbar_btn_gear_over_png_760727495;
			this._embed_mxml__styles_images_toolbar_btn_undo_init_png_1035347911 = TopButtons__embed_mxml__styles_images_toolbar_btn_undo_init_png_1035347911;
			this._embed_mxml__styles_images_toolbar_btn_undo_disabled_png_1489156409 = TopButtons__embed_mxml__styles_images_toolbar_btn_undo_disabled_png_1489156409;
			this._embed_mxml__styles_images_toolbar_btn_redo_over_png_1027024699 = TopButtons__embed_mxml__styles_images_toolbar_btn_redo_over_png_1027024699;
			this._embed_mxml__styles_images_toolbar_btn_save_over_png_757483579 = TopButtons__embed_mxml__styles_images_toolbar_btn_save_over_png_757483579;
			this._embed_mxml__styles_images_toolbar_btn_save_init_png_220669891 = TopButtons__embed_mxml__styles_images_toolbar_btn_save_init_png_220669891;
			this._embed_mxml__styles_images_toolbar_btn_redo_disabled_png_1489476469 = TopButtons__embed_mxml__styles_images_toolbar_btn_redo_disabled_png_1489476469;
			this._embed_mxml__styles_images_toolbar_btn_undo_over_png_1017636807 = TopButtons__embed_mxml__styles_images_toolbar_btn_undo_over_png_1017636807;
			this._embed_mxml__styles_images_toolbar_btn_save_disabled_png_941857077 = TopButtons__embed_mxml__styles_images_toolbar_btn_save_disabled_png_941857077;
			this._embed_mxml__styles_images_toolbar_btn_gear_init_png_1294223303 = TopButtons__embed_mxml__styles_images_toolbar_btn_gear_init_png_1294223303;
			this._bindings = [];
			this._watchers = [];
			this._bindingsByDestination = {};
			this._bindingsBeginWithWord = {};
			super();
			mx_internal::_document = this;
			var bindings:Array = this._TopButtons_bindingsSetup();
			var watchers:Array = [];
			target = this;
			if(_watcherSetupUtil == null)
			{
				watcherSetupUtilClass = getDefinitionByName("_anifire_creator_components_TopButtonsWatcherSetupUtil");
				watcherSetupUtilClass["init"](null);
			}
			_watcherSetupUtil.setup(this,function(param1:String):*
					{
					return target[param1];
					},function(param1:String):*
					{
					return TopButtons[param1];
					},bindings,watchers);
			mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
			mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
			this.width = 300;
			this.height = 68;
			this.mxmlContent = [this._TopButtons_Rect1_c(),this._TopButtons_HGroup1_c(),this._TopButtons_PopUpAnchor1_i(),this._TopButtons_PopUpAnchor2_i()];
			this.currentState = "editor";
			this._TopButtons_Fade1_i();
			this.addEventListener("creationComplete",this.___TopButtons_Group1_creationComplete);
			states = [new State({
					"name":"editor",
					"overrides":[new SetProperty().initializeFromObject({
							"target":"_TopButtons_HGroup2",
							"name":"visible",
							"value":true
							}),new SetProperty().initializeFromObject({
								"target":"_TopButtons_HGroup3",
								"name":"visible",
								"value":true
								}),new SetProperty().initializeFromObject({
									"target":"modifyButton",
									"name":"visible",
									"value":false
									}),new SetProperty().initializeFromObject({
										"target":"modifyButton",
										"name":"includeInLayout",
										"value":false
										})]
					}),new State({
						"name":"preview",
						"overrides":[new SetProperty().initializeFromObject({
								"target":"_TopButtons_HGroup2",
								"name":"visible",
								"value":false
								}),new SetProperty().initializeFromObject({
									"target":"_TopButtons_HGroup3",
									"name":"visible",
									"value":true
									}),new SetProperty().initializeFromObject({
										"target":"previewButton",
										"name":"visible",
										"value":false
										}),new SetProperty().initializeFromObject({
											"target":"previewButton",
											"name":"includeInLayout",
											"value":false
											})]
						})];
			var i:uint = 0;
			while(i < bindings.length)
			{
				Binding(bindings[i]).execute();
				i++;
			}
		}

		public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
		{
			TopButtons._watcherSetupUtil = param1;
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

		protected function createMenuModel() : void
		{
			var _loc3_:MenuItemModel = null;
			var _loc4_:MenuItemModel = null;
			var _loc1_:ArrayCollection = new ArrayCollection();
			if(CcLibConstant.RANDOM_CHAR)
			{
				_loc3_ = new MenuItemModel(UtilDict.toDisplay("go","Randomize character"),"random");
				_loc1_.addItem(_loc3_);
			}
			var _loc2_:MenuItemModel = new MenuItemModel(UtilDict.toDisplay("go","Reset character"),"reset");
			_loc1_.addItem(_loc2_);
			if(CcLibConstant.CHANGE_CHAR_SCALE)
			{
				_loc4_ = new MenuItemModel(UtilDict.toDisplay("go","Scaling tool"),"scale");
				_loc1_.addItem(_loc4_);
			}
			this.extraMenu.dataProvider = _loc1_;
			this.refreshRole();
		}

		public function refreshRole() : void
		{
			var _loc1_:String = null;
			var _loc2_:TextFlow = null;
			var _loc3_:Array = null;
			var _loc4_:ParagraphElement = null;
			var _loc5_:SpanElement = null;
			var _loc6_:LinkElement = null;
			var _loc7_:SpanElement = null;
			var _loc8_:SpanElement = null;
			this.btnSave.visible = true;
			this.btnSaveDisabled.visible = false;
			if(CcLibConstant.IS_BUSINESS_THEME && !UtilUser.hasBusinessFeatures)
			{
				this.btnSave.visible = false;
				this.btnSaveDisabled.visible = true;
				_loc1_ = UtilDict.toDisplay("go","To save this character, please {0} to a business plan.");
			}
			else if(UtilUser.userType == UtilUser.BASIC_USER)
			{
				this.btnSave.visible = false;
				this.btnSaveDisabled.visible = true;
				_loc1_ = UtilDict.toDisplay("go","To save this character, please {0} now.");
			}
			if(this.btnSaveDisabled.visible)
			{
				_loc2_ = new TextFlow();
				_loc3_ = _loc1_.split("{0}");
				_loc4_ = new ParagraphElement();
				_loc5_ = new SpanElement();
				_loc5_.text = _loc3_[0];
				_loc4_.addChild(_loc5_);
				_loc6_ = new LinkElement();
				_loc7_ = new SpanElement();
				_loc7_.text = UtilDict.toDisplay("go","subscribe");
				_loc7_.fontFamily = "StudioSparkMain";
				_loc7_.fontWeight = "bold";
				_loc7_.color = 1808298;
				_loc6_.addChild(_loc7_);
				_loc6_.addEventListener(FlowElementMouseEvent.CLICK,this.onUpgradeLinkClick);
				_loc4_.addChild(_loc6_);
				if(_loc3_.length > 1)
				{
					_loc8_ = new SpanElement();
					_loc8_.text = _loc3_[1];
					_loc4_.addChild(_loc8_);
				}
				_loc2_.addChild(_loc4_);
				this.warnLabel.textFlow = _loc2_;
				this.warnLabel.textFlow.fontFamily = "StudioSparkMain";
				this.btnSaveDisabled.addEventListener(MouseEvent.MOUSE_OVER,this.displaySubscribe);
			}
			else
			{
				this.warnLabel.textFlow = null;
				this.btnSaveDisabled.removeEventListener(MouseEvent.MOUSE_OVER,this.displaySubscribe);
			}
		}

		override public function set currentState(param1:String) : void
		{
			if(CcLibConstant.IS_BUSINESS_THEME && !UtilUser.hasBusinessFeatures || UtilUser.userType == UtilUser.BASIC_USER)
			{
				if(param1 == "preview")
				{
					this.subscribeDisplay.displayPopUp = true;
				}
			}
			if(param1 == "editor")
			{
				this.subscribeDisplay.displayPopUp = false;
			}
			super.currentState = param1;
		}

		protected function onUpgradeLinkClick(param1:FlowElementMouseEvent) : void
		{
			ExternalLinkManager.instance.navigateWithSession(ServerConstants.BUSINESS_PLAN_PAGE_PATH,"wndbizplan");
			ServerConnector.instance.onUpsellUpgradePending();
		}

		protected function displaySubscribe(param1:Event) : void
		{
			this.subscribeDisplay.displayPopUp = true;
		}

		protected function displayMenu() : void
		{
			this.extraMenuDisplay.displayPopUp = true;
		}

		protected function onExtraMenuButtonClick(param1:MouseEvent) : void
		{
			this.displayMenu();
		}

		protected function onMenuItemClick(param1:MenuItemEvent) : void
		{
			var _loc2_:String = param1.item.value;
			switch(_loc2_)
			{
				case "random":
					this.dispatchEvent(new CcButtonBarEvent(CcButtonBarEvent.RANDOMIZE_BUTTON_CLICK,this));
					break;
				case "reset":
					this.dispatchEvent(new CcButtonBarEvent(CcButtonBarEvent.RESET_BUTTON_CLICK,this));
					break;
				case "scale":
					this.dispatchEvent(new CcButtonBarEvent(CcButtonBarEvent.SCALE_BUTTON_CLICK,this));
			}
		}

		private function _TopButtons_Fade1_i() : Fade
		{
			var _loc1_:Fade = new Fade();
			_loc1_.alphaFrom = 0;
			_loc1_.alphaTo = 1;
			_loc1_.duration = 300;
			this.fadeIn = _loc1_;
			BindingManager.executeBindings(this,"fadeIn",this.fadeIn);
			return _loc1_;
		}

		private function _TopButtons_Rect1_c() : Rect
		{
			var _loc1_:Rect = new Rect();
			_loc1_.percentWidth = 100;
			_loc1_.percentHeight = 100;
			_loc1_.fill = this._TopButtons_SolidColor1_c();
			_loc1_.initialized(this,null);
			return _loc1_;
		}

		private function _TopButtons_SolidColor1_c() : SolidColor
		{
			var _loc1_:SolidColor = new SolidColor();
			_loc1_.color = 15658734;
			return _loc1_;
		}

		private function _TopButtons_HGroup1_c() : HGroup
		{
			var _loc1_:HGroup = new HGroup();
			_loc1_.width = 300;
			_loc1_.height = 40;
			_loc1_.verticalAlign = "middle";
			_loc1_.horizontalAlign = "right";
			_loc1_.verticalCenter = 0;
			_loc1_.mxmlContent = [this._TopButtons_HGroup2_i(),this._TopButtons_HGroup3_i()];
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}

		private function _TopButtons_HGroup2_i() : HGroup
		{
			var _loc1_:HGroup = new HGroup();
			_loc1_.height = 40;
			_loc1_.verticalAlign = "middle";
			_loc1_.gap = -1;
			_loc1_.horizontalAlign = "right";
			_loc1_.verticalCenter = 0;
			_loc1_.mxmlContent = [this._TopButtons_IconButton1_i(),this._TopButtons_IconButton2_i(),this._TopButtons_Spacer1_c(),this._TopButtons_IconButton3_i()];
			_loc1_.id = "_TopButtons_HGroup2";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._TopButtons_HGroup2 = _loc1_;
			BindingManager.executeBindings(this,"_TopButtons_HGroup2",this._TopButtons_HGroup2);
			return _loc1_;
		}

		private function _TopButtons_IconButton1_i() : IconButton
		{
			var _loc1_:IconButton = new IconButton();
			_loc1_.buttonMode = true;
			_loc1_.styleName = "topToolBar";
			_loc1_.enabled = false;
			_loc1_.setStyle("icon",this._embed_mxml__styles_images_toolbar_btn_undo_init_png_1035347911);
			_loc1_.setStyle("iconOver",this._embed_mxml__styles_images_toolbar_btn_undo_over_png_1017636807);
			_loc1_.setStyle("iconDisabled",this._embed_mxml__styles_images_toolbar_btn_undo_disabled_png_1489156409);
			_loc1_.addEventListener("click",this.__btnUndo_click);
			_loc1_.id = "btnUndo";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.btnUndo = _loc1_;
			BindingManager.executeBindings(this,"btnUndo",this.btnUndo);
			return _loc1_;
		}

		public function __btnUndo_click(param1:MouseEvent) : void
		{
			this.dispatchEvent(new CcButtonBarEvent(CcButtonBarEvent.UNDO_BUTTON_CLICK,this));
		}

		private function _TopButtons_IconButton2_i() : IconButton
		{
			var _loc1_:IconButton = new IconButton();
			_loc1_.buttonMode = true;
			_loc1_.styleName = "topToolBar";
			_loc1_.enabled = false;
			_loc1_.setStyle("icon",this._embed_mxml__styles_images_toolbar_btn_redo_init_png_1025927043);
			_loc1_.setStyle("iconOver",this._embed_mxml__styles_images_toolbar_btn_redo_over_png_1027024699);
			_loc1_.setStyle("iconDisabled",this._embed_mxml__styles_images_toolbar_btn_redo_disabled_png_1489476469);
			_loc1_.addEventListener("click",this.__btnRedo_click);
			_loc1_.id = "btnRedo";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.btnRedo = _loc1_;
			BindingManager.executeBindings(this,"btnRedo",this.btnRedo);
			return _loc1_;
		}

		public function __btnRedo_click(param1:MouseEvent) : void
		{
			this.dispatchEvent(new CcButtonBarEvent(CcButtonBarEvent.REDO_BUTTON_CLICK,this));
		}

		private function _TopButtons_Spacer1_c() : Spacer
		{
			var _loc1_:Spacer = new Spacer();
			_loc1_.width = 15;
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}

		private function _TopButtons_IconButton3_i() : IconButton
		{
			var _loc1_:IconButton = new IconButton();
			_loc1_.buttonMode = true;
			_loc1_.focusEnabled = false;
			_loc1_.tabEnabled = false;
			_loc1_.setStyle("icon",this._embed_mxml__styles_images_toolbar_btn_gear_init_png_1294223303);
			_loc1_.setStyle("iconOver",this._embed_mxml__styles_images_toolbar_btn_gear_over_png_760727495);
			_loc1_.addEventListener("click",this.__btnOther_click);
			_loc1_.id = "btnOther";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.btnOther = _loc1_;
			BindingManager.executeBindings(this,"btnOther",this.btnOther);
			return _loc1_;
		}

		public function __btnOther_click(param1:MouseEvent) : void
		{
			this.onExtraMenuButtonClick(param1);
		}

		private function _TopButtons_HGroup3_i() : HGroup
		{
			var _loc1_:HGroup = new HGroup();
			_loc1_.height = 40;
			_loc1_.verticalAlign = "middle";
			_loc1_.gap = -1;
			_loc1_.horizontalAlign = "right";
			_loc1_.verticalCenter = 0;
			_loc1_.mxmlContent = [this._TopButtons_Spacer2_c(),this._TopButtons_Button1_i(),this._TopButtons_Button2_i(),this._TopButtons_Spacer3_c(),this._TopButtons_Group2_c()];
			_loc1_.id = "_TopButtons_HGroup3";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._TopButtons_HGroup3 = _loc1_;
			BindingManager.executeBindings(this,"_TopButtons_HGroup3",this._TopButtons_HGroup3);
			return _loc1_;
		}

		private function _TopButtons_Spacer2_c() : Spacer
		{
			var _loc1_:Spacer = new Spacer();
			_loc1_.width = 15;
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}

		private function _TopButtons_Button1_i() : Button
		{
			var _loc1_:Button = new Button();
			_loc1_.buttonMode = true;
			_loc1_.styleName = "default";
			_loc1_.width = 85;
			_loc1_.addEventListener("click",this.__previewButton_click);
			_loc1_.id = "previewButton";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.previewButton = _loc1_;
			BindingManager.executeBindings(this,"previewButton",this.previewButton);
			return _loc1_;
		}

		public function __previewButton_click(param1:MouseEvent) : void
		{
			this.dispatchEvent(new CcButtonBarEvent(CcButtonBarEvent.PREVIEW_BUTTON_CLICK,this));
		}

		private function _TopButtons_Button2_i() : Button
		{
			var _loc1_:Button = new Button();
			_loc1_.buttonMode = true;
			_loc1_.styleName = "default";
			_loc1_.width = 85;
			_loc1_.addEventListener("click",this.__modifyButton_click);
			_loc1_.id = "modifyButton";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.modifyButton = _loc1_;
			BindingManager.executeBindings(this,"modifyButton",this.modifyButton);
			return _loc1_;
		}

		public function __modifyButton_click(param1:MouseEvent) : void
		{
			this.dispatchEvent(new CcButtonBarEvent(CcButtonBarEvent.MODIFY_BUTTON_CLICK,this));
		}

		private function _TopButtons_Spacer3_c() : Spacer
		{
			var _loc1_:Spacer = new Spacer();
			_loc1_.width = 15;
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}

		private function _TopButtons_Group2_c() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.horizontalCenter = 0;
			_loc1_.verticalCenter = 0;
			_loc1_.mxmlContent = [this._TopButtons_IconButton4_i(),this._TopButtons_IconButton5_i()];
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}

		private function _TopButtons_IconButton4_i() : IconButton
		{
			var _loc1_:IconButton = new IconButton();
			_loc1_.buttonMode = true;
			_loc1_.horizontalCenter = 0;
			_loc1_.verticalCenter = 0;
			_loc1_.enabled = true;
			_loc1_.visible = false;
			_loc1_.setStyle("icon",this._embed_mxml__styles_images_toolbar_btn_save_disabled_png_941857077);
			_loc1_.setStyle("iconOver",this._embed_mxml__styles_images_toolbar_btn_save_disabled_png_941857077);
			_loc1_.id = "btnSaveDisabled";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.btnSaveDisabled = _loc1_;
			BindingManager.executeBindings(this,"btnSaveDisabled",this.btnSaveDisabled);
			return _loc1_;
		}

		private function _TopButtons_IconButton5_i() : IconButton
		{
			var _loc1_:IconButton = new IconButton();
			_loc1_.buttonMode = true;
			_loc1_.styleName = "topToolBar";
			_loc1_.enabled = true;
			_loc1_.setStyle("icon",this._embed_mxml__styles_images_toolbar_btn_save_init_png_220669891);
			_loc1_.setStyle("iconOver",this._embed_mxml__styles_images_toolbar_btn_save_over_png_757483579);
			_loc1_.addEventListener("click",this.__btnSave_click);
			_loc1_.id = "btnSave";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.btnSave = _loc1_;
			BindingManager.executeBindings(this,"btnSave",this.btnSave);
			return _loc1_;
		}

		public function __btnSave_click(param1:MouseEvent) : void
		{
			this.dispatchEvent(new CcButtonBarEvent(CcButtonBarEvent.SAVE_BUTTON_CLICK,this));
		}

		private function _TopButtons_PopUpAnchor1_i() : PopUpAnchor
		{
			var _loc1_:PopUpAnchor = new PopUpAnchor();
			_loc1_.percentWidth = 100;
			_loc1_.bottom = 0;
			_loc1_.popUpPosition = "belowRight";
			_loc1_.right = 20;
			_loc1_.popUp = this._TopButtons_ArrowTipContainer1_i();
			_loc1_.id = "extraMenuDisplay";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.extraMenuDisplay = _loc1_;
			BindingManager.executeBindings(this,"extraMenuDisplay",this.extraMenuDisplay);
			return _loc1_;
		}

		private function _TopButtons_ArrowTipContainer1_i() : ArrowTipContainer
		{
			var _loc1_:ArrowTipContainer = new ArrowTipContainer();
			_loc1_.left = 5;
			_loc1_.right = 5;
			_loc1_.top = 5;
			_loc1_.bottom = 5;
			_loc1_.tipPosition = "below";
			_loc1_.targetWidth = 20;
			_loc1_.offset = 15;
			_loc1_.content = [this._TopButtons_MenuItemList1_i()];
			_loc1_.id = "dropDown";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.dropDown = _loc1_;
			BindingManager.executeBindings(this,"dropDown",this.dropDown);
			return _loc1_;
		}

		private function _TopButtons_MenuItemList1_i() : MenuItemList
		{
			var _loc1_:MenuItemList = new MenuItemList();
			_loc1_.top = 5;
			_loc1_.bottom = 5;
			_loc1_.addEventListener("itemClick",this.__extraMenu_itemClick);
			_loc1_.id = "extraMenu";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.extraMenu = _loc1_;
			BindingManager.executeBindings(this,"extraMenu",this.extraMenu);
			return _loc1_;
		}

		public function __extraMenu_itemClick(param1:MenuItemEvent) : void
		{
			this.onMenuItemClick(param1);
		}

		private function _TopButtons_PopUpAnchor2_i() : PopUpAnchor
		{
			var _loc1_:PopUpAnchor = new PopUpAnchor();
			_loc1_.maxWidth = 160;
			_loc1_.bottom = 0;
			_loc1_.popUpPosition = "belowCenter";
			_loc1_.right = 2;
			_loc1_.popUp = this._TopButtons_ArrowTipContainer2_i();
			_loc1_.id = "subscribeDisplay";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.subscribeDisplay = _loc1_;
			BindingManager.executeBindings(this,"subscribeDisplay",this.subscribeDisplay);
			return _loc1_;
		}

		private function _TopButtons_ArrowTipContainer2_i() : ArrowTipContainer
		{
			var _loc1_:ArrowTipContainer = new ArrowTipContainer();
			_loc1_.left = 5;
			_loc1_.right = 5;
			_loc1_.top = 5;
			_loc1_.bottom = 5;
			_loc1_.tipPosition = "belowRight";
			_loc1_.targetWidth = 20;
			_loc1_.offset = 15;
			_loc1_.content = [this._TopButtons_RichEditableText1_i()];
			_loc1_.setStyle("skinClass",SubscribeTipContainerSkin);
			_loc1_.id = "subscribeTip";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.subscribeTip = _loc1_;
			BindingManager.executeBindings(this,"subscribeTip",this.subscribeTip);
			return _loc1_;
		}

		private function _TopButtons_RichEditableText1_i() : RichEditableText
		{
			var _loc1_:RichEditableText = new RichEditableText();
			_loc1_.multiline = true;
			_loc1_.minWidth = 140;
			_loc1_.maxWidth = 160;
			_loc1_.editable = false;
			_loc1_.focusEnabled = false;
			_loc1_.selectable = false;
			_loc1_.verticalCenter = 0;
			_loc1_.setStyle("fontSize",13);
			_loc1_.setStyle("color",16777215);
			_loc1_.setStyle("textAlign","left");
			_loc1_.setStyle("paddingLeft",15);
			_loc1_.setStyle("paddingRight",15);
			_loc1_.setStyle("paddingTop",15);
			_loc1_.setStyle("paddingBottom",15);
			_loc1_.id = "warnLabel";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.warnLabel = _loc1_;
			BindingManager.executeBindings(this,"warnLabel",this.warnLabel);
			return _loc1_;
		}

		public function ___TopButtons_Group1_creationComplete(param1:FlexEvent) : void
		{
			this.createMenuModel();
		}

		private function _TopButtons_bindingsSetup() : Array
		{
			var result:Array = [];
			result[0] = new Binding(this,function():String
					{
					var _loc1_:* = UtilDict.toDisplay("go","Undo");
					return _loc1_ == undefined?null:String(_loc1_);
					},null,"btnUndo.label");
			result[1] = new Binding(this,function():String
					{
					var _loc1_:* = UtilDict.toDisplay("go","Redo");
					return _loc1_ == undefined?null:String(_loc1_);
					},null,"btnRedo.label");
			result[2] = new Binding(this,function():String
					{
					var _loc1_:* = UtilDict.toDisplay("go","PREVIEW");
					return _loc1_ == undefined?null:String(_loc1_);
					},null,"previewButton.label");
			result[3] = new Binding(this,function():String
					{
					var _loc1_:* = UtilDict.toDisplay("go","MODIFY");
					return _loc1_ == undefined?null:String(_loc1_);
					},null,"modifyButton.label");
			result[4] = new Binding(this,function():String
					{
					var _loc1_:* = UtilDict.toDisplay("go","Save");
					return _loc1_ == undefined?null:String(_loc1_);
					},null,"btnSave.label");
			result[5] = new Binding(this,null,function(param1:*):void
					{
					subscribeTip.setStyle("showEffect",param1);
					},"subscribeTip.showEffect","fadeIn");
			return result;
		}

		[Bindable(event="propertyChange")]
			public function get _TopButtons_HGroup2() : HGroup
		{
			return this._2126924263_TopButtons_HGroup2;
		}

		public function set _TopButtons_HGroup2(param1:HGroup) : void
		{
			var _loc2_:Object = this._2126924263_TopButtons_HGroup2;
			if(_loc2_ !== param1)
			{
				this._2126924263_TopButtons_HGroup2 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_TopButtons_HGroup2",_loc2_,param1));
				}
			}
		}

		[Bindable(event="propertyChange")]
			public function get _TopButtons_HGroup3() : HGroup
		{
			return this._2126924264_TopButtons_HGroup3;
		}

		public function set _TopButtons_HGroup3(param1:HGroup) : void
		{
			var _loc2_:Object = this._2126924264_TopButtons_HGroup3;
			if(_loc2_ !== param1)
			{
				this._2126924264_TopButtons_HGroup3 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_TopButtons_HGroup3",_loc2_,param1));
				}
			}
		}

		[Bindable(event="propertyChange")]
			public function get btnOther() : IconButton
		{
			return this._2093656596btnOther;
		}

		public function set btnOther(param1:IconButton) : void
		{
			var _loc2_:Object = this._2093656596btnOther;
			if(_loc2_ !== param1)
			{
				this._2093656596btnOther = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnOther",_loc2_,param1));
				}
			}
		}

		[Bindable(event="propertyChange")]
			public function get btnRedo() : IconButton
		{
			return this._206159482btnRedo;
		}

		public function set btnRedo(param1:IconButton) : void
		{
			var _loc2_:Object = this._206159482btnRedo;
			if(_loc2_ !== param1)
			{
				this._206159482btnRedo = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnRedo",_loc2_,param1));
				}
			}
		}

		[Bindable(event="propertyChange")]
			public function get btnSave() : IconButton
		{
			return this._206185977btnSave;
		}

		public function set btnSave(param1:IconButton) : void
		{
			var _loc2_:Object = this._206185977btnSave;
			if(_loc2_ !== param1)
			{
				this._206185977btnSave = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnSave",_loc2_,param1));
				}
			}
		}

		[Bindable(event="propertyChange")]
			public function get btnSaveDisabled() : IconButton
		{
			return this._1357233045btnSaveDisabled;
		}

		public function set btnSaveDisabled(param1:IconButton) : void
		{
			var _loc2_:Object = this._1357233045btnSaveDisabled;
			if(_loc2_ !== param1)
			{
				this._1357233045btnSaveDisabled = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnSaveDisabled",_loc2_,param1));
				}
			}
		}

		[Bindable(event="propertyChange")]
			public function get btnUndo() : IconButton
		{
			return this._206257504btnUndo;
		}

		public function set btnUndo(param1:IconButton) : void
		{
			var _loc2_:Object = this._206257504btnUndo;
			if(_loc2_ !== param1)
			{
				this._206257504btnUndo = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnUndo",_loc2_,param1));
				}
			}
		}

		[Bindable(event="propertyChange")]
			public function get dropDown() : ArrowTipContainer
		{
			return this._433014735dropDown;
		}

		public function set dropDown(param1:ArrowTipContainer) : void
		{
			var _loc2_:Object = this._433014735dropDown;
			if(_loc2_ !== param1)
			{
				this._433014735dropDown = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dropDown",_loc2_,param1));
				}
			}
		}

		[Bindable(event="propertyChange")]
			public function get extraMenu() : MenuItemList
		{
			return this._253520497extraMenu;
		}

		public function set extraMenu(param1:MenuItemList) : void
		{
			var _loc2_:Object = this._253520497extraMenu;
			if(_loc2_ !== param1)
			{
				this._253520497extraMenu = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"extraMenu",_loc2_,param1));
				}
			}
		}

		[Bindable(event="propertyChange")]
			public function get extraMenuDisplay() : PopUpAnchor
		{
			return this._1233089485extraMenuDisplay;
		}

		public function set extraMenuDisplay(param1:PopUpAnchor) : void
		{
			var _loc2_:Object = this._1233089485extraMenuDisplay;
			if(_loc2_ !== param1)
			{
				this._1233089485extraMenuDisplay = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"extraMenuDisplay",_loc2_,param1));
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
			public function get modifyButton() : Button
		{
			return this._295724916modifyButton;
		}

		public function set modifyButton(param1:Button) : void
		{
			var _loc2_:Object = this._295724916modifyButton;
			if(_loc2_ !== param1)
			{
				this._295724916modifyButton = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"modifyButton",_loc2_,param1));
				}
			}
		}

		[Bindable(event="propertyChange")]
			public function get previewButton() : Button
		{
			return this._122158822previewButton;
		}

		public function set previewButton(param1:Button) : void
		{
			var _loc2_:Object = this._122158822previewButton;
			if(_loc2_ !== param1)
			{
				this._122158822previewButton = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"previewButton",_loc2_,param1));
				}
			}
		}

		[Bindable(event="propertyChange")]
			public function get subscribeDisplay() : PopUpAnchor
		{
			return this._2239512subscribeDisplay;
		}

		public function set subscribeDisplay(param1:PopUpAnchor) : void
		{
			var _loc2_:Object = this._2239512subscribeDisplay;
			if(_loc2_ !== param1)
			{
				this._2239512subscribeDisplay = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"subscribeDisplay",_loc2_,param1));
				}
			}
		}

		[Bindable(event="propertyChange")]
			public function get subscribeTip() : ArrowTipContainer
		{
			return this._327806705subscribeTip;
		}

		public function set subscribeTip(param1:ArrowTipContainer) : void
		{
			var _loc2_:Object = this._327806705subscribeTip;
			if(_loc2_ !== param1)
			{
				this._327806705subscribeTip = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"subscribeTip",_loc2_,param1));
				}
			}
		}

		[Bindable(event="propertyChange")]
			public function get warnLabel() : RichEditableText
		{
			return this._1766219762warnLabel;
		}

		public function set warnLabel(param1:RichEditableText) : void
		{
			var _loc2_:Object = this._1766219762warnLabel;
			if(_loc2_ !== param1)
			{
				this._1766219762warnLabel = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"warnLabel",_loc2_,param1));
				}
			}
		}
	}
}
