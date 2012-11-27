package ro.gotoandlearn.ui.charts
{
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.text.TextField;
	
	public class LineChart extends Sprite implements IChartFactory
	{
		
		private var startX:Number = 30;
		private var startY:Number = 200;
		private var chartHeight:Number = 190;
		private var pointInterval:Number = 50;
		private var heightMarker:Number = 50;
		private var chartData:Array = [71,123,54,211,46,187];
		private var myChart:Shape = new Shape();
		
		public function drawChart(chartWidth:Number=0, chartHeight:Number=0):void {
			myChart.graphics.clear();
			
			for (var i:int = 0; i<this.numChildren; i++) {
				removeChildAt(0);
			}
			
			addChild(myChart);
			
			myChart.x = startX;
			myChart.y = startY;
			
			myChart.graphics.lineStyle(2, 0x333333);
			
			myChart.graphics.moveTo(0, 0);
			myChart.graphics.lineTo(0, -chartHeight);
			myChart.graphics.moveTo(0, 0);
			myChart.graphics.lineTo((chartData.length - 1) * pointInterval, 0);
			
			myChart.graphics.lineStyle(1, 0xCCCCCC);
			
			var totalMarkers:Number = Math.floor(maxVal(chartData) / heightMarker) + 1;
			
			for (var m:int = 0; m<totalMarkers; m++) {
				var thisMarkerHeight:Number = m * heightMarker * chartHeight / maxVal(chartData);
				myChart.graphics.moveTo(0, -thisMarkerHeight);
				myChart.graphics.lineTo((chartData.length - 1) * pointInterval, -thisMarkerHeight);
				
				var thisMarkLabel:TextField = new TextField();
				thisMarkLabel.width = 50;
				thisMarkLabel.selectable = false;
				addChild(thisMarkLabel);
				thisMarkLabel.textColor = 0x666666;
				thisMarkLabel.text = (m * heightMarker).toString();
				thisMarkLabel.x = startX - 30;
				thisMarkLabel.y = - thisMarkerHeight + myChart.y - 15;
			}
			
			myChart.graphics.lineStyle(1, 0x0099FF);
			
			for (var n:int = 0; n<chartData.length; n++) {
				var thisHeight:Number = chartData[n] * chartHeight / maxVal(chartData);
				
				if (n == 0) {
					myChart.graphics.moveTo(pointInterval * n, 0 - thisHeight);
				}
				
				myChart.graphics.lineTo(pointInterval * n, 0 - thisHeight);
				
				myChart.graphics.endFill();
				
				var thisLabel:TextField = new TextField();
				thisLabel.width = 50;
				thisLabel.selectable = false;
				addChild(thisLabel);
				thisLabel.textColor = 0x000000;
				thisLabel.text = chartData[n];
				thisLabel.x = pointInterval * n + startX;
				thisLabel.y = startY - thisHeight - 10;
			}
		}
		
		private function maxVal(givenArray:Array):Number {
			var max:Number = givenArray[0];
			for (var m:int = 0; m<givenArray.length; m++) {
				if (givenArray[m] > max) {
					max = givenArray[m];
				}
			}
			return max;
		}
		
		public function get data():Array {
			return chartData;
		}
		
		public function set data(value:Array):void {
			chartData = value;
		}
	}
}