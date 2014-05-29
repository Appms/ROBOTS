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
	
	public class MBot extends Hipsbot 
	{
		private var inventario:Array;
		private var equipped:uint;
		
		public function MBot(setI:uint, setJ:uint) 
		{
			super(setI, setJ);
			inventario = [2, 1, 3];
			equipped = 2; // no es el objeto en sí, sino el índice del objeto equipado en la Array inventario
		}
		
		
		override protected function sonInteraction(aimI:uint, aimJ:uint):void 
		{
			switch(0)
			{
				case 0:
					trace("I can drain dat MiniBitch");
					break;
				default:
					trace("I can't do that.");
					break;
			}
			trace("HMini Contextual Interaction");
		}
		
		override protected function sonSpecial(aimI:uint, aimJ:uint):void
		{
			if (equipped < inventario.length-1) equipped++;
			else equipped = 0;
			trace("CHANGE EQUIPPED TOOL: " + inventario[equipped]);
			this.state = 1;
		}
		
		override protected function setSkeleton():void
		{
			var atlas:Atlas = new Atlas(new Assets.MBotAtlas(), new StarlingTextureLoader(new Assets.MBotTexture()));
			var json:SkeletonJson = new SkeletonJson(new AtlasAttachmentLoader(atlas));
			var skeletonData:SkeletonData = json.readSkeletonData(new Assets.MBotJson());

			var stateData:AnimationStateData = new AnimationStateData(skeletonData);

			skeleton = new SkeletonAnimation(skeletonData, stateData);
			skeleton.pivotX = 0;
			skeleton.pivotY = 150;

			skeleton.skeleton.skinName = "BACK";
			skeleton.skeleton.setSlotsToSetupPose();
			skeleton.state.setAnimationByName(0, "spawn", false);
			skeleton.state.addAnimationByName(0, "back_idle", true, 0);

			this.addChild(skeleton);
			Starling.juggler.add(skeleton);
		}
		
	}

}