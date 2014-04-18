package com.eray.base.net.loader
{
	import com.eray.base.core.IEXPCore;
	
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	public class IEXPCoreLoader extends EventDispatcher implements IEXPCore
	{
		public function IEXPCoreLoader(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		public function dispose():void
		{
		}
	}
}