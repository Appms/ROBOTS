package screens 
{
	import starling.display.Sprite;
	import events.NavigationEvent;
	import starling.display.Stage;
	import starling.events.Event;
	import starling.animation.DelayedCall;
	import starling.display.Button;
	import starling.display.Image;
	
	/**
	 * ...
	 * @author EGOD
	 */
	
	public class MainMenu extends Sprite 
	{
		//public var Title:Image;
		
		public var LSBtn:Button;
		
		//public var OptionsBtn:Button;
		
		//public var aboutBtn:Button;
		
		public function MainMenu()
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onMainMenuClick(event:Event):void
		{
			var buttonClicked:Button = event.target as Button;
			if ((buttonClicked as Button) == LSBtn)
			{
				trace("Goin' to Level Select!");
				this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN, { id: "level_select" }, true));

			}
			/*else if ((buttonClicked as Button) == aboutBtn)
			{
				trace("ABOUT");
			}*/
		}
		
		public function disposeTemporarily():void
		{
			this.visible = false;
		}
		
		public function initialize():void
		{
			this.visible = true;
		}
		
		private function onAddedToStage(event:Event):void
		{
			trace("Welcome screen initialized");
			
			drawScreen();
		}
		
		private function drawScreen():void
		{
			LSBtn = new Button(Assets.getTexture("LevelSelect"));
			LSBtn.x = 256;
			LSBtn.y = 128;
			this.addChild(LSBtn);
			
			this.addEventListener(Event.TRIGGERED, onMainMenuClick);
		}
	}

}