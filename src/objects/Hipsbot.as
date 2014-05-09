package objects 
{
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.display.MovieClip;
	import starling.events.Event;
	
	import spine.starling.SkeletonAnimation;
	
	/**
	 * ...
	 * @author EGOD
	 * 
	 * This is the father class for all the three robots.
	 * It will include all basic functions common in the three types.
	 */
	
	public class Hipsbot extends Sprite 
	{	
		
		// 0: Bypass, 1: StandBY, 2: Moving, 3: Interaction, 4: Tool 
		protected var _state:uint;
		
		private const TileSizeX:Number = 128;
		private const TileSizeY:Number = 64;
		
		// Counter as time delayer
		protected var counter:uint;
		
		protected var _i:uint;
		protected var _j:uint;
		
		protected var _aim:uint; // 8 = Up, 2 = Down, 4 = Left, 6 = Right
		
		public var ui:Button;
		
		public var skeleton:SkeletonAnimation;
		
		public function Hipsbot(setI:uint, setJ:uint) 
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			this.state = 0;
			this.i = setI;
			this.j = setJ;
			this.aim = 6;
		}
		
		private function onAddedToStage(event:Event):void
		{
			setSkeleton();
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
		
		public function robotSpecial():void
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
			trace("Special Action");
			sonSpecial(aimI, aimJ);
		}
		
		protected function sonSpecial(aimI:uint, aimJ:uint):void
		{
			trace("WARNING: override failed");
		}
		
		//AnimationFunctions
		
		// PROVISIONAL VISUALIZATION FUNCTION
		protected function setSkeleton():void
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