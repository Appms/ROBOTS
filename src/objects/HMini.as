package objects 
{
	import starling.display.Image;
	/**
	 * ...
	 * @author Eric Oliver Obiol, EGOD
	 */
	public class HMini extends Hipsbot 
	{
		
		public function HMini(id:uint, setI:uint, setJ:uint) 
		{
			super(id, setI, setJ);
			
		}
		
		
		override protected function sonInteraction(aimI:uint, aimJ:uint):void 
		{
			switch(0)
			{
				case 0:
					trace("I can drain dat MiniBitch");
					break;
				default:
					trace("I can't do that.");
					break;
			}
			trace("HMini Contextual Interaction");
		}
		
		override protected function setSprite():void
		{
			robotIMG = new Image(Assets.getTexture("Robot_M"));
			robotIMG.pivotX = 46;
			robotIMG.pivotY = 305;
			this.addChild(robotIMG);
		}
		
	}

}