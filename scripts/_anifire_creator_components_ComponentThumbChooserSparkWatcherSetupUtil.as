package
{
	import anifire.creator.components.ComponentThumbChooserSpark;
	import mx.binding.IWatcherSetupUtil2;
	import mx.binding.PropertyWatcher;
	import mx.core.IFlexModuleFactory;

	public class _anifire_creator_components_ComponentThumbChooserSparkWatcherSetupUtil implements IWatcherSetupUtil2
	{


		public function _anifire_creator_components_ComponentThumbChooserSparkWatcherSetupUtil()
		{
			super();
		}

		public static function init(param1:IFlexModuleFactory) : void
		{
			ComponentThumbChooserSpark.watcherSetupUtil = new _anifire_creator_components_ComponentThumbChooserSparkWatcherSetupUtil();
		}

		public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
		{
			param5[0] = new PropertyWatcher("_thumbnailSource",{"propertyChange":true},[param4[0]],param2);
			param5[0].updateParent(param1);
		}
	}
}
