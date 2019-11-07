package anifire.creator.events
{
   import anifire.event.ExtraDataEvent;
   
   public class CcCoreEvent extends ExtraDataEvent
   {
      
      public static const LOAD_THEME_COMPLETE:String = "load_theme_complete";
      
      public static const LOAD_EXISTING_CHAR_COMPLETE:String = "load_existing_char_complete";
      
      public static const LOAD_PRE_MADE_CHARACTER_COMPLETE:String = "load_pre_made_character_complete";
      
      public static const LOAD_CHARACTER_THUMB_COMPLETE:String = "load_char_thumb_complete";
      
      public static const LOAD_CHARACTER_THUMB_ALL_COMPLETE:String = "load_char_thumb_all_complete";
      
      public static const LOAD_EVERYTHING_COMPLETE:String = "load_all_complete";
      
      public static const USER_WANT_TO_SAVE:String = "user_want_to_save";
      
      public static const USER_WANT_TO_MODIFY:String = "user_want_to_modify";
      
      public static const USER_WANT_TO_CONFIRM:String = "user_want_to_confirm";
      
      public static const USER_WANT_TO_PREVIEW:String = "user_want_to_preview";
      
      public static const USER_WANT_TO_CANCEL:String = "user_want_to_cancel";
       
      
      public function CcCoreEvent(param1:String, param2:Object, param3:Object = null, param4:Boolean = false, param5:Boolean = false)
      {
         super(param1,param2,param3,param4,param5);
      }
   }
}
