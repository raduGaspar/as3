package
{
	import flash.display.Sprite;
	
	import ro.gotoandlearn.ui.Dot;
	import ro.gotoandlearn.ui.charts.ChartFactory;
	import ro.gotoandlearn.ui.color.SimpleColorBar;
	import ro.gotoandlearn.ui.color.SimpleColorWheel;
	import ro.gotoandlearn.ui.color.SimpleHoneyComb;
	import ro.gotoandlearn.utils.EncoderUtils;
	
	[SWF(width="853", height="480", backgroundColor="#FFFFFF", frameRate="30")]
	public class as3 extends Sprite
	{
		public function as3() {
			/** Utils test */
			//EncoderUtils.encode
//			var str:String = "Encode this string to its hexadecimal representation";
//			var encoded:String = EncoderUtils.encode(str);
//			trace(encoded);
//			trace(EncoderUtils.decode(encoded));
			
			/** UI elements test */
//			var dot:Dot = new Dot(3, 10, 0xFF0000);
//			addChild(dot);
//			dot.x = dot.y = 20;
			
			/** Charts test */
			var cf:ChartFactory = new ChartFactory(); //'pyramid' [default], 'bar3D', 'line', 'bar', 'pie'
			addChild(cf.chart);
			//cf.chart.config(600, 600, 200, 350, 60);
			
			/** Colors test */
			//color wheel
//			var scw:SimpleColorWheel = new SimpleColorWheel();
//			addChild(scw);
			
			//color bar
//			var scb:SimpleColorBar = new SimpleColorBar(200);
//			addChild(scb);
			
//			var shc:SimpleHoneyComb = new SimpleHoneyComb();
//			addChild(shc);
		}
	}
}