package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import net.hires.debug.Stats;
	import starling.core.Starling;
	
	/**
	 * ...
	 * @author EGOD
	 */
	[SWF(frameRate="60", width="800", height="600", backgroundColor="0x333333")]
	public class Main extends Sprite 
	{
		private var stats:Stats;
		private var starling:Starling;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			stats = new Stats();
			addChild(stats);
			
			starling = new Starling( Game, stage);
			starling.antiAliasing = 1;
			starling.start();
		}
		
	}
	
}