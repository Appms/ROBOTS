package screens.stages 
{
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	
	/**
	 * ...
	 * @author EGOD
	 */
	
	public class EscMenu extends Sprite 
	{
		public var EscBg:Image;
		public var EscBtn:Button;
		
		public function EscMenu() 
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			this.addEventListener(Event.TRIGGERED, escOptions);
		}
		
		private function onAddedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			drawEscScreen();
		}
		
		private function escOptions(e:Event):void 
		{
			var buttonClicked:Button = e.target as Button;
			if ((buttonClicked as Button) == EscBtn)
			{
				EscBg.visible = false;
				EscBtn.visible = false;
			}
		}
		
		private function drawEscScreen():void 
		{
			EscBg = new Image(Assets.getTexture("Esc_BG"));
			EscBtn = new Button(Assets.getTexture("Esc_Btn"));
			
			EscBg.pivotX = 400;
			EscBg.pivotY = 300;
			EscBg.x = 400;
			EscBg.y = 300;
			
			EscBtn.pivotX = 50;
			EscBtn.pivotY = 50;
			EscBtn.x = 400;
			EscBtn.y = 300;
			
			this.addChild(EscBg);
			this.addChild(EscBtn);
			
			EscBg.visible = false;
			EscBtn.visible = false;
		}
		
		
	}

}