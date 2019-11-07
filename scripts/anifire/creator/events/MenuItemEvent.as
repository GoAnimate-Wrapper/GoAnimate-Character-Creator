package anifire.creator.events
{
   import anifire.creator.models.MenuItemModel;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class MenuItemEvent extends Event
   {
      
      public static const ITEM_CLICK:String = "itemClick";
       
      
      public var item:MenuItemModel;
      
      public var isPropagated:Boolean = false;
      
      public var mouseEvent:MouseEvent;
      
      public function MenuItemEvent(param1:String, param2:MenuItemModel)
      {
         super(param1,bubbles,cancelable);
         this.item = param2;
      }
   }
}
