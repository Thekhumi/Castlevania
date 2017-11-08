package entities;

import flixel.system.FlxAssets.FlxGraphicAsset;
import entities.Item.Tipo;
/**
 * ...
 * @author ...
 */
class Balas extends Item 
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset, player:Player) 
	{
		super(X, Y, SimpleGraphic, player);
		loadGraphic(AssetPaths.balas__png);
		updateHitbox();
		tipo  = Tipo.BALAS;
	}
	
}