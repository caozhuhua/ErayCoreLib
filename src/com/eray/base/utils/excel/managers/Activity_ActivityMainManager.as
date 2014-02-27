package com.eray.base.utils.excel.managers
{
	import flash.events.IEventDispatcher;
	
	public class Activity_ActivityMainManager extends BaseSheetsManager
	{
		public function Activity_ActivityMainManager(obj:Object)
		{
			super(obj);
		}
		
		override public function dispose():void
		{
			// TODO Auto Generated method stub
			//code here
			super.dispose();
		}
		public function getIDAndName(id:int,name:String):Array{
			if(mSheetsObj==null){
				var list:Array = [];
				for each(var node:Object in mSheetsObj){
					if(node["id"] ==id&&node["name"]==name){
						list.push(node);
					}
				}
			}
			return null;
		}
		
	}
}