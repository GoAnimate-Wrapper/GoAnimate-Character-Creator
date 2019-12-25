package
{
	import anifire.creator.components.BodyShapeMegaChooser;
	import mx.binding.IWatcherSetupUtil2;
	import mx.binding.PropertyWatcher;
	import mx.core.IFlexModuleFactory;

	public class _anifire_creator_components_BodyShapeMegaChooserWatcherSetupUtil implements IWatcherSetupUtil2
	{


		public function _anifire_creator_components_BodyShapeMegaChooserWatcherSetupUtil()
		{
			super();
		}

		public static function init(param1:IFlexModuleFactory) : void
		{
			BodyShapeMegaChooser.watcherSetupUtil = new _anifire_creator_components_BodyShapeMegaChooserWatcherSetupUtil();
		}

		public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
		{
			param5[2] = new PropertyWatcher("height",{"heightChanged":true},[param4[2]],param2);
			param5[5] = new PropertyWatcher("mc",{"propertyChange":true},[param4[5],param4[6]],param2);
			param5[6] = new PropertyWatcher("height",{"heightChanged":true},[param4[5]],null);
			param5[0] = new PropertyWatcher("TAB_DATAPROVIDER",{"propertyChange":true},[param4[0]],param2);
			param5[1] = new PropertyWatcher("width",{"widthChanged":true},[param4[1]],param2);
			param5[3] = new PropertyWatcher("_selectedCCChar",{"propertyChange":true},[param4[3]],param2);
			param5[8] = new PropertyWatcher("previewer",{"propertyChange":true},[param4[8]],param2);
			param5[7] = new PropertyWatcher("vs",{"propertyChange":true},[param4[7]],param2);
			param5[2].updateParent(param1);
			param5[5].updateParent(param1);
			param5[5].addChild(param5[6]);
			param5[0].updateParent(param1);
			param5[1].updateParent(param1);
			param5[3].updateParent(param1);
			param5[8].updateParent(param1);
			param5[7].updateParent(param1);
		}
	}
}
