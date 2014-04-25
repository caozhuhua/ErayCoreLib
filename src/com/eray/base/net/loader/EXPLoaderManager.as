package com.eray.base.net.loader
{
	import com.eray.base.data.EXPFileVO;
	import com.eray.base.debug.Console;
	import com.eray.response.DataResponse;
	
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	public class EXPLoaderManager extends EventDispatcher
	{
		private static var _instance:EXPLoaderManager;
		private var loader:EXPFileLoader;
		private var fileInfoList:Array = [];
		private var responseList:Array = [];
		private var isLoading:Boolean;
		public function EXPLoaderManager(target:IEventDispatcher=null)
		{
			super(target);
			loader = new EXPFileLoader();
		}
		public static function getInstance():EXPLoaderManager{
			if(_instance==null){
				_instance = new EXPLoaderManager();
			}
			return _instance;
		}
		public function load(fileInfo:EXPFileVO):void{
			var fileData:Object = EXPFileLoader.getFileData(fileInfo);
			if(fileData!=null){
				onLoad(fileInfo,fileData);
			}else{
				if(fileInfo.newThread){
					
				}else{
					fileInfoList.push(fileInfo);
					startLoad();
				}
			}
		}
		
		private function onLoad(file:EXPFileVO,fileData:Object):void{
			if (fileData == null) {
				Console.log(file.url+ "error");
				if(file.error!=null){
					file.error.executeWith([file.url]);
				}
			}
			if (file.success != null) {
				file.success.executeWith([fileData]);
			}
		}
		private function startLoad():void{
			if(isLoading){
				return;
			}
			if(fileInfoList.length>0){
				var _fileInfo:EXPFileVO = fileInfoList.shift();
				loader.load(_fileInfo.url,_fileInfo.fileType,new EXPResponse(complete),_fileInfo.progress,_fileInfo.cache);
			}
			isLoading = true;
		}
		public function loadFile(list:Array,response:DataResponse):void{
			var len:int = list.length;
			for(var i:int = 0;i<len;++i){
				
			}
		}
		public static function clearInstance():void{
			_instance = null;
		}
		private function complete():void{
			
		}
		
	}
}