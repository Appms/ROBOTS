package screens.stages.omaps 
{
	import adobe.utils.CustomActions;
	import objects.Activable;
	import objects.Activator;
	import objects.BotBoost;
	import objects.Cube;
	import objects.Generator;
	import objects.Hipsbot;
	import objects.BBot;
	import objects.Laser;
	import objects.MagneticFloor;
	import objects.MaquinaCafe;
	import objects.MBot;
	import objects.NanoBoost;
	import objects.NBot;
	import objects.Lamp;
	import objects.Pilar;
	import objects.PressurePlate;
	import objects.Rejilla;
	import objects.Spawner;
	import objects.Switch;
	import objects.Tool;
	import objects.Torreta;
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.KeyboardEvent;
	import starling.textures.Texture;
	import starling.events.Event;
	
	/**
	 * ...
	 * @author EGOD
	 */
	
	public class ObjectsMap2 extends Sprite 
	{	
		private var _matrix:Array = [[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
									 [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
									 [0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
									 [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
									 [0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
									 [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
									 [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
									 [0, 0, 0, 0, 0, 18, 18, 18, 0, 0, 0, 17, 17, 17, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
									 [0, 0, 0, 0, 0, 18, 18, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
									 [0, 0, 0, 0, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
									 [0, 0, 0, 0, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
									 [0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
									 [0, 0, 0, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
									 [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, , 0, 0, 0, 0, 0, 0, 0, 0, 0],
									 [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
									 [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
									 [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
									 [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
									 [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
									 [0, 0, 0, 0, 0, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
									 [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
									 [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
									 [0, 0, 0, 0, 0, 0, 0, 0, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
									 [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13, 5, 5, 5, 5, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
									 [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
									 [0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
									 [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 31, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
									 [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]];
		
		
		private var _objectsArray:Array = [new Array(), new Array(), new Array(), new Array(), new Array(), new Array(), new Array(), new Array(), new Array(), new Array(), new Array(), new Array(), new Array()];
		
		private var _connections:Array = [[10,4,8,5],[10,4,8,6],[10,4,8,7],[11,9,7,5],[11,9,7,6],[11,9,7,7]] //[originI,originJ,destI,destJ]
		private var _rejillas:Array = [[9, 4, 19, 5]] //[originI,originJ,destI,destJ]
		
		private var nBooster:NanoBoost;
		private var bBooster:BotBoost;
		
		public function ObjectsMap2()
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			//this.addEventListener(Event.ENTER_FRAME, onGameTick);
			this.addEventListener(KeyboardEvent.KEY_DOWN, KeyDown);
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
							var sw:Activator = new Switch(i, j);
							sw.x = 128 * (j-i) - 64;
							sw.y = 64 * (j + i) - 160;
							if (j < i) sw.y * -1;
							_objectsArray[3].push(sw);
							this.addChild(sw);
							break;
							
						case 104:
							var sw:Activator = new Switch(i, j);
							sw.x = 128 * (j-i) + 64;
							sw.y = 64 * (j + i) - 160;
							sw.scaleX *= -1;
							if (j < i) sw.y * -1;
							_objectsArray[3].push(sw);
							this.addChild(sw);
							matrix[i][j] = 4;
							break;
							
						case 114: // self-standing Switch
							var sw:Activator = new Switch(i, j);
							sw.x = 128 * (j-i) - 64;
							sw.y = 64 * (j + i) - 160;
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
							
						case 31:
							var spawner:Spawner = new Spawner(i,j);
							spawner.x = 128 * (j-i);
							spawner.y = 64 * (j + i);
							if (j < i) spawner.y * -1;
							matrix[i][j] = 12;
							_objectsArray[8].push(spawner);
							this.addChild(spawner);
							break;	
						case 32:
							var spawner:Spawner = new Spawner(i,j);
							spawner.x = 128 * (j-i);
							spawner.y = 64 * (j + i);
							if (j < i) spawner.y * -1;
							spawner.type = 2;
							matrix[i][j] = 12;
							_objectsArray[8].push(spawner);
							this.addChild(spawner);
							break;	
						case 33:
							var spawner:Spawner = new Spawner(i,j);
							spawner.x = 128 * (j-i);
							spawner.y = 64 * (j + i);
							if (j < i) spawner.y * -1;
							spawner.type = 3;
							matrix[i][j] = 12;
							_objectsArray[8].push(spawner);
							this.addChild(spawner);
							break;
						
						case 13:
							var pilar:Pilar = new Pilar();
							pilar.x = 128 * (j - i);
							pilar.y = 64 * (j + i);
							if (j < i) pilar.y * -1;
							_objectsArray[9].push(pilar);
							this.addChild(pilar);
							break;
							
						case 14:
							var placa:PressurePlate = new PressurePlate(i, j);
							placa.x = 128 * (j - i);
							placa.y = 64 * (j + i);
							placa.y -= 74;
							if (j < i) placa.y * -1;
							_objectsArray[3].push(placa);
							this.addChild(placa);
							break;
							
						case 15:
							var generator:Generator = new Generator(i,j);
							generator.x = 128 * (j - i);
							generator.y = 64 * (j + i);
							if (j < i) generator.y * -1;
							_objectsArray[3].push(generator);
							this.addChild(generator);
							break;
							
						case 16:
							
							break;
							
						case 17:
							var torreta:Torreta = new Torreta(i, j);
							torreta.x = 128 * (j - i);
							torreta.y = 64 * (j + i);
							if (j < i) torreta.y * -1;
							_objectsArray[10].push(torreta);
							this.addChild(torreta);
							break;
							
						case 18:
							var magnetic:MagneticFloor = new MagneticFloor(i, j);
							magnetic.x = 128 * (j - i);
							magnetic.y = 64 * (j + i);
							if (j < i) magnetic.y * -1;
							matrix[i][j] = 0;
							_objectsArray[5].push(magnetic);
							this.addChild(magnetic);
							break;
							
						case 19:
							var NBoost:NanoBoost = new NanoBoost();
							NBoost.x = 128 * (j - i);
							NBoost.y = 64 * (j + i);
							if (j < i) NBoost.y * -1;
							nBooster = NBoost;
							this.addChild(NBoost);
							break;
							
						case 20:
							var BBoost:BotBoost = new BotBoost();
							BBoost.x = 128 * (j - i);
							BBoost.y = 64 * (j + i);
							if (j < i) BBoost.y * -1;
							bBooster = BBoost;
							this.addChild(BBoost);
							break;
							
						default:
							break;
					}
				}
			}
			
			
			// SET CONNECTIONS
			for (var a:int = 0; a < _connections.length; a++)
			{
				for (var b:int = 0; b < _objectsArray[3].length; b++)
				{
					if (_objectsArray[3][b].i == _connections[a][0] && _objectsArray[3][b].j == _connections[a][1])
					{
						for (var c:int = 0; c < _objectsArray[5].length; c++)
						{
							if (_objectsArray[5][c].i == _connections[a][2] && _objectsArray[5][c].j == _connections[a][3])
							{
								_objectsArray[3][b].targets.push(_objectsArray[5][c]);
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
			
			drawLasers();
		}
		
		private function KeyDown/*onGameTick*/(event:Event):void
		{
			
			/*for (var k:int = 0; k < _objectsArray[11].length; k++)
			{
				if (_matrix[_objectsArray[11][k].i][_objectsArray[11][k].j] != 0 || _matrix[_objectsArray[11][k].i][_objectsArray[11][k].j] != 2 || _matrix[_objectsArray[11][k].i][_objectsArray[11][k].j] != 3)
				{
					this.removeChild(_objectsArray[11][k]);
					_objectsArray[11][k] = null;
				}
			}
			
			for (var k:int = 0; k < _objectsArray[11].length; k++)
			{
				if (_objectsArray[11][k].father == null)
				{
					this.removeChild(_objectsArray[11][k]);
					_objectsArray[11][k] = null;
				}
			}*/
			
			/*for (var k:int = 0; k < _objectsArray[11].length; k++)
			{
				this.removeChild(_objectsArray[11][k]);
			}
			_objectsArray[11] = [];*/
			
			//drawLasers();
		}
		
		public function drawLasers():void
		{
			for (var k:int = 0; k < _objectsArray[11].length; k++)
			{
				this.removeChild(_objectsArray[11][k]);
			}
			_objectsArray[11] = [];
			
			for (var k:int = 0; k < _objectsArray[10].length; k++)
			{
				//DOWN
				var laser:Laser = new Laser(/*_objectsArray[10][k], */_objectsArray[10][k].i+1, _objectsArray[10][k].j)
				while (_matrix[laser.i][laser.j] == 0 || _matrix[laser.i][laser.j] == 2 || _matrix[laser.i][laser.j] == 3)
				{
					if (_matrix[laser.i][laser.j] == 3) trace("Destroy");
					laser.x = 128 * (laser.j - laser.i);
					laser.y = 64 * (laser.j + laser.i);
					if (laser.j < laser.i) laser.y * -1;
					_objectsArray[11].push(laser);
					this.addChild(laser);
					laser = new Laser(/*laser, */laser.i +1, laser.j);
				}
				laser.img = new Image(Assets.getTexture("LaserEndBot"));
				this.addChild(laser.img);
				laser.x = 128 * (laser.j - laser.i);
				laser.y = 64 * (laser.j + laser.i);
				if (laser.j < laser.i) laser.y * -1;
				_objectsArray[11].push(laser);
				this.addChild(laser);
				
				
				//UP
				laser = new Laser(/*_objectsArray[10][k], */_objectsArray[10][k].i -1, _objectsArray[10][k].j)
				while (laser.i > 0 &&(_matrix[laser.i][laser.j] == 0 || _matrix[laser.i][laser.j] == 2 || _matrix[laser.i][laser.j] == 3))
				{
					if (_matrix[laser.i][laser.j] == 2 || _matrix[laser.i][laser.j] == 3) trace("Destroy");
					laser.x = 128 * (laser.j - laser.i);
					laser.y = 64 * (laser.j + laser.i);
					if (laser.j < laser.i) laser.y * -1;
					_objectsArray[11].push(laser);
					this.addChild(laser);
					laser = new Laser(/*laser, */laser.i -1, laser.j);
				}
				laser.img = new Image(Assets.getTexture("LaserEndTop"));
				this.addChild(laser.img);
				laser.x = 128 * (laser.j - laser.i);
				laser.y = 64 * (laser.j + laser.i);
				if (laser.j < laser.i) laser.y * -1;
				_objectsArray[11].push(laser);
				this.addChild(laser);
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
		
		public function get NBooster():NanoBoost 
		{
			return nBooster;
		}
		
		public function set NBooster(value:NanoBoost):void 
		{
			nBooster = value;
		}
		
		public function get BBooster():BotBoost 
		{
			return bBooster;
		}
		
		public function set BBooster(value:BotBoost):void 
		{
			bBooster = value;
		}
		
	}

}