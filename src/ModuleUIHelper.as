package
{
	import com.eray.base.core.ModuleComponent;
	import com.eray.base.debug.Console;
	import com.eray.data.UIDataVO;
	import com.eray.response.UIResponse;
	
	import flash.display.Sprite;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	import morn.core.handlers.Handler;
	
	public class ModuleUIHelper extends EventDispatcher
	{
		private static var _instance:ModuleUIHelper;
		private var isInit:Boolean;
		public function ModuleUIHelper(target:IEventDispatcher=null)
		{
			super(target);
		}
		public static function getInstance():ModuleUIHelper{
			if(_instance==null){
				_instance = new ModuleUIHelper();
			}
			return _instance;
		}
		private function checkIsInitApp(container:Sprite):void{
			if(!isInit){
				App.init(container);
				isInit = true;
			}
		}
		
		public function getLoginWin(container:ModuleComponent,response:UIResponse):void{
			App.loader.loadAssets(["assets/login.swf"], new Handler(loadComplete), new Handler(loadProgress));
		}
		private function loadProgress(value:Number):void {
			//加载进度
			trace("loaded", value);
		}
		
		private function loadComplete():void {
			//实例化场景
			Console.log("load assets complete");
		}
	}
}