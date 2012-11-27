package ro.gotoandlearn.ui.charts
{
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.text.TextField;
	
	public class PieChart extends Sprite
	{
		private var myData:Array = [
			{val:51,color:0x00CCFF,lab:"Internet Explorer"},
			{val:31,color:0xCC0000,lab:"Firefox"},
			{val:10,color:0x00CC66,lab:"Chrome"},
			{val:4,color:0xFF9966,lab:"Safari"},
			{val:3,color:0x999999,lab:"Other"}
		];
		
		private var myChart:Shape = new Shape();
		private var labelArray:Array = [];
		
		public function PieChart() {
			addChild(myChart);
			drawChart(200,150,100, myData);
		}
		
		private function drawChart(centerX:Number, centerY:Number, radius:Number, givenData:Array):void {
			myChart.graphics.clear();
			myChart.x = centerX;
			myChart.y = centerY;
			
			for (var i:int = 0; i < labelArray.length; i++) {
				labelArray[l].parent.removeChild(labelArray[i]);
			}
			labelArray = [];
			
			myChart.graphics.lineStyle(1, 0xFFFFFF);
			
			var totalVal:Number = 0;
			
			for (var u:int = 0; u<givenData.length; u++) {
				totalVal +=  givenData[u].val;
			}
			
			var degreesPerVal:Number = 360 / totalVal;
			var previousDegree:Number = 0;
			
			for (var l:int = 0; l<givenData.length; l++) {
				drawWedge(radius, previousDegree, degreesPerVal * givenData[l].val + previousDegree, givenData[l].color);
				
				var newLabel:TextField = new TextField();
				addChild(newLabel);
				newLabel.text = givenData[l].lab;
				newLabel.selectable = false;
				newLabel.x = centerX + radius * Math.cos((degreesPerVal * givenData[l].val /2 + previousDegree)/ 180 * Math.PI);
				newLabel.y = centerY + radius * Math.sin((degreesPerVal * givenData[l].val /2 + previousDegree)/ 180 * Math.PI);
				labelArray.push(newLabel);
				
				previousDegree = degreesPerVal * givenData[l].val + previousDegree;
			}
		}
		
		private function drawWedge(radius:int, startDeg:int, endDeg:int, color:uint):void {
			myChart.graphics.beginFill(color);
			myChart.graphics.moveTo(0, 0);
			for (var i:int = startDeg; i<=endDeg; i++) {
				myChart.graphics.lineTo(radius * Math.cos(i / 180 * Math.PI), radius * Math.sin(i / 180 * Math.PI));
			}
			myChart.graphics.endFill();
			
		}
	}
}