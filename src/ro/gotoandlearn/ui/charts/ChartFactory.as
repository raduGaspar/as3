package ro.gotoandlearn.ui.charts
{
	import flash.display.Sprite;

	public class ChartFactory extends Sprite
	{
		
		private var chartType:String;
		private var chartData:Array;
		private var factory:IChartFactory;
		private var chartTypes:Object;
		private var chartW:Number;
		private var chartH:Number;
		
		//0x94AE0A, 0x115FA6, 0xA61120, 0xFF8809, 0xFFD13E, 0xA61187, 0x24AD9A
		public function ChartFactory(name:String="pyramid", chartWidth:Number=300, chartHeight:Number=300) {
			chartW = chartWidth;
			chartH = chartHeight;
			
			chartTypes = {
				'pyramid': function():IChartFactory {
					chartData = [
						{val: 52, col: 0x94AE0A, lab: "Ch"},
						{val: 31, col: 0x115FA6, lab: "FF"},
						{val: 10, col: 0xA61120, lab: "IE"},
						{val: 7,  col: 0xFF8809, lab: "Oth"}
					];
					
					return new PyramidChart();
				},
				
				'bar3D' : function():IChartFactory {
					chartData = [
						{val: 22, col: 0x94AE0A, lab: "A"},
						{val: 42, col: 0x115FA6, lab: "B"},
						{val: 31, col: 0xA61120, lab: "C"},
						{val: 5,  col: 0xFF8809, lab: "D"}
					];
					
					return new BarChart3D();
				},
				
				'line': function():IChartFactory {
					chartData = [71,123,54,211,46,187];
					
					return new LineChart();
				},
				
				//not done yet:
				'bar': function():IChartFactory {
					return null;
				},
				
				'pie': function():IChartFactory {
					return null;
				}
			};
			
			type = (chartTypes[name]) ? name : "pyramid";
		}
		
		public function set type(value:String):void {
			chartType = value;
			update();
		}
		
		public function set data(list:Array):void {
			chartData = list;
			update();
		}
		
		public function get chart():Sprite {
			return factory as Sprite;
		}
		
		private function update():void {
			factory = chartTypes[chartType]();
			factory.data = chartData;
			factory.drawChart(chartW, chartH);
		}
	}
}