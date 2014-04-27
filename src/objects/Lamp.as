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
		
		override public function changeState():void
		{
			if (state == false)
			{
				this.dispose();
				state = true;
				img = new Image(Assets.getTexture("LampOn"));
				this.addChild(img);
			}
			else
			{
				this.dispose();
				state = false;
				img = new Image(Assets.getTexture("LampOff"));
				this.addChild(img); //BUG: image overrided by LampOn on empty pixels filled in LampOn
			}
			trace("Override Success");
		}
	}

}