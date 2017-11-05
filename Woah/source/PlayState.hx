package;

import entities.enemies.Bats;
import entities.enemies.Enemy;
import entities.enemies.EnemySkeleton;
import entities.Player;
import tiles.Escaleras;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.FlxG;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.tile.FlxTilemap;
import flixel.FlxObject;

class PlayState extends FlxState

{
	private var player:Player;
	private var enemy:EnemySkeleton;
	private var guia:FlxSprite;
	private var tileBase:FlxTilemap;
	private var escalera:FlxTilemap;
	private var cinta:FlxTilemap;
	private var bloquer:FlxTilemap;
	private var fuego:FlxTilemap;
	private var interfaz:Interfaz;
	private var escaleritas:FlxTypedGroup<Escaleras>;
	private var enemyGroup:FlxTypedGroup<Enemy>;
	override public function create():Void
	{
		super.create();
		
		FlxG.mouse.visible = false;
		FlxG.camera.bgColor = 0xFF000000;
		
		guia = new FlxSprite(0, 0);
		guia.makeGraphic(256, 240);
		guia.color = 0xFF000000;
		
		escaleritas = new FlxTypedGroup<Escaleras>();
		enemyGroup = new FlxTypedGroup<Enemy>();
		
		var loader:FlxOgmoLoader = new FlxOgmoLoader(AssetPaths.levelv3__oel);
		tileBase = loader.loadTilemap(AssetPaths.tilesC__png, 32, 32, "TilesetBase"); 
		tileBase.setTileProperties(0, FlxObject.NONE);	//NADA
		tileBase.setTileProperties(1, FlxObject.ANY);	//SUELO
		tileBase.setTileProperties(2, FlxObject.ANY);	//RELLENO
		tileBase.setTileProperties(4, FlxObject.NONE);	//AGUA
		escalera = loader.loadTilemap(AssetPaths.tilesC__png, 32, 32, "Escaleras"); 
		escalera.setTileProperties(0, FlxObject.NONE);	//NADA
		escalera.setTileProperties(3, FlxObject.UP);	//ESCALERAS
		cinta = loader.loadTilemap(AssetPaths.tilesC__png, 32, 32, "Cinta"); 
		cinta.setTileProperties(0, FlxObject.NONE);	//NADA
		cinta.setTileProperties(6, FlxObject.ANY);	//CINTA
		bloquer = loader.loadTilemap(AssetPaths.tilesC__png, 32, 32, "BloqueR");
		bloquer.setTileProperties(0, FlxObject.NONE);	//NADA
		bloquer.setTileProperties(7, FlxObject.ANY);	//BLOQUE RANDOM
		fuego = loader.loadTilemap(AssetPaths.tilesC__png, 32, 32, "Fuego"); 
		fuego.setTileProperties(0, FlxObject.NONE);	//NADA
		fuego.setTileProperties(8, FlxObject.ANY);	//FUEGO
		FlxG.worldBounds.set(0, 0, 7680, 2250);
		
		loader.loadEntities(stairs, "Climb");
		loader.loadEntities(enemy2Creator, "Murcielago");
		
		player = new Player(0, 0);
		
		enemy = new EnemySkeleton(400, 0, player);
		enemy.width = 16;
		enemy.height = 32;
		enemy.offset.x = 8;
		enemy.offset.y = 6;
		
		add(guia);
		add(tileBase);
		add(escaleritas);
		add(escalera);
		add(cinta);
		add(bloquer);
		add(fuego);
		
		add(player);
		add(enemy);
		add(enemyGroup);
		interfaz = new Interfaz(player, this);
		add(interfaz);
		
		FlxG.camera.follow(guia);
	}
	
	private function stairs (entityName:String, entityData: Xml) //ESCALERAS
	{
		var x:Int = Std.parseInt(entityData.get("x"));
		var y:Int = Std.parseInt(entityData.get("y"));
		var st:Escaleras = new Escaleras();
		st.x = x+8;
		st.y = y-12;
		escaleritas.add(st);
	}
	private function enemy2Creator(entityName:String, entityData:Xml)//MURCIELAGOS
	{
		var x:Int = Std.parseInt(entityData.get("x"));
		var y:Int = Std.parseInt(entityData.get("y"));
		var bat:Bats = new Bats();
		bat.x = x;
		bat.y = y;	
		enemyGroup.add(bat);		
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		guia.x = player.x - 115;//guia camara
		guia.y = player.y - 230;//guia camara
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
		FlxG.collide(enemyGroup, tileBase);
		player.acceleration.y = Reg.gravedad;
		player.acceleration.x = 0;
		
		if (FlxG.overlap(player, enemy) && player.actionState== Estados.ATTACK)
		{
			enemy.kill();
		}
		if (FlxG.overlap(player, enemy))
		{
			player.recibirDanio(enemy.danio, enemy.x);
			
		}
		if (FlxG.overlap(player, escaleritas) && (FlxG.keys.pressed.UP||FlxG.keys.pressed.DOWN))
		{
			player.trepar();
		}
		if (player.actionState == Estados.ATTACK)//HITBOX DONT WORKS
		{
			if (player.animation.name == "atacc" && player.animation.curAnim.curFrame == 5)
			{
				player.width = 40;
				player.height = 32;
				player.offset.x = 36;
				player.offset.y = 6;
			}
			if (player.animation.name == "atacc" && player.animation.curAnim.curFrame == 7)
			{
				player.width = 60;
				player.height = 32;
				player.offset.x = 36;
				player.offset.y = 6;
			}
		}
		if (player.actionState == Estados.IDLE)//HITBOX UPDATE
		{
			player.width = 16;
			player.height = 32;
			player.offset.x = 36;
			player.offset.y = 6;
		}
	}
}