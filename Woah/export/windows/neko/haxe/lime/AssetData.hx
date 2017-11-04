package lime;


import lime.utils.Assets;


class AssetData {

	private static var initialized:Bool = false;
	
	public static var library = new #if haxe3 Map <String, #else Hash <#end LibraryType> ();
	public static var path = new #if haxe3 Map <String, #else Hash <#end String> ();
	public static var type = new #if haxe3 Map <String, #else Hash <#end AssetType> ();	
	
	public static function initialize():Void {
		
		if (!initialized) {
			
			path.set ("assets/data/data-goes-here.txt", "assets/data/data-goes-here.txt");
			type.set ("assets/data/data-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/Woah.oep", "assets/data/Woah.oep");
			type.set ("assets/data/Woah.oep", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/WoahLevel.oel", "assets/data/WoahLevel.oel");
			type.set ("assets/data/WoahLevel.oel", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/atacc.png", "assets/images/atacc.png");
			type.set ("assets/images/atacc.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/C Damage.png", "assets/images/C Damage.png");
			type.set ("assets/images/C Damage.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/CFULLclone.png", "assets/images/CFULLclone.png");
			type.set ("assets/images/CFULLclone.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/clone.png", "assets/images/clone.png");
			type.set ("assets/images/clone.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/escopeta.png", "assets/images/escopeta.png");
			type.set ("assets/images/escopeta.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/images-go-here.txt", "assets/images/images-go-here.txt");
			type.set ("assets/images/images-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/metralleta.png", "assets/images/metralleta.png");
			type.set ("assets/images/metralleta.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/nada.png", "assets/images/nada.png");
			type.set ("assets/images/nada.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/pistola.png", "assets/images/pistola.png");
			type.set ("assets/images/pistola.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/skeleton.png", "assets/images/skeleton.png");
			type.set ("assets/images/skeleton.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/TilesPetes.png", "assets/images/TilesPetes.png");
			type.set ("assets/images/TilesPetes.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/music/woah.wav", "assets/music/woah.wav");
			type.set ("assets/music/woah.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/sounds-go-here.txt", "assets/sounds/sounds-go-here.txt");
			type.set ("assets/sounds/sounds-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("flixel/sounds/beep.ogg", "flixel/sounds/beep.ogg");
			type.set ("flixel/sounds/beep.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("flixel/sounds/flixel.ogg", "flixel/sounds/flixel.ogg");
			type.set ("flixel/sounds/flixel.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("flixel/fonts/nokiafc22.ttf", "flixel/fonts/nokiafc22.ttf");
			type.set ("flixel/fonts/nokiafc22.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("flixel/fonts/monsterrat.ttf", "flixel/fonts/monsterrat.ttf");
			type.set ("flixel/fonts/monsterrat.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("flixel/images/ui/button.png", "flixel/images/ui/button.png");
			type.set ("flixel/images/ui/button.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/images/logo/default.png", "flixel/images/logo/default.png");
			type.set ("flixel/images/logo/default.png", Reflect.field (AssetType, "image".toUpperCase ()));
			
			
			initialized = true;
			
		} //!initialized
		
	} //initialize
	
	
} //AssetData
