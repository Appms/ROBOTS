package objects 
{
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	
	/**
	 * ...
	 * @author Eric Oliver Obiol
	 */
	public class Activator extends Sprite 
	{
		protected var _state:Boolean = false;
		protected var img:Image;
		private var _i:int;
		private var _j:int;
		protected var _targets:Array = [];
		
		public function Activator(posi:int, posj:int) 
		{
			super();
			_i = posi;
			_j = posj;
			pivotX = 32;
			pivotY = 64;
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			this.addChild(img);
		}
		
		public function interact():void 
		{
			if (_state == true) _state = false;
			else _state = true;
			for (var i:int = 0; i < _targets.length; i++)
			{
				_targets[i].checkState();
			}
			sonInteract();
			trace("Me has pulsado");
		}
		
		protected function sonInteract():void
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
		
		public function get state():Boolean 
		{
			return _state;
		}
		
		public function set state(value:Boolean):void 
		{
			_state = value;
		}
		
		public function get targets():Array 
		{
			return _targets;
		}
		
		public function set targets(value:Array):void 
		{
			_targets = value;
		}
	}

}