package objects 
{
	import starling.display.Image;
	/**
	 * ...
	 * @author Eric Oliver Obiol, EGOD
	 */
	public class HNano extends Hipsbot 
	{
		
		public function HNano(id:uint, levelMap:Array, setI:uint, setJ:uint) 
		{
			super(id, levelMap, setI, setJ);
			
		}
		
		
		override protected function sonInteraction(aimI:uint, aimJ:uint):void 
		{
			switch(map[aimI][aimJ])
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
		
		override protected function setSprite():void
		{
			robotIMG = new Image(Assets.getTexture("HipsbotNano"));
			robotIMG.pivotX = 32;
			robotIMG.pivotY = 188;
			this.addChild(robotIMG);
		}
		
	}

}