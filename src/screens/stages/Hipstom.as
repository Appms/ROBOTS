package screens.stages 
{
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	import starling.utils.HAlign;
	import starling.utils.VAlign;
	
	/**
	 * ...
	 * @author EGOD
	 */
	
	public class Hipstom extends Sprite 
	{
		private var _text:Array = [["Linea 1 Mensaje 1", "Linea 2 Mensaje 1", "Linea 3 Mensaje 1"],
									["Linea 1 Mensaje 2", "Linea 2 Mensaje 2"],
									["Y asi sucesivamente", ":D"]]; //BUG: los dos puntos ":" se cargan la fuente
		
		private var HipstomIMG:Image;
		public var messageText:TextField;		
		
		private var _iteratorI:uint;
		private var _iteratorJ:uint;
			
		public function Hipstom() 
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			setHipstom();
		}
		
		private function setHipstom():void 
		{
			HipstomIMG = new Image(Assets.getTexture("HipstomSprite"));
			//this.x = -20;
			this.y = 395;
			this.scaleX = 0.5;
			this.scaleY = 0.5;
			
			messageText = new TextField(300, 100, text[0][0], "Frau", 48, 0xffffff);
			messageText.hAlign = HAlign.LEFT;
			messageText.vAlign = VAlign.TOP;
			messageText.x = 550;
			messageText.y = 200;
			messageText.border = false;
			messageText.height = messageText.textBounds.height + 5;
			
			this.addChild(HipstomIMG);
			this.addChild(messageText);
		}
		
		public function get iteratorI():uint 
		{
			return _iteratorI;
		}
		
		public function set iteratorI(value:uint):void 
		{
			_iteratorI = value;
		}
		
		public function get iteratorJ():uint 
		{
			return _iteratorJ;
		}
		
		public function set iteratorJ(value:uint):void 
		{
			_iteratorJ = value;
		}
		
		public function get text():Array 
		{
			return _text;
		}
		
		
		
	}

}