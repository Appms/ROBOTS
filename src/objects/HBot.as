package objects 
{
	import spine.SkeletonData;
	import spine.SkeletonJson;
	import spine.animation.AnimationStateData;
	import spine.atlas.Atlas;
	import spine.attachments.AtlasAttachmentLoader;
	import spine.starling.StarlingTextureLoader;
	import spine.starling.SkeletonAnimation;
	import spine.starling.StarlingAtlasAttachmentLoader;
	
	import starling.display.Button;
	import starling.display.Image;
	import starling.core.Starling;
	import starling.display.Sprite;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	
	/**
	 * ...
	 * @author Eric Oliver Obiol, EGOD
	 */
	public class HBot extends Hipsbot 
	{
		private var skeleton:SkeletonAnimation;
		
		public function HBot(setI:uint, setJ:uint) 
		{
			super(setI, setJ);
		}
		
		
		override protected function sonInteraction(aimI:uint, aimJ:uint):void 
		{
			switch(0)
			{
				case 0:
					trace("Let's GO!");
					break;
				default:
					trace("I can't do that.");
					break;
			}
			trace("HBot Contextual Interaction");
		}
		
		override protected function setSprite():void
		{
			var atlas:Atlas = new Atlas(new Assets.BBotAtlas(), new StarlingTextureLoader(new Assets.BBotTexture()));
			var json:SkeletonJson = new SkeletonJson(new AtlasAttachmentLoader(atlas));
			var skeletonData:SkeletonData = json.readSkeletonData(new Assets.BBotJson());

			var stateData:AnimationStateData = new AnimationStateData(skeletonData);
			stateData.setMixByName("walk", "fap fap", 0.2);
			stateData.setMixByName("fap fap", "walk", 0.4);
			stateData.setMixByName("fap fap", "fap fap", 0.2);

			skeleton = new SkeletonAnimation(skeletonData, stateData);
			skeleton.pivotX = 0;
			skeleton.pivotY = 200;
			
			skeleton.state.onStart.add(function (trackIndex:int) : void {
				trace(trackIndex + " start: " + skeleton.state.getCurrent(trackIndex));
			});
			skeleton.state.onEnd.add(function (trackIndex:int) : void {
				trace(trackIndex + " end: " + skeleton.state.getCurrent(trackIndex));
			});
			skeleton.state.onComplete.add(function (trackIndex:int, count:int) : void {
				trace(trackIndex + " complete: " + skeleton.state.getCurrent(trackIndex) + ", " + count);
			});

			skeleton.state.setAnimationByName(0, "walk", true);
			skeleton.state.addAnimationByName(0, "fap fap", false, 3);
			skeleton.state.addAnimationByName(0, "walk", true, 0);

			this.addChild(skeleton);
			Starling.juggler.add(skeleton);
		}
		
	}

}