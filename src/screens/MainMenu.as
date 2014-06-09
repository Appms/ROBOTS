package screens 
{
	import starling.display.Sprite;
	import events.NavigationEvent;
	import starling.display.Stage;
	import starling.events.EnterFrameEvent;
	import starling.events.Event;
	import starling.animation.DelayedCall;
	import starling.display.Button;
	import starling.display.Image;
	import flash.ui.Keyboard;
	import starling.events.KeyboardEvent;
	
	import spine.SkeletonData;
	import spine.SkeletonJson;
	import spine.animation.AnimationStateData;
	import spine.atlas.Atlas;
	import spine.attachments.AtlasAttachmentLoader;
	import spine.starling.StarlingTextureLoader;
	import spine.starling.SkeletonAnimation;
	import spine.starling.StarlingAtlasAttachmentLoader;
	
	import starling.core.Starling;
	
	/**
	 * ...
	 * @author EGOD
	 */
	
	public class MainMenu extends Sprite 
	{
		//public var Title:Image;
		
		private var skeleton:SkeletonAnimation;
		
		private var cursorId:int;
		
		private var cursorImg:Image;
		
		private var yStripe1:Image;
		
		private var yStripe2:Image;
		
		private var bStripe1:Image;
		
		private var bStripe2:Image;
		
		private var transition:Boolean;
		
		//public var OptionsBtn:Button;
		
		//public var aboutBtn:Button;
		
		public function MainMenu()
		{
			super();
			drawScreen();
		}
		
		public function disposeTemporarily():void
		{
			this.visible = false;
		}
		
		public function initialize():void
		{
			this.visible = true;
		}
		
		private function drawScreen():void
		{			
			var atlas:Atlas = new Atlas(new Assets.IntroAtlas(), new StarlingTextureLoader(new Assets.IntroTexture()));
			var json:SkeletonJson = new SkeletonJson(new AtlasAttachmentLoader(atlas));
			var skeletonData:SkeletonData = json.readSkeletonData(new Assets.IntroJson());

			var stateData:AnimationStateData = new AnimationStateData(skeletonData);

			skeleton = new SkeletonAnimation(skeletonData, stateData);
			skeleton.pivotX = -400;
			skeleton.pivotY = -300;
			
			skeleton.state.setAnimationByName(0, "INTRO", false);
			
			skeleton.state.onComplete.add(changeBot);
			
			this.addChild(skeleton);
			Starling.juggler.add(skeleton);
			
			transition = false;
			cursorId = 0;
			cursorImg = new Image(Assets.getTexture("Cursor"));
			cursorImg.x = 650;
			cursorImg.y = 295;
			cursorImg.visible = false;
			this.addChild(cursorImg);
			
			yStripe1 = new Image(Assets.getTexture("YellowStripe"));
			yStripe1.x = -800
			yStripe2 = new Image(Assets.getTexture("YellowStripe"));
			yStripe2.x = -1200
			yStripe2.y = 300;
			bStripe1 = new Image(Assets.getTexture("BlackStripe"));
			bStripe1.x = -1000;
			bStripe1.y = 150;
			bStripe2 = new Image(Assets.getTexture("BlackStripe"));
			bStripe2.x = -1400;
			bStripe2.y = 450;
			this.addChild(yStripe1);
			this.addChild(yStripe2);
			this.addChild(bStripe1);
			this.addChild(bStripe2);
			
			this.addEventListener(KeyboardEvent.KEY_DOWN, KeyDown);
			this.addEventListener(EnterFrameEvent.ENTER_FRAME, onGameTick);
		}
		
		private function onGameTick(e:EnterFrameEvent):void 
		{
			if (transition) 
			{
				if (yStripe1.x != 0) yStripe1.x += 10;
				if (yStripe2.x != 0) yStripe2.x += 10;
				if (bStripe1.x != 0) bStripe1.x += 10;
				if (bStripe2.x != 0) bStripe2.x += 10;
				if (yStripe1.x == 0 && yStripe2.x == 0 && bStripe1.x == 0 && bStripe2.x == 0) 
				{ 
					transition = false;
					switch (cursorId) 
					{
						case 0:
							this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN, { id: "level_select" }, true));
							break;
							
						case 1:
							this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN, { id: "level_select" }, true));
							break;
					}
					 
				}
			}
		}
		
		private function KeyDown(e:KeyboardEvent):void 
		{
			if (cursorImg.visible) 
			{
				switch (cursorId) 
				{
					case 0:
						switch (e.keyCode) 
						{
							case Keyboard.W;// , Keyboard.UP:
								break;
							
							case Keyboard.S;//, Keyboard.DOWN:
								cursorId ++;
								cursorImg.x -= 170;
								cursorImg.y += 50;
								break
							
							case Keyboard.ENTER;// , Keyboard.SPACE:
								this.removeEventListener(KeyboardEvent.KEY_DOWN, KeyDown);
								transition = true;
								break;
						}
						break;
						
					case 1:
						switch (e.keyCode) 
						{
							case Keyboard.W;// , Keyboard.UP:
								cursorId --;
								cursorImg.x += 170;
								cursorImg.y -= 50;
								break;
							
							case Keyboard.S;// , Keyboard.DOWN:
								cursorId ++;
								cursorImg.x += 120;
								cursorImg.y += 50;
								break
							
							case Keyboard.ENTER;// , Keyboard.SPACE:
								transition = true;
								break;
						}
						break;
						
					case 2:
						switch (e.keyCode) 
						{
							case Keyboard.W;// , Keyboard.UP:
								cursorId --;
								cursorImg.x -= 120;
								cursorImg.y -= 50;
								break;
							
							case Keyboard.S;// , Keyboard.DOWN:
								break
							
							case Keyboard.ENTER;// , Keyboard.SPACE:
								skeleton.state.addAnimationByName(0, "CREDITS", false, 0);
								cursorImg.visible = false;
								break;
						}
						break;
				}
			}
			
		}
		
		private function changeBot(trackIndex:int, count:int):void 
		{
			switch (skeleton.state.toString()) 
			{
				case "INTRO":
					skeleton.state.addAnimationByName(0, "MBOT", false, 0);
					cursorImg.visible = true;
					break;
				
				case "MBOT":
					skeleton.state.addAnimationByName(0, "BBOT", false, 0);
					break;
					
				case "BBOT":
					skeleton.state.addAnimationByName(0, "NBOT", false, 0);
					break;
				
				case "NBOT":
					skeleton.state.addAnimationByName(0, "MBOT", false, 0);
					break;
				
				case "CREDITS":
					cursorImg.visible = true;
					break;
			}
		}
	}

}