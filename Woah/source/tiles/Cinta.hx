package tiles;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

class Cinta extends FlxSprite 
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.wheel__png, true, 32, 32);
		updateHitbox();
		animation.add("wheel", [0,1,2], 8, true);
		animation.play("wheel");
		this.immovable = true;
	}
	
}