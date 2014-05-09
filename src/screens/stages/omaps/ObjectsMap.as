package screens.stages.omaps 
{
	import adobe.utils.CustomActions;
	import objects.Activable;
	import objects.Cube;
	import objects.Hipsbot;
	import objects.BBot;
	import objects.MBot;
	import objects.NBot;
	import objects.Lamp;
	import objects.Rejilla;
	import objects.Switch;
	import objects.Tool;
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
		private var _matrix:Array = [[0, 0, 0, 0, 0, 0, 0, 10],
									 [0, 4, 0, 6, 0, 0, 0, 0],
									 [0, 0, 1, 0, 0, 0, 7, 0],
									 [0, 0, 2, 0, 5, 0, 8, 0],
									 [0, 0, 3, 0, 0, 0, 9, 0],
									 [0, 0, 0, 0, 0, 0, 0, 0],
									 [11, 0, 0, 0, 0, 0, 0, 0],
									 [0, 0, 0, 0, 0, 0, 0, 0]];

		private var _objectsArray:Array = [new Array(), new Array(), new Array(), new Array(), new Array(), new Array(), new Array(), new Array()];
		
		private var _connections:Array = [[1,1,1,3]] //[originI,originJ,destI,destJ]
		private var _rejillas:Array = [[6,0,0,7]] //[originI,originJ,destI,destJ]
		
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
							Bot = new BBot(i,j);
							Bot.x = 128 * (j-i);
							Bot.y = 64 * (j + i);
							if (j < i) Bot.y * -1;
							_objectsArray[0].push(Bot);
							this.addChild(Bot);
							break;
							
						case 2:
							Bot = new MBot(i,j);
							Bot.x = 128 * (j-i);
							Bot.y = 64 * (j + i);
							if (j < i) Bot.y * -1;
							_objectsArray[1].push(Bot);
							this.addChild(Bot);
							break;
							
						case 3:
							Bot = new NBot(i,j);
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
							
						case 6:
							var lamp:Lamp = new Lamp(i, j);
							lamp.x = 128 * (j-i);
							lamp.y = 64 * (j + i);
							if (j < i) lamp.y * -1;
							_objectsArray[5].push(lamp);
							this.addChild(lamp);
							break;
							
						//TOOLS
						case 7:
							var tool1:Tool = new Tool(i, j, 1);
							tool1.x = 128 * (j-i);
							tool1.y = 64 * (j + i);
							if (j < i) tool1.y * -1;
							_objectsArray[6].push(tool1);
							this.addChild(tool1);
							break;
							
						case 8:
							var tool2:Tool = new Tool(i, j, 2);
							tool2.x = 128 * (j-i);
							tool2.y = 64 * (j + i);
							if (j < i) tool2.y * -1;
							_objectsArray[6].push(tool2);
							this.addChild(tool2);
							break;
							
						case 9:
							var tool3:Tool = new Tool(i, j, 3);
							tool3.x = 128 * (j-i);
							tool3.y = 64 * (j + i);
							if (j < i) tool3.y * -1;
							_objectsArray[6].push(tool3);
							this.addChild(tool3);
							break;
							
						//REJILLAS
						case 10:
							var rejillaR:Rejilla = new Rejilla(i, j, false);
							rejillaR.x = 128 * (j-i);
							rejillaR.y = 64 * (j + i);
							if (j < i) rejillaR.y * -1;
							_objectsArray[7].push(rejillaR);
							this.addChild(rejillaR);
							break;
							
						case 11:
							var rejillaL:Rejilla = new Rejilla(i, j, true);
							rejillaL.x = 128 * (j-i);
							rejillaL.y = 64 * (j + i);
							if (j < i) rejillaL.y * -1;
							_objectsArray[7].push(rejillaL);
							this.addChild(rejillaL);
							break;
							
						default:
							break;
					} 
				}
			}
			// SET CONNECTIONS
			for (var a:int = 0; a < _connections.length; a++)
			{
				for (var b:int = 0; b < _objectsArray[4].length; b++)
				{
					if (_objectsArray[3][b].i == _connections[a][0] && _objectsArray[3][b].j == _connections[a][1])
					{
						for (var c:int = 0; c < _objectsArray[5].length; c++)
						{
							if (_objectsArray[5][c].i == _connections[a][2] && _objectsArray[5][c].j == _connections[a][3])
							{
								_objectsArray[3][b].target = _objectsArray[5][c];
								_objectsArray[5][c].switchers.push(_objectsArray[3][b]);
								break;
							}
						}
						break;
					}
				}
			}
			// SET REJILLAS
			for (a = 0; a < _rejillas.length; a++)
			{
				for (b = 0; b < _objectsArray[7].length; b++)
				{
					if (_objectsArray[7][b].i == _rejillas[a][0] && _objectsArray[7][b].j == _rejillas[a][1])
					{
						for (c = 0; c < _objectsArray[7].length; c++)
						{
							if (_objectsArray[7][c].i == _rejillas[a][2] && _objectsArray[7][c].j == _rejillas[a][3])
							{
								_objectsArray[7][b].target = _objectsArray[7][c];
								_objectsArray[7][c].target = _objectsArray[7][b];
								break;
							}
						}
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