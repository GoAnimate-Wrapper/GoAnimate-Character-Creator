package anifire.creator.core
{
	import anifire.creator.events.CcActionChosenEvent;
	import anifire.creator.events.CcButtonBarEvent;
	import anifire.creator.events.CcCoreEvent;
	import anifire.creator.interfaces.ICcPreviewAndSaveContainer;
	import anifire.creator.interfaces.IConfiguration;
	import anifire.creator.models.CcCharacter;
	import anifire.creator.models.CcTheme;
	import anifire.event.LoadEmbedMovieEvent;
	import anifire.util.UtilDict;
	import flash.display.BitmapData;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.utils.ByteArray;
	import mx.graphics.codec.PNGEncoder;

	public class CcPreviewAndSaveController extends EventDispatcher
	{


		private var ui_ps_container:ICcPreviewAndSaveContainer;

		private var _ccChar:CcCharacter;

		private var _ccTheme:CcTheme;

		private var _assetId:String;

		private var _cfg:IConfiguration;

		private var _lastSavedAssetId:String = null;

		public function CcPreviewAndSaveController()
		{
			super();
		}

		public function get assetId() : String
		{
			return this._assetId;
		}

		public function get configuration() : IConfiguration
		{
			return this._cfg;
		}

		public function set configuration(param1:IConfiguration) : void
		{
			this._cfg = param1;
		}

		public function get ccChar() : CcCharacter
		{
			return this._ccChar;
		}

		public function get ccTheme() : CcTheme
		{
			return this._ccTheme;
		}

		public function initUi(param1:ICcPreviewAndSaveContainer) : void
		{
			this.ui_ps_container = param1;
			this.ui_ps_container.ui_ps_buttonBar.addEventListener(CcButtonBarEvent.MODIFY_BUTTON_CLICK,this.onUserClickModify);
			this.ui_ps_container.ui_ps_buttonBar.addEventListener(CcButtonBarEvent.SAVE_BUTTON_CLICK,this.onUserClickSave);
			this.ui_ps_container.ui_ps_charPreviewOptionBox.addEventListener(CcActionChosenEvent.ACTION_CHOSEN,this.onUserChooseAction);
			this.ui_ps_container.ui_ps_charPreviewOptionBox.addEventListener(CcActionChosenEvent.FACIAL_CHOSEN,this.onUserChooseFacial);
			this.ui_ps_container.ui_ps_charPreviewer.charCanvasHeight = 280;
		}

		private function onUserClickModify(param1:Event) : void
		{
			dispatchEvent(new CcCoreEvent(CcCoreEvent.USER_WANT_TO_MODIFY,this));
		}

		private function onUserClickSave(param1:Event) : void
		{
			dispatchEvent(new CcCoreEvent(CcCoreEvent.USER_WANT_TO_SAVE,this));
		}

		public function initChar(param1:CcCharacter) : void
		{
			this._ccChar = param1;
		}

		public function initTheme(param1:CcTheme) : void
		{
			this._ccTheme = param1;
		}

		public function initMode() : void
		{
		}

		public function proceedToShow() : void
		{
			this.ui_ps_container.ui_ps_charPreviewer.initByCcChar(this.ccChar,this.ccChar.bodyShape.thumbnailActionId,this.ccChar.bodyShape.thumbnailFacialId);
			this.ui_ps_container.ui_ps_charPreviewOptionBox.init(this.ccChar,this.ccTheme);
			this.ui_ps_container.ui_ps_charPreviewOptionBox.action = this.ccChar.bodyShape.thumbnailActionId;
			this.ui_ps_container.ui_ps_charPreviewOptionBox.facial = this.ccChar.bodyShape.thumbnailFacialId;
			this.ui_ps_container.ui_ps_charPreviewOptionBox.saveEnabled = true;
			this.ui_ps_container.ui_ps_buttonBar.currentState = "preview";
		}

		public function goConfirmBox(param1:Number, param2:Number) : void
		{
		}

		private function onUserChooseAction(param1:CcActionChosenEvent) : void
		{
			this.ui_ps_container.ui_ps_charPreviewer.initByCcChar(this.ccChar,param1.action_id,param1.facial_id);
		}

		private function onUserChooseFacial(param1:CcActionChosenEvent) : void
		{
			this.ui_ps_container.ui_ps_charPreviewer.initByCcChar(this.ccChar,param1.action_id,param1.facial_id);
		}

		public function proceedToSaveComplete(param1:Number, param2:Number, param3:String) : void
		{
			this._assetId = param3;
			this._lastSavedAssetId = param3;
		}

		public function proceedToSaveNotEnoughMoney(param1:Number, param2:Number) : void
		{
			var _loc3_:String = UtilDict.toDisplay("cc","<p ><font size=\'16\'><b><font color=\'#FF0000\'>Hey!</font></b><br><font size=\'14\'>You need {0} more GoBucks to get me.</font></p>");
		}

		public function proceedToSaveError() : void
		{
		}

		public function resetCCAction() : void
		{
			this.ui_ps_container.ui_ps_charPreviewer.addEventListener(LoadEmbedMovieEvent.COMPLETE_EVENT,this.onResetCCActionComplete);
			this.ui_ps_container.ui_ps_charPreviewer.initByCcChar(this.ccChar,this.ccChar.bodyShape.thumbnailActionId);
		}

		private function onResetCCActionComplete(param1:Event) : void
		{
			this.ui_ps_container.ui_ps_charPreviewer.removeEventListener(LoadEmbedMovieEvent.COMPLETE_EVENT,this.onResetCCActionComplete);
			this.dispatchEvent(param1);
		}

		public function saveSnapShot(param1:Boolean = false) : ByteArray
		{
			var _loc2_:BitmapData = null;
			if(!param1)
			{
				_loc2_ = this.ui_ps_container.ui_ps_charPreviewer.capFaceAsBitmap();
			}
			else
			{
				_loc2_ = this.ui_ps_container.ui_ps_charPreviewer.capCharAsBitmap();
			}
			var _loc3_:PNGEncoder = new PNGEncoder();
			var _loc4_:ByteArray = _loc3_.encode(_loc2_);
			return _loc4_;
		}

		public function showNotAbleSave(param1:String) : void
		{
		}

		public function updatePurchaseBoxButton(param1:int) : void
		{
		}

		public function updateTopButtonOnRole() : void
		{
			this.ui_ps_container.ui_ps_buttonBar.refreshRole();
		}
	}
}
