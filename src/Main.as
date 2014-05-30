package 
{
	import flash.display.GradientType;
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.geom.Matrix;
	import input.Keyboard;
	import input.Mouse;
	import screens.Game;
	import screens.Menu;
	
	/**
	 * The base class for the game which will always run.
	 * 
	 * @author Mike Ludwig
	 */
	public final class Main extends Sprite 
	{
		// Input
		private var mouse:Mouse = new Mouse();
		private var keyboard:Keyboard = new Keyboard();
		
		// Screens
		private var menu:Menu = new Menu();
		private var game:Game = new Game();
		
		public function Main()
		{
			var bg:Sprite = new Sprite();
			var g:Graphics = bg.graphics;
			var matrix:Matrix = new Matrix();
			matrix.createGradientBox(Global.Width, Global.Height);
			
			g.beginGradientFill(GradientType.RADIAL, [0x0000FF, 0x00007E], [1, 1], [0, 255], matrix);
			g.drawRect(0, 0, Global.Width, Global.Height);
			g.endFill();
			addChild(bg);
			
			// Display screens
			addChild(game);
			addChild(menu);
			
			// Event listeners for updating and user input
			addEventListener(Event.ENTER_FRAME, update);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyboard.handleKeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyboard.handleKeyUp);
			stage.addEventListener(MouseEvent.MOUSE_DOWN, mouse.mouseDown);
			stage.addEventListener(MouseEvent.MOUSE_UP, mouse.mouseUp);
		}
		
		private function update(e:Event):void
		{
			// Update mouse and menus
			mouse.update(stage);
			if (menu.active) menu.update(mouse, game);
			game.update(keyboard, menu);
		}
	}
	
}