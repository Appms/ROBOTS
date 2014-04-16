package objects 
{
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	
	/**
	 * ...
	 * @author EGOD
	 */
	public class Switch extends Sprite 
	{
		private var img:Image;
		private var _i:int;
		private var _j:int;
		
		public function Switch(posi:int, posj:int) 
		{
			super();
			img = new Image(Assets.getTexture("Switch"));
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
			trace("Me has pulsado");
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