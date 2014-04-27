package  
{
	/**
	 * ...
	 * @author EGOD
	 */
	
	import flash.display.Bitmap;
	import flash.utils.Dictionary;
	import starling.text.BitmapFont;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;

	public class Assets 
	{
		[Embed(source = "../media/graphics/Baldosa.png")]
		public static const Floor:Class;
		
		[Embed(source = "../media/graphics/Columna.png")]
		public static const Wall:Class;
	
		[Embed(source = "../media/graphics/robot.png")]
		public static const Robot:Class;
		
		[Embed(source = "../media/graphics/HMini.png")]
		public static const Robot_M:Class;
		
		[Embed(source = "../media/graphics/HNano.png")]
		public static const Robot_N:Class;
		
		[Embed(source = "../media/graphics/HIPS1.png")]
		public static const Icon_1:Class;
		
		[Embed(source = "../media/graphics/HIPS2.png")]
		public static const Icon_2:Class;
		
		[Embed(source = "../media/graphics/HIPS3.png")]
		public static const Icon_3:Class;
		
		[Embed(source = "../media/graphics/ChooseLeft.png")]
		public static const LeftBtn:Class;
		
		[Embed(source = "../media/graphics/ChooseRight.png")]
		public static const RightBtn:Class;
		
		[Embed(source = "../media/graphics/ESC.png")]
		public static const Esc_BG:Class;
		
		[Embed(source = "../media/graphics/BACK.jpg")]
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
		
		[Embed(source = "../media/graphics/BBOT.atlas", mimeType = "application/octet-stream")]
		static public const BBotAtlas:Class;

		[Embed(source = "../media/graphics/BBOT.png")]
		static public const BBotTexture:Class;

		[Embed(source = "../media/graphics/BBOT.json", mimeType = "application/octet-stream")]
		static public const BBotJson:Class;
		
		private static var gameTextures:Dictionary = new Dictionary();
		
		[Embed(source = "../media/fonts/frau.ttf", fontFamily = "MyFontName", embedAsCFF = "false", fontName = "Frau")]
		public static var MyFont:Class;
		
		/*private static var gameTextureAtlas:TextureAtlas;
		
		[Embed(source = "../media/graphics/mySpriteSheet.png")]
		public static const AtlasTextureGame:Class;
		
		[Embed(source = "../media/graphics/mySpriteSheet.xml",mimeType="application/octet-stream")]
		public static const AtlasXmlGame:Class;
		
		[Embed(source = "../media/fonts/embedded/BD_Cartoon_Shout.ttf",fontFamily="MyFontName",embedAsCFF="false")]
		public static var MyFont:Class;
		
		//SE PUEDEN INTRODUCIR TAMBIÉN BITMAP FONTS QUE SON MÁS EFICIENTES (MIRAR TUTORIAL SI SE DESEA)
		
		public static function getAtlas():TextureAtlas
		{
			if (gameTextureAtlas == null) 
			{
				var texture:Texture = getTexture("AtlasTextureGame");
				var xml:XML = XML(new AtlasXmlGame());
				gameTextureAtlas = new TextureAtlas(texture, xml);
			}
			return gameTextureAtlas;
		}
		*/
		
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