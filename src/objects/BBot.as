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
	 * @author EGOD
	 */
	
	public class BBot extends Hipsbot 
	{
		
		public function BBot(setI:uint, setJ:uint) 
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
		
		override protected function sonSpecial(aimI:uint, aimJ:uint):void
		{
			trace("PLASMA PUNCH!");
			this.state = 1;
		}
		
		override protected function setSkeleton():void
		{
			var atlas:Atlas = new Atlas(new Assets.BBotAtlas(), new StarlingTextureLoader(new Assets.BBotTexture()));
			var json:SkeletonJson = new SkeletonJson(new AtlasAttachmentLoader(atlas));
			var skeletonData:SkeletonData = json.readSkeletonData(new Assets.BBotJson());

			var stateData:AnimationStateData = new AnimationStateData(skeletonData);

			skeleton = new SkeletonAnimation(skeletonData, stateData);
			skeleton.pivotX = 0;
			skeleton.pivotY = 200;
			
			stateData.setMixByName("front_step", "front_idle", 0.2);
			stateData.setMixByName("front_idle", "front_step", 0.2);

			skeleton.skeleton.skinName = "FRONT";
			skeleton.skeleton.setSlotsToSetupPose();
			skeleton.state.setAnimationByName(0, "front_idle", true);

			this.addChild(skeleton);
			Starling.juggler.add(skeleton);
		}
		
	}

}