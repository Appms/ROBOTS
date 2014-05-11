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
		
		private var desty:int;
		
		public function MapTile( img:Image, dy:int) 
		{
			super();
			this.image = img;
			this.desty = dy;
			this.y = desty + (desty / 64) * 100;
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			this.addEventListener(Event.ENTER_FRAME, onGameTick);
		}
		
		private function onGameTick(e:Event):void 
		{
			if (desty < y) y -= 8;
			else {y = desty; removeEventListener(EnterFrameEvent.ENTER_FRAME, onGameTick);}
		}
		
		private function onAddedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			this.addChild(image);
		}
		
	}

}