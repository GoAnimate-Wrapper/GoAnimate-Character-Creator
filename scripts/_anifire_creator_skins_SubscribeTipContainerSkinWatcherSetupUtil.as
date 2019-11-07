package
{
   import anifire.creator.skins.SubscribeTipContainerSkin;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_creator_skins_SubscribeTipContainerSkinWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_creator_skins_SubscribeTipContainerSkinWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         SubscribeTipContainerSkin.watcherSetupUtil = new _anifire_creator_skins_SubscribeTipContainerSkinWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("hostComponent",{"propertyChange":true},[param4[0],param4[1],param4[2]],param2);
         param5[1] = new PropertyWatcher("targetWidth",{"propertyChange":true},[param4[0]],null);
         param5[2] = new PropertyWatcher("offset",{"propertyChange":true},[param4[1],param4[2]],null);
         param5[0].updateParent(param1);
         param5[0].addChild(param5[1]);
         param5[0].addChild(param5[2]);
      }
   }
}
