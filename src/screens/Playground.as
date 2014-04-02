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
		private var robot:Hipsbot;
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
			
			robot = new Hipsbot(1);
			
			user_int = new UI();
			
			this.addChild(map);
			this.addChild(robot);
			this.addChild(user_int);
			
		}
		
		private function KeyDown(event:KeyboardEvent):void 
		{
			if (robot.state == 1)
			{
				switch (event.keyCode) 
				{
					case Keyboard.W:
						if (map.Matrix[robot.i - 1][robot.j] == 2)
						{
							robot.state = 2;
							robot.i--;
							camera_offset_x -= TileSizeX;
							camera_offset_y += TileSizeY;
							trace("moving UP");
						}
						else trace("NOPE");
						break;
						
					case Keyboard.S:
						if (map.Matrix[robot.i + 1][robot.j] == 2)
						{
							//animate
							robot.state = 2;
							robot.i++;
							camera_offset_x += TileSizeX;
							camera_offset_y -= TileSizeY;
							trace("moving DOWN");
						}
						else trace("NOPE");
						break;
					
					case Keyboard.A:
						if (map.Matrix[robot.i][robot.j - 1] == 2)
						{
							//animate
							robot.state = 2;
							robot.j--;
							camera_offset_x += TileSizeX;
							camera_offset_y += TileSizeY;
							trace("moving LEFT");
						}
						else trace("NOPE");
						break;
					
					case Keyboard.D:
						if (map.Matrix[robot.i][robot.j + 1] == 2)
						{
							//animate
							robot.state = 2;
							robot.j++;
							camera_offset_x -= TileSizeX;
							camera_offset_y -= TileSizeY;
							trace("moving RIGHT");
						}
						else trace("NOPE");
						break;
					
					case Keyboard.SPACE:
						//check viability
						//animate
						robot.state = 3;
						//robotInteraction();
						break;
					
					case Keyboard.Q:
						//animate
						robot.state = 4;
						//robotTool();
						break;
					
					default:
						trace("NOPE");
						break;
				}
			}
		}
		
		private function onGameTick(event:Event):void 
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