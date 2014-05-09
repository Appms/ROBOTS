package objects 
{
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	
	/**
	 * ...
	 * @author EGOD
	 */
	
	public class Cube extends Sprite 
	{	
		private const SpeedX:Number = 4;
		private const SpeedY:Number = 2;
		
		private var img:Image;
		private var _i:int;
		private var _j:int;
		private var _state:int;
		private var _destx:int;
		private var _desty:int;
		
		public function Cube(posi:int, posj:int) 
		{
			super();
			img = new Image(Assets.getTexture("Cube"));
			_i = posi;
			_j = posj;
			_state = 0;
			pivotX = 128;
			pivotY = 192;
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			this.addEventListener(Event.ENTER_FRAME, onGameTick);
		}
		
		private function onGameTick(e:Event):void 
		{
			if (_state == 1) 
			{
				if (x < _destx) {x += SpeedX; }

				else if (x > _destx) {x -= SpeedX; }
							
				if (y < _desty) {y += SpeedY; }
							
				else if (y > _desty) {y -= SpeedY; }
							
				if (x == _destx && y == _desty) { _state = 0;}
			}

		}
		
		private function onAddedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			this.addChild(img);
		}
		
		public function get i():int 
		{
			return _i;
		}
		
		public function set i(value:int):void 
		{
			_i = value;
		}
		
		public function get j():int 
		{
			return _j;
		}
		
		public function set j(value:int):void 
		{
			_j = value;
		}
		
		public function get destx():int 
		{
			return _destx;
		}
		
		public function set destx(value:int):void 
		{
			_destx = value;
		}
		
		public function get desty():int 
		{
			return _desty;
		}
		
		public function set desty(value:int):void 
		{
			_desty = value;
		}
		
		public function get state():int 
		{
			return _state;
		}
		
		public function set state(value:int):void 
		{
			_state = value;
		}
		
	}

}