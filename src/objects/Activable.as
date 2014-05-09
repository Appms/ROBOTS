package objects 
{
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	
	/**
	 * ...
	 * @author EGOD
	 */
	
	public class Activable extends Sprite 
	{
		protected var _state:Boolean = false;
		protected var img:Image;
		private var _i:int;
		private var _j:int;
		protected var _switchers:Array = [];
		
		public function Activable(posi:int, posj:int) 
		{
			super();
			_i = posi;
			_j = posj;
			pivotX = 95; //Los cambios de pivote deberían estar en cada una de las clases hija, pero no van.
			pivotY = 138; //
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			this.addChild(img);
		}
		
		public function checkState():void
		{
			_state = true;
			for (var i:int = 0; i < _switchers.length; i++)
			{
				if (_switchers[i].state == false)
				{
					_state = false;
					break;
				}
			}
			trace("Checked");
			changeState();
		}
		
		protected function changeState():void
		{
			trace("WARNING: Override failed");
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
		
		public function get switchers():Array 
		{
			return _switchers;
		}
		
		public function set switchers(value:Array):void 
		{
			_switchers = value;
		}
		
	}

}