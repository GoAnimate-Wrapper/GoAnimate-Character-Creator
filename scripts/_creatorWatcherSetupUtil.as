package
{
	import mx.binding.IWatcherSetupUtil2;
	import mx.binding.PropertyWatcher;
	import mx.core.IFlexModuleFactory;
	
	public class _creatorWatcherSetupUtil implements IWatcherSetupUtil2
	{
		 
		
		public function _creatorWatcherSetupUtil()
		{
			super();
		}
		
		public static function init(param1:IFlexModuleFactory) : void
		{
			creator.watcherSetupUtil = new _creatorWatcherSetupUtil();
		}
		
		public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
		{
			param5[0] = new PropertyWatcher("_ce_selectedDecoration",{"propertyChange":true},[param4[0]],param2);
			param5[1] = new PropertyWatcher("height",{"heightChanged":true},[param4[0]],null);
			param5[0].updateParent(param1);
			param5[0].addChild(param5[1]);
		}
	}
}
