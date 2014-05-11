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
	
	public class Spawner extends Sprite 
	{
		
		public var skeleton:SkeletonAnimation;
		
		public function Spawner() 
		{
			super();
			setSkeleton();
		}
		
		private function setSkeleton():void 
		{
			var atlas:Atlas = new Atlas(new Assets.SpawnerAtlas(), new StarlingTextureLoader(new Assets.SpawnerTexture()));
			var json:SkeletonJson = new SkeletonJson(new AtlasAttachmentLoader(atlas));
			var skeletonData:SkeletonData = json.readSkeletonData(new Assets.SpawnerJson());

			var stateData:AnimationStateData = new AnimationStateData(skeletonData);

			skeleton = new SkeletonAnimation(skeletonData, stateData);
			skeleton.pivotX = 0;
			skeleton.pivotY = 10;

			skeleton.state.setAnimationByName(0, "idle", true);

			this.addChild(skeleton);
			Starling.juggler.add(skeleton);
		}
		
	}

}