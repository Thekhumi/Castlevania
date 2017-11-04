package;

import entities.Player;
import flixel.FlxBasic;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.ui.FlxBar;
import entities.Item;

class Interfaz extends FlxBasic
{
	private var barraVida:FlxBar;
	private var municion:FlxText;
	private var testito:FlxText;
	private var player:Player;
	private var arma:FlxSprite;
	
	public function new(jugador:Player, estado:PlayState)
	{
		super();
		player = jugador;
		 
		barraVida = new FlxBar(FlxG.camera.scroll.x, FlxG.camera.scroll.y, 300, 20, player, "vida", 0, 1000, true);
		barraVida.createColoredEmptyBar(0xFF000000, true, 0xFFFF0000);
		barraVida.createColoredFilledBar(0xFFFF0000, false);
		barraVida.scrollFactor.set(0,0);
		estado.add(barraVida);
		
		arma = new FlxSprite(barraVida.x+ 8, barraVida.y + 30, AssetPaths.nada__png);
		arma.scale.set(2,2);
		arma.scrollFactor.set(0, 0);
		estado.add(arma);
		
		municion = new FlxText(arma.x + arma.width + 8, arma.y, 0, "", 24);
		municion.scrollFactor.set(0, 0);
		estado.add(municion);
		
		testito = new FlxText(16, 16, 0, "", 24);
		testito.scrollFactor.set(0, 0);
		//estado.add(testito);
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		testito.text = player.actionState.getName();
		updateArma();
		municion.text = "Ammo: " + Std.string(player.getMun());
		
	}
	private function updateArma():Void
	{
		switch (player.getArma()) 
		{
			case Tipo.ESCOPETA:
				arma.loadGraphic(AssetPaths.escopeta__png);
			case Tipo.METRALLETA:
				arma.loadGraphic(AssetPaths.metralleta__png);
			case Tipo.PISTOLA:
				arma.loadGraphic(AssetPaths.pistola__png);
			default:
				arma.loadGraphic(AssetPaths.nada__png);
		}
	}
	
}