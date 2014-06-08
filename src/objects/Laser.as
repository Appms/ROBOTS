package objects 
{
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	
	/**
	 * ...
	 * @author Eric Oliver Obiol
	 */
	public class Laser extends Sprite 
	{
		private var _img:Image;
		
		private var _direction:Boolean;
		private var _father:Sprite;
		
		private var _i:int;
		private var _j:int;
		
		public function Laser(dad:Sprite, posi:int, posj:int) 
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			//this.addEventListener(Event.ENTER_FRAME, onGameTick);
			_father = dad;
			_i = posi;
			_j = posj;
			pivotX = 256;
			pivotY = 128;
			_img = new Image(Assets.getTexture("Laser"));
		}
		
		private function onAddedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			this.addChild(img);
		}
		
		public function get i():int 
		{
			return _i;
		}
		
		public function set i(value:int):void 
		{
			_i = value;
		}
		
		public function get j():int 
		{
			return _j;
		}
		
		public function set j(value:int):void 
		{
			_j = value;
		}
		
		public function get img():Image 
		{
			return _img;
		}
		
		public function set img(value:Image):void 
		{
			_img = value;
		}
		
		
	}

}