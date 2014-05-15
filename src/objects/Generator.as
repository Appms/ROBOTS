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
	
	import starling.display.Sprite;
	import starling.core.Starling;
	
	/**
	 * ...
	 * @author EGOD
	 */
	
	public class Generator extends Sprite 
	{
		public var skeleton:SkeletonAnimation;
		
		public function Generator() 
		{
			super();
			setSkeleton();
		}
		
		private function setSkeleton():void 
		{
			var atlas:Atlas = new Atlas(new Assets.GeneratorAtlas(), new StarlingTextureLoader(new Assets.GeneratorTexture()));
			var json:SkeletonJson = new SkeletonJson(new AtlasAttachmentLoader(atlas));
			var skeletonData:SkeletonData = json.readSkeletonData(new Assets.GeneratorJson());

			var stateData:AnimationStateData = new AnimationStateData(skeletonData);

			skeleton = new SkeletonAnimation(skeletonData, stateData);
			skeleton.pivotX = -80;
			skeleton.pivotY = 73;

			skeleton.state.setAnimationByName(0, "spin", true);

			this.addChild(skeleton);
			Starling.juggler.add(skeleton);
		}
		
	}

}