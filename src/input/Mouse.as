package  input
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author Mike Ludwig
	 */
	public final class Mouse extends Sprite 
	{
		private var current:int;
		private var last:int;
		
		public var currentX:Number;
		public var currentY:Number;
		public var previousX:Number;
		public var previousY:Number;
		
		public function Mouse() {}
		
		public function update(stage:Stage):void
		{
			if (last == -1 && current == -1)
			current = 0;
			if (last == 2 && current == 2)
			current = 1;
			last = current;
			
			previousX = currentX;
			previousY = currentY;
			
			currentX = stage.mouseX;
			currentY = stage.mouseY;
		}
		
		public function mouseUp(e:MouseEvent):void
		{
			if (current > 0) current = -1;
			else current = 0;
		}
		
		public function mouseDown(e:MouseEvent):void
		{
			if ( current > 0) current = 1;
			else current = 2;
		}
		
		public function mouseMove(e:MouseEvent):void
		{
			x = e.stageX;
			y = e.stageY;
		}
		
		public function get pressed():Boolean {  return current > 0;}
		public function get justPressed():Boolean { return current == 2; }
		public function get justReleased():Boolean { return current == -1; }
	}

}