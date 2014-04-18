package com.eray.response
{
	import com.eray.base.core.IEXPCore;
	
	public class DataResponse implements IEXPCore
	{
		public function DataResponse()
		{
		}

	
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
		public function get onProgress():Function
		{
			return _onProgress;
		}
		
		public function set onProgress(value:Function):void
		{
			_onProgress = value;
		}
		
		private var _onProgress:Function;
		private var _success:Function;
		private var _error:Function;
		public static function create(success:Function,progress:Function,error:Function):DataResponse{
			var res:DataResponse = new DataResponse();
			res.success = success;
			res.error = error;
			res.onProgress = progress;
			return res;
		}
		public function dispose():void
		{
			this.success = null;
			this.error = null;
		}
	}
}