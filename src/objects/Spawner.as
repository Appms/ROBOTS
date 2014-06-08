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
		
		private var _i:int;
		private var _j:int;
		
		public var type:int = 1;
		public var ready:Boolean = true;
		
		public function Spawner(posi:int, posj:int) 
		{
			super();
			this.i = posi;
			this.j = posj;
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