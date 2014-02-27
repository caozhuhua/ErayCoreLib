package com.eray.base.net.socket.vo
{
	import flash.utils.ByteArray;
	import com.eray.base.utils.Utilities;
	import com.eray.base.net.socket.vo.ItemVO
	public class USER_VO
	{
		public function USER_VO()
		{
		
		}
		private var _userId:int;
		/**
		 * 用户标识
		 */
		public function get userId():int
		{
			return _userId;
		}

		public function set userId(value:int):void
		{
			_userId = value;
		}
		private var _age:int;
		/**
		 * 用户年龄
		 */
		public function get age():int
		{
			return _age;
		}

		public function set age(value:int):void
		{
			_age = value;
		}
		private var _itemVOCount:int;
		/**
		 * 个数
		 */
		public function get itemVOCount():int
		{
			return _itemVOCount;
		}

		public function set itemVOCount(value:int):void
		{
			_itemVOCount = value;
		}
		private var _itemVO:Array;
		/**
		 * 用户物品
		 */
		public function get itemVO():Array
		{
			return _itemVO;
		}

		public function set itemVO(value:Array):void
		{
			_itemVO = value;
		}
		private var _userNameLen:int;
		/**
		 * 个数
		 */
		public function get userNameLen():int
		{
			return _userNameLen;
		}

		public function set userNameLen(value:int):void
		{
			_userNameLen = value;
		}
		private var _userName:String;
		/**
		 * 用户名
		 */
		public function get userName():String
		{
			return _userName;
		}

		public function set userName(value:String):void
		{
			_userName = value;
		}
		private var _bonusVO:Object;
		/**
		 * 奖励信息
		 */
		public function get bonusVO():Object
		{
			return _bonusVO;
		}

		public function set bonusVO(value:Object):void
		{
			_bonusVO = value;
		}
		
		public static function parse(ba:ByteArray):USER_VO{
			var i:int,j:int,__type:int,__listNum:int;
			var vo:USER_VO = new USER_VO();
			vo.userId =  ba.readUnsignedInt();
			vo.age =  ba.readUnsignedInt();
			vo.itemVOCount =  ba.readUnsignedInt();
			vo.itemVO = [];
			for(i=0;i<vo.itemVOCount;++i){
				vo.itemVO.push(ItemVO.parse(ba));
			}
			vo.userNameLen =  ba.readUnsignedInt();
			vo.userName =  Utilities.UnicodeToString(ba,vo.userNameLen/2)
			__type = ba.readUnsignedInt();
			if(__type==1){
				vo.bonusVO = BonusExpVO.parse(ba);
			}
			__type = ba.readUnsignedInt();
			if(__type==2){
				vo.bonusVO = BonusMoneyVO.parse(ba);
			}
			__type = ba.readUnsignedInt();
			if(__type==3){
				__listNum = ba.readUnsignedInt();
				vo.bonusVO = [];
				for(j=0;j<__listNum;++j){
					vo.bonusVO.push(BonusGoodsVO.parse(ba));
				}
			}
			return vo;
		}
	
	}
}