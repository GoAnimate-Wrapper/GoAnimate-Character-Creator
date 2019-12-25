package
{
	import anifire.creator.components.CcComponentPropertyInspectorSpark;
	import mx.binding.IWatcherSetupUtil2;
	import mx.binding.PropertyWatcher;
	import mx.core.IFlexModuleFactory;

	public class _anifire_creator_components_CcComponentPropertyInspectorSparkWatcherSetupUtil implements IWatcherSetupUtil2
	{


		public function _anifire_creator_components_CcComponentPropertyInspectorSparkWatcherSetupUtil()
		{
			super();
		}

		public static function init(param1:IFlexModuleFactory) : void
		{
			CcComponentPropertyInspectorSpark.watcherSetupUtil = new _anifire_creator_components_CcComponentPropertyInspectorSparkWatcherSetupUtil();
		}

		public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
		{
			param5[0] = new PropertyWatcher("yPad",{"propertyChange":true},[param4[0],param4[1],param4[3]],param2);
			param5[3] = new PropertyWatcher("width",{"widthChanged":true},[param4[3]],null);
			param5[2] = new PropertyWatcher("width",{"widthChanged":true},[param4[3]],param2);
			param5[0].updateParent(param1);
			param5[0].addChild(param5[3]);
			param5[2].updateParent(param1);
		}
	}
}
