package ro.gotoandlearn.ui.charts
{
	import flash.display.Sprite;

	public interface IChartFactory {
		function drawChart(chartWidth:Number=0, chartHeight:Number=0):void;
		function get data():Array;
		function set data(value:Array):void;
	}
}