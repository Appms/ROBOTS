package screens.stages.lmaps 
{
	import adobe.utils.CustomActions;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.textures.Texture;
	import starling.events.Event;
	
	/**
	 * ...
	 * @author EGOD
	 * --LEVEL MAP CLASS EXPLANATION--
	 * 
	 * In this class we draw the basic background layout for the level.
	 * This is a basic version that will be used to design all the levels.
	 * Notes: 0=void, 1=wall, 2=floor
	 */
	public class LevelMap extends Sprite 
	{
		//This matrix MUST be NxN
		private var _matrix:Array = [[0, 0, 1, 1, 1, 1, 1, 1],
									 [1, 1, 1, 2, 2, 2, 2, 2],
									 [1, 2, 2, 2, 2, 2, 2, 2],
									 [1, 2, 2, 2, 2, 2, 2, 2],
									 [1, 2, 2, 2, 2, 2, 2, 2],
									 [1, 2, 2, 2, 2, 2, 2, 2],
									 [1, 2, 2, 2, 2, 2, 2, 2],
									 [0, 0, 0, 0, 0, 0, 0, 0]];

		public var drawArray:Array = new Array();
		
		public function LevelMap() 
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(event:Event):void 
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
			for (var i:int = 0; i < matrix.length; i++) 
			{
				for (var j:int = 0; j < matrix.length; j++) 
				{
					if (matrix[i][j]!=0) 
					{
						if (matrix[i][j]==1) 
						{
							var Tile1Object:Image =  new Image(Assets.getTexture("Wall"));
							Tile1Object.pivotX = 128;
							Tile1Object.pivotY = 448;
							Tile1Object.x = 128 * (j-i);
							Tile1Object.y = 64 * (j + i);
							if (j < i) Tile1Object.y * -1;
							drawArray.push(Tile1Object);
						}
						else 
						{	
							var Tile2Object:Image = new Image(Assets.getTexture("Floor"));
							Tile2Object.pivotX = 128;
							Tile2Object.pivotY = 64;
							Tile2Object.x = 128 * (j-i);
							Tile2Object.y = 64 * (j + i);
							if (j < i) Tile2Object.y * -1;
							drawArray.push(Tile2Object);
						}
					}
				}
			}
			
			for each (var tile:Image in drawArray)
			{
				this.addChild(tile);
			}
			
		}
		
		public function get matrix():Array 
		{
			return _matrix;
		}
	}
}