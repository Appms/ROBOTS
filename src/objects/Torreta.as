package objects 
{
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.display.Image;
	
	/**
	 * ...
	 * @author EGOD
	 */
	
	public class Torreta extends Sprite 
	{
		private var img:Image; 
		private var _i:int;
		private var _j:int;
		
		public function Torreta(posi:int, posj:int) 
		{
			super();
			img = new Image(Assets.getTexture("Torreta"));
			pivotX = 96;
			pivotY = 256;
			_i = posi;
			_j = posj;
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
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
	}
}