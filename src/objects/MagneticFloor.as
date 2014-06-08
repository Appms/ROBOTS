package objects 
{
	import starling.display.Image;
	/**
	 * ...
	 * @author EGOD
	 */
	public class MagneticFloor extends Activable
	{
		public function MagneticFloor(posi:int, posj:int) 
		{
			super(posi, posj);
			img = new Image(Assets.getTexture("MagneticFloorON"));
			pivotX = 128;
			pivotY = 64;
		}
		
		override protected function changeState():void
		{
			if (_state)
			{
				this.removeChild(img);
				img = new Image(Assets.getTexture("MagneticFloorOFF"));
				this.addChild(img);
			}
			else
			{
				this.removeChild(img);
				img = new Image(Assets.getTexture("MagneticFloorON"));
				this.addChild(img);
			}
			
			trace("Override Success");
		}
		
	}

}