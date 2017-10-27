package;

import entities.EnemySkeleton;
import entities.Player;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.FlxG;
import flixel.text.FlxText;

class PlayState extends FlxState

{
	private var player:Player;
	private var enemy:EnemySkeleton;
	private var plati:FlxSprite;
	private var testito:FlxText;
	private var interfaz:Interfaz;
	override public function create():Void
	{
		player = new Player(350, 300);
		enemy = new EnemySkeleton(400, 300);
		player.makeGraphic(32, 32, 0xFF000000);
		FlxG.camera.bgColor = 0xFFCC4466;
		
		interfaz = new Interfaz(player, this);
		testito = new FlxText(16, 16, 0, "", 24);
		plati = new FlxSprite(100, 350);
		plati.makeGraphic(440, 32);
		plati.immovable = true;
		
		super.create();
		add(player);
		add(enemy);
		add(plati);
		add(testito);
		add(interfaz);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		FlxG.collide(plati, player);
		testito.text = player.actionState.getName();
	}
}