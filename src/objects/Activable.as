package objects 
{
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	
	/**
	 * ...
	 * @author Eric Oliver Obiol
	 */
	public class Activable extends Sprite 
	{
		protected var state:Boolean;
		protected var img:Image;
		private var _i:int;
		private var _j:int;
		
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
		
		public function changeState():void
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
		
	}

}