package ro.gotoandlearn.ui.charts
{
	import flash.display.Sprite;
	import flash.text.TextField;
	
	import ro.gotoandlearn.utils.ColorUtils;

	public class PyramidChart extends Sprite implements IChartFactory
	{
		
		private var chartData:Array = [];
		private var totalVal:Number = 0;
		private var baseAngleOffset:Number = 40;
		private var theHeight:Number;
		private var theWidth:Number;
		private var baseCenterX:Number;
		private var baseCenterY:Number;
		
		public function drawChart(chartWidth:Number=300, chartHeight:Number=300):void {
			theWidth = chartWidth;
			theHeight = chartHeight;
			baseCenterX = theWidth >> 1;
			baseCenterY = theHeight;
			
			graphics.clear();
			
			//store the chart values sum
			for (var i:int = 0; i<chartData.length; i++) {
				totalVal += chartData[i].val;
			}
			
			for (var u:int = 0; u < this.numChildren; u++) {
				removeChildAt(0);
			}
			
			var heightPerVal:Number = (theHeight + baseAngleOffset) / totalVal;
			var diagPerValY:Number = theHeight / totalVal;
			var diagPerValX:Number = theWidth / (2*totalVal);
			var previousHeight:Number = baseCenterY + baseAngleOffset;
			
			var previousDiagY:Number = baseCenterY;
			var previousDiagX:Number = baseCenterX - (theWidth >> 1);
			var previousDiagX2:Number = baseCenterX + (theWidth >> 1);
			var currentValue:Number;
			var currentColor:uint;
			var newLabel:TextField;
			
			for (var a:int = 0; a<chartData.length; a++) {
				currentValue = chartData[a].val;
				currentColor = chartData[a].col;
				
				graphics.beginFill(ColorUtils.blend(currentColor, 0xFFFFFF, 0.92));
				
				graphics.moveTo(baseCenterX, previousHeight);
				graphics.lineTo(baseCenterX, previousHeight - currentValue * heightPerVal);
				graphics.lineTo(previousDiagX + diagPerValX * currentValue, previousDiagY - diagPerValY * currentValue);
				graphics.lineTo(previousDiagX, previousDiagY);
				graphics.lineTo(baseCenterX, previousHeight);
				
				graphics.beginFill(currentColor);
				
				graphics.lineTo(previousDiagX2, previousDiagY);
				graphics.lineTo(previousDiagX2 - diagPerValX * currentValue, previousDiagY - diagPerValY * currentValue);
				graphics.lineTo(baseCenterX, previousHeight - currentValue * heightPerVal);
				
				previousDiagX = previousDiagX + diagPerValX * currentValue;
				previousDiagX2 = previousDiagX2 - diagPerValX * currentValue;
				previousDiagY = previousDiagY - diagPerValY * currentValue;
				previousHeight = previousHeight - currentValue * heightPerVal;
				
				newLabel = new TextField();
				newLabel.text = chartData[a].lab + ", " + Math.round(currentValue * 100 / totalVal) + "%";
				newLabel.x = previousDiagX2;
				newLabel.y = previousDiagY;
				newLabel.selectable = false;
				addChild(newLabel);
			}
		}
		
		public function get data():Array {
			return chartData;
		}
		
		public function set data(value:Array):void {
			chartData = value;
		}
	}
}