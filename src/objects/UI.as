package objects 
{
	import starling.display.Sprite;
	import starling.display.Button;
	import starling.events.Event;
	
	/**
	 * ...
	 * @author EGOD
	 * 
	 * This class creates the basic UI for our game.
	 * This UI enables the player to change between robots using buttons.
	 * Not yet fully implemented.
	 * 
	 */
	public class UI extends Sprite 
	{
		private var normalBtn:Button;
		private var miniBtn:Button;
		
		public function UI() 
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			drawUI();
		}
		
		private function drawUI():void 
		{
			normalBtn = new Button(Assets.getTexture("Icon_1"));
			normalBtn.x = 660;
			normalBtn.y = 460;
			this.addChild(normalBtn);
			
			miniBtn = new Button(Assets.getTexture("Icon_2"));
			miniBtn.x = 560;
			miniBtn.y = 460;
			this.addChild(miniBtn);
		}
		
	}

}