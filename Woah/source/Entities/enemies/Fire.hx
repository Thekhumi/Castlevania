package entities.enemies;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

class Fire extends FlxSprite 
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.Fire__png, true, 32, 32);
		updateHitbox();
		animation.add("fire", [0,1,2,3], 8, true);
		animation.play("fire");
		this.immovable = true;
	}
	
}