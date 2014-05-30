package  objects
{
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Mike Ludwig
	 */
	public final class Food extends Sprite 
	{
		
		public function Food() 
		{
			addChild(new Block(0xA80000, 0x870000));
		}
		
		public function move(body:Vector.<Block>):void
		{
			do
			{
				var occupied:Boolean = false;
				
				x = 1 + (Math.round(Math.random() * (Global.GridWidth - 2))) * Global.BlockSize;
				y = 1 + (Math.round(Math.random() * (Global.GridHeight - 2))) * Global.BlockSize;
				
				for each (var block:Block in body)
				{
					if (block.x == x && block.y == y) occupied = true;
				}
			}
			while (occupied);
		}
	}

}