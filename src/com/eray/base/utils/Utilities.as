package com.eray.base.utils
{
	import flash.errors.EOFError;
	import flash.utils.ByteArray;
	
	public class Utilities
	{
		public function Utilities()
		{
		}
		public static function replaceAt(char:String, value:String, beginIndex:int, endIndex:int):String   
		{  
			beginIndex = Math.max(beginIndex, 0);  
			endIndex = Math.min(endIndex, char.length);  
			var firstPart:String = char.substr(0, beginIndex);  
			var secondPart:String = char.substr(endIndex, char.length);  
			return (firstPart + value + secondPart);  
		}  
		public static function getMAXUnit(buf:ByteArray):Number{
			var gao:Number = buf.readUnsignedInt();
			return gao * Math.pow(2, 32) + buf.readUnsignedInt();
		}
		/**
		 * 将字符串转化成Unicodema写入到DataStream中去
		 * @param	buf
		 * @param	str
		 * @param	num
		 */
		public static function StringToUnicode(buf:ByteArray, str:String, num:uint=0xFFFFFFFF):void 
		{
			var i: uint;
			var len:uint = (num < str.length) ? num : str.length;	//确保len不会超过字符串的长度
			for ( i = 0; i < len; i++ )
			{
				buf.writeShort(str.charCodeAt(i));
			}
			
			if (num != 0xFFFFFFFF && num > str.length)
			{
				for ( ; i < num; i++ )
				{
					buf.writeShort(0);
				}
			}
		}
		
		
		public static function UnicodeToString(buf:ByteArray, number:uint = 0xFFFFFFFF):String
		{
			var num:uint;
			if (number == 0xFFFFFFFF)
				num = buf.bytesAvailable>>>1;
			else
				num = number;
			
			if (num > 0)
			{
				var codes:Array = new Array(num);
				for (var i:uint = 0; i < num; i++ )
				{
					try{
						codes[i] = buf.readUnsignedShort();
					}
					catch(e:EOFError) {
						
						throw e;
					}
					catch(e:Error) {
						
						throw e;
					}
				}
				
				//删除第一个0及之后的字符.
				for (i = 0; i < num; i++)
				{
					if (codes[i] == 0)
						break;
				}
				if(i < num)
					codes.splice(i);
				
				var str:String = String.fromCharCode.apply(NaN, codes);
				return str;
			}
			else
			{
				return null;
			}
		}
	}
}