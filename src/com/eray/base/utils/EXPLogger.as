package com.eray.base.utils
{
	public class EXPLogger
	{
		public function EXPLogger()
		{
		}
		public static function log(...args):void{
			trace(args.join(","));
		}
	}
}