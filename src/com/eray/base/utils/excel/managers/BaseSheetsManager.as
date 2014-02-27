package com.eray.base.utils.excel.managers
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	public class BaseSheetsManager extends EventDispatcher
	{
		protected var mSheetsObj:Object;
		public function BaseSheetsManager(obj:Object)
		{
			mSheetsObj = obj;
		}
		/**
		 * 释放类方法 
		 * 
		 */		
		public function dispose():void{
			mSheetsObj = null;
		}
		/**
		 * 获取数据表格该Sheet下的所有内容 
		 * @return 
		 * 
		 */		
		public function getAllData():Object{
			return mSheetsObj;
		}
	}
}