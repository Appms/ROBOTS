package  
{
	/**
	 * @author EGOD
	 */
	
	import flash.display.Bitmap;
	import flash.media.Sound;
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
		
		[Embed(source = "../media/graphics/ExtWall.png")]
		public static const ExtWall:Class;
		
		[Embed(source = "../media/graphics/IntWall.png")]
		public static const IntWall:Class;
		
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
		
		[Embed(source = "../media/graphics/SwitchOFF.png")]
		public static const SwitchOFF:Class;
		[Embed(source = "../media/graphics/SwitchON.png")]
		public static const SwitchON:Class;
		
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
		
		[Embed(source = "../media/graphics/RejillaR.png")]
		public static const RejillaR:Class;
		
		[Embed(source = "../media/graphics/Tool1.png")]
		public static const Tool1:Class;
		
		[Embed(source = "../media/graphics/Tool2.png")]
		public static const Tool2:Class;
		
		[Embed(source = "../media/graphics/Tool3.png")]
		public static const Tool3:Class;
		
		[Embed(source = "../media/graphics/Pilar.png")]
		public static const Pilar:Class;
		
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
		
		[Embed(source = "../media/graphics/SPAWNER.json", mimeType = "application/octet-stream")]
		static public const SpawnerJson:Class;
		
		[Embed(source = "../media/graphics/SPAWNER.atlas", mimeType = "application/octet-stream")]
		static public const SpawnerAtlas:Class;

		[Embed(source = "../media/graphics/SPAWNER.png")]
		static public const SpawnerTexture:Class;
		
		[Embed(source = "../media/graphics/GENERATOR.json", mimeType = "application/octet-stream")]
		static public const GeneratorJson:Class;
		
		[Embed(source = "../media/graphics/GENERATOR.atlas", mimeType = "application/octet-stream")]
		static public const GeneratorAtlas:Class;

		[Embed(source = "../media/graphics/GENERATOR.png")]
		static public const GeneratorTexture:Class;
		
		[Embed(source = "../media/graphics/VENTSHAFT.atlas", mimeType = "application/octet-stream")]
		static public const VentshaftAtlas:Class;

		[Embed(source = "../media/graphics/VENTSHAFT.png")]
		static public const VentshaftTexture:Class;

		[Embed(source = "../media/graphics/VENTSHAFT.json", mimeType = "application/octet-stream")]
		static public const VentshaftJson:Class;
		
		[Embed(source = "../media/graphics/Torreta.png")]
		static public const Torreta:Class;
		
		[Embed(source = "../media/graphics/MagneticFloorOFF.png")]
		static public const MagneticFloorOFF:Class;
		
		[Embed(source = "../media/graphics/MagneticFloorON.png")]
		static public const MagneticFloorON:Class;
		
		[Embed(source = "../media/graphics/Laser.png")]
		static public const Laser:Class;
		
		[Embed(source = "../media/graphics/LaserEndTop.png")]
		static public const LaserEndTop:Class;
		
		[Embed(source = "../media/graphics/LaserEndBot.png")]
		static public const LaserEndBot:Class;
		
		private static var gameTextures:Dictionary = new Dictionary();
		private static var gameMusic:Dictionary = new Dictionary();
		
		[Embed(source = "../media/fonts/frau.ttf", fontFamily = "MyFontName", embedAsCFF = "false", fontName = "Frau")]
		public static var MyFont:Class;
		
		[Embed(source = "../media/music/Robots-electrified.mp3")]
		static public const Theme1:Class;
		
		[Embed(source = "../media/sounds/beep5.mp3")]
		static public const Beep:Class;
		
		[Embed(source = "../media/graphics/LevelSelect.png")]
		static public const LevelSelect:Class;
		
		[Embed(source = "../media/graphics/LevelSelect/Back.png")]
		static public const Back:Class;
		
		[Embed(source = "../media/graphics/LevelSelect/1.png")]
		static public const Btn1:Class;
		
		[Embed(source = "../media/graphics/LevelSelect/2.png")]
		static public const Btn2:Class;
		
		[Embed(source = "../media/graphics/INTRO.atlas", mimeType = "application/octet-stream")]
		static public const IntroAtlas:Class;

		[Embed(source = "../media/graphics/INTRO.png")]
		static public const IntroTexture:Class;

		[Embed(source = "../media/graphics/INTRO.json", mimeType = "application/octet-stream")]
		static public const IntroJson:Class;
		
		[Embed(source = "../media/graphics/cursor.png")]
		static public const Cursor:Class;
		
		[Embed(source = "../media/graphics/YELLOWSTRIPE.jpg")]
		static public const YellowStripe:Class;
		
		[Embed(source = "../media/graphics/BLACKSTRIPE.jpg")]
		static public const BlackStripe:Class;
		
		[Embed(source = "../media/graphics/BackArrow.png")]
		static public const BackArrow:Class;
		
		[Embed(source = "../media/graphics/Controls.png")]
		static public const Controls:Class;

		
		public static function getTexture(name:String):Texture
		{
			if (gameTextures[name] == undefined)
			{
					var bitmap:Bitmap = new Assets[name]();
					gameTextures[name] = Texture.fromBitmap(bitmap);
			}
			
			return gameTextures[name];
		}
		
		public static function getMusic(name:String):Sound
		{
			if (gameMusic[name] == undefined)
			{
					var music:Sound = new Assets[name]();
					gameMusic[name] = music;
			}
			
			return gameMusic[name];
		}
	}

}