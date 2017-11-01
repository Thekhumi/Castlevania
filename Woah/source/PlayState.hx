package;

import entities.EnemySkeleton;
import entities.Player;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.tile.FlxTilemap;
import flixel.FlxObject;

class PlayState extends FlxState

{
	private var player:Player;
	private var enemy:EnemySkeleton;
	private var plati:FlxSprite;
	private var tilemap:FlxTilemap;
	private var interfaz:Interfaz;
	override public function create():Void
	{
		super.create();
		
		FlxG.mouse.visible = false;
		FlxG.camera.bgColor = 0xFF000000;
		
		var loader:FlxOgmoLoader = new FlxOgmoLoader(AssetPaths.WoahLevel__oel);
		tilemap = loader.loadTilemap(AssetPaths.TilesPetes__png, 32, 32, "NewLayer0"); 
		tilemap.setTileProperties(0, FlxObject.NONE);
		tilemap.setTileProperties(1, FlxObject.ANY);
		tilemap.setTileProperties(2, FlxObject.NONE);
		tilemap.setTileProperties(3, FlxObject.ANY);
		
		player = new Player(0, 0);
		enemy = new EnemySkeleton(400, 0, player);
		
		
		add(tilemap);
		add(player);
		add(enemy);
		interfaz = new Interfaz(player, this);
		add(interfaz);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		FlxG.collide(player, tilemap);
		FlxG.collide(enemy, tilemap);
		if (FlxG.keys.pressed.LEFT) 
		{
			FlxG.camera.scroll.x -= 10;
		}
		if (FlxG.keys.pressed.RIGHT) 
		{
			FlxG.camera.scroll.x+= 10;
		}
		if (FlxG.keys.pressed.UP) 
		{
			FlxG.camera.scroll.y -= 10;
		}
		if (FlxG.keys.pressed.DOWN) 
		{
			FlxG.camera.scroll.y+= 10;
		}
		
		if (FlxG.overlap(player, enemy))
		{
			player.recibirDanio(enemy.danio,enemy.x);
		}
		
		
	}
}