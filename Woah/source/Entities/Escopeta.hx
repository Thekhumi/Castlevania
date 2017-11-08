package entities;

import flixel.system.FlxAssets.FlxGraphicAsset;
import entities.Item.Tipo;

/**
 * ...
 * @author ...
 */
class Escopeta extends Item 
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset, player:Player) 
	{
		super(X, Y, SimpleGraphic, player);
		loadGraphic(AssetPaths.escopeta__png);
		updateHitbox();
		tipo = Tipo.ESCOPETA;
	}
	
}