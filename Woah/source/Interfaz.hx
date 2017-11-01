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
	private var testito:FlxText;
	private var player:Player;
	
	public function new(jugador:Player, estado:PlayState)
	{
		super();
		player = jugador;
		
		barraVida = new FlxBar(FlxG.camera.scroll.x, FlxG.camera.scroll.y, 300, 20, player, "vida", 0, 1000, true);
		barraVida.createColoredEmptyBar(0xFF000000, true, 0xFFFF0000);
		barraVida.createColoredFilledBar(0xFFFF0000,false);
		estado.add(barraVida);
		
		testito = new FlxText(16, 16, 0, "", 24);
		estado.add(testito);
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		barraVida.scrollFactor.x = 1;
		barraVida.scrollFactor.y = 1;
		testito.text = player.actionState.getName();
	}
	
}