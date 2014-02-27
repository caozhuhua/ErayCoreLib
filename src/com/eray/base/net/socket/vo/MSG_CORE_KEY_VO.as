package com.eray.base.net.socket.vo
{
	import flash.utils.ByteArray;
	import com.eray.base.utils.Utilities;
	import com.eray.base.net.socket.vo.USER_VO
	public class MSG_CORE_KEY_VO
	{
		public function MSG_CORE_KEY_VO()
		{
		
		}
		private var _connect_serial:int;
		/**
		 * 连接序列号
		 */
		public function get connect_serial():int
		{
			return _connect_serial;
		}

		public function set connect_serial(value:int):void
		{
			_connect_serial = value;
		}
		private var _key:int;
		/**
		 * 连接唯一标识
		 */
		public function get key():int
		{
			return _key;
		}

		public function set key(value:int):void
		{
			_key = value;
		}
		private var _userInfo:USER_VO;
		/**
		 * 用户信息
		 */
		public function get userInfo():USER_VO
		{
			return _userInfo;
		}

		public function set userInfo(value:USER_VO):void
		{
			_userInfo = value;
		}
		
		public static function parse(ba:ByteArray):MSG_CORE_KEY_VO{
			var i:int,j:int,__type:int,__listNum:int;
			var vo:MSG_CORE_KEY_VO = new MSG_CORE_KEY_VO();
			vo.connect_serial =  ba.readUnsignedInt();
			vo.key =  ba.readUnsignedInt();
			return vo;
		}
	
	}
}