package objects 
{
	import starling.display.Image;
	/**
	 * ...
	 * @author Eric Oliver Obiol
	 */
	
	public class Lamp extends Activable 
	{
		public function Lamp(posi:int, posj:int) 
		{
			img = new Image(Assets.getTexture("LampOff"));
			super(posi, posj);
		}
		
		override protected function changeState():void
		{
			if (_state == false)
			{
				this.removeChild(img);
				img = new Image(Assets.getTexture("LampOff"));
				this.addChild(img);
			}
			else
			{
				this.removeChild(img);
				img = new Image(Assets.getTexture("LampOn"));
				this.addChild(img);
			}
			
			trace("Override Success");
		}
	}

}