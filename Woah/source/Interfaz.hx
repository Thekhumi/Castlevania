package;

import entities.Player;
import flixel.FlxBasic;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.ui.FlxBar;

class Interfaz extends FlxBasic
{
	private var barraVida:FlxBar;
	private var municion:FlxText;
	public function new(jugador:Player, estado:PlayState)
	{
		super();
		barraVida = new FlxBar(FlxG.camera.scroll.x, FlxG.camera.scroll.y + FlxG.camera.height - 20, 300, 20, jugador, "vida", 0, 1000, true);
		estado.add(barraVida);
	}
	
}