package
{
	import anifire.creator.components.CharPreviewOption;
	import mx.binding.IWatcherSetupUtil2;
	import mx.core.IFlexModuleFactory;

	public class _anifire_creator_components_CharPreviewOptionWatcherSetupUtil implements IWatcherSetupUtil2
	{


		public function _anifire_creator_components_CharPreviewOptionWatcherSetupUtil()
		{
			super();
		}

		public static function init(param1:IFlexModuleFactory) : void
		{
			CharPreviewOption.watcherSetupUtil = new _anifire_creator_components_CharPreviewOptionWatcherSetupUtil();
		}

		public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
		{
		}
	}
}
