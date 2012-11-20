package ro.gotoandlearn.utils {

	public class StringUtils  {
		/**
		 * Pads a number of leading zeros ahead of a given number
		 * @param	num
		 * @param	digits
		 * @return	String
		 */
		public static function padZero(num:Number, digits:int):String {
			var numString:String = num.toString();
			while (numString.length < digits) numString = "0" + numString;
			
			return numString;
		}
	}
}

