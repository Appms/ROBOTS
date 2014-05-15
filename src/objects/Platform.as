package objects 
{
	import starling.display.Image;
	import starling.events.Event;
	/**
	 * ...
	 * @author Eric Oliver Obiol
	 */
	public class Platform extends Activable 
	{
		
		public function Platform(posi:int, posj:int) 
		{
			img = new Image(Assets.getTexture("Floor"));
			super(posi, posj);
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(e:Event):void 
		{
			pivotX = 128;
			pivotY = 64;
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			this.removeChild(img);
		}
		
		override protected function changeState():void
		{
			if (_state == false)
			{
				this.removeChild(img);
			}
			else
			{
				this.addChild(img);
			}
			
			trace("Override Success");
		}
	}
}