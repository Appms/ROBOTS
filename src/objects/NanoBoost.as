package objects 
{
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	
	/**
	 * ...
	 * @author EGOD
	 */
	public class NanoBoost extends Sprite 
	{
		private var img:Image;
		
		public function NanoBoost() 
		{
			super();
			img = new Image(Assets.getTexture("NanoPowerUp"));
			pivotX = 120;
			pivotY = 60;
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			this.addChild(img);
		}
		
		public function Activate():void
		{
			trace("WOW such animations");
		}
		
	}

}