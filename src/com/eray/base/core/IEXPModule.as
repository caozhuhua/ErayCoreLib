package com.eray.base.core
{
	import flash.display.DisplayObject;

	public interface IEXPModule extends IEXPCore
	{
		function setup():void;
		function getID():String;
		function addChild(child:DisplayObject):DisplayObject;
	}
}