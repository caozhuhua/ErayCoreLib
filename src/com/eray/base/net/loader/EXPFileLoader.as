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
	import flash.net.URLRequest;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	
	public class EXPFileLoader extends EventDispatcher implements IEXPCore
	{
		private var urlLoader:URLLoader;
		private var loader:Loader;
		private static var fileMap:Dictionary = new Dictionary();
		private var request:URLRequest;
		public function EXPFileLoader()
		{
			super();
		}
		private function initinalize():void{
			request = new URLRequest();
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
			var content:Object = null;
			if (_type == EXPFileVO.SWF_FILE) {
				loader.unloadAndStop();
				content = 10;
			} else if(_type==EXPFileVO.IMAGE_FILE) {
				content = Bitmap(loader.content).bitmapData;
				loader.unloadAndStop();
			}
			onLoadComplete(content);
		}
		
		protected function onIOErrorHandler(event:IOErrorEvent):void
		{
			// TODO Auto-generated method stub
			Console.log("loaderror: ",_url);
			onLoadComplete(null,0);
		}
		
		protected function onProgressHandler(event:ProgressEvent):void
		{
			if (_progress != null) {
				var value:Number = event.bytesLoaded / event.bytesTotal;
				_progress.executeWith([value]);
			}
		}
		
		protected function onDataLoaderHandler(event:Event):void
		{
			// TODO Auto-generated method stub
			var content:Object = null;
			if(_type == EXPFileVO.SWF_FILE || _type==EXPFileVO.IMAGE_FILE){
				if(urlLoader.data!=null){
					loader.loadBytes(urlLoader.data,new LoaderContext(false,ApplicationDomain.currentDomain));
					urlLoader.data = null;
					return;
				}
			}else if(_type == EXPFileVO.TXT_FILE){
				content = ByteArray(urlLoader.data).toString();
			}else if(_type == EXPFileVO.BYTE_FILE){
				content = ByteArray(urlLoader.data);
			}
			onLoadComplete(content);
		}
		private function onLoadComplete(content:Object,val:int = 1):void{
			var lr:EXPResponse = _lr;
			_progress = null;
			lr = null;
			if(val==1){
				lr.executeWith([content]);
			}else{
				lr.executeWith([null]);
			}
		}
		public static function getFileData(f:EXPFileVO):Object{
			if(fileMap[f.url]){
				return fileMap[f.url];
			}
			return null;
		}
		
		private var _lr:EXPResponse;
		private var _url:String;
		private var _type:int;
		private var _isCache:int;
		private var _progress:EXPResponse;
		public function load(url:String,type:int,lr:EXPResponse,progress:EXPResponse,isCache:int = 1):void{
			_url = url;
			_type = type;
			_lr = lr;
			_isCache = isCache;
			_progress = progress;
			request.url = _url;
			urlLoader.load(request);
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
		}
	}
}