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
		protected var robotIMG:Image;
		// ID Number to identify each robot on screen.
		protected var idRobot:uint;
		
		// 0: Bypass, 1: StandBY, 2: Moving, 3: Interaction, 4: Tool 
		protected var _state:uint;
		
		private const TileSizeX:Number = 128;
		private const TileSizeY:Number = 64;
		
		// Counter as time delayer
		protected var counter:uint;
		
		protected var _i:uint;
		protected var _j:uint;
		
		protected var _aim:uint; // 8 = Up, 2 = Down, 4 = Left, 6 = Right
		
		public function Hipsbot(id:uint, setI:uint, setJ:uint) 
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			this.idRobot = id;
			this.state = 0;
			// Self Sprite Origin Change Representation
			this.i = setI;
			this.j = setJ;
			this.x = - i * TileSizeX + j * TileSizeX + TileSizeX;
			this.y = i * TileSizeY + j * TileSizeY + TileSizeY*3/4;
			this.aim = 8;
		}
		
		private function onAddedToStage(event:Event):void
		{
			setSprite();
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		public function robotInteraction():void 
		{
			var aimI:uint = i;
			var aimJ:uint = j;
			switch(aim)
			{
				case 8:
					aimI--;
					break;
				case 2:
					aimI++;
					break;
				case 4:
					aimJ--;
					break;
				case 6:
					aimJ++;
					break;
				default:
					break;
			}
			sonInteraction(aimI, aimJ);
			trace("Contextual Interaction");
		}
		protected function sonInteraction(aimI:uint, aimJ:uint):void
		{
			trace("WARNING: override failed");
		}
		
		public function robotTool():void
		{
			trace("WOW SUCH TOOLS");
		}
		
		//AnimationFunctions
		
		// PROVISIONAL VISUALIZATION FUNCTION
		protected function setSprite():void
		{
			trace("WARNING: override failed");
		}
		
		
		//*********** GETTERS - SETTERS ***********
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
		
		public function get aim():uint 
		{
			return _aim;
		}
		
		public function set aim(value:uint):void 
		{
			_aim = value;
		}
	}

}