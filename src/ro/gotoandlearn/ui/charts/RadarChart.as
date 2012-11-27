//package ro.gotoandlearn.charts.src
//{
//	import flash.display.Sprite;
//	import flash.display.Stage;
//	import flash.events.MouseEvent;
//	import flash.geom.ColorTransform;
//	import flash.text.TextField;
//	import flash.text.TextFieldAutoSize;
//	
//	import ro.gotoandlearn.ui.iphone.FontManager;
//	import ro.gotoandlearn.ui.iphone.Label;
//	import ro.gotoandlearn.utils.Dot;
//	
//	public class RadarChart extends Sprite
//	{
//		private var radius:int;
//		private var points:int;
//		private var lineColor:uint = 0x000000;
//		private var layers:Array = new Array();
//		private var rows:int;
//		private var dot:Dot;
//		private var entries:Object;
//		
//		private var defaultColors:Array = [0xF9AA00, 0x007BF9, 0x008D0D, 0xB9000D, 0x8CC53B, 0x4C3BC5];
//		private var fillAlpha:Number = 0.4;
//		private var color:ColorTransform = new ColorTransform();
//		private var colors:Array = [lineColor, 0x007BF9];
//		private var dataProvider:Object;
//		
//		public function RadarChart(dataProvider:Object, radius:int=180) {
//			this.dataProvider = dataProvider;
//			this.radius = radius;
//			this.entries = dataProvider['entries'];
//			this.rows = entries[0]['scores'].length;
//			this.points = dataProvider['sections'].length;
//			drawChart();
//		}
//		
//		private function drawChart():void {
//			x = radius + 20;
//			y = radius + 20;
//			
//			//draw multiple rows
//			for (var i:int = 0; i<rows; i++) {
//				var size:int = radius - (i*radius/rows);
//				drawRadarSegment(size, (i==0));
//			}
//			
//			drawEntries();
//		}
//		
//		private function drawRadarSegment(radarRadius:int, showTitle:Boolean=true):void {
//			var pArr:Array = [];
//			for (var i:int = 0; i<points; i++) {
//				dot = (showTitle) ? new Dot(3, 10, 0) : new Dot();
//				addChild(dot);
//				
//				//spread dots evenly across circumference
//				var angle:Number = Math.PI*2/points;
//				var theta:Number = angle*i;
//				
//				dot.x = Math.cos(theta)*radarRadius;
//				dot.y = Math.sin(theta)*radarRadius;
//				
//				//show section labels
//				if(showTitle) {
//					//add labels to chart
//					addChild(createLabel(dot.x, dot.y, dataProvider['sections'][i]));
//				} else {
//					//change dot color
//					color.color = colors[0];
//					dot.transform.colorTransform = color;
//					
//					//add mouse events to dot
//					dot.addEventListener(MouseEvent.MOUSE_OVER, doOver);
//					dot.addEventListener(MouseEvent.MOUSE_OUT, doOut);
//					
//					//store dot into points array
//					pArr.push(dot);
//					
//					//draw a line from the center to the current dot
//					graphics.moveTo(0,0);
//					graphics.lineStyle(1, lineColor);
//					graphics.lineTo(dot.x, dot.y);
//				}
//			}
//			
//			//draw lines between each of the points
//			if(!showTitle) {
//				for (var p:Object in pArr) {
//					var o:Object=pArr[p];
//					if (p == 0) {
//						graphics.moveTo(o.x, o.y);
//					} else {
//						graphics.lineStyle(1, lineColor);
//						graphics.lineTo(o.x, o.y);
//					}
//					
//					if (p == pArr.length-1) {
//						graphics.lineTo(pArr[0].x, pArr[0].y);
//					}
//				}
//				layers.push(pArr);
//			}
//			
//		}
//		
//		private function drawEntries():void {
//			//var vals:Array = [];
//			for(var e:Object in entries) {
//				trace(entries[e].name);
//				trace(entries[e].scores);
//				
//				var firstPoint:Object;
//				
//				for(var i:int = 0; i < entries[e].scores.length; i++) {
//					var value:int = entries[e].scores[layers.length - i];
//					var dotObj:Object = layers[value-1][i];
//					if(i==0) {
//						firstPoint = dotObj;
//						graphics.beginFill(entries[e].color, fillAlpha);
//						graphics.moveTo(dotObj.x, dotObj.y);
//					} else {
//						graphics.lineStyle(1, entries[e].color);
//						graphics.lineTo(dotObj.x, dotObj.y);
//					}
//					if (i == entries[e].scores.length-1) {
//						graphics.lineTo(firstPoint.x, firstPoint.y);
//						graphics.endFill();
//					}
//				}
//				
//				//vals = (vals.length == 0) ? entries[e].scores : vals.concat(entries[e].scores);
//			}
//			
//			//trace('maxScoreValue: ' + maxVal(vals) + ' valsLen:: ' + vals.length);
//		}
//		
//		private function createLabel(x:Number, y:Number, text:String):Sprite {
//			//create label container
//			var spr:Sprite = new Sprite();
//			
//			//create label
//			var tf:TextField = new TextField();
//			tf.embedFonts = true;
//			tf.selectable = false;
//			tf.mouseEnabled = false;
//			tf.defaultTextFormat = FontManager.getTextFormat({
//				font: FontManager.BOLD,
//				size: 12,
//				color: 0x000000,
//				bold: true,
//				align: 'center'
//			});
//			tf.text = text;
//			addChild(tf);
//			tf.autoSize = TextFieldAutoSize.LEFT;
//			spr.addChild(tf);
//			
//			//text and sprite coordinates
//			tf.x -= tf.width >> 1;
//			tf.y -= tf.height >> 1;
//			spr.x = x;
//			spr.y = y;
//			spr.rotation = (Math.atan2(spr.y, spr.x) * 180 / Math.PI) + 90;
//			
//			return spr;
//		}
//		
//		private function maxVal(arr:Array):Number {
//			return Math.max.apply(this, arr);
//		}
//		
//		private function doOver(e:MouseEvent):void {
//			color.color = colors[1];
//			e.target.transform.colorTransform = color;
//		}
//		
//		private function doOut(e:MouseEvent):void {
//			color.color = colors[0];
//			e.target.transform.colorTransform = color;
//		}
//	}
//}

package ro.gotoandlearn.ui.charts
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.MouseEvent;
	import flash.geom.ColorTransform;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	
	import ro.gotoandlearn.ui.Dot;
	
	
	public class RadarChart extends Sprite
	{
		private var radius:int;
		private var points:int;
		private var lineColor:uint = 0x000000;
		private var layers:Array = new Array();
		private var rows:int;
		private var dot:Dot;
		private var entries:Object;
		
		private var colors:Array = [0x20409A, 0x00AEEF, 0x056839, 0x8DC63F, 0x7F3F98, 0xBF1E2E, 0x8B5E3B, 0xFFDE16, 0xFCB040];
		private var colors2:Array = [0x31b09f, 0xac218f, 0xfdd249, 0xff901a, 0xaa1f2d, 0x1f68aa, 0x9bb31b];
		private var fillAlpha:Number = 0.4;
		private var color:ColorTransform = new ColorTransform();
		private var dataProvider:Object;
		
		public function RadarChart(dataProvider:Object, radius:int=180) {
			this.dataProvider = dataProvider;
			this.radius = radius;
			this.entries = dataProvider['entries'];
			this.rows = entries[0]['scores'].length;
			this.points = dataProvider['sections'].length;
			drawChart();
		}
		
		private function drawChart():void {
			x = radius + 20;
			y = radius + 20;
			
			//draw multiple rows
			for (var i:int = 0; i<rows; i++) {
				var size:int = radius - (i*radius/rows);
				drawRadarSegment(size, (i==0));
			}
			
			drawEntries();
		}
		
		private function drawRadarSegment(radarRadius:int, showTitle:Boolean=true):void {
			var pArr:Array = [];
			for (var i:int = 0; i<points; i++) {
				dot = (showTitle) ? new Dot(3, 10, 0) : new Dot();
				addChild(dot);
				
				//spread dots evenly across circumference
				var angle:Number = Math.PI*2/points;
				var theta:Number = angle*i;
				
				dot.x = Math.cos(theta)*radarRadius;
				dot.y = Math.sin(theta)*radarRadius;
				
				//show section labels
				if(showTitle) {
					//add labels to chart
					addChild(createLabel(dot.x, dot.y, dataProvider['sections'][i]));
				} else {
					//change dot color
					color.color = colors[0];
					dot.transform.colorTransform = color;
					
					//add mouse events to dot
					dot.addEventListener(MouseEvent.MOUSE_OVER, doOver);
					dot.addEventListener(MouseEvent.MOUSE_OUT, doOut);
					
					//store dot into points array
					pArr.push(dot);
					
					//draw a line from the center to the current dot
					graphics.moveTo(0,0);
					graphics.lineStyle(1, lineColor);
					graphics.lineTo(dot.x, dot.y);
				}
			}
			
			//draw lines between each of the points
			if(!showTitle) {
				for (var p:Object in pArr) {
					var o:Object=pArr[p];
					if (p == 0) {
						graphics.moveTo(o.x, o.y);
					} else {
						graphics.lineStyle(1, lineColor);
						graphics.lineTo(o.x, o.y);
					}
					
					if (p == pArr.length-1) {
						graphics.lineTo(pArr[0].x, pArr[0].y);
					}
				}
				layers.push(pArr);
			}
			
		}
		
		private function drawEntries():void {
			//var vals:Array = [];
			for(var e:Object in entries) {
				trace(entries[e].name);
				trace(entries[e].scores);
				
				var firstPoint:Object;
				
				for(var i:int = 0; i < entries[e].scores.length; i++) {
					var value:int = entries[e].scores[layers.length - i];
					var dotObj:Object = layers[value-1][i];
					if(i==0) {
						firstPoint = dotObj;
						graphics.beginFill(entries[e].color, fillAlpha);
						graphics.moveTo(dotObj.x, dotObj.y);
					} else {
						graphics.lineStyle(1, entries[e].color);
						graphics.lineTo(dotObj.x, dotObj.y);
					}
					if (i == entries[e].scores.length-1) {
						graphics.lineTo(firstPoint.x, firstPoint.y);
						graphics.endFill();
					}
				}
				
				//vals = (vals.length == 0) ? entries[e].scores : vals.concat(entries[e].scores);
			}
			
			//trace('maxScoreValue: ' + maxVal(vals) + ' valsLen:: ' + vals.length);
		}
		
		private function createLabel(x:Number, y:Number, text:String):Sprite {
			//create label container
			var spr:Sprite = new Sprite();
			
			//create label
			var tf:TextField = new TextField();
			tf.embedFonts = true;
			tf.selectable = false;
			tf.mouseEnabled = false;
			/*tf.defaultTextFormat = FontManager.getTextFormat({
				font: FontManager.BOLD,
				size: 12,
				color: 0x000000,
				bold: true,
				align: 'center'
			});*/
			tf.text = text;
			addChild(tf);
			tf.autoSize = TextFieldAutoSize.LEFT;
			spr.addChild(tf);
			
			//text and sprite coordinates
			tf.x -= tf.width >> 1;
			tf.y -= tf.height >> 1;
			spr.x = x;
			spr.y = y;
			spr.rotation = (Math.atan2(spr.y, spr.x) * 180 / Math.PI) + 90;
			
			return spr;
		}
		
		private function maxVal(arr:Array):Number {
			return Math.max.apply(this, arr);
		}
		
		private function doOver(e:MouseEvent):void {
			color.color = colors[1];
			e.target.transform.colorTransform = color;
		}
		
		private function doOut(e:MouseEvent):void {
			color.color = colors[0];
			e.target.transform.colorTransform = color;
		}
	}
}