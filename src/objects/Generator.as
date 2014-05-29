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
	import starling.events.EnterFrameEvent;
	
	import starling.display.Sprite;
	import starling.core.Starling;
	
	/**
	 * ...
	 * @author EGOD
	 */
	
	public class Generator extends Sprite
	{
		public var skeleton:SkeletonAnimation;
		
		public var activated:Boolean = false;
		
		private var _i:int;
		private var _j:int;
		
		public function Generator(posi:int, posj:int) 
		{
			super();
			_i = posi;
			_j = posj;
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

			this.addChild(skeleton);
			Starling.juggler.add(skeleton);
		}
		
		public function update()
		{
			if (activated) 
			{
				activated = false;
				skeleton.state.setAnimationByName(0, "start", false);
			}
			else 
			{
				activated = true;
				skeleton.state.setAnimationByName(0, "start", false);
				skeleton.state.addAnimationByName(0, "spin", true, 0);
			}
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