package objects 
{
	import starling.display.Image;

	/**
	 * ...
	 * @author EGOD
	 */
	
	public class Switch extends Activator 
	{
		public function Switch(posi:int, posj:int) 
		{
			super(posi,posj);
			img = new Image(Assets.getTexture("SwitchOFF"));
		}
		
		override protected function sonInteract():void
		{
			this.removeChild(img);
			if (_state) img = new Image(Assets.getTexture("SwitchON"));
			else img = new Image(Assets.getTexture("SwitchOFF"));
			this.addChild(img);
		}
	}

}