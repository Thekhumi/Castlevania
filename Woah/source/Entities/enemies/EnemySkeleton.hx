package entities.enemies;

import entities.enemies.Enemy;
import flixel.FlxObject;
import flixel.util.FlxColor;
import flixel.system.FlxAssets.FlxGraphicAsset;
import Math;

class EnemySkeleton extends Enemy
{

	public function new(?X:Float=0, ?Y:Float=0, playerRef:Player) 
	{
		super(X, Y,playerRef);
		loadGraphic(AssetPaths.skeleton__png, true, 32, 38);
		updateHitbox();
		setFacingFlip(FlxObject.RIGHT, true, false);
		setFacingFlip(FlxObject.LEFT, false, false);
		animation.add("chase", [0, 1, 2, 1], 8, true);
		animation.play("chase");
		danio = 75;
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
			if (checkDistancia())
			{
				actionState = EstadosEnemy.RUN;
			}
			
		//RUN
		case EstadosEnemy.RUN:
			movimientoEnemy1();
			if (checkDistancia())
			{
				
			}
			else 
			{
				velocity.x = 0;
				actionState = EstadosEnemy.IDLE;
			}
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
		velocity.x = 0;
		if (playerRef.x > this.x)
		{
			velocity.x += 65;
		}
		else if (playerRef.x < this.x)
		{
			velocity.x -= 65;
		}
		if (velocity.x < 0)
		facing = FlxObject.LEFT;
		if (velocity.x > 0)
		facing = FlxObject.RIGHT;
	}
	
	function checkDistancia():Bool 
	{
		if (Math.abs(playerRef.x - this.x) < 300)
		{
			return true;
		}
		else return false;
	}
	
}