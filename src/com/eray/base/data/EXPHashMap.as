package com.eray.base.data
{
	import flash.utils.Dictionary;

	public class EXPHashMap
	{
		private var dic:Dictionary;
		public function EXPHashMap()
		{
			dic = new Dictionary();
		}
		public function insert(key:*,obj:*):*{
			if (key == null)  return null;
			if (obj == null)  return null;
			dic[key] = obj;
			return obj;
		}
		public function remove(key:*):*{
			var obj:*  = dic[key];
			delete dic[key];
			return obj;
		}
	}
}