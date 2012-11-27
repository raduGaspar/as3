package ro.gotoandlearn.ui
{
	import flash.display.Shape;

	public class Hexagon extends Shape
	{
		public static var hxWidth:Number = 90;
		public static var hxHeight:Number = 100;
		
		private static var hxScale:Number = 1;
		private static var hxCoords:Vector.<Number>;
		private static var hxCommands:Vector.<int>;
		
		public function Hexagon(color:uint) {
			hxCommands = new Vector.<int>();
			hxCoords = new Vector.<Number>();
			hxCommands.push(1, 2, 2, 2, 2, 2, 2);
			hxCoords.push(0,-50, 45,-25, 45,25, 0,50, -45,25, -45,-25, 0,-50);
			
			graphics.beginFill(color);
			graphics.lineStyle(3, 0xFFFFFF);
			graphics.drawPath(hxCommands, hxCoords);
			
			scaleX = scaleY = hxScale;
		}
		
		public static function set scale(value:Number):void {
			hxScale = value;
			hxWidth = value * 90;
			hxHeight = value * 100;
		}
		
		public static function get scale():Number {
			return hxScale;
		}
	}
}