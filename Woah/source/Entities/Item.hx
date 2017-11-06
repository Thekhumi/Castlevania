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
	CURA;
	
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
		switch (tipo) 
		{
			case BALAS:
				player.addMun(10);
			case CURA:
				player.curarse();
			default:
				if (FlxG.keys.justPressed.X) 
				{
					player.setArma(tipo);
				}
		}
		this.destroy();
	}
}