package com.eray.base.net.loader
{
	import com.eray.base.core.IEXPCore;
	import com.eray.base.data.EXPFileVO;
	import com.eray.base.debug.Console;
	import com.eray.response.DataResponse;
	
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	
	public class EXPFileLoader extends EventDispatcher implements IEXPCore
	{
		private var urlLoader:URLLoader;
		private var loader:Loader;
		private static var fileMap:Dictionary = new Dictionary();
		public function EXPFileLoader()
		{
			super();
		}
		private function initinalize():void{
			urlLoader = new URLLoader();
			urlLoader.addEventListener(Event.COMPLETE,onDataLoaderHandler);
			urlLoader.addEventListener(ProgressEvent.PROGRESS,onProgressHandler);
			urlLoader.addEventListener(IOErrorEvent.IO_ERROR,onIOErrorHandler);
			urlLoader.dataFormat = flash.net.URLLoaderDataFormat.BINARY;
			
			loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE,onLoaderCompleteHandler);
			loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,onIOErrorHandler);
			loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS,onLoaderProgressHandler);
		}
		
		protected function onLoaderProgressHandler(event:ProgressEvent):void
		{
			// TODO Auto-generated method stub
			
		}
		
		protected function onLoaderCompleteHandler(event:Event):void
		{
			// TODO Auto-generated method stub
			if (fileInfo.fileType == EXPFileVO.SWF_FILE) {
				loader.unloadAndStop();
				fileInfo.fileData = 10;
			} else if(fileInfo.fileType==EXPFileVO.IMAGE_FILE) {
				fileInfo.fileData = Bitmap(loader.content).bitmapData;
				loader.unloadAndStop();
			}
			onLoadComplete();
		}
		
		protected function onIOErrorHandler(event:IOErrorEvent):void
		{
			// TODO Auto-generated method stub
			Console.log("loaderror: ",fileInfo.url);
			onLoadComplete(0);
		}
		
		protected function onProgressHandler(event:ProgressEvent):void
		{
			// TODO Auto-generated method stub
			if(fileInfo.onProgress!=null){
				fileInfo.onProgress(event.bytesLoaded,event.bytesTotal);
			}
		}
		
		protected function onDataLoaderHandler(event:Event):void
		{
			// TODO Auto-generated method stub
			if(fileInfo.fileType == EXPFileVO.SWF_FILE || fileInfo.fileType==EXPFileVO.IMAGE_FILE){
				if(urlLoader.data!=null){
					loader.loadBytes(urlLoader.data,new LoaderContext(false,ApplicationDomain.currentDomain));
					urlLoader.data = null;
					return;
				}
			}else if(fileInfo.fileType == EXPFileVO.TXT_FILE){
				fileInfo.fileData = ByteArray(urlLoader.data).toString();
			}else if(fileInfo.fileType == EXPFileVO.BYTE_FILE){
				fileInfo.fileData = ByteArray(urlLoader.data);
			}
			onLoadComplete();
		}
		private function onLoadComplete(val:int = 1):void{
			var _fileInfo:EXPFileVO = fileInfo;
			fileInfo = null;
			if(val==1){
				_fileInfo.success(_fileInfo);
			}else{
				_fileInfo.error(_fileInfo);
			}
		}
		public static function getFileData(f:EXPFileVO):Object{
			if(fileMap[f.url]){
				return fileMap[f.url];
			}
			return null;
		}
		
		private var fileInfo:EXPFileVO;
		public function load(f:EXPFileVO):void{
			fileInfo = f;
		}
		
		public function dispose():void
		{
			if(urlLoader){
				urlLoader.removeEventListener(Event.COMPLETE,onDataLoaderHandler);
				urlLoader.removeEventListener(ProgressEvent.PROGRESS,onProgressHandler);
				urlLoader.removeEventListener(IOErrorEvent.IO_ERROR,onIOErrorHandler);
			}
			urlLoader =  null;
			if(loader){
				loader.contentLoaderInfo.removeEventListener(Event.COMPLETE,onLoaderCompleteHandler);
				loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,onIOErrorHandler);
				loader.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS,onLoaderProgressHandler);
			}
			loader = null;
			fileInfo = null;
		}
	}
}