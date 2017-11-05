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
	private var tileBase:FlxTilemap;
	private var escalera:FlxTilemap;
	private var cinta:FlxTilemap;
	private var bloquer:FlxTilemap;
	private var fuego:FlxTilemap;
	private var interfaz:Interfaz;
	private var hit:WoahHitbox;
	override public function create():Void
	{
		super.create();
		
		FlxG.mouse.visible = false;
		FlxG.camera.bgColor = 0xFF000000;
		
		var loader:FlxOgmoLoader = new FlxOgmoLoader(AssetPaths.levelv3__oel);
		tileBase = loader.loadTilemap(AssetPaths.tilesC__png, 32, 32, "TilesetBase"); 
		tileBase.setTileProperties(0, FlxObject.NONE);	//NADA
		tileBase.setTileProperties(1, FlxObject.ANY);	//SUELO
		tileBase.setTileProperties(2, FlxObject.NONE);	//RELLENO
		tileBase.setTileProperties(4, FlxObject.NONE);	//AGUA
		tileBase.scale.set(1.5, 1.5);
		escalera = loader.loadTilemap(AssetPaths.tilesC__png, 32, 32, "Escaleras"); 
		escalera.setTileProperties(0, FlxObject.NONE);	//NADA
		escalera.setTileProperties(3, FlxObject.UP);	//ESCALERAS
		escalera.scale.set(1.5, 1.5);
		cinta = loader.loadTilemap(AssetPaths.tilesC__png, 32, 32, "Cinta"); 
		cinta.setTileProperties(0, FlxObject.NONE);	//NADA
		cinta.setTileProperties(6, FlxObject.ANY);	//CINTA
		cinta.scale.set(1.5, 1.5);
		bloquer = loader.loadTilemap(AssetPaths.tilesC__png, 32, 32, "BloqueR");
		bloquer.setTileProperties(0, FlxObject.NONE);	//NADA
		bloquer.setTileProperties(7, FlxObject.ANY);	//BLOQUE RANDOM
		bloquer.scale.set(1.5, 1.5);
		fuego = loader.loadTilemap(AssetPaths.tilesC__png, 32, 32, "Fuego"); 
		fuego.setTileProperties(0, FlxObject.NONE);	//NADA
		fuego.setTileProperties(8, FlxObject.ANY);	//FUEGO
		fuego.scale.set(1.5, 1.5);
		FlxG.worldBounds.set(0, 0, 7680, 2250);
		
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
		
		add(tileBase);
		add(escalera);
		add(cinta);
		add(bloquer);
		add(fuego);
		
		add(player);
		add(enemy);
		interfaz = new Interfaz(player, this);
		add(interfaz);
		
		FlxG.camera.follow(player);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		FlxG.collide(player, tileBase);
		FlxG.collide(player, escalera);
		if (FlxG.collide(player, cinta))
		{
			player.x += 5;
		}
		if (FlxG.collide(player, fuego))
		{
			player.fueguin();
			player.x -= 5;
			player.y -= 5;
		}
		FlxG.collide(enemy, tileBase);
		player.acceleration.y = Reg.gravedad;
		player.acceleration.x = 0;
		
		if (FlxG.overlap(player, enemy) && player.actionState== Estados.ATTACK)
		{
			enemy.kill();
		}
		if (FlxG.overlap(player, enemy))
		{
			player.recibirDanio(enemy.danio, enemy.x);
			enemy.kill();
		}
		if (FlxG.overlap(player, escalera) && FlxG.keys.pressed.UP)
		{
			player.trepar();
		}
		if (player.actionState == Estados.ATTACK)//HITBOX DONT WORKS
		{
			if (player.animation.name == "atacc" && player.animation.curAnim.curFrame == 5)
			{
				player.width = 80;
				player.height = 64;
				player.offset.x = 28;
				player.offset.y = -7;
			}
			if (player.animation.name == "atacc" && player.animation.curAnim.curFrame == 7)
			{
				player.width = 100;
				player.height = 64;
				player.offset.x = 28;
				player.offset.y = -7;
			}
		}
		if (player.actionState == Estados.IDLE)//HITBOX UPDATE
		{
			player.width = 32;
			player.height = 64;
			player.offset.x = 28;
			player.offset.y = -7;
		}
	}
}