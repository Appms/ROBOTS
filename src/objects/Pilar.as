package objects 
{
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	
	/**
	 * ...
	 * @author EGOD
	 */
	
	public class Pilar extends Sprite 
	{
		private var img:Image;
		
		public function Pilar() 
		{
			super();
			img = new Image(Assets.getTexture("Pilar"));
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