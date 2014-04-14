package com.eray.base.data
{
	import com.eray.base.core.IEXPCore;
	
	public class EXPFileVO implements IEXPCore
	{
		public function EXPFileVO()
		{
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
		public function dispose():void
		{
			fileData = null;
		}
		public static function create(path:String):EXPFileVO{
			var f:EXPFileVO = new EXPFileVO();
			f.url = path;
			return f;
		}
	}
}