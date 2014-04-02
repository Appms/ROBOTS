package screens 
{

	import objects.Hipsbot;
	import objects.LevelMap;
	import objects.UI;
	import starling.display.Sprite;
	import starling.events.Event;
	import flash.ui.Keyboard;
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
		private var robots_vector:Vector.<Hipsbot>;
		private var current_robot:Hipsbot;
		private var user_int:UI;
		
		public function Playground() 
		{
			super();
			trace("Playground inicializado!");
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			this.addEventListener(Event.ENTER_FRAME, onGameTick);
			this.addEventListener(KeyboardEvent.KEY_DOWN, KeyDown);
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
			
			// robots_vector should be defined on instances layer.
			// Playground.as should read that vector and create its own.
			robots_vector = new<Hipsbot>[new Hipsbot(1,2,1)];
			
			current_robot = robots_vector[0];
			current_robot.state = 1;
			
			user_int = new UI();
			
			this.addChild(map);
			this.addChild(current_robot);
			this.addChild(user_int);
			
		}
		
		private function KeyDown(event:KeyboardEvent):void 
		{
			if (current_robot.state == 1)
			{
				switch (event.keyCode) 
				{
					case Keyboard.W:
						if (current_robot.aim != 8) current_robot.aim = 8;
						else if (map.Matrix[current_robot.i - 1][current_robot.j] == 2)
						{
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
						else if (map.Matrix[current_robot.i + 1][current_robot.j] == 2)
						{
							//animate
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
						else if (map.Matrix[current_robot.i][current_robot.j - 1] == 2)
						{
							//animate
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
						else if (map.Matrix[current_robot.i][current_robot.j + 1] == 2)
						{
							//animate
							current_robot.state = 2;
							current_robot.j++;
							camera_offset_x -= TileSizeX;
							camera_offset_y -= TileSizeY;
							trace("moving RIGHT");
						}
						else trace("NOPE");
						break;
					
					case Keyboard.SPACE:
						//check viability
						//animate
						current_robot.state = 3;
						current_robot.robotInteraction();
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
		
		private function onGameTick(event:Event):void 
		{
			for (var robot:Hipsbot in robots_vector)
			{
				switch (robot.state)
				{
					case 1:
						//CURRENT ROBOT IDLE ANIMATION
						break;
						
					case 2:
						//MAP MOVEMENT UPDATE
						if (map.x < camera_offset_x) map.x += SpeedX;

						else if (map.x > camera_offset_x) map.x -= SpeedX;
						
						if (map.y < camera_offset_y) map.y += SpeedY;
						
						else if (map.y > camera_offset_y) map.y -= SpeedY;
						
						if (map.x == camera_offset_x && map.y == camera_offset_y) robot.state = 1;
						
						map.Draw(camera_offset_x, camera_offset_y);
						
						break;
						
					case 3:
						//CURRENT ROBOT INTERACTION
						break;
						
					case 4:
						//CURRENT ROBOT TOOLS
						break;
						
				}
			}
		}
		
	}

}