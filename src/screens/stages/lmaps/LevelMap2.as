package screens.stages.lmaps 
{
	import adobe.utils.CustomActions;
	import objects.MapTile;
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
	
	public class LevelMap2 extends Sprite 
	{
		//This matrix MUST be NxN
		private var _matrix:Array = [[0, 0, 0, 0, 4, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
									 [0, 0, 0, 0, 1, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
									 [0, 0, 0, 0, 1, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
									 [0, 0, 0, 0, 1, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0],
									 [0, 0, 0, 0, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0],
									 [0, 0, 0, 0, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0],
									 [0, 0, 0, 0, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0],
									 [0, 0, 0, 0, 1, 6, 6, 6, 0, 0, 0, 2, 2, 2, 2, 2, 0, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0],
									 [0, 0, 0, 0, 1, 6, 6, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
									 [0, 0, 0, 4, 3, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
									 [0, 4, 1, 3, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
									 [0, 1, 2, 2, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
									 [0, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 5, 5, 5, 5, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
									 [0, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 5, 5, 5, 5, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
									 [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
									 [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
									 [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
									 [0, 0, 0, 0, 0, 4, 1, 1, 1, 1, 1, 0, 0, 0, 0, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
									 [0, 0, 0, 0, 0, 1, 2, 2, 2, 2, 2, 5, 5, 5, 5, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
									 [0, 0, 0, 0, 0, 1, 2, 2, 2, 2, 2, 5, 5, 5, 5, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
									 [0, 0, 0, 0, 0, 1, 2, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
									 [0, 0, 0, 0, 0, 1, 2, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
									 [0, 0, 0, 0, 0, 1, 2, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
									 [0, 0, 0, 0, 0, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
									 [0, 0, 0, 0, 0, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
									 [0, 0, 0, 0, 0, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
									 [0, 0, 0, 0, 0, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
									 [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]];

		public var drawArray:Array = new Array();
		
		public function LevelMap2() 
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(event:Event):void 
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
			var k:int;
			for (var i:int = 0; i < matrix.length; i++) 
			{
				for (var j:int = 0; j < matrix.length; j++) 
				{
					if (matrix[i][j]!=0) 
					{
						if (matrix[i][j]==1) 
						{
							k = 64 * (j + i);
							if (j < i) k * -1;
							var Tile1Object:MapTile =  new MapTile(new Image(Assets.getTexture("Wall")), k, false);
							if (j >= i) Tile1Object.scaleX = -1;
							Tile1Object.pivotX = 64;
							Tile1Object.pivotY = 414;
							Tile1Object.x = 128 * (j-i);
							drawArray.push(Tile1Object);
						}
						else if (matrix[i][j]==2)
						{	
							k = 64 * (j + i);
							if (j < i) k * -1;
							var Tile2Object:MapTile = new MapTile(new Image(Assets.getTexture("Floor")),k, false);
							Tile2Object.pivotX = 128;
							Tile2Object.pivotY = 64;
							Tile2Object.x = 128 * (j-i);
							drawArray.push(Tile2Object);
						}
						else if (matrix[i][j]==3)
						{
							k = 64 * (j + i);
							if (j < i) k * -1;
							var Tile3Object:MapTile =  new MapTile(new Image(Assets.getTexture("ExtWall")), k, false);
							if (j >= i) Tile3Object.scaleX = -1;
							Tile3Object.pivotX = 128;
							Tile3Object.pivotY = 414;
							Tile3Object.x = 128 * (j-i);
							drawArray.push(Tile3Object);
						}
						else if(matrix[i][j]==4)
						{
							k = 64 * (j + i);
							if (j < i) k * -1;
							var Tile4Object:MapTile =  new MapTile(new Image(Assets.getTexture("IntWall")), k, false);
							if (j >= i) Tile4Object.scaleX = -1;
							Tile4Object.pivotX = 64;
							Tile4Object.pivotY = 382;
							Tile4Object.x = 128 * (j-i);
							drawArray.push(Tile4Object);
						}
						else if(matrix[i][j]==5)
						{
							k = 64 * (j + i);
							if (j < i) k * -1;
							var Tile5Object:MapTile = new MapTile(new Image(Assets.getTexture("Floor")),k, true);
							Tile5Object.pivotX = 128;
							Tile5Object.pivotY = 64;
							Tile5Object.x = 128 * (j-i);
							drawArray.push(Tile5Object);
						}
					}
				}
			}
			
			for each (var tile:MapTile in drawArray)
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