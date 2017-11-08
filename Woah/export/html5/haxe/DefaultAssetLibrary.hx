package;


import haxe.Timer;
import haxe.Unserializer;
import lime.app.Future;
import lime.app.Preloader;
import lime.app.Promise;
import lime.audio.AudioSource;
import lime.audio.openal.AL;
import lime.audio.AudioBuffer;
import lime.graphics.Image;
import lime.net.HTTPRequest;
import lime.system.CFFI;
import lime.text.Font;
import lime.utils.Bytes;
import lime.utils.UInt8Array;
import lime.Assets;

#if sys
import sys.FileSystem;
#end

#if flash
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Loader;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.events.ProgressEvent;
import flash.media.Sound;
import flash.net.URLLoader;
import flash.net.URLRequest;
#end


class DefaultAssetLibrary extends AssetLibrary {
	
	
	public var className (default, null) = new Map <String, Dynamic> ();
	public var path (default, null) = new Map <String, String> ();
	public var type (default, null) = new Map <String, AssetType> ();
	
	private var lastModified:Float;
	private var timer:Timer;
	
	
	public function new () {
		
		super ();
		
		#if (openfl && !flash)
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_monsterrat_ttf);
		
		
		
		#end
		
		#if flash
		
		className.set ("assets/data/levelv3.oel", __ASSET__assets_data_levelv3_oel);
		type.set ("assets/data/levelv3.oel", AssetType.TEXT);
		className.set ("assets/data/NewTileset.png", __ASSET__assets_data_newtileset_png);
		type.set ("assets/data/NewTileset.png", AssetType.IMAGE);
		className.set ("assets/data/ObstaCulos.png", __ASSET__assets_data_obstaculos_png);
		type.set ("assets/data/ObstaCulos.png", AssetType.IMAGE);
		className.set ("assets/data/tilesC.png", __ASSET__assets_data_tilesc_png);
		type.set ("assets/data/tilesC.png", AssetType.IMAGE);
		className.set ("assets/data/woahLevel.oep", __ASSET__assets_data_woahlevel_oep);
		type.set ("assets/data/woahLevel.oep", AssetType.TEXT);
		className.set ("assets/images/atacc.png", __ASSET__assets_images_atacc_png);
		type.set ("assets/images/atacc.png", AssetType.IMAGE);
		className.set ("assets/images/balas.png", __ASSET__assets_images_balas_png);
		type.set ("assets/images/balas.png", AssetType.IMAGE);
		className.set ("assets/images/bat.png", __ASSET__assets_images_bat_png);
		type.set ("assets/images/bat.png", AssetType.IMAGE);
		className.set ("assets/images/bloqueR.png", __ASSET__assets_images_bloquer_png);
		type.set ("assets/images/bloqueR.png", AssetType.IMAGE);
		className.set ("assets/images/C Damage.png", __ASSET__assets_images_c_damage_png);
		type.set ("assets/images/C Damage.png", AssetType.IMAGE);
		className.set ("assets/images/CFULLclone.png", __ASSET__assets_images_cfullclone_png);
		type.set ("assets/images/CFULLclone.png", AssetType.IMAGE);
		className.set ("assets/images/Chikologo.png", __ASSET__assets_images_chikologo_png);
		type.set ("assets/images/Chikologo.png", AssetType.IMAGE);
		className.set ("assets/images/clone.png", __ASSET__assets_images_clone_png);
		type.set ("assets/images/clone.png", AssetType.IMAGE);
		className.set ("assets/images/CTileset.png", __ASSET__assets_images_ctileset_png);
		type.set ("assets/images/CTileset.png", AssetType.IMAGE);
		className.set ("assets/images/cura.png", __ASSET__assets_images_cura_png);
		type.set ("assets/images/cura.png", AssetType.IMAGE);
		className.set ("assets/images/escopeta.png", __ASSET__assets_images_escopeta_png);
		type.set ("assets/images/escopeta.png", AssetType.IMAGE);
		className.set ("assets/images/Fire.png", __ASSET__assets_images_fire_png);
		type.set ("assets/images/Fire.png", AssetType.IMAGE);
		className.set ("assets/images/fondoBienPete.png", __ASSET__assets_images_fondobienpete_png);
		type.set ("assets/images/fondoBienPete.png", AssetType.IMAGE);
		className.set ("assets/images/gameover.png", __ASSET__assets_images_gameover_png);
		type.set ("assets/images/gameover.png", AssetType.IMAGE);
		className.set ("assets/images/images-go-here.txt", __ASSET__assets_images_images_go_here_txt);
		type.set ("assets/images/images-go-here.txt", AssetType.TEXT);
		className.set ("assets/images/Menu.png", __ASSET__assets_images_menu_png);
		type.set ("assets/images/Menu.png", AssetType.IMAGE);
		className.set ("assets/images/metralleta.png", __ASSET__assets_images_metralleta_png);
		type.set ("assets/images/metralleta.png", AssetType.IMAGE);
		className.set ("assets/images/nada.png", __ASSET__assets_images_nada_png);
		type.set ("assets/images/nada.png", AssetType.IMAGE);
		className.set ("assets/images/Pirania.png", __ASSET__assets_images_pirania_png);
		type.set ("assets/images/Pirania.png", AssetType.IMAGE);
		className.set ("assets/images/pistola.png", __ASSET__assets_images_pistola_png);
		type.set ("assets/images/pistola.png", AssetType.IMAGE);
		className.set ("assets/images/skeleton.png", __ASSET__assets_images_skeleton_png);
		type.set ("assets/images/skeleton.png", AssetType.IMAGE);
		className.set ("assets/images/Stairs.png", __ASSET__assets_images_stairs_png);
		type.set ("assets/images/Stairs.png", AssetType.IMAGE);
		className.set ("assets/images/TilesPetes.png", __ASSET__assets_images_tilespetes_png);
		type.set ("assets/images/TilesPetes.png", AssetType.IMAGE);
		className.set ("assets/images/verySpookySkeleton.png", __ASSET__assets_images_veryspookyskeleton_png);
		type.set ("assets/images/verySpookySkeleton.png", AssetType.IMAGE);
		className.set ("assets/images/wheel.png", __ASSET__assets_images_wheel_png);
		type.set ("assets/images/wheel.png", AssetType.IMAGE);
		className.set ("assets/music/Spooky.ogg", __ASSET__assets_music_spooky_ogg);
		type.set ("assets/music/Spooky.ogg", AssetType.MUSIC);
		className.set ("assets/music/woah.wav", __ASSET__assets_music_woah_wav);
		type.set ("assets/music/woah.wav", AssetType.SOUND);
		className.set ("assets/sounds/caja.ogg", __ASSET__assets_sounds_caja_ogg);
		type.set ("assets/sounds/caja.ogg", AssetType.SOUND);
		className.set ("assets/sounds/disparo.ogg", __ASSET__assets_sounds_disparo_ogg);
		type.set ("assets/sounds/disparo.ogg", AssetType.SOUND);
		className.set ("assets/sounds/Fuego.ogg", __ASSET__assets_sounds_fuego_ogg);
		type.set ("assets/sounds/Fuego.ogg", AssetType.MUSIC);
		className.set ("assets/sounds/Fuego.xmp", __ASSET__assets_sounds_fuego_xmp);
		type.set ("assets/sounds/Fuego.xmp", AssetType.TEXT);
		className.set ("assets/sounds/golpe.ogg", __ASSET__assets_sounds_golpe_ogg);
		type.set ("assets/sounds/golpe.ogg", AssetType.SOUND);
		className.set ("assets/sounds/huesos.ogg", __ASSET__assets_sounds_huesos_ogg);
		type.set ("assets/sounds/huesos.ogg", AssetType.SOUND);
		className.set ("assets/sounds/huesos.xmp", __ASSET__assets_sounds_huesos_xmp);
		type.set ("assets/sounds/huesos.xmp", AssetType.TEXT);
		className.set ("assets/sounds/murcielagos.ogg", __ASSET__assets_sounds_murcielagos_ogg);
		type.set ("assets/sounds/murcielagos.ogg", AssetType.SOUND);
		className.set ("assets/sounds/murcielagos.xmp", __ASSET__assets_sounds_murcielagos_xmp);
		type.set ("assets/sounds/murcielagos.xmp", AssetType.TEXT);
		className.set ("assets/sounds/quemadura.ogg", __ASSET__assets_sounds_quemadura_ogg);
		type.set ("assets/sounds/quemadura.ogg", AssetType.SOUND);
		className.set ("assets/sounds/quemadura.xmp", __ASSET__assets_sounds_quemadura_xmp);
		type.set ("assets/sounds/quemadura.xmp", AssetType.TEXT);
		className.set ("assets/sounds/sinBalas.ogg", __ASSET__assets_sounds_sinbalas_ogg);
		type.set ("assets/sounds/sinBalas.ogg", AssetType.SOUND);
		className.set ("assets/sounds/sounds-go-here.txt", __ASSET__assets_sounds_sounds_go_here_txt);
		type.set ("assets/sounds/sounds-go-here.txt", AssetType.TEXT);
		className.set ("flixel/sounds/beep.ogg", __ASSET__flixel_sounds_beep_ogg);
		type.set ("flixel/sounds/beep.ogg", AssetType.SOUND);
		className.set ("flixel/sounds/flixel.ogg", __ASSET__flixel_sounds_flixel_ogg);
		type.set ("flixel/sounds/flixel.ogg", AssetType.SOUND);
		className.set ("flixel/fonts/nokiafc22.ttf", __ASSET__flixel_fonts_nokiafc22_ttf);
		type.set ("flixel/fonts/nokiafc22.ttf", AssetType.FONT);
		className.set ("flixel/fonts/monsterrat.ttf", __ASSET__flixel_fonts_monsterrat_ttf);
		type.set ("flixel/fonts/monsterrat.ttf", AssetType.FONT);
		className.set ("flixel/images/ui/button.png", __ASSET__flixel_images_ui_button_png);
		type.set ("flixel/images/ui/button.png", AssetType.IMAGE);
		className.set ("flixel/images/logo/default.png", __ASSET__flixel_images_logo_default_png);
		type.set ("flixel/images/logo/default.png", AssetType.IMAGE);
		
		
		#elseif html5
		
		var id;
		id = "assets/data/levelv3.oel";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/NewTileset.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/data/ObstaCulos.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/data/tilesC.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/data/woahLevel.oep";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/atacc.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/balas.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/bat.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/bloqueR.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/C Damage.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/CFULLclone.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Chikologo.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/clone.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/CTileset.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/cura.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/escopeta.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Fire.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/fondoBienPete.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/gameover.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/images-go-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/Menu.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/metralleta.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/nada.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Pirania.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/pistola.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/skeleton.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Stairs.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/TilesPetes.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/verySpookySkeleton.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/wheel.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/music/Spooky.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/music/woah.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/caja.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/disparo.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Fuego.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Fuego.xmp";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/sounds/golpe.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/huesos.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/huesos.xmp";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/sounds/murcielagos.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/murcielagos.xmp";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/sounds/quemadura.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/quemadura.xmp";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/sounds/sinBalas.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/sounds-go-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "flixel/sounds/beep.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "flixel/sounds/flixel.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "flixel/fonts/nokiafc22.ttf";
		className.set (id, __ASSET__flixel_fonts_nokiafc22_ttf);
		
		type.set (id, AssetType.FONT);
		id = "flixel/fonts/monsterrat.ttf";
		className.set (id, __ASSET__flixel_fonts_monsterrat_ttf);
		
		type.set (id, AssetType.FONT);
		id = "flixel/images/ui/button.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/images/logo/default.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		
		
		var assetsPrefix = null;
		if (ApplicationMain.config != null && Reflect.hasField (ApplicationMain.config, "assetsPrefix")) {
			assetsPrefix = ApplicationMain.config.assetsPrefix;
		}
		if (assetsPrefix != null) {
			for (k in path.keys()) {
				path.set(k, assetsPrefix + path[k]);
			}
		}
		
		#else
		
		#if (windows || mac || linux)
		
		var useManifest = false;
		
		className.set ("assets/data/levelv3.oel", __ASSET__assets_data_levelv3_oel);
		type.set ("assets/data/levelv3.oel", AssetType.TEXT);
		
		className.set ("assets/data/NewTileset.png", __ASSET__assets_data_newtileset_png);
		type.set ("assets/data/NewTileset.png", AssetType.IMAGE);
		
		className.set ("assets/data/ObstaCulos.png", __ASSET__assets_data_obstaculos_png);
		type.set ("assets/data/ObstaCulos.png", AssetType.IMAGE);
		
		className.set ("assets/data/tilesC.png", __ASSET__assets_data_tilesc_png);
		type.set ("assets/data/tilesC.png", AssetType.IMAGE);
		
		className.set ("assets/data/woahLevel.oep", __ASSET__assets_data_woahlevel_oep);
		type.set ("assets/data/woahLevel.oep", AssetType.TEXT);
		
		className.set ("assets/images/atacc.png", __ASSET__assets_images_atacc_png);
		type.set ("assets/images/atacc.png", AssetType.IMAGE);
		
		className.set ("assets/images/balas.png", __ASSET__assets_images_balas_png);
		type.set ("assets/images/balas.png", AssetType.IMAGE);
		
		className.set ("assets/images/bat.png", __ASSET__assets_images_bat_png);
		type.set ("assets/images/bat.png", AssetType.IMAGE);
		
		className.set ("assets/images/bloqueR.png", __ASSET__assets_images_bloquer_png);
		type.set ("assets/images/bloqueR.png", AssetType.IMAGE);
		
		className.set ("assets/images/C Damage.png", __ASSET__assets_images_c_damage_png);
		type.set ("assets/images/C Damage.png", AssetType.IMAGE);
		
		className.set ("assets/images/CFULLclone.png", __ASSET__assets_images_cfullclone_png);
		type.set ("assets/images/CFULLclone.png", AssetType.IMAGE);
		
		className.set ("assets/images/Chikologo.png", __ASSET__assets_images_chikologo_png);
		type.set ("assets/images/Chikologo.png", AssetType.IMAGE);
		
		className.set ("assets/images/clone.png", __ASSET__assets_images_clone_png);
		type.set ("assets/images/clone.png", AssetType.IMAGE);
		
		className.set ("assets/images/CTileset.png", __ASSET__assets_images_ctileset_png);
		type.set ("assets/images/CTileset.png", AssetType.IMAGE);
		
		className.set ("assets/images/cura.png", __ASSET__assets_images_cura_png);
		type.set ("assets/images/cura.png", AssetType.IMAGE);
		
		className.set ("assets/images/escopeta.png", __ASSET__assets_images_escopeta_png);
		type.set ("assets/images/escopeta.png", AssetType.IMAGE);
		
		className.set ("assets/images/Fire.png", __ASSET__assets_images_fire_png);
		type.set ("assets/images/Fire.png", AssetType.IMAGE);
		
		className.set ("assets/images/fondoBienPete.png", __ASSET__assets_images_fondobienpete_png);
		type.set ("assets/images/fondoBienPete.png", AssetType.IMAGE);
		
		className.set ("assets/images/gameover.png", __ASSET__assets_images_gameover_png);
		type.set ("assets/images/gameover.png", AssetType.IMAGE);
		
		className.set ("assets/images/images-go-here.txt", __ASSET__assets_images_images_go_here_txt);
		type.set ("assets/images/images-go-here.txt", AssetType.TEXT);
		
		className.set ("assets/images/Menu.png", __ASSET__assets_images_menu_png);
		type.set ("assets/images/Menu.png", AssetType.IMAGE);
		
		className.set ("assets/images/metralleta.png", __ASSET__assets_images_metralleta_png);
		type.set ("assets/images/metralleta.png", AssetType.IMAGE);
		
		className.set ("assets/images/nada.png", __ASSET__assets_images_nada_png);
		type.set ("assets/images/nada.png", AssetType.IMAGE);
		
		className.set ("assets/images/Pirania.png", __ASSET__assets_images_pirania_png);
		type.set ("assets/images/Pirania.png", AssetType.IMAGE);
		
		className.set ("assets/images/pistola.png", __ASSET__assets_images_pistola_png);
		type.set ("assets/images/pistola.png", AssetType.IMAGE);
		
		className.set ("assets/images/skeleton.png", __ASSET__assets_images_skeleton_png);
		type.set ("assets/images/skeleton.png", AssetType.IMAGE);
		
		className.set ("assets/images/Stairs.png", __ASSET__assets_images_stairs_png);
		type.set ("assets/images/Stairs.png", AssetType.IMAGE);
		
		className.set ("assets/images/TilesPetes.png", __ASSET__assets_images_tilespetes_png);
		type.set ("assets/images/TilesPetes.png", AssetType.IMAGE);
		
		className.set ("assets/images/verySpookySkeleton.png", __ASSET__assets_images_veryspookyskeleton_png);
		type.set ("assets/images/verySpookySkeleton.png", AssetType.IMAGE);
		
		className.set ("assets/images/wheel.png", __ASSET__assets_images_wheel_png);
		type.set ("assets/images/wheel.png", AssetType.IMAGE);
		
		className.set ("assets/music/Spooky.ogg", __ASSET__assets_music_spooky_ogg);
		type.set ("assets/music/Spooky.ogg", AssetType.MUSIC);
		
		className.set ("assets/music/woah.wav", __ASSET__assets_music_woah_wav);
		type.set ("assets/music/woah.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/caja.ogg", __ASSET__assets_sounds_caja_ogg);
		type.set ("assets/sounds/caja.ogg", AssetType.SOUND);
		
		className.set ("assets/sounds/disparo.ogg", __ASSET__assets_sounds_disparo_ogg);
		type.set ("assets/sounds/disparo.ogg", AssetType.SOUND);
		
		className.set ("assets/sounds/Fuego.ogg", __ASSET__assets_sounds_fuego_ogg);
		type.set ("assets/sounds/Fuego.ogg", AssetType.MUSIC);
		
		className.set ("assets/sounds/Fuego.xmp", __ASSET__assets_sounds_fuego_xmp);
		type.set ("assets/sounds/Fuego.xmp", AssetType.TEXT);
		
		className.set ("assets/sounds/golpe.ogg", __ASSET__assets_sounds_golpe_ogg);
		type.set ("assets/sounds/golpe.ogg", AssetType.SOUND);
		
		className.set ("assets/sounds/huesos.ogg", __ASSET__assets_sounds_huesos_ogg);
		type.set ("assets/sounds/huesos.ogg", AssetType.SOUND);
		
		className.set ("assets/sounds/huesos.xmp", __ASSET__assets_sounds_huesos_xmp);
		type.set ("assets/sounds/huesos.xmp", AssetType.TEXT);
		
		className.set ("assets/sounds/murcielagos.ogg", __ASSET__assets_sounds_murcielagos_ogg);
		type.set ("assets/sounds/murcielagos.ogg", AssetType.SOUND);
		
		className.set ("assets/sounds/murcielagos.xmp", __ASSET__assets_sounds_murcielagos_xmp);
		type.set ("assets/sounds/murcielagos.xmp", AssetType.TEXT);
		
		className.set ("assets/sounds/quemadura.ogg", __ASSET__assets_sounds_quemadura_ogg);
		type.set ("assets/sounds/quemadura.ogg", AssetType.SOUND);
		
		className.set ("assets/sounds/quemadura.xmp", __ASSET__assets_sounds_quemadura_xmp);
		type.set ("assets/sounds/quemadura.xmp", AssetType.TEXT);
		
		className.set ("assets/sounds/sinBalas.ogg", __ASSET__assets_sounds_sinbalas_ogg);
		type.set ("assets/sounds/sinBalas.ogg", AssetType.SOUND);
		
		className.set ("assets/sounds/sounds-go-here.txt", __ASSET__assets_sounds_sounds_go_here_txt);
		type.set ("assets/sounds/sounds-go-here.txt", AssetType.TEXT);
		
		className.set ("flixel/sounds/beep.ogg", __ASSET__flixel_sounds_beep_ogg);
		type.set ("flixel/sounds/beep.ogg", AssetType.SOUND);
		
		className.set ("flixel/sounds/flixel.ogg", __ASSET__flixel_sounds_flixel_ogg);
		type.set ("flixel/sounds/flixel.ogg", AssetType.SOUND);
		
		className.set ("flixel/fonts/nokiafc22.ttf", __ASSET__flixel_fonts_nokiafc22_ttf);
		type.set ("flixel/fonts/nokiafc22.ttf", AssetType.FONT);
		
		className.set ("flixel/fonts/monsterrat.ttf", __ASSET__flixel_fonts_monsterrat_ttf);
		type.set ("flixel/fonts/monsterrat.ttf", AssetType.FONT);
		
		className.set ("flixel/images/ui/button.png", __ASSET__flixel_images_ui_button_png);
		type.set ("flixel/images/ui/button.png", AssetType.IMAGE);
		
		className.set ("flixel/images/logo/default.png", __ASSET__flixel_images_logo_default_png);
		type.set ("flixel/images/logo/default.png", AssetType.IMAGE);
		
		
		if (useManifest) {
			
			loadManifest ();
			
			if (Sys.args ().indexOf ("-livereload") > -1) {
				
				var path = FileSystem.fullPath ("manifest");
				lastModified = FileSystem.stat (path).mtime.getTime ();
				
				timer = new Timer (2000);
				timer.run = function () {
					
					var modified = FileSystem.stat (path).mtime.getTime ();
					
					if (modified > lastModified) {
						
						lastModified = modified;
						loadManifest ();
						
						onChange.dispatch ();
						
					}
					
				}
				
			}
			
		}
		
		#else
		
		loadManifest ();
		
		#end
		#end
		
	}
	
	
	public override function exists (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var assetType = this.type.get (id);
		
		if (assetType != null) {
			
			if (assetType == requestedType || ((requestedType == SOUND || requestedType == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			#if flash
			
			if (requestedType == BINARY && (assetType == BINARY || assetType == TEXT || assetType == IMAGE)) {
				
				return true;
				
			} else if (requestedType == TEXT && assetType == BINARY) {
				
				return true;
				
			} else if (requestedType == null || path.exists (id)) {
				
				return true;
				
			}
			
			#else
			
			if (requestedType == BINARY || requestedType == null || (assetType == BINARY && requestedType == TEXT)) {
				
				return true;
				
			}
			
			#end
			
		}
		
		return false;
		
	}
	
	
	public override function getAudioBuffer (id:String):AudioBuffer {
		
		#if flash
		
		var buffer = new AudioBuffer ();
		buffer.src = cast (Type.createInstance (className.get (id), []), Sound);
		return buffer;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		if (className.exists(id)) return AudioBuffer.fromBytes (cast (Type.createInstance (className.get (id), []), Bytes));
		else return AudioBuffer.fromFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getBytes (id:String):Bytes {
		
		#if flash
		
		switch (type.get (id)) {
			
			case TEXT, BINARY:
				
				return Bytes.ofData (cast (Type.createInstance (className.get (id), []), flash.utils.ByteArray));
			
			case IMAGE:
				
				var bitmapData = cast (Type.createInstance (className.get (id), []), BitmapData);
				return Bytes.ofData (bitmapData.getPixels (bitmapData.rect));
			
			default:
				
				return null;
			
		}
		
		return cast (Type.createInstance (className.get (id), []), Bytes);
		
		#elseif html5
		
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var bytes = loader.bytes;
		
		if (bytes != null) {
			
			return bytes;
			
		} else {
			
			return null;
		}
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Bytes);
		else return Bytes.readFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getFont (id:String):Font {
		
		#if flash
		
		var src = Type.createInstance (className.get (id), []);
		
		var font = new Font (src.fontName);
		font.src = src;
		return font;
		
		#elseif html5
		
		return cast (Type.createInstance (className.get (id), []), Font);
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Font);
			
		} else {
			
			return Font.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	public override function getImage (id:String):Image {
		
		#if flash
		
		return Image.fromBitmapData (cast (Type.createInstance (className.get (id), []), BitmapData));
		
		#elseif html5
		
		return Image.fromImageElement (Preloader.images.get (path.get (id)));
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Image);
			
		} else {
			
			return Image.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	/*public override function getMusic (id:String):Dynamic {
		
		#if flash
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif openfl_html5
		
		//var sound = new Sound ();
		//sound.__buffer = true;
		//sound.load (new URLRequest (path.get (id)));
		//return sound;
		return null;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return null;
		//if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		//else return new Sound (new URLRequest (path.get (id)), null, true);
		
		#end
		
	}*/
	
	
	public override function getPath (id:String):String {
		
		//#if ios
		
		//return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		//#else
		
		return path.get (id);
		
		//#end
		
	}
	
	
	public override function getText (id:String):String {
		
		#if html5
		
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var bytes = loader.bytes;
		
		if (bytes != null) {
			
			return bytes.getString (0, bytes.length);
			
		} else {
			
			return null;
		}
		
		#else
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.getString (0, bytes.length);
			
		}
		
		#end
		
	}
	
	
	public override function isLocal (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		
		#if flash
		
		//if (requestedType != AssetType.MUSIC && requestedType != AssetType.SOUND) {
			
			return className.exists (id);
			
		//}
		
		#end
		
		return true;
		
	}
	
	
	public override function list (type:String):Array<String> {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var items = [];
		
		for (id in this.type.keys ()) {
			
			if (requestedType == null || exists (id, type)) {
				
				items.push (id);
				
			}
			
		}
		
		return items;
		
	}
	
	
	public override function loadAudioBuffer (id:String):Future<AudioBuffer> {
		
		var promise = new Promise<AudioBuffer> ();
		
		#if (flash)
		
		if (path.exists (id)) {
			
			var soundLoader = new Sound ();
			soundLoader.addEventListener (Event.COMPLETE, function (event) {
				
				var audioBuffer:AudioBuffer = new AudioBuffer();
				audioBuffer.src = event.currentTarget;
				promise.complete (audioBuffer);
				
			});
			soundLoader.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			soundLoader.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			soundLoader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getAudioBuffer (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<AudioBuffer> (function () return getAudioBuffer (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	public override function loadBytes (id:String):Future<Bytes> {
		
		var promise = new Promise<Bytes> ();
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.dataFormat = flash.net.URLLoaderDataFormat.BINARY;
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bytes = Bytes.ofData (event.currentTarget.data);
				promise.complete (bytes);
				
			});
			loader.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			loader.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getBytes (id));
			
		}
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var request = new HTTPRequest ();
			promise.completeWith (request.load (path.get (id) + "?" + Assets.cache.version));
			
		} else {
			
			promise.complete (getBytes (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<Bytes> (function () return getBytes (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	public override function loadImage (id:String):Future<Image> {
		
		var promise = new Promise<Image> ();
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bitmapData = cast (event.currentTarget.content, Bitmap).bitmapData;
				promise.complete (Image.fromBitmapData (bitmapData));
				
			});
			loader.contentLoaderInfo.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			loader.contentLoaderInfo.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getImage (id));
			
		}
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var image = new js.html.Image ();
			image.onload = function (_):Void {
				
				promise.complete (Image.fromImageElement (image));
				
			}
			image.onerror = promise.error;
			image.src = path.get (id) + "?" + Assets.cache.version;
			
		} else {
			
			promise.complete (getImage (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<Image> (function () return getImage (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	#if (!flash && !html5)
	private function loadManifest ():Void {
		
		try {
			
			#if blackberry
			var bytes = Bytes.readFile ("app/native/manifest");
			#elseif tizen
			var bytes = Bytes.readFile ("../res/manifest");
			#elseif emscripten
			var bytes = Bytes.readFile ("assets/manifest");
			#elseif (mac && java)
			var bytes = Bytes.readFile ("../Resources/manifest");
			#elseif (ios || tvos)
			var bytes = Bytes.readFile ("assets/manifest");
			#else
			var bytes = Bytes.readFile ("manifest");
			#end
			
			if (bytes != null) {
				
				if (bytes.length > 0) {
					
					var data = bytes.getString (0, bytes.length);
					
					if (data != null && data.length > 0) {
						
						var manifest:Array<Dynamic> = Unserializer.run (data);
						
						for (asset in manifest) {
							
							if (!className.exists (asset.id)) {
								
								#if (ios || tvos)
								path.set (asset.id, "assets/" + asset.path);
								#else
								path.set (asset.id, asset.path);
								#end
								type.set (asset.id, cast (asset.type, AssetType));
								
							}
							
						}
						
					}
					
				}
				
			} else {
				
				trace ("Warning: Could not load asset manifest (bytes was null)");
				
			}
		
		} catch (e:Dynamic) {
			
			trace ('Warning: Could not load asset manifest (${e})');
			
		}
		
	}
	#end
	
	
	public override function loadText (id:String):Future<String> {
		
		var promise = new Promise<String> ();
		
		#if html5
		
		if (path.exists (id)) {
			
			var request = new HTTPRequest ();
			var future = request.load (path.get (id) + "?" + Assets.cache.version);
			future.onProgress (function (progress) promise.progress (progress));
			future.onError (function (msg) promise.error (msg));
			future.onComplete (function (bytes) promise.complete (bytes.getString (0, bytes.length)));
			
		} else {
			
			promise.complete (getText (id));
			
		}
		
		#else
		
		promise.completeWith (loadBytes (id).then (function (bytes) {
			
			return new Future<String> (function () {
				
				if (bytes == null) {
					
					return null;
					
				} else {
					
					return bytes.getString (0, bytes.length);
					
				}
				
			});
			
		}));
		
		#end
		
		return promise.future;
		
	}
	
	
}


#if !display
#if flash

@:keep @:bind #if display private #end class __ASSET__assets_data_levelv3_oel extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_data_newtileset_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_data_obstaculos_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_data_tilesc_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_data_woahlevel_oep extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_atacc_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_balas_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_bat_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_bloquer_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_c_damage_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_cfullclone_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_chikologo_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_clone_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_ctileset_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_cura_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_escopeta_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_fire_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_fondobienpete_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_gameover_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_images_go_here_txt extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_menu_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_metralleta_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_nada_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_pirania_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_pistola_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_skeleton_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_stairs_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_tilespetes_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_veryspookyskeleton_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_wheel_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_music_spooky_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_music_woah_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_caja_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_disparo_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_fuego_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_fuego_xmp extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_golpe_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_huesos_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_huesos_xmp extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_murcielagos_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_murcielagos_xmp extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_quemadura_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_quemadura_xmp extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_sinbalas_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_sounds_beep_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_images_ui_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_images_logo_default_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }


#elseif html5
















































@:keep #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { super (); name = "Nokia Cellphone FC Small"; } } 
@:keep #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font { public function new () { super (); name = "Monsterrat"; } } 




#else



#if (windows || mac || linux || cpp)


@:file("assets/data/levelv3.oel") #if display private #end class __ASSET__assets_data_levelv3_oel extends lime.utils.Bytes {}
@:image("assets/data/NewTileset.png") #if display private #end class __ASSET__assets_data_newtileset_png extends lime.graphics.Image {}
@:image("assets/data/ObstaCulos.png") #if display private #end class __ASSET__assets_data_obstaculos_png extends lime.graphics.Image {}
@:image("assets/data/tilesC.png") #if display private #end class __ASSET__assets_data_tilesc_png extends lime.graphics.Image {}
@:file("assets/data/woahLevel.oep") #if display private #end class __ASSET__assets_data_woahlevel_oep extends lime.utils.Bytes {}
@:image("assets/images/atacc.png") #if display private #end class __ASSET__assets_images_atacc_png extends lime.graphics.Image {}
@:image("assets/images/balas.png") #if display private #end class __ASSET__assets_images_balas_png extends lime.graphics.Image {}
@:image("assets/images/bat.png") #if display private #end class __ASSET__assets_images_bat_png extends lime.graphics.Image {}
@:image("assets/images/bloqueR.png") #if display private #end class __ASSET__assets_images_bloquer_png extends lime.graphics.Image {}
@:image("assets/images/C Damage.png") #if display private #end class __ASSET__assets_images_c_damage_png extends lime.graphics.Image {}
@:image("assets/images/CFULLclone.png") #if display private #end class __ASSET__assets_images_cfullclone_png extends lime.graphics.Image {}
@:image("assets/images/Chikologo.png") #if display private #end class __ASSET__assets_images_chikologo_png extends lime.graphics.Image {}
@:image("assets/images/clone.png") #if display private #end class __ASSET__assets_images_clone_png extends lime.graphics.Image {}
@:image("assets/images/CTileset.png") #if display private #end class __ASSET__assets_images_ctileset_png extends lime.graphics.Image {}
@:image("assets/images/cura.png") #if display private #end class __ASSET__assets_images_cura_png extends lime.graphics.Image {}
@:image("assets/images/escopeta.png") #if display private #end class __ASSET__assets_images_escopeta_png extends lime.graphics.Image {}
@:image("assets/images/Fire.png") #if display private #end class __ASSET__assets_images_fire_png extends lime.graphics.Image {}
@:image("assets/images/fondoBienPete.png") #if display private #end class __ASSET__assets_images_fondobienpete_png extends lime.graphics.Image {}
@:image("assets/images/gameover.png") #if display private #end class __ASSET__assets_images_gameover_png extends lime.graphics.Image {}
@:file("assets/images/images-go-here.txt") #if display private #end class __ASSET__assets_images_images_go_here_txt extends lime.utils.Bytes {}
@:image("assets/images/Menu.png") #if display private #end class __ASSET__assets_images_menu_png extends lime.graphics.Image {}
@:image("assets/images/metralleta.png") #if display private #end class __ASSET__assets_images_metralleta_png extends lime.graphics.Image {}
@:image("assets/images/nada.png") #if display private #end class __ASSET__assets_images_nada_png extends lime.graphics.Image {}
@:image("assets/images/Pirania.png") #if display private #end class __ASSET__assets_images_pirania_png extends lime.graphics.Image {}
@:image("assets/images/pistola.png") #if display private #end class __ASSET__assets_images_pistola_png extends lime.graphics.Image {}
@:image("assets/images/skeleton.png") #if display private #end class __ASSET__assets_images_skeleton_png extends lime.graphics.Image {}
@:image("assets/images/Stairs.png") #if display private #end class __ASSET__assets_images_stairs_png extends lime.graphics.Image {}
@:image("assets/images/TilesPetes.png") #if display private #end class __ASSET__assets_images_tilespetes_png extends lime.graphics.Image {}
@:image("assets/images/verySpookySkeleton.png") #if display private #end class __ASSET__assets_images_veryspookyskeleton_png extends lime.graphics.Image {}
@:image("assets/images/wheel.png") #if display private #end class __ASSET__assets_images_wheel_png extends lime.graphics.Image {}
@:file("assets/music/Spooky.ogg") #if display private #end class __ASSET__assets_music_spooky_ogg extends lime.utils.Bytes {}
@:file("assets/music/woah.wav") #if display private #end class __ASSET__assets_music_woah_wav extends lime.utils.Bytes {}
@:file("assets/sounds/caja.ogg") #if display private #end class __ASSET__assets_sounds_caja_ogg extends lime.utils.Bytes {}
@:file("assets/sounds/disparo.ogg") #if display private #end class __ASSET__assets_sounds_disparo_ogg extends lime.utils.Bytes {}
@:file("assets/sounds/Fuego.ogg") #if display private #end class __ASSET__assets_sounds_fuego_ogg extends lime.utils.Bytes {}
@:file("assets/sounds/Fuego.xmp") #if display private #end class __ASSET__assets_sounds_fuego_xmp extends lime.utils.Bytes {}
@:file("assets/sounds/golpe.ogg") #if display private #end class __ASSET__assets_sounds_golpe_ogg extends lime.utils.Bytes {}
@:file("assets/sounds/huesos.ogg") #if display private #end class __ASSET__assets_sounds_huesos_ogg extends lime.utils.Bytes {}
@:file("assets/sounds/huesos.xmp") #if display private #end class __ASSET__assets_sounds_huesos_xmp extends lime.utils.Bytes {}
@:file("assets/sounds/murcielagos.ogg") #if display private #end class __ASSET__assets_sounds_murcielagos_ogg extends lime.utils.Bytes {}
@:file("assets/sounds/murcielagos.xmp") #if display private #end class __ASSET__assets_sounds_murcielagos_xmp extends lime.utils.Bytes {}
@:file("assets/sounds/quemadura.ogg") #if display private #end class __ASSET__assets_sounds_quemadura_ogg extends lime.utils.Bytes {}
@:file("assets/sounds/quemadura.xmp") #if display private #end class __ASSET__assets_sounds_quemadura_xmp extends lime.utils.Bytes {}
@:file("assets/sounds/sinBalas.ogg") #if display private #end class __ASSET__assets_sounds_sinbalas_ogg extends lime.utils.Bytes {}
@:file("assets/sounds/sounds-go-here.txt") #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends lime.utils.Bytes {}
@:file("C:/HaxeToolkit/haxe/lib/flixel/4,3,0/assets/sounds/beep.ogg") #if display private #end class __ASSET__flixel_sounds_beep_ogg extends lime.utils.Bytes {}
@:file("C:/HaxeToolkit/haxe/lib/flixel/4,3,0/assets/sounds/flixel.ogg") #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends lime.utils.Bytes {}
@:font("C:/HaxeToolkit/haxe/lib/flixel/4,3,0/assets/fonts/nokiafc22.ttf") #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font {}
@:font("C:/HaxeToolkit/haxe/lib/flixel/4,3,0/assets/fonts/monsterrat.ttf") #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font {}
@:image("C:/HaxeToolkit/haxe/lib/flixel/4,3,0/assets/images/ui/button.png") #if display private #end class __ASSET__flixel_images_ui_button_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel/4,3,0/assets/images/logo/default.png") #if display private #end class __ASSET__flixel_images_logo_default_png extends lime.graphics.Image {}



#end
#end

#if (openfl && !flash)
@:keep #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__flixel_fonts_nokiafc22_ttf (); src = font.src; name = font.name; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__flixel_fonts_monsterrat_ttf (); src = font.src; name = font.name; super (); }}

#end

#end