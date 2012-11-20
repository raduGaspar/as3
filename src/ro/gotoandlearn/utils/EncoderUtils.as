package ro.gotoandlearn.utils
{
	import flash.utils.ByteArray;

	public class EncoderUtils
	{
		/**
		 * Encodes a given string to its hexadecimal representation
		 * @param	value
		 * @return 	String
		 */
		public static function encode(value:String):String {
			var byteArray:ByteArray = new ByteArray();
			byteArray.writeUTFBytes(value);
			var len:uint = byteArray.length;
			var result:String = "";
			
			for (var i:uint = 0; i < len; i++) {
				result += byteArray[i].toString(16);
			}
			
			return result;
		}
		
		/**
		 * Decodes a given hexadecimal to its string representation
		 * @param	value
		 * @return 	String
		 */
		public static function decode(value:String):String {
			var byteArray:ByteArray = new ByteArray();
			var len:uint = value.length;
			
			for (var i:uint = 0; i < len; i += 2) {
				var concat:String = value.charAt(i) + value.charAt(i+1);
				byteArray.writeByte(parseInt(concat, 16));
			}
			
			return byteArray.toString();
		}
	}
}