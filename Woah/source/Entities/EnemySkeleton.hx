package entities;

import entities.Enemy;
import flixel.util.FlxColor;
import flixel.system.FlxAssets.FlxGraphicAsset;


class EnemySkeleton extends Enemy
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(32, 32, FlxColor.YELLOW);
	}
	
}