package  
{
	import events.NavigationEvent;
	import screens.LevelSelect;
	import screens.stages.Playground;
	import starling.animation.DelayedCall;
	import starling.display.Sprite;
	import starling.events.Event;
	import screens.MainMenu
	
	/**
	 * @author EGOD
	 */
	
	public class Game extends Sprite 
	{
		private var screenMainMenu:screens.MainMenu;
		private var screenLevelSelect:LevelSelect;
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
			screenPlayground.disposeTemporarly();
			this.addChild(screenPlayground);	
			
			screenLevelSelect = new LevelSelect();
			screenLevelSelect.disposeTemporarily();
			this.addChild(screenLevelSelect);
			
			screenMainMenu = new MainMenu();
			this.addChild(screenMainMenu);
			screenMainMenu.initialize();
		}
		
		private function onChangeScreen(event:NavigationEvent):void 
		{
			switch (event.params.id)
			{
				case "level_select":
					screenMainMenu.disposeTemporarily();
					screenLevelSelect.initialize();
					break;
				case "main_menu":
					screenLevelSelect.initialize();
					screenMainMenu.initialize();
				case "Btn1":
					screenLevelSelect.disposeTemporarily();
					screenPlayground.initialize();
					break;
			}
			//THE ACTIONS WE NEED TO EXECUTE WHEN CHANGING BETWEEN SCREENS
		}
	}

}