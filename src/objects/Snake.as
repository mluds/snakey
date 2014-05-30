package  objects
{
	import adobe.utils.CustomActions;
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.text.TextField;
	import input.Keyboard;
	import screens.Game;
	import screens.Menu;
	/**
	 * ...
	 * @author Mike Ludwig
	 */
	public final class Snake 
	{
		// The group of blocks acting as its body
		public var body:Vector.<Block> = new Vector.<Block>();
		
		// How fast the snake moves
		private var counter:int;
		public var delay:int = 3;
		private var explodeDelay:int = 5;
		
		// Where the snake will move next
		private var directionX:int;
		private var directionY:int;
		
		private var eyes:Sprite = new Sprite();
		private var dead:Boolean;
		public var growth:int = 2;
		
		public function Snake() 
		{
			var g:Graphics = eyes.graphics;
			g.beginFill(0x000000);
			var size:Number = Global.BlockSize - 2;
			g.drawCircle(size / 4, -size / 4, 2);
			g.drawCircle(size / 4, size / 4, 2);
			g.endFill();
			eyes.x = size / 2;
			eyes.y = size / 2;
		}
		
		public function reset(game:Game):void
		{
			dead = false;
			directionX = 0;
			directionY = 0;
			eyes.rotation = 0;
			body = new Vector.<Block>();
			body.push(new Block(0x00A800, 0x008700));
			game.addChild(body[0]);
			body[0].x = Math.round(Global.GridWidth / 2 - 1) * Global.BlockSize;
			body[0].y = Math.round(Global.GridHeight / 2 - 1) * Global.BlockSize;
			body[0].addChild(eyes);
		}
		
		public function update(game:Game, keyboard:Keyboard, food:Food, score:TextField, menu:Menu):void
		{
			if (dead)
			{
				if (body.length > 0)
				{
					if (counter == explodeDelay)
					{
						counter = 0;
						createPop(game);
						game.removeChild(body[0]);
						body.splice(0, 1);
					}
					
					counter++;
				}
			}
			else
			{
				if ((keyboard.A || keyboard.LEFT) && directionX != 1) 
				{
					directionX = -1;
					directionY = 0;
					eyes.rotation = 180;
				}
				if ((keyboard.D || keyboard.RIGHT) && directionX != -1)
				{
					directionX = 1;
					directionY = 0;
					eyes.rotation = 0;
				}
				if ((keyboard.W || keyboard.UP) && directionY != 1) 
				{
					directionX = 0;
					directionY = -1;
					eyes.rotation = -90;
				}
				if ((keyboard.S || keyboard.DOWN) && directionY != -1) 
				{
					directionX = 0;
					directionY = 1;
					eyes.rotation = 90;
				}
				
				if (counter == delay)
				{
					counter = 0;
					
					if (body[0].hitTestObject(food))
					{
						food.move(body);
						score.text = "Score: " + String(++game.score);
						createPop(game);
						
						for (var j:int = 0; j < growth; j++)
						{
							var endX:int = body[body.length - 1].x;
							var endY:int = body[body.length - 1].y;
							
							var newBlock:Block = new Block(0x00A800, 0x008700);
							newBlock.x = endX;
							newBlock.y = endY;
							body.push(newBlock);
							game.addChildAt(newBlock, 0);
						}
					}
					
					for (var i:int = body.length - 1; i > 0; i--)
					{
						var block1:Block = body[i];
						var block2:Block = body[i - 1];
						
						block1.x = block2.x;
						block1.y = block2.y;
					}
					
					body[0].x += Global.BlockSize * directionX;
					body[0].y += Global.BlockSize * directionY;
					
					var colliding:Boolean;
					for (var k:int = 1; k < body.length; k++)
					{
						if (body[0].x == body[k].x && body[0].y == body[k].y) colliding = true;
					}
					
					if (body[0].x < 0 || body[0].x == Global.Width || body[0].y < 0 || body[0].y == Global.Height || colliding)
					{
						menu.visible = true;
						menu.active = true;
						
						dead = true;
						counter = 0;
						menu.fading = true;
						menu.direction = 1;
						food.visible = false;
					}
				}
			
				counter++;
			}
		}
		
		private function createPop(game:Game):void
		{
			var pop:Pop = new Pop(body[0].x + Global.BlockSize / 2, body[0].y + Global.BlockSize / 2);
			game.addChild(pop);
			game.pops.push(pop);
		}
	}

}