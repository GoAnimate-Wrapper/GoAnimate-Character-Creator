package anifire.util
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import mx.events.PropertyChangeEvent;

	public class UtilPager implements IEventDispatcher
	{


		private var _model:Array = null;

		private var _pageNo:int = 1;

		private var _windowSize:int = 10;

		private var _bindingEventDispatcher:EventDispatcher;

		public function UtilPager()
		{
			this._bindingEventDispatcher = new EventDispatcher(IEventDispatcher(this));
			super();
		}

		[Bindable(event="propertyChange")]
			public function get pageNumber() : int
		{
			return this._pageNo;
		}

		private function set _1144767160pageNumber(param1:int) : void
		{
			this._pageNo = param1;
		}

		public function get totalPages() : int
		{
			var _loc1_:int = Math.ceil(this._model.length / this._windowSize);
			return _loc1_;
		}

		public function scrollToItem(param1:Object) : void
		{
			var _loc2_:int = 0;
			while(_loc2_ < this._model.length)
			{
				if(this._model[_loc2_] == param1)
				{
					this.pageNumber = Math.ceil((_loc2_ + 1) / this._windowSize);
				}
				_loc2_++;
			}
		}

		public function isItemOnCurrentPage(param1:Object) : Boolean
		{
			var _loc2_:Object = null;
			for each(_loc2_ in this.getView())
			{
				if(_loc2_ == param1)
				{
					return true;
				}
			}
			return false;
		}

		public function set data(param1:Array) : void
		{
			this._model = param1;
		}

		public function set windowSize(param1:int) : void
		{
			if(param1 > 0)
			{
				this._windowSize = param1;
				return;
			}
			throw new RangeError("UtilPager: Invalid page size - " + param1);
		}

		public function previous() : void
		{
			if(this.pageNumber > 1)
			{
				this.pageNumber--;
			}
		}

		public function next() : void
		{
			if(this.pageNumber < this.totalPages)
			{
				this.pageNumber++;
			}
		}

		public function getView() : Array
		{
			if(this._model == null)
			{
				return null;
			}
			var _loc1_:int = this._windowSize * (this.pageNumber - 1);
			return this._model.slice(_loc1_,_loc1_ + this._windowSize);
		}

		public function set pageNumber(param1:int) : void
		{
			var _loc2_:Object = this.pageNumber;
			if(_loc2_ !== param1)
			{
				this._1144767160pageNumber = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"pageNumber",_loc2_,param1));
				}
			}
		}

		public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
		{
			this._bindingEventDispatcher.addEventListener(param1,param2,param3,param4,param5);
		}

		public function dispatchEvent(param1:Event) : Boolean
		{
			return this._bindingEventDispatcher.dispatchEvent(param1);
		}

		public function hasEventListener(param1:String) : Boolean
		{
			return this._bindingEventDispatcher.hasEventListener(param1);
		}

		public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
		{
			this._bindingEventDispatcher.removeEventListener(param1,param2,param3);
		}

		public function willTrigger(param1:String) : Boolean
		{
			return this._bindingEventDispatcher.willTrigger(param1);
		}
	}
}
