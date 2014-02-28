package com.eray.base.managers
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	public class EXPLocalDataManger extends EventDispatcher
	{
		private static var _instance:EXPLocalDataManger;
		public function EXPLocalDataManger(target:IEventDispatcher=null)
		{
			super(target);
		}
		public static function getInstance():EXPLocalDataManger{
			if(_instance==null){
				_instance = new EXPLocalDataManger();
			}
			return _instance;
		}
	}
}