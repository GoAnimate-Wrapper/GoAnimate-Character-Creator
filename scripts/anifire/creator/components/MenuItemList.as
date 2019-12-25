package anifire.creator.components
{
	import anifire.creator.events.MenuItemEvent;
	import anifire.creator.interfaces.IMenuItemOwner;
	import anifire.creator.models.MenuItemModel;
	import flash.events.MouseEvent;
	import mx.core.IVisualElement;
	import spark.components.List;
	import spark.events.RendererExistenceEvent;

	public class MenuItemList extends List implements IMenuItemOwner
	{


		public function MenuItemList()
		{
			super();
			useVirtualLayout = false;
		}

		public function menuItemClicked(param1:MenuItemModel, param2:Boolean, param3:MouseEvent) : void
		{
			if(!param2)
			{
				param1.toggle();
			}
			var _loc4_:MenuItemEvent = new MenuItemEvent(MenuItemEvent.ITEM_CLICK,param1);
			_loc4_.isPropagated = param2;
			_loc4_.mouseEvent = param3;
			dispatchEvent(_loc4_);
		}

		override protected function dataGroup_rendererAddHandler(param1:RendererExistenceEvent) : void
		{
			super.dataGroup_rendererAddHandler(param1);
			var _loc2_:IVisualElement = param1.renderer;
			if(!_loc2_)
			{
				return;
			}
			_loc2_.addEventListener(MouseEvent.MOUSE_UP,this.menuItem_mouseHandler);
		}

		override protected function dataGroup_rendererRemoveHandler(param1:RendererExistenceEvent) : void
		{
			super.dataGroup_rendererRemoveHandler(param1);
			var _loc2_:IVisualElement = param1.renderer;
			if(!_loc2_)
			{
				return;
			}
			_loc2_.removeEventListener(MouseEvent.MOUSE_UP,this.menuItem_mouseHandler);
		}

		protected function menuItem_mouseHandler(param1:MouseEvent) : void
		{
			var _loc2_:MenuItemModel = this.selectedItem as MenuItemModel;
			if(_loc2_ && _loc2_.selectable)
			{
				this.menuItemClicked(_loc2_,false,param1);
			}
		}
	}
}
