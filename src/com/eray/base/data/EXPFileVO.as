package com.eray.base.data
{
	import com.eray.base.core.IEXPCore;
	import com.eray.base.net.loader.EXPResponse;
	import com.eray.base.utils.EXPGuid;
	
	public class EXPFileVO implements IEXPCore
	{
		public static const SWF_FILE:int = 1;
		public static const IMAGE_FILE:int = 2;
		public static const BYTE_FILE:int = 3;
		public static const TXT_FILE:int = 4;
		
		public function EXPFileVO()
		{
			_key = EXPGuid.create();
		}
		private var _newThread:Boolean;
		private var _fileType:int;

		public function get error():EXPResponse
		{
			return _error;
		}

		public function set error(value:EXPResponse):void
		{
			_error = value;
		}

		public function get progress():EXPResponse
		{
			return _progress;
		}

		public function set progress(value:EXPResponse):void
		{
			_progress = value;
		}

		public function get success():EXPResponse
		{
			return _success;
		}

		public function set success(value:EXPResponse):void
		{
			_success = value;
		}

		public function get newThread():Boolean
		{
			return _newThread;
		}

		public function set newThread(value:Boolean):void
		{
			_newThread = value;
		}

		public function get fileType():int{
			return _fileType;
		}
		private var _key:String;
		
		public function get cache():int
		{
			return _cache;
		}

		public function set cache(value:int):void
		{
			_cache = value;
		}

		public function get key():String{
			return _key;
		}
		private var _url:String;

		public function get fileData():Object
		{
			return _fileData;
		}

		public function set fileData(value:Object):void
		{
			_fileData = value;
		}

		public function get isRelease():Boolean
		{
			return _isRelease;
		}

		public function set isRelease(value:Boolean):void
		{
			_isRelease = value;
		}

		public function get url():String
		{
			return _url;
		}

		public function set url(value:String):void
		{
			_url = value;
		}
		
		private var _isRelease:Boolean;
		private var _fileData:Object;
		private var _cache:int
		private var _success:EXPResponse;
		private var _progress:EXPResponse;
		private var _error:EXPResponse;
		
		
		public function dispose():void
		{
			fileData = null;
		}
		public static function create(path:String,success:EXPResponse=null,progress:EXPResponse=null,error:EXPResponse=null,newThread:Boolean=false,cache:int = 1):EXPFileVO{
			var f:EXPFileVO = new EXPFileVO();
			f.url = path;
			f.cache = cache;
			f.newThread = newThread;
			f.success = success;
			f.error = error;
			f.progress = progress;
			return f;
		}
	}
}