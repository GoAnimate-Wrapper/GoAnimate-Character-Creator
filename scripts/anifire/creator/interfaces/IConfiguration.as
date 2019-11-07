package anifire.creator.interfaces
{
   import anifire.creator.utils.ComponentThumbFilter;
   
   public interface IConfiguration
   {
       
      
      function loadPreMadeCharsEnabled() : Boolean;
      
      function get defaultThumbFilter() : ComponentThumbFilter;
   }
}
