package screens 
{

	import objects.Hipsbot;
	import objects.LevelMap;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.extensions.fluocode.Fluocam;
	import starling.extensions.fluocode.FluocamControl;//FIGURE OUT HOW TO USE THE CAMERA
	
	/**
	 * ...
	 * @author EGOD
	 */
	public class Playground extends Sprite 
	{
		private var map:LevelMap;
		

		private var robot:Hipsbot;
		
		public function Playground() 
		{
			super();
			trace("Playground inicializado!");
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(event:Event):void 
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			drawGame();
		}
		
		private function drawGame():void 
		{
			map = new LevelMap();
			robot = new Hipsbot(1, map.Matrix);
			this.addChild(map);
			this.addChild(robot);
			
		}
		
	}

}