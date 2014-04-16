package screens.stages.omaps 
{
	import adobe.utils.CustomActions;
	import objects.Hipsbot;
	import objects.HBot;
	import objects.HMini;
	import objects.HNano;
	import objects.Switch;
	import starling.display.Button;
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
									 [0, 4, 0, 0, 0, 0],
									 [0, 0, 1, 1, 0, 0],
									 [0, 3, 0, 2, 0, 0],
									 [0, 0, 0, 0, 0, 0],
									 [0, 0, 0, 0, 0, 0,]];

		private var _objectsArray:Array = [new Array(), new Array(), new Array(), new Array(), new Array(), new Array(), new Array(), new Array()];
		private var _robotsArray:Array = [new Array(), new Array(), new Array()];
		
		public function ObjectsMap() 
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(event:Event):void 
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
			var Bot:Hipsbot;
			
			for (var i:int = 0; i < _matrix.length; i++) 
			{
				for (var j:int = 0; j < _matrix.length; j++) 
				{
					switch (_matrix[i][j]) 
					{
						case 1:
							Bot = new HBot(i,j);
							Bot.x = 128 * (j-i);
							Bot.y = 64 * (j + i);
							if (j < i) Bot.y * -1;
							robotsArray[0].push(Bot);
							this.addChild(Bot);
							break;
						case 2:
							Bot = new HMini(i,j);
							Bot.x = 128 * (j-i);
							Bot.y = 64 * (j + i);
							if (j < i) Bot.y * -1;
							robotsArray[1].push(Bot);
							this.addChild(Bot);
							break;
						case 3:
							Bot = new HNano(i,j);
							Bot.x = 128 * (j-i);
							Bot.y = 64 * (j + i);
							if (j < i) Bot.y * -1;
							robotsArray[2].push(Bot);
							this.addChild(Bot);
							break;
						case 4:
							var sw:Switch = new Switch(i, j);
							sw.x = 128 * (j-i) - 64;
							sw.y = 64 * (j + i) - 128;
							if (j < i) sw.y * -1;
							_objectsArray[0].push(sw);
							this.addChild(sw);
							break;
						default:
							break;
					} 
				}
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
				if (bot.state == 0)
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
		
		public function get matrix():Array 
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