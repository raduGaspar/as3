package ro.gotoandlearn.utils
{
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;

	public class BitmapUtils
	{
		/**
		 * scaleBitmapData
		 * @param	bitmapData
		 * @param	scale
		 */
		public static function scaleBitmapData(bitmapData:BitmapData, scale:Number):BitmapData {
			scale = Math.abs(scale);
			var width:int = (bitmapData.width * scale) || 1;
			var height:int = (bitmapData.height * scale) || 1;
			var result:BitmapData = new BitmapData(width, height, true, 0);
			var matrix:Matrix = new Matrix();
			matrix.scale(scale, scale);
			result.draw(bitmapData, matrix);
			
			return result;
		}
		
		public static function copyBitmapData(sheet:BitmapData, rect:Rectangle, size:Number=1):BitmapData {
			var bitmapData:BitmapData = new BitmapData(rect.width, rect.height, true, 0);
			bitmapData.copyPixels(sheet, rect, new Point, null, null, true);
			if(size != 1) {
				bitmapData = scaleBitmapData(bitmapData, size);
			}
			
			return bitmapData;
		}
	}
}