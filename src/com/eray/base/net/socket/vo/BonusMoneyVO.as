package com.eray.base.net.socket.vo
{
	import flash.utils.ByteArray;
	import com.eray.base.utils.Utilities;
	public class BonusMoneyVO
	{
		public function BonusMoneyVO()
		{
		
		}
		private var _bonusId:int;
		/**
		 * 奖励ID
		 */
		public function get bonusId():int
		{
			return _bonusId;
		}

		public function set bonusId(value:int):void
		{
			_bonusId = value;
		}
		
		public static function parse(ba:ByteArray):BonusMoneyVO{
			var i:int,j:int,__type:int,__listNum:int;
			var vo:BonusMoneyVO = new BonusMoneyVO();
			vo.bonusId =  ba.readUnsignedInt();
			return vo;
		}
	
	}
}