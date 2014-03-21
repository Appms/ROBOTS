package objects 
{
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
		private var matrix:Array = [[0, 0, 1, 1, 1, 1],
									[1, 1, 1, 2, 2, 2],
									[1, 2, 2, 2, 2, 2],
									[1, 2, 2, 0, 0, 2],
									[1, 2, 2, 2, 2, 2],
									[1, 0, 0, 0, 0, 0,]];
		trace("Vector construido!");
		private var DrawVector:Vector.<Image>;
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
							var Tile1Object:Image = new Image(Assets.getTexture("Wall"));
							Tile1Object.x = 128 * (j-i);
							Tile1Object.y = 64 * (j + i) - 384;
							if (j < i) Tile1Object.y * -1;
							this.addChild(Tile1Object);
						}
						else 
						{	
							var Tile2Object:Image = new Image(Assets.getTexture("Floor"));
							Tile2Object.x = 128 * (j-i);
							Tile2Object.y = 64 * (j + i);
							if (j < i) Tile2Object.y * -1;
							this.addChild(Tile2Object);
						}
					}
				}
			}
		}
		
		public function get Matrix():Array 
		{
			return matrix;
		}
	}

}