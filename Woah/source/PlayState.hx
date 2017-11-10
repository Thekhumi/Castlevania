package;

import entities.Caja;
import entities.enemies.Bats;
import entities.enemies.Boss;
import entities.enemies.Enemy;
import entities.enemies.EnemySkeleton;
import entities.enemies.EnemySkeletonShield;
import entities.enemies.Fire;
import entities.enemies.Pirania;
import entities.Player;
import tiles.Cinta;
import tiles.Escaleras;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.FlxG;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.tile.FlxTilemap;
import flixel.FlxObject;
import tiles.RandomFloor;
import entities.Disparo;
import tiles.Water;

class PlayState extends FlxState

{
	private var player:Player;
	private var enemy:EnemySkeletonShield;
	private var guia:FlxSprite;
	private var tileBase:FlxTilemap;
	private var escalera:FlxTilemap;
	private var cinta:FlxTilemap;
	private var bloquer:FlxTilemap;
	private var fuego:FlxTilemap;
	private var interfaz:Interfaz;
	private var escaleritas:FlxTypedGroup<Escaleras>;
	private var enemyGroup:FlxTypedGroup<Enemy>;
	private var randomFloor:FlxTypedGroup<RandomFloor>;
	private var cintita:FlxTypedGroup<Cinta>;
	private var caja:Caja;
	private var fondo:FlxSprite;
	private var fueguito:FlxTypedGroup<Fire>;
	private var cajitas:FlxTypedGroup<Caja>;
	private var watery:FlxTypedGroup<Water>;
	private var posicionGuia:Int;
	private var limiteGuia:Int;
	private var boss:Boss;
	override public function create():Void
	{
		super.create();
		
		FlxG.mouse.visible = false;
		FlxG.camera.bgColor = 0xFF000000;
		fondo = new FlxSprite(0, 0, AssetPaths.fondoBienPete__png);
		
		guia = new FlxSprite(0, 0);
		guia.makeGraphic(256, 240);
		guia.color = 0xFF000000;
		
		escaleritas = new FlxTypedGroup<Escaleras>();
		watery = new FlxTypedGroup<Water>();
		randomFloor = new FlxTypedGroup<RandomFloor>();
		cintita = new FlxTypedGroup<Cinta>();
		fueguito = new FlxTypedGroup<Fire>();
		cajitas = new FlxTypedGroup<Caja>();
		enemyGroup = new FlxTypedGroup<Enemy>();
		
		var loader:FlxOgmoLoader = new FlxOgmoLoader(AssetPaths.levelv2__oel);
		tileBase = loader.loadTilemap(AssetPaths.tilesetbase__png, 32, 32, "TilesetBase"); 
		tileBase.setTileProperties(0, FlxObject.NONE);	//NADA
		tileBase.setTileProperties(1, FlxObject.ANY);	//SUELO
		tileBase.setTileProperties(2, FlxObject.ANY);	//RELLENO
		tileBase.setTileProperties(3, FlxObject.ANY);	//SUELO2
		tileBase.setTileProperties(4, FlxObject.NONE);	//AGUA
		tileBase.setTileProperties(5, FlxObject.ANY);	//SUELO3
		escalera = loader.loadTilemap(AssetPaths.Stairs__png, 32, 32, "Escaleras"); 
		escalera.setTileProperties(3, FlxObject.NONE);	//ESCALERAS
		cinta = loader.loadTilemap(AssetPaths.tilesC__png, 32, 32, "Cinta"); 
		cinta.setTileProperties(0, FlxObject.NONE);	//NADA
		cinta.setTileProperties(6, FlxObject.ANY);	//CINTA
		bloquer = loader.loadTilemap(AssetPaths.tilesC__png, 32, 32, "BloqueR");
		bloquer.setTileProperties(0, FlxObject.NONE);	//NADA
		bloquer.setTileProperties(7, FlxObject.ANY);	//BLOQUE RANDOM
		bloquer.y += 32;
		fuego = loader.loadTilemap(AssetPaths.tilesC__png, 32, 32, "Fuego"); 
		fuego.setTileProperties(0, FlxObject.NONE);	//NADA
		fuego.setTileProperties(8, FlxObject.ANY);	//FUEGO
		FlxG.worldBounds.set(0, 0, 7680, 2250);
		
		FlxG.camera.setScrollBounds(0, tileBase.width, 0, tileBase.height);
		player = new Player(69, 98, this);
		
		loader.loadEntities(stairs, "Climb");
		loader.loadEntities(Disap, "Disap");
		loader.loadEntities(Wheel, "Slide");
		loader.loadEntities(Faiah, "Fire");
		loader.loadEntities(Boxes, "Caja");
		loader.loadEntities(Agoa, "Watery");
		loader.loadEntities(enemy2Creator, "Murcielago");
		loader.loadEntities(enemy1Creator, "Esqueleto");
		loader.loadEntities(enemy3Creator, "BadFish");
		loader.loadEntities(enemy4Creator, "EsqueleShield");
		
		Disparo.setEnemigo(enemyGroup);
		Disparo.setTerreno(tileBase);
		
		enemy = new EnemySkeletonShield(400, 0, player,this);
		enemy.width = 16;
		enemy.height = 32;
		enemy.offset.x = 8;
		enemy.offset.y = 6;
		
		boss = new Boss(4480, 864);
		//caja = new Caja(100, 0, player, this);
		
		add(escaleritas);
		add(guia);
		add(fondo);
		add(tileBase);
		add(escalera);
		add(cintita);
		add(randomFloor);
		add(fueguito);
		add(cajitas);
		add(watery);
		
		add(player.woahHit);
		add(player);
		add(enemy);
		//add(caja);
		add(enemyGroup);
		add(boss);
		add(boss.beam);
		interfaz = new Interfaz(player, this);
		posicionGuia = 100;
		limiteGuia = 100;
		add(interfaz);
		
		FlxG.camera.follow(guia);
		FlxG.sound.playMusic(AssetPaths.Spooky__ogg,0.075,true);
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
	private function Agoa (entityName:String, entityData: Xml) //agua
	{
		var x:Int = Std.parseInt(entityData.get("x"));
		var y:Int = Std.parseInt(entityData.get("y"));
		var wat:Water = new Water();
		wat.x = x+8;
		wat.y = y-12;
		watery.add(wat);
	}
	private function Disap (entityName:String, entityData: Xml) //PISO RANDOM
	{
		var x:Int = Std.parseInt(entityData.get("x"));
		var y:Int = Std.parseInt(entityData.get("y"));
		var flo:RandomFloor = new RandomFloor();
		flo.x = x;
		flo.y = y;
		randomFloor.add(flo);
	}
	private function Wheel (entityName:String, entityData: Xml)//TRONCO
	{
		var x:Int = Std.parseInt(entityData.get("x"));
		var y:Int = Std.parseInt(entityData.get("y"));
		var log:Cinta = new Cinta();
		log.x = x;
		log.y = y;
		cintita.add(log);
	}
		private function Faiah (entityName:String, entityData: Xml)//Fuego
	{
		var x:Int = Std.parseInt(entityData.get("x"));
		var y:Int = Std.parseInt(entityData.get("y"));
		var fir:Fire = new Fire();
		fir.x = x;
		fir.y = y;
		fueguito.add(fir);
	}
	private function Boxes (entityName:String, entityData: Xml)//CAJAS
	{
		var x:Int = Std.parseInt(entityData.get("x"));
		var y:Int = Std.parseInt(entityData.get("y"));
		var box:Caja = new Caja(x,y,"",player, this);
		cajitas.add(box);
	}
	private function enemy1Creator(entityName:String, entityData:Xml)//ESQUELETOS
	{
		var x:Int = Std.parseInt(entityData.get("x"));
		var y:Int = Std.parseInt(entityData.get("y"));
		var esq:EnemySkeleton = new EnemySkeleton(x,y-32,player, this);
		enemyGroup.add(esq);		
	}
	
	private function enemy2Creator(entityName:String, entityData:Xml)//MURCIELAGOS
	{
		var x:Int = Std.parseInt(entityData.get("x"));
		var y:Int = Std.parseInt(entityData.get("y"));
		var bat:Bats = new Bats(x,y,player,this);
		enemyGroup.add(bat);		
	}
		private function enemy3Creator(entityName:String, entityData:Xml)//PIRANIAS
	{
		var x:Int = Std.parseInt(entityData.get("x"));
		var y:Int = Std.parseInt(entityData.get("y"));
		var pir:Pirania = new Pirania(x,y,player,this);
		enemyGroup.add(pir);		
	}
		private function enemy4Creator(entityName:String, entityData:Xml)//ESQUELETOSESCUDO
	{
		var x:Int = Std.parseInt(entityData.get("x"));
		var y:Int = Std.parseInt(entityData.get("y"));
		var esqS:EnemySkeletonShield = new EnemySkeletonShield(x,y-32,player,this);
		enemyGroup.add(esqS);		
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		guia.x = player.x - posicionGuia;//guia camara
		guia.y = player.y - 200;//guia camara
		if (FlxG.keys.pressed.LEFT)
		{
			limiteGuia = 175;
			if(posicionGuia < limiteGuia)
			posicionGuia += 1; 
		}
		if (FlxG.keys.pressed.RIGHT)
		{
			limiteGuia = 100;
			if(posicionGuia > limiteGuia)
			posicionGuia -= 1; 
		}
		FlxG.collide(player, tileBase);
		FlxG.collide(player, escalera);
		FlxG.collide(player, randomFloor);
		FlxG.collide(player, cajitas);
		if (FlxG.collide(player, cintita))
		{
			player.x += 2;
		}
		if (FlxG.collide(player, fueguito))
		{
			player.fueguin();
			player.x -= 5;
			player.y -= 5;
		}
		FlxG.collide(enemy, tileBase);
		FlxG.collide(enemyGroup, tileBase);
		//FlxG.collide(caja, tileBase);
		FlxG.collide(cajitas, tileBase);
		FlxG.collide(cajitas, cajitas);
		player.acceleration.y = Reg.gravedad;
		player.acceleration.x = 0;
		
		if (FlxG.overlap(player.woahHit, enemy))
		{
			if (enemy.get_tieneEscudo())
				{
					if (enemy.get_attackDirection() == "Right" && enemy.x > player.x)
					{
						enemy.kill();
					}
					else 
					if (enemy.get_attackDirection() == "Left" && enemy.x < player.x)
					{
						enemy.kill();
					}
				}
		}
		if (FlxG.overlap(player, enemy))
		{
			player.recibirDanio(enemy.danio, enemy.x);
		}
		for (i in 0... enemyGroup.members.length)
		{
			var spoopy:Enemy = enemyGroup.members[i];
			if (FlxG.overlap(player.woahHit, spoopy) && player.actionState == Estados.ATTACK)
			{
				if (spoopy.get_tieneEscudo())
				{
					if (spoopy.get_attackDirection() == "Right" && spoopy.x > player.x)
					{
						spoopy.drop();
						enemyGroup.remove(spoopy, true);
					}
					else 
					if (spoopy.get_attackDirection() == "Left" && spoopy.x < player.x)
					{
						spoopy.drop();
						enemyGroup.remove(spoopy, true);
					}
				}
				else
				spoopy.drop();
				enemyGroup.remove(spoopy, true);
			}
			if (player.esVulnerable() && FlxG.overlap(player, spoopy) && player.actionState != Estados.ATTACK)
			{
				player.recibirDanio(spoopy.danio, spoopy.x);
			}
		}
		if (FlxG.overlap(player, escaleritas) && (FlxG.keys.pressed.UP||FlxG.keys.pressed.DOWN))
		{
			player.trepar();
		}
		if (FlxG.overlap(player, watery))
		{
			player.recibirDanio(25, 1200);
			player.x = 1024;
			player.y = 1088;
		}
	}
}