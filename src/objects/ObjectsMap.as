package objects 
{
	import adobe.utils.CustomActions;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.textures.Texture;
	import starling.events.Event;
	
	/**
	 * ...
	 * @author EGOD
	 */
	public class ObjectsMap extends Sprite 
	{	
		private var _matrix:Array = [[0, 0, 0, 0, 0, 0],
									 [0, 0, 0, 0, 0, 0],
									 [0, 0, 1, 0, 0, 0],
									 [0, 3, 0, 2, 0, 0],
									 [0, 0, 0, 0, 0, 0],
									 [0, 0, 0, 0, 0, 0,]];

		private var _objectsArray:Array;
		private var _robotsArray:Array;
		
		public function ObjectsMap() 
		{
			super();
			_objectsArray = new Array();
			_robotsArray = new Array();
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(event:Event):void 
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
			for (var i:int = 0; i < _matrix.length; i++) 
			{
				for (var j:int = 0; j < _matrix.length; j++) 
				{
					if (_matrix[i][j]!=0) 
					{
						if (_matrix[i][j]==1) 
						{
							var Bot1:HBot = new HBot(1,2,2);
							Bot1.x = 128 * (j-i);
							Bot1.y = 64 * (j + i);
							if (j < i) Bot1.y * -1;
							robotsArray.push(Bot1);
						}
						else if (_matrix[i][j]==2) 
						{
							var Bot2:HMini = new HMini(2,3,3);
							Bot2.x = 128 * (j-i);
							Bot2.y = 64 * (j + i);
							if (j < i) Bot2.y * -1;
							robotsArray.push(Bot2);
						}
						else
						{
							var Bot3:HNano = new HNano(3,1,3);
							Bot3.x = 128 * (j-i) + 128;
							Bot3.y = 64 * (j + i) + 64;
							if (j < i) Bot3.y * -1;
							robotsArray.push(Bot3);
						}
					}
				}
			}
			
			for each (var object:Sprite in objectsArray)
			{
				this.addChild(object);
			}
			
			for each (var bot:Hipsbot in robotsArray)
			{
				this.addChild(bot);
			}
			
		}
		
		public function Draw(cam_x:int,cam_y:int):void 
		{
			for each (var object:Sprite in objectsArray) 
			{
				if (cam_x + 800 < object.x + cam_x || cam_x - 300 > object.x + cam_x + 256) 
				{
					object.visible = false;
					
				}
				else if (cam_y + 600 < object.y + cam_y || cam_y - 600 > object.y + cam_y + 512)
				{
					object.visible = false;
				}
				else 
				{
					object.visible = true;
				}
			}
			
			for each (var bot:Hipsbot in robotsArray) 
			{
				if (!bot.selected) 
				{
					if (cam_x + 800 < bot.x + cam_x || cam_x - 300 > bot.x + cam_x + 256) 
					{
						bot.visible = false;
						
					}
					else if (cam_y + 600 < object.y + cam_y || cam_y - 600 > object.y + cam_y + 512)
					{
						bot.visible = false;
					}
					else 
					{
						bot.visible = true;
					}
				}
			}
		}
		
		public function get Matrix():Array 
		{
			return _matrix;
		}
		
		public function get objectsArray():Array 
		{
			return _objectsArray;
		}
		
		public function get robotsArray():Array 
		{
			return _robotsArray;
		}
		
	}

}