package;

import Entities.Player;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.FlxG;
import flixel.text.FlxText;

class PlayState extends FlxState

{
	private var player:Player
	override public function create():Void
	{
		player = new Player;
		player.makeGraphic(32,32,FlxG.
		super.create();
		add player;
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}