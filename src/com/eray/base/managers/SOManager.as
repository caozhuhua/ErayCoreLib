package com.eray.base.managers
{
	import com.eray.base.data.EXPConstants;
	import com.eray.base.utils.EXPLogger;
	
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.events.NetStatusEvent;
	import flash.net.SharedObject;
	
	internal class SOManager extends EventDispatcher
	{
		private var so:SharedObject;
		
		public function SOManager(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function initialize():void{
			try{
				so = SharedObject.getLocal(EXPConstants.LOCAL_SO_FILE_NA,"/");
				if(so){
					so.addEventListener(NetStatusEvent.NET_STATUS,onNetStatusHandler);
					try{
						so.flush(EXPConstants.LOCAL_SO_BUFFER_SIZE);
					}catch(error:Error){
						EXPLogger.log("flush:",error.toString());
					}
				}
			}catch(error:Error){
				EXPLogger.log("getSO:",error.toString());
			}
		}
		
		protected function onNetStatusHandler(event:NetStatusEvent):void
		{
			// TODO Auto-generated method stub
			EXPLogger.log(event.info.codde);
			switch (event.info.code){
				case EXPConstants.LOCAL_SO_STATUS_SUCCESS:
					
					break;
				case EXPConstants.LOCAL_SO_STATUS_FAILED:
					
					break;
			}
		}
		
		public function putData(vo:SODataVO):void{
			if(so){
				removeData(vo.key);
				so.data[vo.key] = {"key":vo.key,"ver":vo.ver,"data":vo.data};
			}
		}
		public function getData(key:String,ver:String=EXPConstants.LOCAL_SO_DATA_DEFAULT_VER):SODataVO{
			return null;
		}
		public function hasData(key:String,ver:String=EXPConstants.LOCAL_SO_DATA_DEFAULT_VER):Boolean{
			return false;
		}
		public function removeData(key:String):SODataVO{
			return null;
		}
		
	}
}