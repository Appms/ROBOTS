package objects 
{
	import starling.display.Image;
	/**
	 * ...
	 * @author Eric Oliver Obiol, EGOD
	 */
	public class HBot extends Hipsbot 
	{
		
		public function HBot(id:uint, levelMap:Array, setI:uint, setJ:uint) 
		{
			super(id, levelMap, setI, setJ);
		}
		
		
		override protected function sonInteraction(aimI:uint, aimJ:uint):void 
		{
			switch(map[aimI][aimJ])
			{
				case 0:
					trace("I can drain dat Bitch");
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
			robotIMG.pivotY = 378;
			this.addChild(robotIMG);
		}
		
	}

}