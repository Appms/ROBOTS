package objects 
{
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	
	/**
	 * ...
	 * @author Eric Oliver Obiol
	 */
	public class Tool extends Sprite 
	{
		
		protected var img:Image;
		private var _i:int;
		private var _j:int;
		private var _type:uint;
		
		public function Tool(posi:int, posj:int, tooltype:uint) 
		{
			super();
			_i = posi;
			_j = posj;
			pivotX = 96;
			pivotY = 46;
			_type = tooltype;
			img = new Image(Assets.getTexture("Tool" + _type));
			/*switch(_type)
			{
				case 1:
					img = new Image(Assets.getTexture("Tool1"));
					break;
					
				case 2:
					img = new Image(Assets.getTexture("Tool2"));
					break;
					
				case 3:
					img = new Image(Assets.getTexture("Tool3"));
					break;
					
				default:
					trace("WARNING: wrong tool type");
					break;
			}*/
			
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			this.addChild(img);
		}
		
		
		public function get type():int 
		{
			return _type;
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
	}

}