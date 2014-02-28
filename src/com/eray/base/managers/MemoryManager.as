package com.eray.base.managers
{
	import com.eray.base.data.EXPHashMap;
	
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	public class MemoryManager extends EventDispatcher
	{
		private var expMap:EXPHashMap;
		public function MemoryManager(target:IEventDispatcher=null)
		{
			super(target);
		}
	}
}