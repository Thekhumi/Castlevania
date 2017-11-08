package entities.enemies;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

class Pirania extends Enemy 
{

	public function new(?X:Float=0, ?Y:Float=0, player:Player, estado:PlayState)  
	{
		super(X, Y, player, estado);
		loadGraphic(AssetPaths.Pirania__png, true, 32, 32);
		updateHitbox();
		animation.add("fish", [0,1,2], 10, true);
		animation.play("fish");
		this.immovable = true;
	}
	
}