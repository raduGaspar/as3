package ro.gotoandlearn.ui.color
{
	import flash.display.Sprite;
	
	import ro.gotoandlearn.ui.Hexagon;
	import ro.gotoandlearn.utils.ColorUtils;
	
	public class SimpleHoneyComb extends Sprite
	{
		public function SimpleHoneyComb() {
			Hexagon.scale = .15;
			var sectors:Array = new Array([2, 0], [1, 1], [-1, 1], [-2, 0], [-1, -1], [1, -1]);
			//red, magenta, blue, cyan, lime, yellow
			var colors:Array = new Array(0xFF0000, 0xFF00FF, 0x0000FF, 0x00FFFF, 0x00FF00, 0xFFFF00);
			
			var w:Number = 0.50 * Hexagon.hxWidth;
			var h:Number = 0.75 * Hexagon.hxHeight;
			var r:uint, p:uint, s:uint;
			var hx:Hexagon;
			var hexagons:int = 397;
			
			for(var i:Number=0; i<hexagons; i++) {
				r = getRadius(i);
				p = getPosition(i, r);
				s = getSector(r, p);
				
				// create hexagon
				// color
				hx = (r == 0) ? new Hexagon(0xFFFFFF) : new Hexagon(ColorUtils.blend(colors[s], 0x000000, i/hexagons*0.95));
				// achromatic
				//hx = (r == 0) ? new Hexagon(0xFFFFFF) : new Hexagon(ColorUtils.blend(0xFFFFFF, 0x000000, i/hexagons*0.95));
				hx.x = w * (r * sectors[s][0] - (p % r) * (sectors[s][0] - sectors[(s + 1) % 6][0]));
				hx.y = h * (r * sectors[s][1] - (p % r) * (sectors[s][1] - sectors[(s + 1) % 6][1]));
				addChild(hx);
			}
			
			x = width >> 1;
			y = height >> 1;
		}
		
		private function getRadius(i:uint):uint {
			var r:uint = 0;
			while (i > r*6)
				i -= r++ * 6;
			
			return r;
		}
		
		private function getPosition(i:uint, r:uint):uint {
			if (r == 0)
				return i;
			
			while (r-- > 0)
				i -= r * 6;
			
			return i - 1;
		}
		
		private function getSector(r:uint, s:uint):uint {
			return Math.floor(s/r);
		}
	}
}