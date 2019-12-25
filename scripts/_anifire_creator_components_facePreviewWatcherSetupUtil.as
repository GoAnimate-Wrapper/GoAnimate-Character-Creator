package
{
	import anifire.creator.components.facePreview;
	import mx.binding.IWatcherSetupUtil2;
	import mx.binding.PropertyWatcher;
	import mx.core.IFlexModuleFactory;

	public class _anifire_creator_components_facePreviewWatcherSetupUtil implements IWatcherSetupUtil2
	{


		public function _anifire_creator_components_facePreviewWatcherSetupUtil()
		{
			super();
		}

		public static function init(param1:IFlexModuleFactory) : void
		{
			facePreview.watcherSetupUtil = new _anifire_creator_components_facePreviewWatcherSetupUtil();
		}

		public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
		{
			param5[1] = new PropertyWatcher("height",{"heightChanged":true},[param4[0]],param2);
			param5[0] = new PropertyWatcher("width",{"widthChanged":true},[param4[0]],param2);
			param5[4] = new PropertyWatcher("bottomLine",{"propertyChange":true},[param4[3],param4[4]],param2);
			param5[3] = new PropertyWatcher("mymask",{"propertyChange":true},[param4[1],param4[2]],param2);
			param5[2] = new PropertyWatcher("faceBg",{"propertyChange":true},[param4[1],param4[2]],param2);
			param5[1].updateParent(param1);
			param5[0].updateParent(param1);
			param5[4].updateParent(param1);
			param5[3].updateParent(param1);
			param5[2].updateParent(param1);
		}
	}
}
