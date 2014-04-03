package objects 
{
	import starling.display.Image;
	/**
	 * ...
	 * @author Eric Oliver Obiol, EGOD
	 */
	public class HBot extends Hipsbot 
	{
		
		public function HBot(id:uint, setI:uint, setJ:uint) 
		{
			super(id, setI, setJ);
		}
		
		
		override protected function sonInteraction(aimI:uint, aimJ:uint):void 
		{
			switch(0)
			{
				case 0:
					trace("Let's GO!");
					break;
				default:
					trace("I can't do that.");
					break;
			}
			trace("HBot Contextual Interaction: Override Success");
		}
		
		override protected function setSprite():void
		{
			robotIMG = new Image(Assets.getTexture("Robot"));
			robotIMG.pivotX = 62;
			robotIMG.pivotY = 407;
			this.addChild(robotIMG);
		}
		
	}

}