package  
{
	import flash.text.TextFormat;
	/**
	 * Holds useful values available to other classes.
	 * 
	 * @author Mike Ludwig
	 */
	public final class Global 
	{
		public static const Width:int = 580;
		public static const Height:int = 400;
		public static const BlockSize:int = 20;
		public static const GridWidth:int = Width / BlockSize;
		public static const GridHeight:int = Height / BlockSize;
		
		public static function get TitleFormat():TextFormat
		{
			return new TextFormat("Showcard Gothic", 44, 0xFFFFFF);
		}
		
		public static function get MenuFormat():TextFormat
		{
			return new TextFormat("Showcard Gothic", 28, 0xFFFFFF);
		}
		
		public static function get GameFormat():TextFormat
		{
			return new TextFormat("Showcard Gothic", 24, 0xFFFFFF);
		}
	}

}