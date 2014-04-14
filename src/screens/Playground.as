package screens 
{

	import objects.HBot;
	import objects.Hipsbot;
	import objects.HMini;
	import objects.HNano;
	import objects.LevelMap;
	import objects.ObjectsMap;
	import objects.UI;
	import starling.display.Sprite;
	import starling.events.Event;
	import flash.ui.Keyboard;
	import starling.display.Button;
	import starling.events.KeyboardEvent;
	
	/**
	 * ...
	 * @author EGOD
	 * 
	 * This class adds the differents layers that are part of our main gameplay, updates them and controls the main input for our game.
	 * Not yet fully implemented
	 * 
	 */
	public class Playground extends Sprite 
	{
		private const TileSizeX:Number = 128;
		private const TileSizeY:Number = 64;
		private const SpeedX:Number = 8;
		private const SpeedY:Number = 4;
		
		private var camera_offset_x:int = 400;
		private var camera_offset_y:int = 300;
		
		private var map:LevelMap;
		private var obj:ObjectsMap;
		private var current_robot:Hipsbot;
		private var user_int:UI;
		
		
		public function Playground()
		{
			super();
			trace("Playground inicializado!");
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			this.addEventListener(Event.ENTER_FRAME, onGameTick);
			this.addEventListener(KeyboardEvent.KEY_DOWN, KeyDown);
			this.addEventListener(Event.TRIGGERED, changeCurrentRobot);
		}
		
		private function onAddedToStage(event:Event):void 
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			drawGame();
		}
		
		private function drawGame():void 
		{
			map = new LevelMap();
			map.x += camera_offset_x;
			map.y += camera_offset_y;
			
			obj = new ObjectsMap();
			obj.x += camera_offset_x;
			obj.y += camera_offset_y;
			
			user_int = new UI();
			
			this.addChild(map);
			this.addChild(obj);
			this.addChild(user_int);
			
			var i:uint;
			while (current_robot == null)
			{
				current_robot = obj.robotsArray[i][0];
				i++;
			}
			current_robot.state = 1;
		}
		
		private function KeyDown(event:KeyboardEvent):void 
		{
			if (current_robot.state == 1)
			{
				switch (event.keyCode) 
				{
					case Keyboard.W:
						if (current_robot.aim != 8) current_robot.aim = 8;
						else if (map.matrix[current_robot.i - 1][current_robot.j] == 2 && obj.matrix[current_robot.i - 1][current_robot.j] == 0 )
						{
							obj.matrix[current_robot.i - 1][current_robot.j] = obj.matrix[current_robot.i][current_robot.j]; 
							obj.matrix[current_robot.i][current_robot.j] = 0;
							current_robot.state = 2;
							current_robot.i--;
							camera_offset_x -= TileSizeX;
							camera_offset_y += TileSizeY;
							trace("moving UP");
						}
						else trace("NOPE");
						break;
						
					case Keyboard.S:
						if (current_robot.aim != 2) current_robot.aim = 2;
						else if (map.matrix[current_robot.i + 1][current_robot.j] == 2 && obj.matrix[current_robot.i + 1][current_robot.j] == 0)
						{
							//animate
							obj.matrix[current_robot.i + 1][current_robot.j] = obj.matrix[current_robot.i][current_robot.j]; 
							obj.matrix[current_robot.i][current_robot.j] = 0;
							current_robot.state = 2;
							current_robot.i++;
							camera_offset_x += TileSizeX;
							camera_offset_y -= TileSizeY;
							trace("moving DOWN");
						}
						else trace("NOPE");
						break;
					
					case Keyboard.A:
						if (current_robot.aim != 4) current_robot.aim = 4;
						else if (map.matrix[current_robot.i][current_robot.j - 1] == 2 && obj.matrix[current_robot.i][current_robot.j - 1] == 0)
						{
							//animate
							obj.matrix[current_robot.i][current_robot.j - 1] = obj.matrix[current_robot.i][current_robot.j]; 
							obj.matrix[current_robot.i][current_robot.j] = 0;
							current_robot.state = 2;
							current_robot.j--;
							camera_offset_x += TileSizeX;
							camera_offset_y += TileSizeY;
							trace("moving LEFT");
						}
						else trace("NOPE");
						break;
					
					case Keyboard.D:
						if (current_robot.aim != 6) current_robot.aim = 6;
						else if (map.matrix[current_robot.i][current_robot.j + 1] == 2 && obj.matrix[current_robot.i][current_robot.j + 1] == 0)
						{
							//animate
							obj.matrix[current_robot.i][current_robot.j + 1] = obj.matrix[current_robot.i][current_robot.j]; 
							obj.matrix[current_robot.i][current_robot.j] = 0;
							current_robot.state = 2;
							current_robot.j++;
							camera_offset_x -= TileSizeX;
							camera_offset_y -= TileSizeY;
							trace("moving RIGHT");
						}
						else trace("NOPE");
						break;
					
					case Keyboard.SPACE:
						/* CHECK VIABILITY
						 * Think about of what of this code should be on the overrided function on son classes
						switch (current_robot.aim)
						{
							case 8:
								switch (obj.matrix[current_robot.i - 1][current_robot.j])
								{
									default:
										break;
								}
								break;
							case 2:
								switch (obj.matrix[current_robot.i + 1][current_robot.j])
								{
									default:
										break;
								}
								break;
							case 4:
								switch (obj.matrix[current_robot.i][current_robot.j - 1])
								{
									default:
										break;
								}
								break;
							case 6:
								switch (obj.matrix[current_robot.i][current_robot.j + 1])
								{
									default:
										break;
								}
								break;
							default:
								break;
						}
						*/
						//animate
						current_robot.state = 3;
						current_robot.robotInteraction(); // Destination object should be passed here as argument¿?
						current_robot.state = 1;
						break;
					
					case Keyboard.Q:
						//animated
						current_robot.state = 4;
						current_robot.robotTool();
						break;
					
					default:
						trace("NOPE");
						break;
				}
			}
		}
		
		private function changeCurrentRobot(e:Event):void 
		{
			if (current_robot.state == 1)
			{
				var diff_x:uint
				var diff_y:uint
				var buttonClicked:Button = e.target as Button;
				if ((buttonClicked as Button) == user_int.normalBtn)
				{
					diff_x = current_robot.x - obj.robotsArray[0][user_int.normalID].x;
					diff_y = current_robot.y - obj.robotsArray[0][user_int.normalID].y;
					current_robot.state = 0;
					current_robot = obj.robotsArray[0][user_int.normalID];
					camera_offset_x += diff_x;
					camera_offset_y += diff_y;
				}
				else if ((buttonClicked as Button) == user_int.normalRightBtn)
				{
					user_int.normalID++;
					if (user_int.normalID == obj.robotsArray[0].length) user_int.normalID = 0;
				}
				else if ((buttonClicked as Button) == user_int.normalLeftBtn)
				{
					if (user_int.normalID == 0) user_int.normalID = obj.robotsArray[0].length;
					user_int.normalID--;

				}
				
				else if ((buttonClicked as Button) == user_int.miniBtn)
				{
					diff_x = current_robot.x - obj.robotsArray[1][user_int.miniID].x;
					diff_y = current_robot.y - obj.robotsArray[1][user_int.miniID].y;
					current_robot.state = 0;
					current_robot = obj.robotsArray[1][user_int.miniID];
					camera_offset_x += diff_x;
					camera_offset_y += diff_y;
				}
				else if ((buttonClicked as Button) == user_int.miniRightBtn)
				{
					user_int.miniID++;
					if (user_int.miniID == obj.robotsArray[1].length) user_int.miniID = 0;
				}
				else if ((buttonClicked as Button) == user_int.miniLeftBtn)
				{
					if (user_int.miniID == 0) user_int.miniID = obj.robotsArray[1].length;
					user_int.miniID--;
				}
				
				else if ((buttonClicked as Button) == user_int.nanoBtn)
				{
					diff_x = current_robot.x - obj.robotsArray[2][user_int.nanoID].x;
					diff_y = current_robot.y - obj.robotsArray[2][user_int.nanoID].y;
					current_robot.state = 0;
					current_robot = obj.robotsArray[2][user_int.nanoID];
					camera_offset_x += diff_x;
					camera_offset_y += diff_y;
				}
				else if ((buttonClicked as Button) == user_int.nanoRightBtn)
				{
					user_int.nanoID++;
					if (user_int.nanoID == obj.robotsArray[2].length) user_int.nanoID = 0;
				}
				else if ((buttonClicked as Button) == user_int.nanoLeftBtn)
				{
					if (user_int.nanoID == 0) user_int.nanoID = obj.robotsArray[2].length - 1;
					user_int.nanoID--;
				}
			}
		}
		
		private function onGameTick(event:Event):void 
		{
			switch (current_robot.state)
			{
				//case 0:
				//	if (map.x == camera_offset_x && map.y == camera_offset_y) { current_robot.state = 1;}
				case 0:
					//CURRENT ROBOT IDLE ANIMATION
					if (map.x < camera_offset_x) { map.x += SpeedX; obj.x += SpeedX; }

					else if (map.x > camera_offset_x) {map.x -= SpeedX; obj.x -= SpeedX; }
					
					if (map.y < camera_offset_y) {map.y += SpeedY; obj.y += SpeedY; }
					
					else if (map.y > camera_offset_y) { map.y -= SpeedY; obj.y -= SpeedY; }
					
					if (map.x == camera_offset_x && map.y == camera_offset_y) { current_robot.state = 1;}
					
					map.Draw(camera_offset_x, camera_offset_y);
					break;
					
				case 2:
					//MAP MOVEMENT UPDATE
					if (map.x < camera_offset_x) { map.x += SpeedX; obj.x += SpeedX; current_robot.x -= SpeedX; }

					else if (map.x > camera_offset_x) {map.x -= SpeedX; obj.x -= SpeedX; current_robot.x += SpeedX; }
					
					if (map.y < camera_offset_y) {map.y += SpeedY; obj.y += SpeedY; current_robot.y -= SpeedY;}
					
					else if (map.y > camera_offset_y) {map.y -= SpeedY; obj.y -= SpeedY; current_robot.y += SpeedY;}
					
					if (map.x == camera_offset_x && map.y == camera_offset_y) { current_robot.state = 1;}
					
					map.Draw(camera_offset_x, camera_offset_y);
					
					/*for (var i:int = 0; i < 3; i++)
					{
						for each (var bot:Hipsbot in obj.robotsArray[i]) 
						{
							if (bot.state == 0) 
							{
								//PLAY IDLE ANIMATION
							}
							else 
							{
								if (map.x < camera_offset_x) { bot.x -= SpeedX; }

								else if (map.x > camera_offset_x) { bot.x += SpeedX; }
						
								if (map.y < camera_offset_y) { bot.y -= SpeedY; }
						
								else if (map.y > camera_offset_y) { bot.y += SpeedY; }
						
							}
						}
					}*/
					
					obj.sortChildren(entitySort);
					
					break;
					
				case 3:
					//CURRENT ROBOT INTERACTION
					break;
					
				case 4:
					//CURRENT ROBOT TOOLS
					break;
					
			}
		}
		
		/*private function onGameTick(event:Event):void 
		{
			switch (current_robot.state)
			{
				case 1:
					//CURRENT ROBOT IDLE ANIMATION
					if (map.x < camera_offset_x) { map.x += SpeedX; obj.x += SpeedX; }

					else if (map.x > camera_offset_x) {map.x -= SpeedX; obj.x -= SpeedX; }
					
					if (map.y < camera_offset_y) {map.y += SpeedY; obj.y += SpeedY; }
					
					else if (map.y > camera_offset_y) {map.y -= SpeedY; obj.y -= SpeedY; }
					
					if (map.x == camera_offset_x && map.y == camera_offset_y) { current_robot.state = 1; current_robot.selected = true; }
					
					map.Draw(camera_offset_x, camera_offset_y);
					break;
					
				case 2:
					//MAP MOVEMENT UPDATE
					if (map.x < camera_offset_x) { map.x += SpeedX; obj.x += SpeedX; }

					else if (map.x > camera_offset_x) {map.x -= SpeedX; obj.x -= SpeedX; }
					
					if (map.y < camera_offset_y) {map.y += SpeedY; obj.y += SpeedY; }
					
					else if (map.y > camera_offset_y) {map.y -= SpeedY; obj.y -= SpeedY; }
					
					if (map.x == camera_offset_x && map.y == camera_offset_y) { current_robot.state = 1; current_robot.selected = true; }
					
					map.Draw(camera_offset_x, camera_offset_y);
					
					for (var i:int = 0; i < 3; i++)
					{
						for each (var bot:Hipsbot in obj.robotsArray[i]) 
						{
							if (!bot.selected) 
							{
								//PLAY IDLE ANIMATION
							}
							else 
							{
								if (map.x < camera_offset_x) { bot.x -= SpeedX; }

								else if (map.x > camera_offset_x) { bot.x += SpeedX; }
						
								if (map.y < camera_offset_y) { bot.y -= SpeedY; }
						
								else if (map.y > camera_offset_y) { bot.y += SpeedY; }
						
							}
						}
					}
					
					obj.sortChildren(entitySort);
					
					break;
					
				case 3:
					//CURRENT ROBOT INTERACTION
					break;
					
				case 4:
					//CURRENT ROBOT TOOLS
					break;
					
			}
		}*/
		
		private function entitySort(a:Sprite, b:Sprite):int
		{
		if (a.y > b.y)
			return 1;
		else (a.y < b.y)
			return -1;
		}
	}

}