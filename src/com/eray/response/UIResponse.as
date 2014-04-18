package com.eray.response
{
	import com.eray.base.core.IEXPCore;
	
	public class UIResponse implements IEXPCore
	{
		public function UIResponse()
		{
		}
		private var _key:String;

		public function get error():Function
		{
			return _error;
		}

		public function set error(value:Function):void
		{
			_error = value;
		}

		public function get success():Function
		{
			return _success;
		}

		public function set success(value:Function):void
		{
			_success = value;
		}

		public function get key():String
		{
			return _key;
		}

		public function set key(value:String):void
		{
			_key = value;
		}

		private var _success:Function;
		private var _error:Function;
		
		public static function create(key:String,success:Function,error:Function):UIResponse{
			var res:UIResponse = new UIResponse();
			res.key = key;
			res.success = success;
			res.error = error;
			return res;
		}
		
		public function dispose():void
		{
			this.success = null;
			this.error = null;
		}
	}
}