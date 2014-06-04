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
		public function Torreta() 
		{
			super();
			img = new Image(Assets.getTexture("Torreta"));
			pivotX = 96;
			pivotY = 440;
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			this.addChild(img);
		}
	}
}