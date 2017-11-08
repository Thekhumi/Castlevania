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
		jugador = player;
		acceleration.y = Reg.gravedad;
	}
	override public function update(elapsed:Float):Void
	{
		FlxG.overlap(this,jugador,pickUp);
	}
	private function pickUp(yo:Item, player:Player):Void
	{
		if (FlxG.keys.justPressed.X)
		{
			switch (tipo)
			{
				case BALAS:
					player.addMun(5);
				case CURA:
					player.curarse();
				default:
					player.setArma(tipo);
			}
			this.destroy();
		}
	}
}