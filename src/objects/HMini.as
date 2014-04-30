package objects 
{
	import starling.display.Button;
	import starling.display.Image;
	/**
	 * ...
	 * @author Eric Oliver Obiol, EGOD
	 */
	public class HMini extends Hipsbot 
	{
		private var inventario:Array;
		private var equipped:uint;
		
		public function HMini(setI:uint, setJ:uint) 
		{
			super(setI, setJ);
			inventario = [2, 1, 3];
			equipped = 2; // no es el objeto en sí, sino el índice del objeto equipado en la Array inventario
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
		
		override protected function sonSpecial(aimI:uint, aimJ:uint):void
		{
			if (equipped < inventario.length-1) equipped++;
			else equipped = 0;
			trace("CHANGE EQUIPPED TOOL: " + inventario[equipped]);
			this.state = 1;
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