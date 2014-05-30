package objects 
{
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Mike Ludwig
	 */
	public final class Pop extends Sprite 
	{
		public var dead:Boolean;
		private var lines:Vector.<Line> = new Vector.<Line>();
		
		public function Pop(x:Number, y:Number) 
		{
			this.x = x;
			this.y = y;
			
			for (var i:int = 0; i < 8; i++)
			{
				var angle:Number = Math.PI / 4 * i;
				var line:Line = new Line(Math.cos(angle) * 8, Math.sin(angle) * 8, angle);
				lines.push(line);
				addChild(line);
			}
		}
		
		public function update():void
		{
			var checkDead:Boolean = true;
			
			for each (var line:Line in lines)
			{
				checkDead = line.dead;
				line.update();
			}
			
			dead = checkDead;
		}
	}

}