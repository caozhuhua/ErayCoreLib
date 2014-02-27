package com.eray.base.net.socket
{
	import com.eray.base.net.socket.vo.MSG_CORE_KEY_VO;
	
	import flash.events.EventDispatcher;
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	public class ErayMessageManager extends EventDispatcher
	{
		private static var _instance:ErayMessageManager;
		public static const MSG_CORE_KEY:int = 2;
		private var dic:Dictionary;
		public function ErayMessageManager()
		{
			dic = new Dictionary();
		}
		public function parse(messageId:int,ba:ByteArray):void{
		 	var messageVO:Object;
			switch(messageId){
				case 2:
					messageVO = MSG_CORE_KEY_VO.parse(ba); //,MSG_CORE_KEY
				break;
			}
			executeCallbackById(messageId,messageVO);
		}
		public function registerMessageCallback(messageId:int,callback:Function,context:Object):void{
			var messageCallbackList:Array = dic[messageId];
			if(messageCallbackList==null){
				messageCallbackList = [];
			}
			dic[messageId].push(new MessageHandler(callback,context));
		}
		public function removeMessageCallback(messageId:int,context:Object):void{
			var callbackList:Array = dic[messageId] as Array;
			if(callbackList){
				for ( var i:int=0; i<callbackList.length; i++ ) {
					if ( MessageHandler(callbackList[i]).compareContext( context ) == true ) {
						callbackList.splice(i,1);
						break;
					}
				}
			}
		}
		public function executeCallbackById(messageId:int,messageVO:Object):void{
			if( dic[messageId] != null ) {
				
				var callbackList:Array = dic[messageId] as Array;
				
				var backList:Array = [];
				var messageHandler:MessageHandler;
				for (var i:Number = 0; i < callbackList.length; i++) { 
					messageHandler = callbackList[ i ] as MessageHandler;
					backList.push( messageHandler );
				}
							
				for (i = 0; i < backList.length; i++) {
					messageHandler = backList[ i ] as MessageHandler;
					messageHandler.callbackHandler( messageVO );
				}
			}
		}
		
		public function sendMessageToServer(messageId:int,messageVO:Object):void{
			
		}
		public static function getInstace():ErayMessageManager{
			if(_instance == null){
				_instance = new ErayMessageManager();
			}
			return _instance;
		}
	}
}