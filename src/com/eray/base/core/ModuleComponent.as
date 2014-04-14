package com.eray.base.core
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class ModuleComponent extends Sprite implements IEXPModule
	{
		public function ModuleComponent()
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE,onAddToStageHandler);
		}
		
		private function onAddToStageHandler(event:Event):void
		{
			// TODO Auto-generated method stub
			this.removeEventListener(Event.ADDED_TO_STAGE,onAddToStageHandler);
			onAddToStage(event);
		}
		protected function onAddToStage(e:Event):void{
			
		}
		public function setup():void{
			
		}
		public function getID():String{
			return "";
		}
		public function dispose():void{
			
		}
	}
}