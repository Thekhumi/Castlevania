package;

import entities.EnemySkeleton;
import entities.Player;
import entities.WoahHitbox;
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
	private var hit:WoahHitbox;
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
		FlxG.worldBounds.set(0, 0, 5120, 1200);
		
		player = new Player(0, 0);
		player.width = 32;
		player.height = 64;
		player.offset.x = 28;
		player.offset.y = -7;
		
		hit = new WoahHitbox(player.x + 10, player.y + 10);
		
		enemy = new EnemySkeleton(400, 0, player);
		enemy.width = 30;
		enemy.height = 56;
		enemy.offset.x = 0;
		enemy.offset.y = -7;
		
		add(tilemap);
		add(player);
		add(enemy);
		interfaz = new Interfaz(player, this);
		add(interfaz);
		
		FlxG.camera.follow(player);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		FlxG.collide(player, tilemap);
		FlxG.collide(enemy, tilemap);
		
		if (FlxG.overlap(player, enemy))
		{
			player.recibirDanio(enemy.danio, enemy.x);
			enemy.kill();
		}
	}
}