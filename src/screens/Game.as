package  screens
{
	import flash.display.Sprite;
	import flash.filters.DropShadowFilter;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import input.Keyboard;
	import objects.Food;
	import objects.Pop;
	import objects.Snake;
	
	/**
	 * ...
	 * @author Mike Ludwig
	 */
	public final class Game extends Sprite 
	{
		// Add automation in menu
		// add difficulties/controls
		// sound, controls
		// personal best score
		
		public var snake:Snake = new Snake();
		private var food:Food = new Food();
		public var score:int = 0;
		private var scoreText:TextField = new TextField();
		private var playing:Boolean;
		public var pops:Vector.<Pop> = new Vector.<Pop>();
		
		public function Game() 
		{
			scoreText.defaultTextFormat = Global.GameFormat;
			scoreText.text = "Score: " + String(score);
			scoreText.autoSize = TextFieldAutoSize.LEFT;
			scoreText.y = Global.Height - scoreText.height;
			scoreText.filters = new Array(new DropShadowFilter(2));
			scoreText.alpha = 0.7;
		}
		
		public function reset():void
		{
			playing = true;
			
			while (numChildren) removeChildAt(0);
			addChild(scoreText);
			addChild(food);
			
			score = 0;
			scoreText.text = "Score: " + String(score);
			snake.reset(this);
			food.move(snake.body);
			food.visible = true;
		}
		
		public function update(keyboard:Keyboard, menu:Menu):void
		{
			if (playing) snake.update(this, keyboard, food, scoreText, menu);
			
			for each (var pop:Pop in pops)
			{
				if (pop.dead)
				{
					pops.splice(pops.indexOf(pop), 1);
					pop = null;
				}
				else pop.update();
			}
		}
	}

}