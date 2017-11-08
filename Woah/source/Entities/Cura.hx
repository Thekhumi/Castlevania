package entities;

import entities.Item;
import entities.Player;
import flixel.system.FlxAssets.FlxGraphicAsset;
import entities.Item.Tipo;

/**
 * ...
 * @author Tomás Mugetti
 */
class Cura extends Item 
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset, player:Player) 
	{
		
		super(X, Y, SimpleGraphic, player);
		loadGraphic(AssetPaths.cura__png);
		updateHitbox();
		tipo = Tipo.CURA;
		
	}
	
}