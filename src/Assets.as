package  
{
	/**
	 * @author EGOD
	 */
	
	import flash.display.Bitmap;
	import flash.utils.Dictionary;
	import starling.text.BitmapFont;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;

	public class Assets 
	{
		[Embed(source = "../media/graphics/FloorPlate.png")]
		public static const Floor:Class;
		
		[Embed(source = "../media/graphics/Wall.png")]
		public static const Wall:Class;
		
		[Embed(source = "../media/graphics/BBOTIcon.png")]
		public static const Icon_1:Class;
		
		[Embed(source = "../media/graphics/MBOTIcon.png")]
		public static const Icon_2:Class;
		
		[Embed(source = "../media/graphics/NBOTIcon.png")]
		public static const Icon_3:Class;
		
		[Embed(source = "../media/graphics/ChooseLeft.png")]
		public static const LeftBtn:Class;
		
		[Embed(source = "../media/graphics/ChooseRight.png")]
		public static const RightBtn:Class;
		
		[Embed(source = "../media/graphics/EscBG.png")]
		public static const Esc_BG:Class;
		
		[Embed(source = "../media/graphics/EscMenuReturn.jpg")]
		public static const Esc_Btn:Class;
		
		[Embed(source = "../media/graphics/Hipstom.png")]
		public static const HipstomSprite:Class;
		
		[Embed(source = "../media/graphics/Switch.png")]
		public static const Switch:Class;
		
		[Embed(source = "../media/graphics/LampOff.png")]
		public static const LampOff:Class;
		
		[Embed(source = "../media/graphics/LampOn.png")]
		public static const LampOn:Class;
		
		[Embed(source = "../media/graphics/Cube.png")]
		public static const Cube:Class;
		
		[Embed(source = "../media/graphics/PressurePlateUP.png")]
		public static const PressurePlateUP:Class;
		
		[Embed(source = "../media/graphics/PressurePlateDOWN.png")]
		public static const PressurePlateDOWN:Class;
		
		[Embed(source = "../media/graphics/RejillaL.png")]
		public static const RejillaL:Class;
		
		[Embed(source = "../media/graphics/RejillaR.png")]
		public static const RejillaR:Class;
		
		[Embed(source = "../media/graphics/Tool1.png")]
		public static const Tool1:Class;
		
		[Embed(source = "../media/graphics/Tool2.png")]
		public static const Tool2:Class;
		
		[Embed(source = "../media/graphics/Tool3.png")]
		public static const Tool3:Class;
		
		[Embed(source = "../media/graphics/BBOT.atlas", mimeType = "application/octet-stream")]
		static public const BBotAtlas:Class;

		[Embed(source = "../media/graphics/BBOT.png")]
		static public const BBotTexture:Class;

		[Embed(source = "../media/graphics/BBOT.json", mimeType = "application/octet-stream")]
		static public const BBotJson:Class;
		
		[Embed(source = "../media/graphics/MBOT.atlas", mimeType = "application/octet-stream")]
		static public const MBotAtlas:Class;

		[Embed(source = "../media/graphics/MBOT.png")]
		static public const MBotTexture:Class;

		[Embed(source = "../media/graphics/MBOT.json", mimeType = "application/octet-stream")]
		static public const MBotJson:Class;
		
		[Embed(source = "../media/graphics/NBOT.atlas", mimeType = "application/octet-stream")]
		static public const NBotAtlas:Class;

		[Embed(source = "../media/graphics/NBOT.png")]
		static public const NBotTexture:Class;

		[Embed(source = "../media/graphics/NBOT.json", mimeType = "application/octet-stream")]
		static public const NBotJson:Class;
		
		private static var gameTextures:Dictionary = new Dictionary();
		
		[Embed(source = "../media/fonts/frau.ttf", fontFamily = "MyFontName", embedAsCFF = "false", fontName = "Frau")]
		public static var MyFont:Class;
		
		public static function getTexture(name:String):Texture
		{
			if (gameTextures[name] == undefined)
			{
					var bitmap:Bitmap = new Assets[name]();
					gameTextures[name] = Texture.fromBitmap(bitmap);
			}
			
			return gameTextures[name];
		}
	}

}