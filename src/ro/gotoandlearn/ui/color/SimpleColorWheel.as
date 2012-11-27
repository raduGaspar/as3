package ro.gotoandlearn.ui.color
{
	import flash.display.CapsStyle;
	import flash.display.GradientType;
	import flash.display.LineScaleMode;
	import flash.display.Sprite;
	import flash.geom.Matrix;
	
	public class SimpleColorWheel extends Sprite
	{
		
		public function SimpleColorWheel(radius:Number=100) {
			var diameter	:Number = radius*2;
			var radians		:Number;
			var destX		:Number;
			var destY		:Number;
			var redShift	:Number;
			var greenShift	:Number;
			var blueShift	:Number;
			var color		:Number;
			var colorMatrix	:Matrix;
			
			for(var i:Number=0; i<360; i+=0.1) {
				radians 	= i * (Math.PI / 180);
				destX 		= radius * Math.cos(radians);
				destY 		= radius * Math.sin(radians);
				redShift 	= Math.cos(radians) * 127 + 128 << 16;
				greenShift 	= Math.cos(radians + 2 * Math.PI / 3) * 127 + 128 << 8;
				blueShift 	= Math.cos(radians + 4 * Math.PI / 3) * 127 + 128;
				color 		= redShift | greenShift | blueShift;
				
				colorMatrix = new Matrix();
				colorMatrix.createGradientBox(diameter, diameter, radians);
				
				graphics.lineStyle(1, color, 1, false, LineScaleMode.NONE, CapsStyle.NONE);
				//graphics.lineGradientStyle(GradientType.LINEAR, [color>>8, color], [100, 100], [127, 255], colorMatrix);
				//graphics.lineGradientStyle(GradientType.LINEAR, [0x000000, color], [100, 100], [127, 255], colorMatrix);
				//graphics.lineGradientStyle(GradientType.LINEAR, [0xFFFFFF, color], [100, 100], [127, 255], colorMatrix);
				
				graphics.moveTo(radius, radius);
				graphics.lineTo(destX+radius, destY+radius);
			}
		}
	}
}