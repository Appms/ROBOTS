package objects 
{
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	
	/**
	 * ...
	 * @author Eric Oliver Obiol
	 */
	public class Rejilla extends Sprite 
	{
		private var img:Image;
		private var _i:int;
		private var _j:int;
		private var _target:Rejilla;
		
		public function Rejilla(posi:int, posj:int, orientation:Boolean)
		{
			super();
			if (orientation)
			{
				img = new Image(Assets.getTexture("RejillaL"));
				pivotX = -32;
				pivotY = 128;
			}
			else
			{
				img = new Image(Assets.getTexture("RejillaR"));
				pivotX = 128;
				pivotY = 128;
			}
			_i = posi;
			_j = posj;
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			this.addChild(img);
		}
		
		public function interact():void 
		{
			
			trace("Me has penetrado");
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
		
		public function get target():Rejilla 
		{
			return _target;
		}
		
		public function set target(value:Rejilla):void 
		{
			_target = value;
		}
		
	}

}