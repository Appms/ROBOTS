package objects 
{
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.EnterFrameEvent;
	import starling.events.Event;
	
	/**
	 * ...
	 * @author EGOD
	 */
	
	public class MapTile extends Sprite 
	{
		private var image:Image;
		
		private var _desty:int;
		
		private var activable:Boolean;
		
		public var activated:Boolean = false;
		
		public function MapTile( img:Image, dy:int, act:Boolean) 
		{
			super();
			this.image = img;
			this.desty = dy ;
			this.y = desty + (desty / 64) * 100;
			this.activable = act;
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			this.addEventListener(Event.ENTER_FRAME, onGameTick);
		}
		
		private function onGameTick(e:Event):void 
		{
			if (!activable)
			{
				if (desty < y) y -= 8;
				else { y = desty; removeEventListener(EnterFrameEvent.ENTER_FRAME, onGameTick); }
			}
			else 
			{
				if (activated)
				{
					if (desty < y) y -= 8;
					else y = desty;
					//else { y = desty; removeEventListener(EnterFrameEvent.ENTER_FRAME, onGameTick); }
				}
				else
				{
					if (y < desty + (desty / 64) * 100) y += 8;
				}
			}
		}
		
		private function onAddedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			this.addChild(image);
		}
		
		public function get desty():int 
		{
			return _desty;
		}
		
		public function set desty(value:int):void 
		{
			_desty = value;
		}
		
	}

}