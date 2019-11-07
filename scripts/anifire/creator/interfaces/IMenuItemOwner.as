package anifire.creator.interfaces
{
   import anifire.creator.models.MenuItemModel;
   import flash.events.MouseEvent;
   
   public interface IMenuItemOwner
   {
       
      
      function menuItemClicked(param1:MenuItemModel, param2:Boolean, param3:MouseEvent) : void;
   }
}
