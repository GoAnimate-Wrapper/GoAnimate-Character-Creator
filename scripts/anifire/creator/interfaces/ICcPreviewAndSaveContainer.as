package anifire.creator.interfaces
{
   import anifire.creator.components.CharPreviewOption;
   import anifire.creator.components.CharPreviewer;
   import anifire.creator.components.TopButtons;
   import flash.events.IEventDispatcher;
   import spark.components.Group;
   
   public interface ICcPreviewAndSaveContainer extends IEventDispatcher
   {
       
      
      function get ui_ps_charPreviewer() : CharPreviewer;
      
      function get ui_ps_interactionViewStack() : Group;
      
      function get ui_ps_charPreviewCanvas() : Group;
      
      function get ui_ps_charPreviewOptionBox() : CharPreviewOption;
      
      function get ui_ps_buttonBar() : TopButtons;
   }
}
