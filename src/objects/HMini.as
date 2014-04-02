package objects 
{
	import starling.display.Image;
	/**
	 * ...
	 * @author Eric Oliver Obiol, EGOD
	 */
	public class HMini extends Hipsbot 
	{
		
		public function HMini(id:uint, levelMap:Array, setI:uint, setJ:uint) 
		{
			super(id, levelMap, setI, setJ);
			
		}
		
		
		override protected function sonInteraction(aimI:uint, aimJ:uint):void 
		{
			switch(map[aimI][aimJ])
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
			robotIMG = new Image(Assets.getTexture("HipsbotMini"));
			robotIMG.pivotX = 48;
			robotIMG.pivotY = 283;
			this.addChild(robotIMG);
		}
		
	}

}