package entities;

import entities.Player;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;

/**
 * ...
 * @author ...
 */

 enum Tipo
 {
	NADA;
	PISTOLA;
	METRALLETA;
	ESCOPETA;
	BALAS;
	
 }
class Item extends FlxSprite 
{
	private var tipo:Tipo;
	private var jugador:Player;
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset, player:Player) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(15,15,0xFF00FFFF);
		jugador = player;
		
	}
	override public function update(elapsed:Float):Void
	{
		FlxG.overlap(this,jugador,pickUp);
	}
	private function pickUp(yo:Item, player:Player):Void
	{
		if (tipo == BALAS) 
		{
			player.addMun(25);
			this.visible= false;
			this.destroy;
		} else if (FlxG.keys.justPressed.X) {
			player.setArma(tipo);
			this.visible = false;
			this.destroy;
		}
	}
}