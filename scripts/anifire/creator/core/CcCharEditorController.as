package anifire.creator.core
{
	import anifire.constant.CcLibConstant;
	import anifire.creator.events.CcBodyShapeChooserEvent;
	import anifire.creator.events.CcButtonBarEvent;
	import anifire.creator.events.CcColorPickerEvent;
	import anifire.creator.events.CcComponentThumbChooserEvent;
	import anifire.creator.events.CcComponentTypeChooserEvent;
	import anifire.creator.events.CcCoreEvent;
	import anifire.creator.events.CcPreMadeCharChooserEvent;
	import anifire.creator.events.CcScaleChosenEvent;
	import anifire.creator.events.CcSelectedDecorationEvent;
	import anifire.creator.events.CcThumbPropertyEvent;
	import anifire.creator.events.CcThumbScaleEvent;
	import anifire.creator.interfaces.ICcCharEditorContainer;
	import anifire.creator.interfaces.IConfiguration;
	import anifire.creator.models.CcBodyShape;
	import anifire.creator.models.CcCharacter;
	import anifire.creator.models.CcColor;
	import anifire.creator.models.CcComponent;
	import anifire.creator.models.CcComponentThumb;
	import anifire.creator.models.CcLibrary;
	import anifire.creator.models.CcTemplate;
	import anifire.creator.models.CcTheme;
	import anifire.event.LoadEmbedMovieEvent;
	import anifire.util.UtilHashArray;
	import flash.display.BitmapData;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.geom.Point;
	import flash.utils.ByteArray;
	import mx.graphics.codec.PNGEncoder;

	public class CcCharEditorController extends EventDispatcher
	{


		private var _ccChar:CcCharacter;

		private var _currentTheme:CcTheme;

		private var _commands:Array;

		private var _currentCommandIndex:Number = -1;

		private var _moneyMode:int;

		private var _isUserLogined:Boolean;

		private var _ui_ce_container:ICcCharEditorContainer;

		private var _userLevel:int;

		private var _ccCharCopyForReset:CcCharacter;

		private var _currentComponentType:String;

		private var isNewCharInsteadOfExistingChar:Boolean;

		private var _cfg:IConfiguration;

		private var _coupon:int;

		public function CcCharEditorController(param1:IEventDispatcher = null)
		{
			this._commands = new Array();
			super(param1);
		}

		public function get configuration() : IConfiguration
		{
			return this._cfg;
		}

		public function set configuration(param1:IConfiguration) : void
		{
			this._cfg = param1;
		}

		private function get coupon() : int
		{
			return this._coupon;
		}

		private function get currentComponentType() : String
		{
			return this._currentComponentType;
		}

		private function set currentComponentType(param1:String) : void
		{
			this._currentComponentType = param1;
		}

		private function get ccCharCopyForReset() : CcCharacter
		{
			return this._ccCharCopyForReset;
		}

		private function set ccCharCopyForReset(param1:CcCharacter) : void
		{
			this._ccCharCopyForReset = param1;
		}

		private function get ui_ce_container() : ICcCharEditorContainer
		{
			return this._ui_ce_container;
		}

		private function get isUserLogined() : Boolean
		{
			return this._isUserLogined;
		}

		private function get moneyMode() : int
		{
			return this._moneyMode;
		}

		private function get userLevel() : int
		{
			return this._userLevel;
		}

		private function addCommand(param1:CcCharacter) : void
		{
			var _loc2_:Array = this._commands.slice(0,this._currentCommandIndex);
			_loc2_.push(param1.clone());
			this._commands = _loc2_;
			this._currentCommandIndex = this._commands.length;
			this.ui_ce_container.ui_ce_buttonBar.btnUndo.enabled = this._commands.length > 1?true:false;
			this.ui_ce_container.ui_ce_buttonBar.btnRedo.enabled = false;
		}

		public function get ccChar() : CcCharacter
		{
			return this._ccChar;
		}

		public function copyCcChar(param1:CcCharacter) : void
		{
			this._ccChar.cloneFromSourceToMe(param1);
		}

		private function get currentTheme() : CcTheme
		{
			return this._currentTheme;
		}

		public function initUi(param1:ICcCharEditorContainer) : void
		{
			this._ui_ce_container = param1;
			this.ui_ce_container.ui_ce_buttonBar.btnRedo.enabled = this.ui_ce_container.ui_ce_buttonBar.btnUndo.enabled = false;
			this.ui_ce_container.ui_ce_buttonBar.addEventListener(CcButtonBarEvent.UNDO_BUTTON_CLICK,this.onUserClickUndoButton);
			this.ui_ce_container.ui_ce_buttonBar.addEventListener(CcButtonBarEvent.REDO_BUTTON_CLICK,this.onUserClickRedoButton);
			this.ui_ce_container.ui_ce_buttonBar.addEventListener(CcButtonBarEvent.PREVIEW_BUTTON_CLICK,this.onUserClickPreviewButton);
			this.ui_ce_container.ui_ce_buttonBar.addEventListener(CcButtonBarEvent.MODIFY_BUTTON_CLICK,this.onUserClickModifyButton);
			this.ui_ce_container.ui_ce_buttonBar.addEventListener(CcButtonBarEvent.SAVE_BUTTON_CLICK,this.onUserClickSaveButton);
			this.ui_ce_container.ui_ce_buttonBar.addEventListener(CcButtonBarEvent.RANDOMIZE_BUTTON_CLICK,this.onUserClickRandomizeButton);
			this.ui_ce_container.ui_ce_buttonBar.addEventListener(CcButtonBarEvent.SCALE_BUTTON_CLICK,this.onUserClickScaleButton);
			this.ui_ce_container.ui_ce_buttonBar.addEventListener(CcButtonBarEvent.RESET_BUTTON_CLICK,this.onUserWantToReset);
			this.ui_ce_container.ui_ce_componentTypeChooser.addEventListener(CcComponentTypeChooserEvent.COMPONENT_TYPE_CHOSEN,this.onUserChooseType);
			this.ui_ce_container.ui_ce_componentTypeChooser.addEventListener(CcButtonBarEvent.SAVE_BUTTON_CLICK,this.onUserClickSaveButton);
			this.ui_ce_container.ui_ce_colorPicker.addEventListener(CcColorPickerEvent.COLOR_CHOSEN,this.onUserChooseColor);
			this.ui_ce_container.ui_ce_componentThumbChooser.thumbFilter = this._cfg.defaultThumbFilter;
			this.ui_ce_container.ui_ce_componentThumbChooser.addEventListener(CcComponentThumbChooserEvent.COMPONENT_THUMB_CHOSEN,this.onUserChooseThumb);
			this.ui_ce_container.ui_ce_componentThumbChooser.addEventListener(CcComponentThumbChooserEvent.NONE_COMPONENT_THUMB_CHOSEN,this.onUserChooseNullThumb);
			this.ui_ce_container.ui_ce_clothesChooser.addEventListener(CcComponentThumbChooserEvent.COMPONENT_THUMB_CHOSEN,this.onUserChooseCloth);
			this.ui_ce_container.ui_ce_clothesChooser.addEventListener(CcThumbScaleEvent.CCTHUMB_SCALE_UPDATE,this.onUserEditScale);
			this.ui_ce_container.ui_ce_thumbPropertyInspector.addEventListener(CcThumbPropertyEvent.CCPROP_UP_BUTTON_CLICK,this.onUserEditComponentProperty);
			this.ui_ce_container.ui_ce_thumbPropertyInspector.addEventListener(CcThumbPropertyEvent.CCPROP_DOWN_BUTTON_CLICK,this.onUserEditComponentProperty);
			this.ui_ce_container.ui_ce_thumbPropertyInspector.addEventListener(CcThumbPropertyEvent.CCPROP_LEFT_BUTTON_CLICK,this.onUserEditComponentProperty);
			this.ui_ce_container.ui_ce_thumbPropertyInspector.addEventListener(CcThumbPropertyEvent.CCPROP_RIGHT_BUTTON_CLICK,this.onUserEditComponentProperty);
			this.ui_ce_container.ui_ce_thumbPropertyInspector.addEventListener(CcThumbPropertyEvent.CCPROP_SCALEUP_BUTTON_CLICK,this.onUserEditComponentProperty);
			this.ui_ce_container.ui_ce_thumbPropertyInspector.addEventListener(CcThumbPropertyEvent.CCPROP_SCALEDOWN_BUTTON_CLICK,this.onUserEditComponentProperty);
			this.ui_ce_container.ui_ce_thumbPropertyInspector.addEventListener(CcThumbPropertyEvent.CCPROP_SCALEXUP_BUTTON_CLICK,this.onUserEditComponentProperty);
			this.ui_ce_container.ui_ce_thumbPropertyInspector.addEventListener(CcThumbPropertyEvent.CCPROP_SCALEXDOWN_BUTTON_CLICK,this.onUserEditComponentProperty);
			this.ui_ce_container.ui_ce_thumbPropertyInspector.addEventListener(CcThumbPropertyEvent.CCPROP_SCALEYUP_BUTTON_CLICK,this.onUserEditComponentProperty);
			this.ui_ce_container.ui_ce_thumbPropertyInspector.addEventListener(CcThumbPropertyEvent.CCPROP_SCALEYDOWN_BUTTON_CLICK,this.onUserEditComponentProperty);
			this.ui_ce_container.ui_ce_thumbPropertyInspector.addEventListener(CcThumbPropertyEvent.CCPROP_ROTATEUP_BUTTON_CLICK,this.onUserEditComponentProperty);
			this.ui_ce_container.ui_ce_thumbPropertyInspector.addEventListener(CcThumbPropertyEvent.CCPROP_ROTATEDOWN_BUTTON_CLICK,this.onUserEditComponentProperty);
			this.ui_ce_container.ui_ce_thumbPropertyInspector.addEventListener(CcThumbPropertyEvent.CCPROP_OFFSETUP_BUTTON_CLICK,this.onUserEditComponentProperty);
			this.ui_ce_container.ui_ce_thumbPropertyInspector.addEventListener(CcThumbPropertyEvent.CCPROP_OFFSETDOWN_BUTTON_CLICK,this.onUserEditComponentProperty);
			this.ui_ce_container.ui_ce_thumbPropertyInspector.addEventListener(CcThumbPropertyEvent.CCPROP_LOCATION_UPDATE,this.onUserUpdateComponentProperty);
			this.ui_ce_container.ui_ce_selectedDecoration.addEventListener(CcSelectedDecorationEvent.DECORATION_CHOOSEN,this.onUserChooseDecoration);
			this.ui_ce_container.ui_ce_selectedDecoration.addEventListener(CcSelectedDecorationEvent.DECORATION_MOUSE_OVER,this.onUserOverDecoration);
			this.ui_ce_container.ui_ce_selectedDecoration.addEventListener(CcSelectedDecorationEvent.DECORATION_MOUSE_OUT,this.onUserOutDecoration);
			this.ui_ce_container.ui_ce_selectedDecoration.addEventListener(CcSelectedDecorationEvent.DECORATION_DELETED,this.onUserDeleteDecoration);
			this.ui_ce_container.ui_ce_charPreviewer.charCanvasHeight = 280;
		}

		public function proceedToShow() : void
		{
			this.ui_ce_container.ui_ce_buttonBar.currentState = "editor";
		}

		public function resetCCAction() : void
		{
			this.ui_ce_container.ui_ce_charPreviewer.addEventListener(LoadEmbedMovieEvent.COMPLETE_EVENT,this.onResetCCActionComplete);
			this.ui_ce_container.ui_ce_charPreviewer.initByCcChar(this.ccChar,this.ccChar.bodyShape.thumbnailActionId);
		}

		private function onResetCCActionComplete(param1:Event) : void
		{
			this.ui_ce_container.ui_ce_charPreviewer.removeEventListener(LoadEmbedMovieEvent.COMPLETE_EVENT,this.onResetCCActionComplete);
			this.dispatchEvent(param1);
		}

		private function onUserClickScaleButton(param1:Event) : void
		{
			this.initScalePanel();
			this.ui_ce_container.ui_ce_charScaleChooser.show();
		}

		private function initScalePanel() : void
		{
			var _loc1_:Array = CcLibConstant.DEFAULT_HEADSCALES;
			var _loc2_:Array = CcLibConstant.DEFAULT_BODYSCALES;
			var _loc3_:Array = CcLibConstant.DEFAULT_HEADPOS;
			this.ui_ce_container.ui_ce_charScaleChooser.updateSliders(this.ccChar.bodyScale.x * 100,this.ccChar.headScale.x * 100);
			this.ui_ce_container.ui_ce_charScaleChooser.addEventListener(CcScaleChosenEvent.SCALE_CHOSEN,this.onUserSelectedScale);
		}

		private function onUserSelectedScale(param1:CcScaleChosenEvent) : void
		{
			if(param1.head_scale)
			{
				this.ccChar.headScale = new Point(param1.head_scale,param1.head_scale);
				this.ui_ce_container.ui_ce_charPreviewer.setHeadScale(this.ccChar.headScale.x,this.ccChar.headScale.y);
				this.ui_ce_container.ui_ce_facePreviewer.setHeadScale(this.ccChar.headScale.x,this.ccChar.headScale.y);
			}
			if(param1.body_scale)
			{
				this.ccChar.bodyScale = new Point(param1.body_scale,param1.body_scale);
				this.ui_ce_container.ui_ce_charPreviewer.setBodyScale(this.ccChar.bodyScale.x,this.ccChar.bodyScale.y);
				this.ui_ce_container.ui_ce_facePreviewer.setBodyScale(this.ccChar.bodyScale.x,this.ccChar.bodyScale.y);
			}
			if(param1.head_pos)
			{
				this.ccChar.headShift = new Point(param1.head_pos.x,param1.head_pos.y);
				this.ui_ce_container.ui_ce_charPreviewer.resetHeadPos();
				this.ui_ce_container.ui_ce_charPreviewer.setHeadPos(this.ccChar.headShift.x,this.ccChar.headShift.y);
				this.ui_ce_container.ui_ce_facePreviewer.resetHeadPos();
				this.ui_ce_container.ui_ce_facePreviewer.setHeadPos(this.ccChar.headShift.x,this.ccChar.headShift.y);
			}
			if(param1.head_shift)
			{
				this.ui_ce_container.ui_ce_charPreviewer.setHeadPos(param1.head_shift.x,param1.head_shift.y);
				this.ui_ce_container.ui_ce_facePreviewer.setHeadPos(param1.head_shift.x,param1.head_shift.y);
				this.ccChar.headShift = this.ui_ce_container.ui_ce_charPreviewer.getHeadPos();
			}
			this.ui_ce_container.ui_ce_charPreviewer.reloadSkin();
			this.ui_ce_container.ui_ce_facePreviewer.reloadSkin();
		}

		private function onUserWantToReset(param1:Event) : void
		{
			this.ccChar.cloneFromSourceToMe(this.ccCharCopyForReset);
			this.propagateNewCharToUi(this.ccChar);
			this.refreshCurrentUi();
			this.addCommand(this.ccChar);
		}

		private function onUserOverDecoration(param1:CcSelectedDecorationEvent) : void
		{
			var _loc2_:CcComponent = param1.ccComponent;
			this.ui_ce_container.ui_ce_charPreviewer.highlightComponent(_loc2_);
			this.ui_ce_container.ui_ce_facePreviewer.highlightComponent(_loc2_);
		}

		private function onUserOutDecoration(param1:CcSelectedDecorationEvent) : void
		{
			var _loc2_:CcComponent = param1.ccComponent;
			this.ui_ce_container.ui_ce_charPreviewer.removeHighlightComponent(_loc2_);
			this.ui_ce_container.ui_ce_facePreviewer.removeHighlightComponent(_loc2_);
		}

		private function onUserChooseDecoration(param1:CcSelectedDecorationEvent) : void
		{
			var _loc2_:CcComponent = param1.ccComponent;
			this.ui_ce_container.ui_ce_colorPicker.destroy();
			this.ui_ce_container.ui_ce_thumbPropertyInspector.destroy();
			this.ui_ce_container.ui_ce_colorPicker.addComponentType(_loc2_,_loc2_.componentThumb.type,this.currentTheme,this.ccChar);
			this.ui_ce_container.ui_ce_colorPicker.addComponentThumb(_loc2_,_loc2_.componentThumb,this.currentTheme,this.ccChar);
			this.ui_ce_container.ui_ce_thumbPropertyInspector.init(_loc2_,this.userLevel);
		}

		private function onUserDeleteDecoration(param1:CcSelectedDecorationEvent) : void
		{
			var _loc2_:CcComponent = param1.ccComponent;
			this.ui_ce_container.ui_ce_colorPicker.destroy();
			this.ui_ce_container.ui_ce_thumbPropertyInspector.destroy();
			this.ui_ce_container.ui_ce_charPreviewer.removeComponent(_loc2_);
			this.ui_ce_container.ui_ce_facePreviewer.removeComponent(_loc2_);
			this.ccChar.removeUserChosenComponentById(_loc2_.id);
			this.addCommand(this.ccChar);
		}

		private function onUserChoosePreMadeChar(param1:CcPreMadeCharChooserEvent) : void
		{
			var _loc5_:CcComponent = null;
			var _loc2_:CcCharacter = param1.ccCharChosen;
			this.copyCcChar(_loc2_);
			this.ui_ce_container.ui_ce_thumbPropertyInspector.destroy();
			var _loc3_:Number = this.ccChar.getUserChosenComponentSize();
			var _loc4_:int = 0;
			while(_loc4_ < _loc3_)
			{
				_loc5_ = this.ccChar.getUserChosenComponentByIndex(_loc4_);
				if(_loc5_.componentThumb.type == this.currentComponentType)
				{
					this.ui_ce_container.ui_ce_thumbPropertyInspector.init(_loc5_,this.userLevel);
				}
				_loc4_++;
			}
			this.propagateNewCharToUi(this.ccChar);
			if(this.currentComponentType)
			{
				this.refreshCurrentUi();
			}
			this.addCommand(this.ccChar);
		}

		private function onUserEditComponentProperty(param1:CcThumbPropertyEvent) : void
		{
			switch(param1.type)
			{
				case CcThumbPropertyEvent.CCPROP_UP_BUTTON_CLICK:
					param1.component.y--;
					break;
				case CcThumbPropertyEvent.CCPROP_DOWN_BUTTON_CLICK:
					param1.component.y++;
					break;
				case CcThumbPropertyEvent.CCPROP_LEFT_BUTTON_CLICK:
					param1.component.x++;
					break;
				case CcThumbPropertyEvent.CCPROP_RIGHT_BUTTON_CLICK:
					param1.component.x--;
					break;
				case CcThumbPropertyEvent.CCPROP_SCALEUP_BUTTON_CLICK:
					param1.component.xscale = param1.component.xscale + 0.01;
					param1.component.yscale = param1.component.yscale + 0.01;
					break;
				case CcThumbPropertyEvent.CCPROP_SCALEDOWN_BUTTON_CLICK:
					param1.component.xscale = param1.component.xscale - 0.01;
					param1.component.yscale = param1.component.yscale - 0.01;
					break;
				case CcThumbPropertyEvent.CCPROP_SCALEXUP_BUTTON_CLICK:
					param1.component.xscale = param1.component.xscale + 0.01;
					break;
				case CcThumbPropertyEvent.CCPROP_SCALEXDOWN_BUTTON_CLICK:
					param1.component.xscale = param1.component.xscale - 0.01;
					break;
				case CcThumbPropertyEvent.CCPROP_SCALEYUP_BUTTON_CLICK:
					param1.component.yscale = param1.component.yscale + 0.01;
					break;
				case CcThumbPropertyEvent.CCPROP_SCALEYDOWN_BUTTON_CLICK:
					param1.component.yscale = param1.component.yscale - 0.01;
					break;
				case CcThumbPropertyEvent.CCPROP_ROTATEUP_BUTTON_CLICK:
					param1.component.rotation = param1.component.rotation + 1;
					break;
				case CcThumbPropertyEvent.CCPROP_ROTATEDOWN_BUTTON_CLICK:
					param1.component.rotation = param1.component.rotation - 1;
					break;
				case CcThumbPropertyEvent.CCPROP_OFFSETUP_BUTTON_CLICK:
					param1.component.offset++;
					break;
				case CcThumbPropertyEvent.CCPROP_OFFSETDOWN_BUTTON_CLICK:
					param1.component.offset--;
			}
			this.ui_ce_container.ui_ce_charPreviewer.updateLocation(param1.component);
			this.ui_ce_container.ui_ce_facePreviewer.updateLocation(param1.component);
		}

		private function onUserUpdateComponentProperty(param1:Event) : void
		{
			this.addCommand(this.ccChar);
		}

		private function onUserClickUndoButton(param1:Event) : void
		{
			var _loc5_:CcComponent = null;
			var _loc2_:CcCharacter = this._commands[this._currentCommandIndex - 2];
			this.copyCcChar(_loc2_.clone());
			this.ui_ce_container.ui_ce_charPreviewer.initByCcChar(this.ccChar,this.ccChar.thumbnailActionId);
			this.ui_ce_container.ui_ce_facePreviewer.initByCcChar(this.ccChar,this.ccChar.thumbnailActionId);
			this.ui_ce_container.ui_ce_thumbPropertyInspector.destroy();
			var _loc3_:Number = this.ccChar.getUserChosenComponentSize();
			var _loc4_:int = 0;
			while(_loc4_ < _loc3_)
			{
				_loc5_ = this.ccChar.getUserChosenComponentByIndex(_loc4_);
				if(_loc5_.componentThumb.type == this.currentComponentType)
				{
					this.ui_ce_container.ui_ce_thumbPropertyInspector.init(_loc5_,this.userLevel);
				}
				_loc4_++;
			}
			if(CcLibConstant.ALL_MULTIPLE_COMPONENT_TYPES.indexOf(this.currentComponentType) > -1)
			{
				this.ui_ce_container.ui_ce_selectedDecoration.initByCcChar(this.ccChar);
			}
			this._currentCommandIndex--;
			if(this._currentCommandIndex == 1)
			{
				this.ui_ce_container.ui_ce_buttonBar.btnUndo.enabled = false;
			}
			else
			{
				this.ui_ce_container.ui_ce_buttonBar.btnUndo.enabled = true;
			}
			this.ui_ce_container.ui_ce_buttonBar.btnRedo.enabled = true;
			this.refreshCurrentUi();
		}

		private function onUserClickRedoButton(param1:Event) : void
		{
			var _loc5_:CcComponent = null;
			var _loc2_:CcCharacter = this._commands[this._currentCommandIndex];
			this.copyCcChar(_loc2_.clone());
			this.ui_ce_container.ui_ce_charPreviewer.initByCcChar(this.ccChar,this.ccChar.thumbnailActionId);
			this.ui_ce_container.ui_ce_facePreviewer.initByCcChar(this.ccChar,this.ccChar.thumbnailActionId);
			this.ui_ce_container.ui_ce_thumbPropertyInspector.destroy();
			var _loc3_:Number = this.ccChar.getUserChosenComponentSize();
			var _loc4_:int = 0;
			while(_loc4_ < _loc3_)
			{
				_loc5_ = this.ccChar.getUserChosenComponentByIndex(_loc4_);
				if(_loc5_.componentThumb.type == this.currentComponentType)
				{
					this.ui_ce_container.ui_ce_thumbPropertyInspector.init(_loc5_,this.userLevel);
				}
				_loc4_++;
			}
			if(CcLibConstant.ALL_MULTIPLE_COMPONENT_TYPES.indexOf(this.currentComponentType) > -1)
			{
				this.ui_ce_container.ui_ce_selectedDecoration.initByCcChar(this.ccChar);
			}
			this._currentCommandIndex++;
			if(this._currentCommandIndex == this._commands.length)
			{
				this.ui_ce_container.ui_ce_buttonBar.btnRedo.enabled = false;
			}
			else
			{
				this.ui_ce_container.ui_ce_buttonBar.btnRedo.enabled = true;
			}
			this.ui_ce_container.ui_ce_buttonBar.btnUndo.enabled = true;
			this.refreshCurrentUi();
		}

		private function onUserClickPreviewButton(param1:Event) : void
		{
			this.dispatchEvent(new CcCoreEvent(CcCoreEvent.USER_WANT_TO_PREVIEW,this));
		}

		private function onUserClickModifyButton(param1:Event) : void
		{
			this.dispatchEvent(new CcCoreEvent(CcCoreEvent.USER_WANT_TO_MODIFY,this));
		}

		private function onUserClickSaveButton(param1:Event) : void
		{
			this.dispatchEvent(new CcCoreEvent(CcCoreEvent.USER_WANT_TO_SAVE,this));
		}

		private function onUserClickRandomizeButton(param1:Event) : void
		{
			var _loc4_:CcComponent = null;
			this.ccChar.randomize(this.currentTheme,this.ccChar.bodyShape.bodyType);
			this.ui_ce_container.ui_ce_thumbPropertyInspector.destroy();
			var _loc2_:Number = this.ccChar.getUserChosenComponentSize();
			var _loc3_:int = 0;
			while(_loc3_ < _loc2_)
			{
				_loc4_ = this.ccChar.getUserChosenComponentByIndex(_loc3_);
				if(_loc4_.componentThumb.type == this.currentComponentType)
				{
					this.ui_ce_container.ui_ce_thumbPropertyInspector.init(_loc4_,this.userLevel);
				}
				_loc3_++;
			}
			this.propagateNewCharToUi(this.ccChar);
			this.refreshCurrentUi();
			this.addCommand(this.ccChar);
		}

		private function propagateNewCharToUi(param1:CcCharacter) : void
		{
			this.ui_ce_container.ui_ce_charPreviewer.initByCcChar(param1,param1.thumbnailActionId);
			this.ui_ce_container.ui_ce_facePreviewer.initByCcChar(param1,param1.thumbnailActionId);
			this.ui_ce_container.ui_ce_selectedDecoration.initByCcChar(this.ccChar);
		}

		public function initTheme(param1:CcTheme) : void
		{
			this._currentTheme = param1;
		}

		public function start(param1:CcCharacter, param2:Boolean) : void
		{
			this.ui_ce_container.ui_ce_bodyShapeChooser.init(this.currentTheme,this.moneyMode,param2);
			this.initChar(param1);
			this.isNewCharInsteadOfExistingChar = param2;
			if(this.isNewCharInsteadOfExistingChar)
			{
				this.ui_ce_container.ui_ce_bodyShapeChooser.addEventListener(CcBodyShapeChooserEvent.BODY_SHAPE_CHOSEN,this.onUserChooseBodyShapeAtFirstTime);
			}
			else
			{
				this.ui_ce_container.ui_ce_bodyShapeChooser.addEventListener(CcBodyShapeChooserEvent.BODY_SHAPE_CHOSEN,this.onUserChooseBodyShape);
				this.ccCharCopyForReset = this._ccChar.clone();
				this.addCommand(this.ccChar);
				this.propagateNewCharToUi(this.ccChar);
				this.ui_ce_container.ui_ce_componentTypeChooser.init(this.currentTheme,this.ccChar,false);
				this.switchComponentType(this.ccChar.getComponentTypeOrdering()[0] as String,true);
			}
		}

		private function initChar(param1:CcCharacter) : void
		{
			this._ccChar = param1;
		}

		public function initMode(param1:int, param2:Boolean, param3:int, param4:int = 0) : void
		{
			this._isUserLogined = param2;
			this._moneyMode = param1;
			this._userLevel = param3;
			this._coupon = param4;
			try
			{
				if(this.moneyMode != CcLibConstant.MONEY_MODE_SCHOOL)
				{
				}
				return;
			}
			catch(e:Error)
			{
				return;
			}
		}

		private function onUserChooseBodyShapeAtFirstTime(param1:CcBodyShapeChooserEvent) : void
		{
			var _loc3_:XML = null;
			var _loc4_:CcCharacter = null;
			var _loc5_:UtilHashArray = null;
			(param1.target as IEventDispatcher).removeEventListener(param1.type,this.onUserChooseBodyShapeAtFirstTime);
			var _loc2_:CcBodyShape = param1.bodyShapeChosen;
			if(_loc2_ != null && this.ccChar.getUserChosenComponentSize() == 0)
			{
				_loc3_ = _loc2_.getDefaultCharXml();
				_loc4_ = new CcCharacter();
				_loc5_ = new UtilHashArray();
				_loc5_.push(this.currentTheme.id,this.currentTheme);
				_loc4_.deserialize(_loc3_,_loc5_);
				this.ccChar.cloneFromSourceToMe(_loc4_);
				this.onUserChooseBodyShapeCommon();
			}
			else if(this.ccChar.getUserChosenComponentSize() > 0)
			{
			}
		}

		private function onUserChooseBodyShape(param1:CcBodyShapeChooserEvent) : void
		{
			var _loc3_:XML = null;
			var _loc4_:CcCharacter = null;
			var _loc5_:UtilHashArray = null;
			var _loc2_:CcBodyShape = param1.bodyShapeChosen;
			if(_loc2_ != null)
			{
				if(CcLibConstant.LOAD_DEFAULT_ON_SWITCH_SHAPE)
				{
					_loc3_ = _loc2_.getDefaultCharXml();
					_loc4_ = new CcCharacter();
					_loc5_ = new UtilHashArray();
					_loc5_.push(this.currentTheme.id,this.currentTheme);
					_loc4_.deserialize(_loc3_,_loc5_);
					this.ccChar.cloneFromSourceToMe(_loc4_);
				}
				else
				{
					this.ccChar.transformBodyShape(_loc2_);
				}
				this.onUserChooseBodyShapeCommon();
			}
		}

		private function onUserChooseBodyShapeCommon() : void
		{
			var _loc1_:UtilHashArray = null;
			if(this.isNewCharInsteadOfExistingChar)
			{
				_loc1_ = new UtilHashArray();
				_loc1_.push(this.currentTheme.id,this.currentTheme);
				this.ccCharCopyForReset = new CcCharacter();
				this.ccCharCopyForReset.deserialize(this.ccChar.bodyShape.getDefaultCharXml(),_loc1_);
			}
			this.propagateNewCharToUi(this.ccChar);
			this.addCommand(this.ccChar);
			this.ui_ce_container.ui_ce_componentTypeChooser.init(this.currentTheme,this.ccChar,false);
			this.switchComponentType(this.ccChar.getComponentTypeOrdering()[0] as String,true);
		}

		private function refreshCurrentUi() : void
		{
			this.switchComponentType(this.currentComponentType,true);
		}

		private function switchComponentType(param1:String, param2:Boolean) : void
		{
			var _loc9_:CcComponent = null;
			var _loc10_:CcLibrary = null;
			var _loc3_:String = String(param1 == "componentGroupClothes"?"body":param1);
			_loc3_ = _loc3_.charAt(0).toUpperCase() + _loc3_.substr(1);
			this.currentComponentType = param1;
			if(param2)
			{
				this.ui_ce_container.ui_ce_componentTypeChooser.switchToComponentType(param1,false);
			}
			var _loc4_:Array = CcLibConstant.USER_CHOOSE_ABLE_HEAD_COMPONENT_TYPES;
			var _loc5_:Array = new Array();
			if(CcLibConstant.ALL_MULTIPLE_COMPONENT_TYPES.indexOf(param1) > -1)
			{
				this.ui_ce_container.ui_ce_selectedDecoration.visible = true;
			}
			else
			{
				this.ui_ce_container.ui_ce_selectedDecoration.visible = false;
			}
			if(param1 != CcLibConstant.COMPONENT_TYPE_BODYSHAPE)
			{
				if(param1 == CcLibConstant.COMPONENT_GROUP_UPPER_LOWER)
				{
					_loc5_.push(CcLibConstant.COMPONENT_TYPE_UPPER_BODY);
					_loc5_.push(CcLibConstant.COMPONENT_TYPE_LOWER_BODY);
					this.ui_ce_container.ui_ce_clothesChooser.init(this.ccChar,this.currentTheme,param1,this.moneyMode,false);
					this.ui_ce_container.ui_ce_thumbPropertyInspector.destroy();
				}
				else
				{
					_loc5_.push(param1);
					this.ui_ce_container.ui_ce_componentThumbChooser.init(this.ccChar,this.currentTheme,param1,this.moneyMode,CcLibConstant.ALL_MULTIPLE_COMPONENT_TYPES.indexOf(param1) > -1?false:true);
					this.ui_ce_container.ui_ce_thumbPropertyInspector.destroy();
				}
			}
			this.ui_ce_container.ui_ce_colorPicker.destroy();
			var _loc6_:Number = this.ccChar.getUserChosenComponentSize();
			var _loc7_:int = 0;
			while(_loc7_ < _loc6_)
			{
				_loc9_ = this.ccChar.getUserChosenComponentByIndex(_loc7_);
				if(_loc5_.indexOf(_loc9_.componentThumb.type) >= 0 && CcLibConstant.ALL_MULTIPLE_COMPONENT_TYPES.indexOf(param1) == -1 || _loc9_.componentThumb.type == CcLibConstant.COMPONENT_TYPE_BODYSHAPE && _loc5_.indexOf(CcLibConstant.COMPONENT_TYPE_FACESHAPE) >= 0)
				{
					this.ui_ce_container.ui_ce_colorPicker.addComponentType(_loc9_,_loc9_.componentThumb.type,this.currentTheme,this.ccChar);
					this.ui_ce_container.ui_ce_colorPicker.addComponentThumb(_loc9_,_loc9_.componentThumb,this.currentTheme,this.ccChar);
					this.ui_ce_container.ui_ce_thumbPropertyInspector.init(_loc9_,this.userLevel);
				}
				_loc7_++;
			}
			var _loc8_:int = 0;
			while(_loc8_ < this.ccChar.getUserChosenLibraryNum())
			{
				_loc10_ = this.ccChar.getUserChosenLibraryByIndex(_loc8_);
				if(_loc5_.indexOf(_loc10_.type) > -1)
				{
					this.ui_ce_container.ui_ce_colorPicker.addLibraryType(_loc10_,this.currentTheme,this.ccChar);
				}
				_loc8_++;
			}
		}

		private function resetPanels() : void
		{
			this.ui_ce_container.ui_ce_charScaleChooser.close();
			this.ui_ce_container.ui_ce_thumbPropertyInspector.close();
		}

		private function onUserChooseType(param1:CcComponentTypeChooserEvent) : void
		{
			this.resetPanels();
			this.switchComponentType(param1.componentType,false);
		}

		private function onUserChooseColor(param1:CcColorPickerEvent) : void
		{
			var _loc2_:CcColor = param1.colorChosen;
			this.ui_ce_container.ui_ce_charPreviewer.updateColor(_loc2_);
			this.ui_ce_container.ui_ce_facePreviewer.updateColor(_loc2_);
			this.ccChar.addUserChosenColor(_loc2_);
			if(param1.undoable)
			{
				this.addCommand(this.ccChar);
			}
		}

		private function onUserChooseThumb(param1:CcComponentThumbChooserEvent) : void
		{
			var _loc3_:CcComponent = null;
			this.resetPanels();
			var _loc2_:CcComponent = new CcComponent();
			_loc2_.componentThumb = param1.componentThumb;
			this.onUserChooseThumbCommon(_loc2_);
			this.ui_ce_container.ui_ce_colorPicker.destroy();
			if(_loc2_.componentThumb.type == CcLibConstant.COMPONENT_TYPE_FACESHAPE)
			{
				_loc3_ = this.ccChar.getUserChosenComponentByComponentType(CcLibConstant.COMPONENT_TYPE_BODYSHAPE)[0] as CcComponent;
				this.ui_ce_container.ui_ce_colorPicker.addComponentType(_loc3_,_loc3_.componentThumb.type,this.currentTheme,this.ccChar);
				this.ui_ce_container.ui_ce_colorPicker.addComponentThumb(_loc3_,_loc3_.componentThumb,this.currentTheme,this.ccChar);
			}
			this.ui_ce_container.ui_ce_colorPicker.addComponentType(_loc2_,_loc2_.componentThumb.type,this.currentTheme,this.ccChar);
			this.ui_ce_container.ui_ce_colorPicker.addComponentThumb(_loc2_,_loc2_.componentThumb,this.currentTheme,this.ccChar);
		}

		private function onUserEditScale(param1:CcThumbScaleEvent) : void
		{
			var _loc2_:Number = param1.scale / 100;
			if(param1.part == CcLibConstant.COMPONENT_CAT_HEAD)
			{
				this.ccChar.headScale = new Point(_loc2_,_loc2_);
				this.ui_ce_container.ui_ce_charPreviewer.setHeadScale(_loc2_,_loc2_);
				this.ui_ce_container.ui_ce_facePreviewer.setHeadScale(_loc2_,_loc2_);
			}
			else if(param1.part == CcLibConstant.COMPONENT_CAT_BODY)
			{
				this.ccChar.bodyScale = new Point(_loc2_,_loc2_);
				this.ui_ce_container.ui_ce_charPreviewer.setBodyScale(_loc2_,_loc2_);
				this.ui_ce_container.ui_ce_facePreviewer.setBodyScale(_loc2_,_loc2_);
			}
		}

		private function onUserChooseCloth(param1:CcComponentThumbChooserEvent) : void
		{
			var _loc3_:CcComponent = null;
			this.resetPanels();
			var _loc2_:CcComponent = new CcComponent();
			_loc2_.componentThumb = param1.componentThumb;
			this.onUserChooseThumbCommon(_loc2_);
			this.ui_ce_container.ui_ce_colorPicker.destroy();
			_loc3_ = this.ccChar.getUserChosenComponentByComponentType(CcLibConstant.COMPONENT_TYPE_UPPER_BODY)[0] as CcComponent;
			this.ui_ce_container.ui_ce_colorPicker.addComponentType(_loc3_,CcLibConstant.COMPONENT_TYPE_UPPER_BODY,this.currentTheme,this.ccChar);
			this.ui_ce_container.ui_ce_colorPicker.addComponentThumb(_loc3_,_loc3_.componentThumb,this.currentTheme,this.ccChar);
			_loc3_ = this.ccChar.getUserChosenComponentByComponentType(CcLibConstant.COMPONENT_TYPE_LOWER_BODY)[0] as CcComponent;
			this.ui_ce_container.ui_ce_colorPicker.addComponentType(_loc3_,CcLibConstant.COMPONENT_TYPE_LOWER_BODY,this.currentTheme,this.ccChar);
			this.ui_ce_container.ui_ce_colorPicker.addComponentThumb(_loc3_,_loc3_.componentThumb,this.currentTheme,this.ccChar);
		}

		private function convertComponentToLibrary(param1:CcComponent) : CcLibrary
		{
			var _loc2_:CcLibrary = new CcLibrary();
			_loc2_.type = param1.componentThumb.type;
			_loc2_.theme_id = param1.componentThumb.themeId;
			_loc2_.component_id = param1.componentThumb.componentId;
			_loc2_.money = param1.componentThumb.money;
			_loc2_.sharingPoint = param1.componentThumb.sharingPoint;
			return _loc2_;
		}

		private function convertLibraryToComponent(param1:CcLibrary) : CcComponent
		{
			var _loc2_:CcComponent = new CcComponent();
			var _loc3_:CcComponentThumb = new CcComponentThumb();
			_loc2_.componentThumb = this.currentTheme.getComponentThumbByType(param1.type).getValueByKey(param1.type + "_" + param1.component_id);
			return _loc2_;
		}

		private function onUserChooseThumbCommon(param1:CcComponent, param2:Boolean = false) : void
		{
			var _loc3_:Array = null;
			var _loc4_:CcComponent = null;
			var _loc5_:Array = null;
			var _loc6_:UtilHashArray = null;
			var _loc7_:String = null;
			var _loc8_:CcComponentThumb = null;
			var _loc9_:CcComponent = null;
			var _loc10_:CcLibrary = null;
			param1.xscale = param1.yscale = CcCharacter.getComponentScaling(this.ccChar.bodyShape.bodyType);
			if(CcLibConstant.ALL_MULTIPLE_COMPONENT_TYPES.indexOf(param1.componentThumb.type) == -1)
			{
				_loc3_ = this.ccChar.getUserChosenComponentByComponentType(param1.componentThumb.type);
				if(_loc3_.length > 0)
				{
					_loc4_ = _loc3_[0] as CcComponent;
					param1.x = _loc4_.x;
					param1.y = _loc4_.y;
					param1.xscale = _loc4_.xscale;
					param1.yscale = _loc4_.yscale;
					param1.offset = _loc4_.offset;
					param1.rotation = _loc4_.rotation;
				}
			}
			if(CcLibConstant.IS_TAKE_ORIGINAL_COLOR(param1.componentThumb.type))
			{
				_loc5_ = this.ui_ce_container.ui_ce_charPreviewer.removeColorOfThumb(param1,this.ccChar);
				this.ui_ce_container.ui_ce_facePreviewer.removeColorByRefs(_loc5_);
			}
			if(param1.componentThumb.libType != "")
			{
				_loc6_ = this.ccChar.bodyShape.getComponentThumbByType(param1.componentThumb.libType);
				if(_loc6_)
				{
					_loc7_ = param1.componentThumb.libType + "_" + param1.componentThumb.componentId;
					_loc8_ = _loc6_.getValueByKey(_loc7_);
					if(_loc8_)
					{
						_loc9_ = new CcComponent();
						_loc9_.componentThumb = _loc8_;
						this.onUserChooseThumbCommon(_loc9_,true);
					}
					else
					{
						this.ccChar.removeUserChosenComponentByType(param1.componentThumb.libType);
						this.ui_ce_container.ui_ce_charPreviewer.initByCcChar(this.ccChar,this.ccChar.bodyShape.thumbnailActionId);
						this.ui_ce_container.ui_ce_facePreviewer.initByCcChar(this.ccChar,this.ccChar.bodyShape.thumbnailActionId);
					}
				}
			}
			if(param1.componentThumb.apply_template_id)
			{
				this.applyTemplate(param1.componentThumb.apply_template_id,param1.componentThumb.type);
			}
			if(CcLibConstant.ALL_LIBRARY_TYPES.indexOf(param1.componentThumb.type) > -1)
			{
				_loc10_ = this.convertComponentToLibrary(param1);
				this.ccChar.addUserChosenLibrary(_loc10_);
				this.ui_ce_container.ui_ce_charPreviewer.switchLibrary(param1,this.ccChar);
				this.ui_ce_container.ui_ce_facePreviewer.switchLibrary(param1,this.ccChar);
			}
			else
			{
				this.ccChar.addUserChosenComponent(param1);
				this.ui_ce_container.ui_ce_charPreviewer.switchComponent(param1,this.ccChar,this.ccChar.bodyShape.thumbnailActionId);
				this.ui_ce_container.ui_ce_facePreviewer.switchComponent(param1,this.ccChar,this.ccChar.bodyShape.thumbnailActionId);
			}
			this.ui_ce_container.ui_ce_thumbPropertyInspector.init(param1,this.userLevel);
			if(CcLibConstant.ALL_MULTIPLE_COMPONENT_TYPES.indexOf(param1.componentThumb.type) > -1)
			{
				this.ui_ce_container.ui_ce_selectedDecoration.addComponent(param1);
			}
			if(!param2)
			{
				this.addCommand(this.ccChar);
			}
		}

		private function applyTemplate(param1:String, param2:String) : void
		{
			var _loc7_:int = 0;
			var _loc8_:CcColor = null;
			var _loc9_:CcComponent = null;
			var _loc10_:CcLibrary = null;
			var _loc3_:CcTemplate = this.currentTheme.getTemplateById(param1);
			var _loc4_:int = _loc3_.getUserChosenColorNum();
			var _loc5_:int = _loc3_.getUserChosenComponentSize();
			var _loc6_:int = _loc3_.getUserChosenLibraryNum();
			_loc7_ = 0;
			while(_loc7_ < _loc4_)
			{
				_loc8_ = _loc3_.getUserChosenColorByIndex(_loc7_);
				this.ui_ce_container.ui_ce_charPreviewer.updateColor(_loc8_);
				this.ui_ce_container.ui_ce_facePreviewer.updateColor(_loc8_);
				this.ccChar.addUserChosenColor(_loc8_);
				_loc7_++;
			}
			_loc7_ = 0;
			while(_loc7_ < _loc5_)
			{
				_loc9_ = _loc3_.getUserChosenComponentByIndex(_loc7_);
				if(_loc9_.componentThumb.type != param2)
				{
					this.onUserChooseThumbCommon(_loc9_);
				}
				_loc7_++;
			}
			_loc7_ = 0;
			while(_loc7_ < _loc6_)
			{
				_loc10_ = _loc3_.getUserChosenLibraryByIndex(_loc7_);
				if(_loc10_.type != param2)
				{
					this.onUserChooseThumbCommon(this.convertLibraryToComponent(_loc10_));
				}
				_loc7_++;
			}
		}

		private function onUserChooseNullThumb(param1:CcComponentThumbChooserEvent) : void
		{
			this.resetPanels();
			var _loc2_:CcComponent = new CcComponent();
			_loc2_.xscale = _loc2_.yscale = CcCharacter.getComponentScaling(this.ccChar.bodyShape.bodyType);
			_loc2_.componentThumb = param1.componentThumb;
			if(CcLibConstant.GET_COMPONENT_RELATED_LIBRARY(param1.noneComponentThumbType))
			{
				this.ccChar.removeUserChosenComponentByType(CcLibConstant.GET_COMPONENT_RELATED_LIBRARY(param1.noneComponentThumbType));
			}
			this.ccChar.removeUserChosenComponentByType(param1.noneComponentThumbType);
			this.ui_ce_container.ui_ce_charPreviewer.initByCcChar(this.ccChar,this.ccChar.bodyShape.thumbnailActionId);
			this.ui_ce_container.ui_ce_facePreviewer.initByCcChar(this.ccChar,this.ccChar.bodyShape.thumbnailActionId);
			this.ui_ce_container.ui_ce_colorPicker.destroy();
			this.ui_ce_container.ui_ce_colorPicker.addComponentType(_loc2_,param1.noneComponentThumbType,this.currentTheme,this.ccChar);
			this.ui_ce_container.ui_ce_thumbPropertyInspector.destroy();
			this.addCommand(this.ccChar);
		}

		public function updateTopButtonOnRole() : void
		{
			this.ui_ce_container.ui_ce_buttonBar.refreshRole();
		}

		public function saveSnapShot(param1:Boolean = false) : ByteArray
		{
			var _loc2_:BitmapData = null;
			if(!param1)
			{
				_loc2_ = this.ui_ce_container.ui_ce_charPreviewer.capFaceAsBitmap();
			}
			else
			{
				_loc2_ = this.ui_ce_container.ui_ce_charPreviewer.capCharAsBitmap();
			}
			var _loc3_:PNGEncoder = new PNGEncoder();
			var _loc4_:ByteArray = _loc3_.encode(_loc2_);
			return _loc4_;
		}
	}
}
