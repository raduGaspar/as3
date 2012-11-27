package ro.gotoandlearn.utils {

	public class ColorUtils  {
		/**
		 * Blends two colors together.
		 * @param from			color from which to blend
		 * @param to			color to which to blend
		 * @param by			amount of original color to maintain [0, 1]
		 * @param blendAlpha	includes the alpha value of the color (0xFF000000)
		 * @returns uint		blended color result
		 */
		public static function blend(from:uint, to:uint=0xFFFFFFFF, by:Number=0.5, blendAlpha:Boolean=false):uint {
			var alphaFrom	:uint = (from >> 24) & 0xFF;
			var redFrom		:uint = (from >> 16) & 0xFF;
			var greenFrom	:uint = (from >>  8) & 0xFF;
			var blueFrom	:uint = (from >>  0) & 0xFF;
			
			var alphaTo		:uint = (to >> 24) & 0xFF;
			var redTo		:uint = (to >> 16) & 0xFF;
			var greenTo		:uint = (to >>  8) & 0xFF;
			var blueTo		:uint = (to >>  0) & 0xFF;
			
			by = (by < 0 || by > 1) ? 0.5 : by;
			
			var alphaFinal	:uint = (alphaFrom*by + alphaTo*(1-by)) & 0xFF;
			var redFinal	:uint = (redFrom*by + redTo*(1-by)) & 0xFF;
			var greenFinal	:uint = (greenFrom*by + greenTo*(1-by)) & 0xFF;
			var blueFinal	:uint = (blueFrom*by + blueTo*(1-by)) & 0xFF;
			
			return (blendAlpha?alphaFinal<<24:0) | (redFinal<<16) | (greenFinal<<8) | blueFinal;
		}
		
		/**
		 * Converts an RGB color value to HSL. Conversion formula
		 * adapted from http://en.wikipedia.org/wiki/HSL_color_space.
		 * Assumes r, g, and b are contained in the set [0, 255] and
		 * returns h, s, and l in the set [0, 1].
		 *
		 * @param   Number  r	The red color value
		 * @param   Number  g	The green color value
		 * @param   Number  b	The blue color value
		 * @return  Array		The HSL representation
		 */
		public static function rgbToHsl(color:uint):Array {
			var r:Number = ((color >> 16) & 0xFF) / 255;
			var g:Number = ((color >> 8) & 0xFF) / 255;
			var b:Number = (color & 0xFF) / 255;
			
			var max:Number = Math.max(r, g, b);
			var min:Number = Math.min(r, g, b);
			
			var h:Number, s:Number, l:Number = (max + min) >> 1;
			
			if(max == min) {
				//achromatic
				h = s = 0;
			} else {
				var d:Number = max - min;
				s = (l > 0.5) ? d / (2 - max - min) : d / (max + min);
				switch(max) {
					case r:
						h = (g - b) / d + (g < b ? 6 : 0);
						break;
					case g:
						h = (b - r) / d + 2;
						break;
					case b:
						h = (r - g) / d + 4;
						break;
				}
				h /= 6;
			}
			
			//h = [0-360]; s = [0-100]%; l=[0-100]
			h = Math.round(h*360);
			s = Math.round(s*100);
			l = Math.round(l*100);
			
			return [h, s, l];
		}
		
		/**
		 * Converts an HSL color value to RGB. Conversion formula
		 * adapted from http://en.wikipedia.org/wiki/HSL_color_space.
		 * Assumes h, s, and l are contained in the set [0, 1] and
		 * returns r, g, and b in the set [0, 255].
		 *
		 * @param   Number  h	The hue
		 * @param   Number  s	The saturation
		 * @param   Number  l	The lightness
		 * @return  Array		The RGB representation
		 */
		public static function hslToRgb(h:Number, s:Number, l:Number):Array {
			var r:Number, g:Number, b:Number;
			
			function hue2rgb(p:Number, q:Number, t:Number):Number {
				if(t < 0) t += 1;
				if(t > 1) t -= 1;
				if(t < 1/6) return p + (q - p) * 6 * t;
				if(t < 1/2) return q;
				if(t < 2/3) return p + (q - p) * (2/3 - t) * 6;
				
				return p;
			}
			
			if(s == 0){
				r = g = b = l; // achromatic
			} else {
				var q:Number = l < 0.5 ? l * (1 + s) : l + s - l * s;
				var p:Number = 2 * l - q;
				r = hue2rgb(p, q, h + 1/3);
				g = hue2rgb(p, q, h);
				b = hue2rgb(p, q, h - 1/3);
			}
			
			return [r * 255, g * 255, b * 255];
		}
		
		/**
		 * Converts an RGB color value to HSV. Conversion formula
		 * adapted from http://en.wikipedia.org/wiki/HSV_color_space.
		 * Assumes r, g, and b are contained in the set [0, 255] and
		 * returns h, s, and v in the set [0, 1].
		 *
		 * @param   Number  r       The red color value
		 * @param   Number  g       The green color value
		 * @param   Number  b       The blue color value
		 * @return  Array           The HSV representation
		 */
		/*function rgbToHsv(r, g, b) {
			r = r/255, g = g/255, b = b/255;
			var max = Math.max(r, g, b), min = Math.min(r, g, b);
			var h, s, v = max;
			
			var d = max - min;
			s = max == 0 ? 0 : d / max;
			
			if(max == min) {
				h = 0; // achromatic
			} else {
				switch(max) {
					case r:
						h = (g - b) / d + (g < b ? 6 : 0);
						break;
					case g:
						h = (b - r) / d + 2;
						break;
					case b:
						h = (r - g) / d + 4;
						break;
				}
		
				h /= 6;
			}
			
			return [h, s, v];
		}
		*/
		/**
		 * Converts an HSV color value to RGB. Conversion formula
		 * adapted from http://en.wikipedia.org/wiki/HSV_color_space.
		 * Assumes h, s, and v are contained in the set [0, 1] and
		 * returns r, g, and b in the set [0, 255].
		 *
		 * @param   Number  h       The hue
		 * @param   Number  s       The saturation
		 * @param   Number  v       The value
		 * @return  Array           The RGB representation
		 */
		/*function hsvToRgb(h, s, v) {
			var r, g, b;
			
			var i = Math.floor(h * 6);
			var f = h * 6 - i;
			var p = v * (1 - s);
			var q = v * (1 - f * s);
			var t = v * (1 - (1 - f) * s);
			
			switch(i % 6) {
				case 0:
					r = v, g = t, b = p;
					break;
				case 1:
					r = q, g = v, b = p;
					break;
				case 2:
					r = p, g = v, b = t;
					break;
				case 3:
					r = p, g = q, b = v;
					break;
				case 4:
					r = t, g = p, b = v;
					break;
				case 5:
					r = v, g = p, b = q;
					break;
			}
			
			return [r * 255, g * 255, b * 255];
		}*/
	}
}

