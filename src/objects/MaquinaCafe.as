package objects 
{
	import starling.display.Image;
	/**
	 * ...
	 * @author Eric Oliver Obiol
	 */
	
	public class MaquinaCafe extends Activable 
	{
		
		public function MaquinaCafe(posi:int, posj:int) 
		{
			img = new Image(Assets.getTexture("Pilar"));
			super(posi, posj);
		}
		
		override protected function changeState():void
		{
			if (_state == false)
			{
				this.removeChild(img);
				//state = true;
				img = new Image(Assets.getTexture("Pilar"));//REVERSED due to ANDSwitchers
				this.addChild(img);
			}
			else
			{
				this.removeChild(img);
				//state = false;
				img = new Image(Assets.getTexture("LampOn")); //REVERSED due to ANDSwitchers
				this.addChild(img); //BUG: image overrided by LampOn on empty pixels filled in LampOn
			}
			
			trace("Override Success");
		}
	}
}