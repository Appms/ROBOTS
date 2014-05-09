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
				this.dispose(); //????
				//state = true;
				img = new Image(Assets.getTexture("LampOff"));//REVERSED due to ANDSwitchers
				this.addChild(img);
			}
			else
			{
				this.dispose();
				//state = false;
				img = new Image(Assets.getTexture("LampOn")); //REVERSED due to ANDSwitchers
				this.addChild(img); //BUG: image overrided by LampOn on empty pixels filled in LampOn
			}
			
			trace("Override Success");
		}
	}

}