package entities.enemies;

import entities.enemies.Enemy;
import flixel.FlxObject;
import flixel.util.FlxColor;
import flixel.system.FlxAssets.FlxGraphicAsset;
import Math;

class Bats extends Enemy
{

	public function new(?X:Float=0, ?Y:Float=0, playerRef:Player) 
	{
		super(X, Y,playerRef);
		loadGraphic(AssetPaths.bat__png, true, 32, 32);
		updateHitbox();
		setFacingFlip(FlxObject.RIGHT, true, false);
		setFacingFlip(FlxObject.LEFT, false, false);
		animation.add("fly", [0, 1, 3, 4, 3, 1], 18, true);
		animation.play("fly");
		danio = 75;
		velocity.y = 0;
	}
	
	override public function update(elapsed:Float):Void 
	{
		checkEstados();
		super.update(elapsed);
	}
	
	function checkEstados() 
	{
		switch(actionState)
		{
		//IDLE
		case EstadosEnemy.IDLE:
			
			
		//RUN
		case EstadosEnemy.RUN:
			
		//JUMP
		case EstadosEnemy.JUMP:
		//FALLING
		case EstadosEnemy.FALLING:
		//ATTACK
		case EstadosEnemy.ATTACK:
		}
	}
	
	function movimientoEnemy1():Void 
	{
		if (velocity.x < 0)
		facing = FlxObject.LEFT;
		if (velocity.x > 0)
		facing = FlxObject.RIGHT;
	}
	
}