package screens.stages 
{
	import starling.display.Sprite;
	import starling.display.Button;
	import starling.events.Event;
	
	/**
	 * ...
	 * @author EGOD
	 * 
	 * This class creates the basic UI for our game.
	 * This UI enables the player to change between robots using buttons.
	 * Not yet fully implemented.
	 * 
	 */
	
	public class UI extends Sprite 
	{
		public var normalBtn:Button;
		public var normalRightBtn:Button;
		public var normalLeftBtn:Button;
		
		public var miniBtn:Button;
		public var miniRightBtn:Button;
		public var miniLeftBtn:Button;
		
		public var nanoBtn:Button;
		public var nanoRightBtn:Button;
		public var nanoLeftBtn:Button;
		
		
		private var _normalID:uint;
		private var _miniID:uint;
		private var _nanoID:uint;
		
		public function UI() 
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			drawUI();
		}
		
		private function drawUI():void 
		{
			normalBtn = new Button(Assets.getTexture("Icon_1"));
			normalBtn.x = 660;
			normalBtn.y = 460;
			normalRightBtn = new Button(Assets.getTexture("RightBtn"));
			normalRightBtn.x = 750;
			normalRightBtn.y = 562;
			normalLeftBtn = new Button(Assets.getTexture("LeftBtn"));
			normalLeftBtn.x = 680;
			normalLeftBtn.y = 562;
			normalID = 0;
			this.addChild(normalBtn);
			this.addChild(normalRightBtn);
			this.addChild(normalLeftBtn);
			
			miniBtn = new Button(Assets.getTexture("Icon_2"));
			miniBtn.x = 560;
			miniBtn.y = 460;
			miniRightBtn = new Button(Assets.getTexture("RightBtn"));
			miniRightBtn.x = 650;
			miniRightBtn.y = 562;
			miniLeftBtn = new Button(Assets.getTexture("LeftBtn"));
			miniLeftBtn.x = 580;
			miniLeftBtn.y = 562;
			miniID = 0;
			this.addChild(miniBtn);
			this.addChild(miniRightBtn);
			this.addChild(miniLeftBtn);
			
			nanoBtn = new Button(Assets.getTexture("Icon_3"));
			nanoBtn.x = 460;
			nanoBtn.y = 460;
			nanoRightBtn = new Button(Assets.getTexture("RightBtn"));
			nanoRightBtn.x = 550;
			nanoRightBtn.y = 562;
			nanoLeftBtn = new Button(Assets.getTexture("LeftBtn"));
			nanoLeftBtn.x = 480;
			nanoLeftBtn.y = 562;
			nanoID = 0;
			this.addChild(nanoBtn);
			this.addChild(nanoRightBtn);
			this.addChild(nanoLeftBtn);
		}
		
		public function get normalID():uint 
		{
			return _normalID;
		}
		
		public function set normalID(value:uint):void 
		{
			_normalID = value;
		}
		
		public function get miniID():uint 
		{
			return _miniID;
		}
		
		public function set miniID(value:uint):void 
		{
			_miniID = value;
		}
		
		public function get nanoID():uint 
		{
			return _nanoID;
		}
		
		public function set nanoID(value:uint):void 
		{
			_nanoID = value;
		}
		
	}

}