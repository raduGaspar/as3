package ro.gotoandlearn.ui.charts
{
	import flash.display.Sprite;
	import flash.text.TextField;
	
	import ro.gotoandlearn.utils.ColorUtils;
	
	public class BarChart3D extends Sprite implements IChartFactory
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
			baseCenterY = theHeight + baseAngleOffset;
			graphics.clear();
			
			//store the chart values sum
			for (var i:int = 0; i<chartData.length; i++) {
				totalVal += chartData[i].val;
			}
			
			for (var u:int = 0; u < this.numChildren; u++) {
				removeChildAt(0);
			}
			
			var heightPerVal:Number = theHeight / totalVal;
			var previousHeight:Number = baseCenterY;
			var halfW:Number = theWidth >> 1;
			var beginning:Number = baseCenterX - halfW;
			var end:Number = baseCenterX + halfW;
			var currentValue:Number;
			var currentColor:uint;
			var newLabel:TextField;
			
			for (var a:int = 0; a<chartData.length; a++) {
				currentValue = chartData[a].val;
				currentColor = chartData[a].col;
				
				graphics.beginFill(ColorUtils.blend(currentColor, 0xFFFFFF, 0.92));
				graphics.moveTo(beginning, previousHeight);
				graphics.lineTo(beginning, previousHeight - currentValue * heightPerVal);
				graphics.lineTo(end, previousHeight - currentValue * heightPerVal);
				graphics.lineTo(end, previousHeight);
				graphics.lineTo(beginning, previousHeight);
				graphics.endFill();
				graphics.beginFill(currentColor);
				graphics.moveTo(end, previousHeight);
				graphics.lineTo(end + baseAngleOffset, previousHeight - baseAngleOffset);
				graphics.lineTo(end + baseAngleOffset, previousHeight - currentValue * heightPerVal - baseAngleOffset);
				graphics.lineTo(end, previousHeight - currentValue * heightPerVal);
				graphics.endFill();
				
				newLabel = new TextField();
				newLabel.text = chartData[a].lab + ", " + Math.round(currentValue * 100 / totalVal) + "%";
				newLabel.x = beginning;
				newLabel.y = previousHeight - currentValue * (heightPerVal >> 1) - 10;
				newLabel.selectable = false;
				newLabel.width = theWidth;
				addChild(newLabel);
				
				previousHeight = previousHeight - currentValue * heightPerVal;
			}
			
			graphics.beginFill(ColorUtils.blend(chartData[chartData.length-1].col, 0xFFFFFF, 0.92));
			graphics.moveTo(end, baseCenterY-theHeight);
			graphics.lineTo(beginning, baseCenterY-theHeight);
			graphics.lineTo(beginning+baseAngleOffset, baseCenterY-theHeight-baseAngleOffset);
			graphics.lineTo(end+baseAngleOffset, baseCenterY-theHeight-baseAngleOffset);
			graphics.endFill();
		}
		
		public function get data():Array {
			return chartData;
		}
		
		public function set data(value:Array):void {
			chartData = value;
		}
	}
}