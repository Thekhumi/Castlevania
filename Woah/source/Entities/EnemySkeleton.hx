package entities;

import entities.Enemy;
import flixel.util.FlxColor;
import flixel.system.FlxAssets.FlxGraphicAsset;
import Math;

class EnemySkeleton extends Enemy
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset, playerRef:Player) 
	{
		super(X, Y, SimpleGraphic,playerRef);
		makeGraphic(32, 32, FlxColor.YELLOW);
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
	}
	
	function checkDistancia():Bool 
	{
		if (Math.abs(playerRef.x - this.x) < 100)
		{
			return true;
		}
		else return false;
	}
}