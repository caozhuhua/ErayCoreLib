package com.eray.base.net.socket.vo
{
	import flash.utils.ByteArray;
	import com.eray.base.utils.Utilities;
	public class BonusGoodsVO
	{
		public function BonusGoodsVO()
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
		
		public static function parse(ba:ByteArray):BonusGoodsVO{
			var i:int,j:int,__type:int,__listNum:int;
			var vo:BonusGoodsVO = new BonusGoodsVO();
			vo.bonusId =  ba.readUnsignedInt();
			return vo;
		}
	
	}
}