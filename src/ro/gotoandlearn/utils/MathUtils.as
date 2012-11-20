package ro.gotoandlearn.utils
{
	public class MathUtils
	{
		/**
		 * Converts radians to degrees
		 * @param	radians
		 * @return	Number
		 */
		public static function radiansToDegrees(radians:Number):Number {
			return (radians * 180 / Math.PI);
		}
		
		/**
		 * Converts degrees to radians
		 * @param	degrees
		 * @return	Number
		 */ 
		public static function degreesToRadians(degrees:Number):Number {
			return (degrees * Math.PI / 180);
		}
		
		/**
		 * Returns a random number between min and max
		 * @param	min
		 * @param	max
		 * @return	Number
		 */
		public static function randomRange(min:Number, max:Number, round:Boolean = false):Number {
			var num:Number = (min + Math.random() * (max - min));
			return (round) ? Math.round(num) : num;
		}
		
		/**
		 * Returns -1 for negative and 1 for positive numbers
		 * @param	num
		 * @return	int
		 */
		public static function sign(num:Number):int {
			return (num < 0) ? -1 : 1;
		}
		
		/**
		 * Returns the whole part of a floated number
		 * @param	num
		 * @return	int
		 */
		public static function trimFloat(num:Number):int {
			return int(num);
		}
	}
}