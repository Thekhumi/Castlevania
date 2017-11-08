package entities.enemies;

import entities.enemies.Enemy;
import flixel.FlxObject;
import flixel.util.FlxColor;
import flixel.system.FlxAssets.FlxGraphicAsset;
import Math;
import flixel.FlxG;

class EnemySkeletonShield extends Enemy
{

	private var timer:Float;
	public function new(?X:Float=0, ?Y:Float=0, player:Player) 
	{
		super(X, Y,player);
		loadGraphic(AssetPaths.verySpookySkeleton__png, true, 32, 38);
		updateHitbox();
		tieneEscudo = true;
		attackDirection = "Left";
		setFacingFlip(FlxObject.RIGHT, true,false);
		setFacingFlip(FlxObject.LEFT, false, false);
		animation.add("chase", [0, 1, 2, 1], 8, true);
		animation.play("chase");
		danio = 150;
		timer = 0;
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		checkEstados(elapsed);
	}
	
	function checkEstados(elapsed:Float) 
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
		timer += (elapsed);	
		if (timer >= 2)
		{
			attackDirectionSet();
			actionState = EstadosEnemy.ATTACK;
		}
		//JUMP
		case EstadosEnemy.JUMP:
		//FALLING
		case EstadosEnemy.FALLING:
		//ATTACK
		case EstadosEnemy.ATTACK:
		timer += (elapsed);
		movimientoEnemy2();
		if (timer > 5)
		{
			timer = 0;
			acceleration.x = 0;
			velocity.x = 0;
			actionState = EstadosEnemy.IDLE;
		}
		}
	}
	
	function attackDirectionSet():Void
	{
		if (playerRef.x > this.x)
		{
			attackDirection = "Right";
		}
		else if (playerRef.x < this.x)
		{
			attackDirection = "Left";
		}
	}
	function movimientoEnemy2():Void 
	{
		if (attackDirection == "Right")
		{
			acceleration.x = 75;
		}
		else if (attackDirection == "Left")
		{
			acceleration.x = -75;
		}
		if (velocity.x < 0)
		facing = FlxObject.LEFT;
		if (velocity.x > 0)
		facing = FlxObject.RIGHT;
	}
	
	function checkDistancia():Bool 
	{
		if (Math.abs(playerRef.x - this.x) < 165 && playerRef.y == this.y)
		{
			return true;
		}
		else return false;
	}
	
}