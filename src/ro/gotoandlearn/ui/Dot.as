package ro.gotoandlearn.ui
{
	import flash.display.Sprite;
	
	public class Dot extends Sprite
	{
		/**
		 * Created a UI Dot element with a visible and a interactive layer
		 * @param	size
		 * @param	areaSize
		 */
		public function Dot(size:int=3, areaSize:int=10, color:uint=0x000000, alpha:int=1) {
			/**
			 * hidden layer aspects:
			 * mouse enabled true
			 * visible false 
			 */ 
			graphics.beginFill(color, 0);
			graphics.drawCircle(0, 0, areaSize);
			
			/**
			 * visible layer aspects:
			 * mouse enabled true
			 * visible true
			 */
			graphics.beginFill(color, alpha);
			graphics.drawCircle(0, 0, size);
			
			buttonMode = true;
		}
	}
}