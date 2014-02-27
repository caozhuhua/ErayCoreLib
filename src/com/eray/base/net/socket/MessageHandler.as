package com.eray.base.net.socket
{
	public class MessageHandler
	{
		public function MessageHandler(_callback:Function,_context:Object)
		{
			callback = _callback;
			context = _context;
		}
		private var callback:Function;
		private var context:Object;
		public function compareContext( _context:Object ):Boolean
		{
			return _context === this.context;
		}	
		private function getCallMethod():Function
		{
			return callback;
		}
		
		
		private function getCallBackContext():Object
		{
			return context;
		}
		
		public function callbackHandler( messageVO:Object ):void
		{
			this.getCallMethod().apply(this.getCallBackContext(),[messageVO]);
		}
	}
}