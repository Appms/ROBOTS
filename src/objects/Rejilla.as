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
	 * @author 	EGOD
	 */
	
	public class Rejilla extends Sprite 
	{
		
		public var skeleton:SkeletonAnimation;
		
		private var _i:int;
		private var _j:int;
		private var _target:Rejilla;
		
		public function Rejilla(posi:int, posj:int, orientation:Boolean)
		{
			super();
			_i = posi;
			_j = posj;
			setSkeleton();
		}
		
		private function setSkeleton():void 
		{
			var atlas:Atlas = new Atlas(new Assets.VentshaftAtlas(), new StarlingTextureLoader(new Assets.VentshaftTexture()));
			var json:SkeletonJson = new SkeletonJson(new AtlasAttachmentLoader(atlas));
			var skeletonData:SkeletonData = json.readSkeletonData(new Assets.VentshaftJson());

			var stateData:AnimationStateData = new AnimationStateData(skeletonData);

			skeleton = new SkeletonAnimation(skeletonData, stateData);
			skeleton.pivotX = -128;
			skeleton.pivotY = 40;
			
			skeleton.skeleton.skinName = "BACK";
			skeleton.skeleton.setSlotsToSetupPose();
			skeleton.state.setAnimationByName(0, "idle", false);

			this.addChild(skeleton);
			Starling.juggler.add(skeleton);
		}
		
		public function interact():void 
		{
			
			trace("Me has penetrado");
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
		
		public function get target():Rejilla 
		{
			return _target;
		}
		
		public function set target(value:Rejilla):void 
		{
			_target = value;
		}
		
	}

}