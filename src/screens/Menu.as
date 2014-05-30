package  screens
{
	import flash.display.Sprite;
	import flash.filters.DropShadowFilter;
	import flash.text.TextField;
	import input.Mouse;
	import flash.text.TextFieldAutoSize;
	import objects.Pop;
	
	/**
	 * ...
	 * @author Mike Ludwig
	 */
	public final class Menu extends Sprite 
	{
		public var active:Boolean = true;
		private var title:TextField = new TextField();
		private var controls:TextField = new TextField();
		private var casual:TextField = new TextField();
		private var pro:TextField = new TextField();
		private var play:TextField = new TextField();
		public var fading:Boolean;
		public var direction:int;
		private var speed:Number = 4;
		
		public function Menu() 
		{
			title.selectable = false;
			title.defaultTextFormat = Global.TitleFormat;
			title.text = "Snakey";
			title.autoSize = TextFieldAutoSize.LEFT;
			title.x = Global.Width / 2 - title.width / 2;
			title.filters = new Array(new DropShadowFilter(2));
			addChild(title);
			
			controls.selectable = false;
			controls.defaultTextFormat = Global.MenuFormat;
			controls.text = "WASD or Arrows to move";
			controls.autoSize = TextFieldAutoSize.LEFT;
			controls.x = Global.Width / 2 - controls.width / 2;
			controls.y = Global.Height * 0.3;
			addChild(controls);
			
			play.selectable = false;
			play.defaultTextFormat = Global.MenuFormat;
			play.text = "Play";
			play.autoSize = TextFieldAutoSize.LEFT;
			play.x = Global.Width / 2 - play.width / 2;
			play.y = Global.Height * 0.7;
			addChild(play);
			
			casual.selectable = false;
			casual.defaultTextFormat = Global.MenuFormat;
			casual.text = "Casual";
			casual.autoSize = TextFieldAutoSize.LEFT;
			casual.x = Global.Width / 3 - casual.width / 2;
			casual.y = Global.Height * 0.5;
			addChild(casual);
			
			pro.selectable = false;
			pro.defaultTextFormat = Global.MenuFormat;
			pro.text = "Pro";
			pro.autoSize = TextFieldAutoSize.LEFT;
			pro.x = Global.Width * 2 / 3 - pro.width / 2;
			pro.y = Global.Height * 0.5;
			addChild(pro);
		}
		
		public function update(mouse:Mouse, game:Game):void
		{
			if (mouse.justReleased)
			{
				if (play.hitTestPoint(mouse.currentX, mouse.currentY))
				{
					game.reset();
					fading = true;
					direction = -1;
				}
				
				if (casual.hitTestPoint(mouse.currentX, mouse.currentY))
				{
					game.snake.delay = 3;
					game.snake.growth = 2;
				}
				
				if (pro.hitTestPoint(mouse.currentX, mouse.currentY))
				{
					game.snake.delay = 2;
					game.snake.growth = 3;
				}
			}
			
			if (fading)
			{
				alpha += speed * direction / 100;
				if (alpha <= 0 || alpha >= 1) fading = false;
			}
		}
	}

}