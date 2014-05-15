package objects 
{
	import starling.display.Image;
	/**
	 * ...
	 * @author Eric Oliver Obiol
	 */
	public class RuedaHamster extends Activator 
	{
		
		public function RuedaHamster(posi:int, posj:int) 
		{
			super(posi, posj);
			img = new Image(Assets.getTexture("Switch"));
		}
		
		override public function interact():void 
		{
			super();
			if (_state)
			{
				trace("animate");
			}
			else
			{
				trace("deanimate");
			}
		}
		
		
	}

}