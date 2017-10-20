package Entities;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import flixel.FlxObject;

enum estados{
	IDLE;
	JUMP;
	RUN;
	FALLING;
	ATTACK;
}

actionState:estados;
 
class Player extends FlxSprite 
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		checkEstados(
	}
	
	private function movimiento():Void
	{
	velocity.x = 0;
	if (FlxG.keys.pressed.RIGHT)
	{
		velocity.x += 300; 
	}
	if (FlxG.keys.pressed.LEFT)
	{
		velocty.x -= 300;
	}
	}
}