package
{
   import anifire.creator.components.CharPreviewer;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_creator_components_CharPreviewerWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_creator_components_CharPreviewerWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         CharPreviewer.watcherSetupUtil = new _anifire_creator_components_CharPreviewerWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}
