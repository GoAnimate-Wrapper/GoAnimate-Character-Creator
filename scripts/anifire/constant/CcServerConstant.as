package anifire.constant
{
   public class CcServerConstant
   {
      
      public static const ACTION_SAVE_CC_CHAR:String = ServerConstants.get_server_path() + "saveCCCharacter/";
      
      public static const ACTION_SAVE_CC_CHAR_TEMPLATE:String = ServerConstants.get_server_path() + "saveCCCharacterTemplate/";
       
      
      public function CcServerConstant()
      {
         super();
      }
      
      public static function displayThumbnailId() : Boolean
      {
         return LicenseConstants.isThumbnailTestHost();
      }
   }
}
