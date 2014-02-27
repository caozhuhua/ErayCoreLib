package com.eray.base.loader
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	public class EXPLoaderManager extends EventDispatcher
	{
		private static var _instance:EXPLoaderManager;
		public function EXPLoaderManager(target:IEventDispatcher=null)
		{
			super(target);
		}
		public static function getInstance():EXPLoaderManager{
			if(_instance==null){
				_instance = new EXPLoaderManager();
			}
			return _instance;
		}
		public static function clearInstance():void{
			_instance = null;
		}
	}
}