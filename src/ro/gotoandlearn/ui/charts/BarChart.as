package ro.gotoandlearn.ui.charts
{
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.TimerEvent;
	import flash.text.TextField;
	import flash.utils.Timer;
	
	public class BarChart extends Sprite
	{
		private var startX:Number = 10;
		private var startY:Number = 200;
		private var chartHeight:Number = 190;
		private var columnWidth:Number = 30;
		private var columnInterval:Number = 15;
		private var totalSteps:Number = 15;
		
		private var chartData:Array = [
			{val:71,color:0xFF0000},
			{val:123,color:0x00FF00},
			{val:54,color:0x0000FF},
			{val:211,color:0xFFFF00},
			{val:26,color:0x9900FF},
			{val:187,color:0xF0F0F0}
		];
		
		private var myChart:Shape = new Shape();
		private var labelArray:Array = [];
		private var tempData:Array = [];
		private var animateStep:Timer = new Timer(50);
		private var step:Number = maxVal(chartData) / totalSteps;
		
		public function BarChart() {
			addChild(myChart);
			
			animateStep.repeatCount = totalSteps + 1;
			animateStep.addEventListener(TimerEvent.TIMER, animateStepFunc);
			
			animateChart();
		}
		
		private function animateChart():void {
			tempData = [];
			for (var td:int = 0; td<chartData.length; td++) {
				tempData.push({val: 1, color:0x000000});
			}
			animateStep.start();
		}
		
		private function animateStepFunc(e:TimerEvent):void {
			for (var an:int = 0; an<tempData.length; an++) {
				if (tempData[an].val < chartData[an].val) {
					tempData[an].val +=  step;
					tempData[an].val = Math.floor(tempData[an].val);
				}
				else {
					tempData[an].val = chartData[an].val;
				}
				tempData[an].color = chartData[an].color;
			}
			
			drawChart(tempData, maxVal(chartData));
		}
		
		private function drawChart(givenData:Array, givenMaxVal:Number):void {
			// remove all the previous stuff
			myChart.graphics.clear();
			
			for (var la:int = 0; la<labelArray.length; la++) {
				labelArray[la].parent.removeChild(labelArray[la]);
			}
			labelArray = [];
			
			// generate chart
			myChart.x = startX;
			myChart.y = startY;
			
			for (var n:int = 0; n<givenData.length; n++) {
				var thisHeight:Number = givenData[n].val * chartHeight / givenMaxVal;
				
				myChart.graphics.beginFill(givenData[n].color);
				myChart.graphics.drawRect(columnInterval * n + columnWidth * n, 0 - thisHeight, columnWidth, thisHeight);
				myChart.graphics.endFill();
				
				var thisLabel:TextField = new TextField();
				thisLabel.width = columnWidth;
				addChild(thisLabel);
				thisLabel.textColor = 0x000000;
				thisLabel.text = givenData[n].val;
				thisLabel.x = columnInterval * n + columnWidth * n + 0.5 * columnWidth;
				thisLabel.y = 0 - thisHeight / 2 + chartHeight;
				labelArray.push(thisLabel);
			}
		}
		
		private function maxVal(givenArray:Array):Number {
			var max:Number = givenArray[0].val;
			for (var ma:int = 0; ma<givenArray.length; ma++) {
				if (givenArray[ma].val > max) {
					max = givenArray[ma].val;
				}
			}
			
			return max;
		}
	}
}