package com.eray.base.net.socket.vo
{
	import flash.utils.ByteArray;
	import com.eray.base.utils.Utilities;
	public class ItemVO
	{
		public function ItemVO()
		{
		
		}
		private var _id:int;
		/**
		 * 物品唯一ID
		 */
		public function get id():int
		{
			return _id;
		}

		public function set id(value:int):void
		{
			_id = value;
		}
		private var _itemId:int;
		/**
		 * 物品表格里的ID
		 */
		public function get itemId():int
		{
			return _itemId;
		}

		public function set itemId(value:int):void
		{
			_itemId = value;
		}
		
		public static function parse(ba:ByteArray):ItemVO{
			var i:int,j:int,__type:int,__listNum:int;
			var vo:ItemVO = new ItemVO();
			vo.id =  ba.readUnsignedInt();
			vo.itemId =  ba.readUnsignedInt();
			return vo;
		}
	
	}
}