package;

import entities.Player;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.FlxG;
import flixel.text.FlxText;

class PlayState extends FlxState

{
	private var player:Player;
	private var plati:FlxSprite;
	private var testito:FlxText;
	override public function create():Void
	{
		player = new Player(350,300);
		player.makeGraphic(32, 32, 0xFF000000);
		FlxG.camera.bgColor = 0xFFCC4466;
		
		testito = new FlxText(16, 16, 0, "", 24);
		plati = new FlxSprite(100, 350);
		plati.makeGraphic(440, 32);
		plati.immovable = true;
		
		super.create();
		add(player);
		add(plati);
		add(testito);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		FlxG.collide(plati, player);
		testito.text = player.actionState.getName();
	}
}