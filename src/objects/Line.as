package objects 
{
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Mike Ludwig
	 */
	public class Line extends Sprite 
	{
		public var dead:Boolean;
		private var angle:Number;
		
		public function Line(x:Number, y:Number, angle:Number) 
		{
			graphics.lineStyle(1, 0xffffff);
			graphics.lineTo(Math.cos(angle) * 5, Math.sin(angle) * 5);
			
			this.x = x;
			this.y = y;
			this.angle = angle;
		}
		
		public function update():void
		{
			x += Math.cos(angle) * 3;
			y += Math.sin(angle) * 3;
			
			alpha -= 0.02;
			
			if (alpha <= 0) dead = true;
		}
	}

}