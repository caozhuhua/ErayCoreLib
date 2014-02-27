package com.eray.base.utils.core
{
	import flash.net.LocalConnection;

	public class GC
	{
		public function GC()
		{
		}
		static public function gc():void
		{
			try
			{
				new LocalConnection().connect("foo");
				new LocalConnection().connect("foo");
			}
			catch(e:Error)	{}
		}
	}
}