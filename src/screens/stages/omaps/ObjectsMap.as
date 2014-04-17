package screens.stages.omaps 
{
	import adobe.utils.CustomActions;
	import objects.Cube;
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
		private var _matrix:Array = [[0, 0, 0, 0, 0, 0, 0, 0],
									 [0, 4, 0, 0, 0, 0, 0, 0],
									 [0, 0, 1, 0, 0, 0, 0, 0],
									 [0, 0, 2, 0, 5, 0, 0, 0],
									 [0, 0, 3, 0, 0, 0, 0, 0],
									 [0, 0, 0, 0, 0, 0, 0, 0],
									 [0, 0, 0, 0, 0, 0, 0, 0],
									 [0, 0, 0, 0, 0, 0, 0, 0]];

		private var _objectsArray:Array = [new Array(), new Array(), new Array(), new Array(), new Array(), new Array(), new Array(), new Array()];
		
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
							_objectsArray[0].push(Bot);
							this.addChild(Bot);
							break;
						case 2:
							Bot = new HMini(i,j);
							Bot.x = 128 * (j-i);
							Bot.y = 64 * (j + i);
							if (j < i) Bot.y * -1;
							_objectsArray[1].push(Bot);
							this.addChild(Bot);
							break;
						case 3:
							Bot = new HNano(i,j);
							Bot.x = 128 * (j-i);
							Bot.y = 64 * (j + i);
							if (j < i) Bot.y * -1;
							_objectsArray[2].push(Bot);
							this.addChild(Bot);
							break;
						case 4:
							var sw:Switch = new Switch(i, j);
							sw.x = 128 * (j-i) - 64;
							sw.y = 64 * (j + i) - 128;
							if (j < i) sw.y * -1;
							_objectsArray[3].push(sw);
							this.addChild(sw);
							break;
						case 5:
							var cube:Cube = new Cube(i, j);
							cube.x = 128 * (j-i);
							cube.y = 64 * (j + i);
							if (j < i) cube.y * -1;
							_objectsArray[4].push(cube);
							this.addChild(cube);
							break;
						default:
							break;
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
		
	}

}