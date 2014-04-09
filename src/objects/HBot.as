package objects 
{
	import starling.display.Button;
	import starling.display.Image;
	/**
	 * ...
	 * @author Eric Oliver Obiol, EGOD
	 */
	public class HBot extends Hipsbot 
	{
		
		public function HBot(setI:uint, setJ:uint) 
		{
			super(setI, setJ);
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
			trace("HBot Contextual Interaction");
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