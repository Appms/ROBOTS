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
		public var Back:Button;
		public var Btn1:Button;
		public var Btn2:Button;
		
		
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
			if ((buttonClicked as Button) == Btn2)
			{
				trace("ROW ROW FIGHT THE POWAH");
				this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN, { id: "level_2" }, true));
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
			
			Back = new Button(Assets.getTexture("Back"));
			Back.x = 16;
			Back.y = 384;
			this.addChild(Back);
			
			Btn1 = new Button(Assets.getTexture("Btn1"));
			Btn1.x = 64;
			Btn1.y = 128;
			this.addChild(Btn1);
			
			Btn2 = new Button(Assets.getTexture("Btn2"));
			Btn2.x = 264;
			Btn2.y = 128;
			this.addChild(Btn2);
			
			this.addEventListener(Event.TRIGGERED, onLevelSelectClick);
		}
	}
}