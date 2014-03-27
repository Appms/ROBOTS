package objects 
{
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.display.MovieClip;
	import starling.events.Event;
	
	/**
	 * ...
	 * @author EGOD
	 * 
	 * This is the father class for all the three robots.
	 * It will include all basic functions common in the three types.
	 */
	public class Hipsbot extends Sprite 
	{	
		
		// Provisional code (until son classes made)
		private var robotIMG:Image;
		// ID Number to identify each robot on screen.
		private var idRobot:uint;
		
		// 0: Bypass, 1: StandBY, 2: Moving, 3: Interaction, 4: Tool 
		private var _state:uint;

		//Movement destination variables
		private var destX:Number;
		private var destY:Number;
		
		// Counter as time delayer
		private var counter:uint;
		
		private var map:Array;
		
		private var _i:uint;
		private var _j:uint;
		
		
		public function Hipsbot(id:uint) 
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			this.idRobot = id;
			this.state = 1;
			// Self Sprite Origin Change Representation
			this.x += 338 ; // RobotIMG/2
			this.y += 97 ;// RobotIMG/2
			this.i = 2;
			this.j = 1;
			this.y += 64;
			//this.x = -i * TileSizeX + j * TileSizeX;
			//this.y = i * TileSizeY + j * TileSizeY;
		}
		
		private function onAddedToStage(event:Event):void
		{
			setSprite();
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function robotInteraction():void 
		{
			trace("Contextual Interaction");
		}
		
		private function robotTool():void
		{
			trace("WOW SUCH TOOLS");
		}
		
		//AnimationFunctions
		
		// PROVISIONAL VISUALIZATION FUNCTION
		private function setSprite():void
		{
			robotIMG = new Image(Assets.getTexture("Robot"));
			this.addChild(robotIMG);
		}
		
		public function get state():uint 
		{
			return _state;
		}
		
		public function set state(value:uint):void 
		{
			_state = value;
		}
		
		public function get i():uint 
		{
			return _i;
		}
		
		public function set i(value:uint):void 
		{
			_i = value;
		}
		
		public function get j():uint 
		{
			return _j;
		}
		
		public function set j(value:uint):void 
		{
			_j = value;
		}
		
	}

}