package objects 
{
	import starling.display.Button;
	import starling.display.Image;
	/**
	 * ...
	 * @author Eric Oliver Obiol, EGOD
	 */
	public class HNano extends Hipsbot 
	{
		
		public function HNano(setI:uint, setJ:uint) 
		{
			super(setI, setJ);
			
		}
		
		
		override protected function sonInteraction(aimI:uint, aimJ:uint):void 
		{
			switch(0)
			{
				case 0:
					trace("I can drain dat NanoBitch");
					break;
				default:
					trace("I can't do that.");
					break;
			}
			trace("HNano Contextual Interaction");
		}
		
		override protected function sonSpecial(aimI:uint, aimJ:uint):void
		{
			trace("PLASMA RUN!");
			this.state = 1;
		}
		
		override protected function setSprite():void
		{
			robotIMG = new Image(Assets.getTexture("Robot_N"));
			robotIMG.pivotX = 31;
			robotIMG.pivotY = 204;
			this.addChild(robotIMG);
		}
		
	}

}