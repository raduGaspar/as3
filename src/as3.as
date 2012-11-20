package
{
	import flash.display.Sprite;
	
	import ro.gotoandlearn.ui.Dot;
	import ro.gotoandlearn.utils.EncoderUtils;
	
	[SWF(width="853", height="480", backgroundColor="#FFFFFF", frameRate="30")]
	public class as3 extends Sprite
	{
		public function as3()
		{
			//encoder utils test
			//encode
			var str:String = "Encode this string to its hexadecimal representation";
			var encoded:String = EncoderUtils.encode(str);
			trace(encoded);
			
			//decode
			trace(EncoderUtils.decode(encoded));
			
			//UI elements test
			var dot:Dot = new Dot(3, 10, 0xFF0000);
			addChild(dot);
			dot.x = dot.y = 20;
		}
	}
}