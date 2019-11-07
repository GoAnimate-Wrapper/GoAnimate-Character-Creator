package anifire.creator.config
{
   import anifire.constant.ServerConstants;
   import anifire.constant.ThemeConstants;
   import anifire.creator.interfaces.IConfiguration;
   import anifire.creator.models.CcComponentThumb;
   import anifire.creator.utils.ComponentThumbFilter;
   import anifire.managers.AppConfigManager;
   import anifire.util.UtilUser;
   
   public class GoAnimate implements IConfiguration
   {
      
      private static var _configManager:AppConfigManager = AppConfigManager.instance;
       
      
      public function GoAnimate()
      {
         super();
      }
      
      private static function goTagFilter(param1:CcComponentThumb) : Boolean
      {
         var _loc2_:int = parseInt(_configManager.getValue("ut"));
         var _loc3_:String = _configManager.getValue("siteId");
         var _loc4_:String = _configManager.getValue("userId");
         var _loc5_:String = _configManager.getValue("ft");
         if(!param1)
         {
            return false;
         }
         return (_loc2_ >= 60 || !param1.hasTag("_userrole_admin")) && (!_loc5_ || param1.hasTag(_loc5_));
      }
      
      public function scalingCharacterEnabled() : Boolean
      {
         if(_configManager.getValue(ServerConstants.PARAM_THEME_ID) == ThemeConstants.ANIME_THEME_ID)
         {
            if(UtilUser.hasAdminFeatures)
            {
               return true;
            }
            return false;
         }
         return true;
      }
      
      public function templateSelectorEnabled() : Boolean
      {
         return false;
      }
      
      public function loadPreMadeCharsEnabled() : Boolean
      {
         return true;
      }
      
      public function get defaultThumbFilter() : ComponentThumbFilter
      {
         var _loc1_:ComponentThumbFilter = new ComponentThumbFilter();
         _loc1_.filter = goTagFilter;
         return _loc1_;
      }
   }
}
