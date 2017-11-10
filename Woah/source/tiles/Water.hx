package tiles;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

class Water extends FlxSprite 
{
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.watery__png, true, 32, 32);
		animation.add("water", [0, 1, 2, 3], 6, true);
		animation.play("water");
		
	}
	
}