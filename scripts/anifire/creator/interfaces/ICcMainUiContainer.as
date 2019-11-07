package anifire.creator.interfaces
{
   import flash.events.IEventDispatcher;
   import spark.components.Group;
   
   public interface ICcMainUiContainer extends IEventDispatcher
   {
       
      
      function get ui_main_ViewStack() : Group;
      
      function get ui_main_ccCharEditor() : Group;
      
      function get ui_main_ccCharPreviewAndSaveScreen() : Group;
   }
}
