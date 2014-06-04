package  
{
	import events.NavigationEvent;
	import screens.LevelSelect;
	import screens.stages.Playgrounds.Playground;
	import screens.stages.Playgrounds.Playground2;
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
		private var screenPlayground:Playground;
		private var screenPlayground2:Playground2;
		
		public function Game() 
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(event:Event):void 
		{
			this.addEventListener(NavigationEvent.CHANGE_SCREEN, onChangeScreen);
			
			screenPlayground = new Playground();
			screenPlayground.disposeTemporarily();
			this.addChild(screenPlayground);
			
			screenPlayground2 = new Playground2();
			screenPlayground2.disposeTemporarily();
			this.addChild(screenPlayground2);
			
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
					screenLevelSelect.disposeTemporarily();
					screenMainMenu.initialize();
					break;
				case "level_1":
					screenLevelSelect.disposeTemporarily();
					screenPlayground.initialize();
					break;
				case "level_2":
					screenLevelSelect.disposeTemporarily();
					screenPlayground2.initialize();
					break;
			}
			//THE ACTIONS WE NEED TO EXECUTE WHEN CHANGING BETWEEN SCREENS
		}
	}

}