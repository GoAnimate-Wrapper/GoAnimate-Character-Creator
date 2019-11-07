package
{
   import anifire.creator.components.TypeChooserSpark;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_creator_components_TypeChooserSparkWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_creator_components_TypeChooserSparkWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         TypeChooserSpark.watcherSetupUtil = new _anifire_creator_components_TypeChooserSparkWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}
