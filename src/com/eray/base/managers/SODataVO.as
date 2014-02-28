package com.eray.base.managers
{
	import com.eray.base.data.EXPConstants;

	public class SODataVO
	{
		public function SODataVO()
		{
		}
		private var _key:String;
		private var _data:*;
		private var _ver:String;

		public function get key():String
		{
			return _key;
		}

		public function set key(value:String):void
		{
			_key = value;
		}

		public function get data():*
		{
			return _data;
		}

		public function set data(value:*):void
		{
			_data = value;
		}

		public function get ver():String
		{
			return _ver;
		}

		public function set ver(value:String):void
		{
			_ver = value;
		}
		static public function create(key:String,data:*,ver:String = EXPConstants.LOCAL_SO_DATA_DEFAULT_VER):SODataVO{
			var vo:SODataVO = new SODataVO();
			vo.key = key;
			vo.data = data;
			vo.ver = ver;
			return vo;
		}

	}
}