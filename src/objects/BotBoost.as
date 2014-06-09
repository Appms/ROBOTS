package objects 
{
	import starling.display.Sprite;
	import starling.display.Image;
	import starling.events.Event;
	/**
	 * ...
	 * @author EGOD
	 */
	public class BotBoost extends Sprite
	{
		private var img:Image;
		
		public function BotBoost() 
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
			trace("WOW such BIGGER animations");
		}
		
	}

}