package com.eray.base.loader
{
	import com.eray.base.data.EXPFileVO;
	import com.eray.base.debug.Console;
	
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	import flash.utils.ByteArray;
	
	import org.osflash.signals.Signal;
	
	public class EXPModuleLoader extends IEXPCoreLoader
	{
		private var dataLoader:URLLoader;
		private var loader:Loader;
		private var _signal:Signal;
		public function EXPModuleLoader()
		{
			super();
			_signal = new Signal(EXPFileVO);
		}
		public function get signal():Signal{
			return _signal;
		}
		private var _fileInfo:EXPFileVO;

		public function get fileInfo():EXPFileVO
		{
			return _fileInfo;
		}

		public function set fileInfo(value:EXPFileVO):void
		{
			_fileInfo = value;
		}
		public function load():void{
			if(fileInfo.isRelease){
				dataLoader = new URLLoader();
				dataLoader.dataFormat = URLLoaderDataFormat.BINARY;
				dataLoader.addEventListener(Event.COMPLETE,onLoadDataHandler);
				dataLoader.addEventListener(IOErrorEvent.IO_ERROR,onIOErrorHandler);
				dataLoader.load(new URLRequest(fileInfo.url));
			}else{
				loadSWF(null);
			}
		}
		
		protected function onLoadDataHandler(event:Event):void
		{
			// TODO Auto-generated method stub
			var ba:ByteArray = event.target.data as ByteArray;
			loadSWF(ba);
		}
		private function loadSWF(bytes:ByteArray=null):void{
			loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE,onCompleteHandler);
			loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,onIOErrorHandler);
			if(bytes==null){
				loader.load(new URLRequest(fileInfo.url));
			}else{
				loader.loadBytes(bytes);
			}
		}
		
		protected function onIOErrorHandler(event:IOErrorEvent):void
		{
			// TODO Auto-generated method stub
			Console.log("Event:",event.toString());
		}
		
		protected function onCompleteHandler(event:Event):void
		{
			// TODO Auto-generated method stub
			var loaderInfo:LoaderInfo = event.currentTarget as LoaderInfo;
			fileInfo.fileData = loaderInfo;
			signal.dispatch(fileInfo);
			dispose();
		}
		
		override public function dispose():void
		{
			// TODO Auto Generated method stub
			if(loader){
				loader.contentLoaderInfo.removeEventListener(Event.COMPLETE,onCompleteHandler);
				loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,onIOErrorHandler);
			}
			loader = null;
			if(dataLoader){
				dataLoader.removeEventListener(Event.COMPLETE,onLoadDataHandler);
				dataLoader.removeEventListener(IOErrorEvent.IO_ERROR,onIOErrorHandler);
			}
			dataLoader = null;
			fileInfo = null;
			super.dispose();
		}
		
		
	}
}