package com.eray.base.net.loader
{
	import com.eray.base.core.IEXPDispose;
	
	public class EXPResponse implements IEXPDispose
	{
		public function EXPResponse(cb:Function = null, args:Array = null)
		{
			this.callback = cb;
			this.args = args;
		}
		
		public function dispose():void
		{
			this.callback = null;
			this.args = null;
		}
		public function execute():void {
			if (callback != null) {
				callback.apply(null, args);
			}
		}
		
		public function executeWith(data:Array):void {
			if (data == null) {
				return execute();
			}
			if (callback != null) {
				callback.apply(null, args ? args.concat(data) : data);
			}
		}
		public var callback:Function;
		public var args:Array;
	}
}