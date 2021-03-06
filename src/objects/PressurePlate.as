package objects 
{
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	
	/**
	 * ...
	 * @author Eric Oliver Obiol
	 */
	public class PressurePlate extends Activator 
	{	
		private var _last_state:Boolean = false;
		
		public function PressurePlate(posi:int, posj:int) 
		{
			super(posi, posj);
			img = new Image(Assets.getTexture("PressurePlateUP"));
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(e:Event):void 
		{
			pivotX = 128;
			pivotY = 10;
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		
		override protected function sonInteract():void
		{
			if (_state == false)
			{
				this.removeChild(img);
				img = new Image(Assets.getTexture("PressurePlateUP"));
				this.addChild(img);
			}
			else
			{
				this.removeChild(img);
				img = new Image(Assets.getTexture("PressurePlateDOWN"));
				this.addChild(img);
			}
			
			trace("Override Success");
		}
		
		public function get last_state():Boolean 
		{
			return _last_state;
		}
		
		public function set last_state(value:Boolean):void 
		{
			_last_state = value;
		}
	}
}