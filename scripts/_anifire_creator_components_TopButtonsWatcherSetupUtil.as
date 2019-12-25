package
{
	import anifire.creator.components.TopButtons;
	import mx.binding.IWatcherSetupUtil2;
	import mx.binding.PropertyWatcher;
	import mx.core.IFlexModuleFactory;
	
	public class _anifire_creator_components_TopButtonsWatcherSetupUtil implements IWatcherSetupUtil2
	{
		 
		
		public function _anifire_creator_components_TopButtonsWatcherSetupUtil()
		{
			super();
		}
		
		public static function init(param1:IFlexModuleFactory) : void
		{
			TopButtons.watcherSetupUtil = new _anifire_creator_components_TopButtonsWatcherSetupUtil();
		}
		
		public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
		{
			param5[5] = new PropertyWatcher("fadeIn",{"propertyChange":true},[param4[5]],param2);
			param5[5].updateParent(param1);
		}
	}
}
