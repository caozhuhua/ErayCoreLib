package com.eray.data
{
	import com.eray.base.core.IEXPDispose;
	
	public class UIDataVO implements IEXPDispose
	{
		public function UIDataVO()
		{
		}

		public function get view():Class
		{
			return _view;
		}

		public function set view(value:Class):void
		{
			_view = value;
		}

		public function get name():String
		{
			return _name;
		}

		public function set name(value:String):void
		{
			_name = value;
		}

		public function get method():Function
		{
			return _method;
		}

		public function set method(value:Function):void
		{
			_method = value;
		}
		private var _name:String;
		private var _method:Function;
		private var _view:Class;
		
		public static function create(moduleName:String,uiView:Class,cb:Function):UIDataVO{
			var vo:UIDataVO = new UIDataVO();
			vo.name  = moduleName;
			vo.view = uiView;
			vo.method = cb;
			return vo;
		}
		public function dispose():void
		{
			this.method = null;
		}
	}
}