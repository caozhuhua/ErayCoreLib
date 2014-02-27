package com.eray.base.net.socket.vo
{
	import flash.utils.ByteArray;
	import com.eray.base.utils.Utilities;
	public class GoodsVO
	{
		public function GoodsVO()
		{
		
		}
		private var _goodsId:int;
		/**
		 * 物品数据库ID
		 */
		public function get goodsId():int
		{
			return _goodsId;
		}

		public function set goodsId(value:int):void
		{
			_goodsId = value;
		}
		private var _itemId:int;
		/**
		 * 物品数据表格ID
		 */
		public function get itemId():int
		{
			return _itemId;
		}

		public function set itemId(value:int):void
		{
			_itemId = value;
		}
		
		public static function parse(ba:ByteArray):GoodsVO{
			var i:int,j:int,__type:int,__listNum:int;
			var vo:GoodsVO = new GoodsVO();
			vo.goodsId =  ba.readUnsignedInt();
			vo.itemId =  ba.readUnsignedInt();
			return vo;
		}
	
	}
}