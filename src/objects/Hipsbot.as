package objects 
{
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.display.MovieClip;
	import starling.events.Event;
	import flash.ui.Keyboard;
	import starling.events.KeyboardEvent;
	
	/**
	 * ...
	 * @author EGOD
	 * 
	 * This is the father class for all the three robots.
	 * It will include all basic functions common in the three types.
	 */
	public class Hipsbot extends Sprite 
	{
		
		private const TileSizeX:Number = 128;
		private const TileSizeY:Number = 64;
		private const SpeedX:Number = 8;
		private const SpeedY:Number = 4;
		
		
		// Provisional code (until son classes made)
		private var robotIMG:Image;
		// ID Number to identify each robot on screen.
		private var idRobot:uint;
		
		// 0: Bypass, 1: StandBY, 2: Moving, 3: Interaction, 4: Tool 
		private var state:uint;

		//Movement destination variables
		private var destX:Number;
		private var destY:Number;
		
		// Counter as time delayer
		private var counter:uint;
		
		private var map:Array;
		
		private var i:uint;
		private var j:uint;
		
		
		public function Hipsbot(id:uint, levelMap:Array) 
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			this.idRobot = id;
			this.state = 1;
			this.map = levelMap;
			// Self Sprite Origin Change Representation
			this.x -= 62; // RobotIMG/2
			this.y -= 203;// RobotIMG/2
			this.i = 2;
			this.j = 1;
			this.y += TileSizeY;
			//this.x = -i * TileSizeX + j * TileSizeX;
			//this.y = i * TileSizeY + j * TileSizeY;
		}
		
		private function onAddedToStage(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			setSprite();
			setKeyboard();
			this.addEventListener(Event.ENTER_FRAME, GameTick);
		}
		
		private function setKeyboard():void 
		{
			//this.addEventListener(KeyboardEvent.KEY_DOWN, KeyDown);
			this.addEventListener(KeyboardEvent.KEY_UP, KeyUp);
		}
		
		private function KeyUp(event:KeyboardEvent):void
		{
			if (state == 1)
			{
				switch (event.keyCode) 
				{
					case Keyboard.W:
						if (map[i - 1][j] == 2)
						{
							state = 2;
							i--;
							destX = TileSizeX;
							destY = -TileSizeY;
							trace("moving UP");
						}
						else trace("NOPE");
						break;
						
					case Keyboard.S:
						if (map[i + 1][j] == 2)
						{
							//animate
							state = 2;
							i++;
							destX = -TileSizeX;
							destY = TileSizeY;
							trace("moving DOWN");
						}
						else trace("NOPE");
						break;
					
					case Keyboard.A:
						if (map[i][j - 1] == 2)
						{
							//animate
							state = 2;
							j--;
							destX = -TileSizeX;
							destY = -TileSizeY;
							trace("moving LEFT");
						}
						else trace("NOPE");
						break;
					
					case Keyboard.D:
						if (map[i][j + 1] == 2)
						{
							//animate
							state = 2;
							j++;
							destX = TileSizeX;
							destY = TileSizeY;
							trace("moving RIGHT");
						}
						else trace("NOPE");
						break;
					
					case Keyboard.SPACE:
						//check viability
						//animate
						state = 3;
						counter = 300;
						robotInteraction();
						break;
					
					case Keyboard.Q:
						//animate
						state = 4;
						counter = 300;
						robotTool();
						break;
					
					default:
						trace("NOPE");
						break;
				}
			}
		}
		
		
		private function robotInteraction():void 
		{
			trace("Contextual Interaction");
		}
		
		private function robotTool():void
		{
			trace("WOW SUCH TOOLS");
		}
		
		private function GameTick(e:Event):void
		{
			// SHOULD BE ON PLAYGROUND??
			switch (state)
			{
				case 1:
					if (counter > 0) counter--;
					else
					{
						trace("cool IDLE animation")
						counter = 1000 + Math.random() * 500;
					}
					break;
					
				case 2:
					if (destX < 0)
					{
						this.x -= SpeedX;
						destX += SpeedX;
					}
					else if (destX > 0)
					{
						this.x += SpeedX;
						destX -= SpeedX;
					}
					
					if (destY < 0)
					{
						this.y -= SpeedY;
						destY += SpeedY;
					}
					else if (destY > 0)
					{
						this.y += SpeedY;
						destY -= SpeedY;
					}
					
					if (destX == 0 && destY == 0)
					{
						state = 1;
					}
					break;
					
				case 3:
					if (counter > 0) counter--;
					else
					{
						state = 1;
						counter = 1000 + Math.random() * 500;
					}
					break;
					
				case 4:
					if (counter > 0) counter--;
					else
					{
						state = 1;
						counter = 1000 + Math.random() * 500;
					}
					break;
					
			}
		}
		
		// PROVISIONAL VISUALIZATION FUNCTION
		private function setSprite():void
		{
			robotIMG = new Image(Assets.getTexture("Robot"));
			this.addChild(robotIMG);
		}
		
	}

}