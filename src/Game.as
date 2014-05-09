package  
{
	import events.NavigationEvent;
	import screens.stages.Playground;
	import starling.animation.DelayedCall;
	import starling.display.Sprite;
	import starling.events.Event;
	
	/**
	 * @author EGOD
	 */
	
	public class Game extends Sprite 
	{
		private var screenPlayground:screens.stages.Playground;
		public function Game() 
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(event:Event):void 
		{
			this.addEventListener(NavigationEvent.CHANGE_SCREEN, onChangeScreen);
			
			screenPlayground = new Playground();
			this.addChild(screenPlayground);	
		}
		
		private function onChangeScreen(event:NavigationEvent):void 
		{
			//THE ACTIONS WE NEED TO EXECUTE WHEN CHANGING BETWEEN SCREENS
		}
	}

}