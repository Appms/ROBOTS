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
	 * @author EGOD
	 */
	
	public class LevelSelect extends Sprite 
	{
		public var LSImg:Image;
		public var Back:Button;
		public var Btn1:Button;
		
		
		public function LevelSelect() 
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onLevelSelectClick(event:Event):void
		{
			var buttonClicked:Button = event.target as Button;
			if ((buttonClicked as Button) == Back) 
			{
				trace("Back to Main Menu");
				this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN, { id: "main_menu" }, true));
			}
			if ((buttonClicked as Button) == Btn1)
			{
				trace("ROW ROW FIGHT THE POWAH");
				this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN, { id: "level_1" }, true));
			}
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
			trace("Level Select screen initialized");
			
			drawScreen();
		}
		
		private function drawScreen():void
		{
			LSImg = new Image(Assets.getTexture("LevelSelect"));
			LSImg.x = 256;
			LSImg.y = 32;
			this.addChild(LSImg);
			
			Back = new Button(Assets.getTexture("Back"));
			Back.x = 16;
			Back.y = 384;
			this.addChild(Back);
			
			Btn1 = new Button(Assets.getTexture("Btn1"));
			Btn1.x = 64;
			Btn1.y = 128;
			this.addChild(Btn1);
			
			this.addEventListener(Event.TRIGGERED, onLevelSelectClick);
		}

}