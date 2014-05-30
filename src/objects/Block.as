package objects 
{
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.filters.DropShadowFilter;
	import flash.geom.Matrix;
	import flash.display.GradientType;
	
	/**
	 * ...
	 * @author Mike Ludwig
	 */
	public final class Block extends Sprite 
	{	
		public function Block(light:uint, dark:uint) 
		{
			var sprite:Sprite = new Sprite();
			var g:Graphics = sprite.graphics;
			var matrix:Matrix = new Matrix();
			matrix.createGradientBox(Global.BlockSize - 2, Global.BlockSize - 2);
			
			g.beginGradientFill(GradientType.LINEAR, [light, dark], [1, 1], [0, 255], matrix, "pad", "rgb", 0.8);
			g.drawRect(0, 0, Global.BlockSize - 2, Global.BlockSize - 2);
			g.endFill();
			addChild(sprite);
			
			var shadow:DropShadowFilter = new DropShadowFilter(2);
			filters = new Array(shadow);
		}
		
	}

}