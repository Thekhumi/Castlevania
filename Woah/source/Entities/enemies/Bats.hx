package entities.enemies;

import entities.enemies.Enemy;
import flixel.FlxObject;
import flixel.util.FlxColor;
import flixel.system.FlxAssets.FlxGraphicAsset;
import Math;
import flixel.FlxG;
class Bats extends Enemy
{

	public function new(?X:Float=0, ?Y:Float=0, player:Player) 
	{
		super(X, Y, player);
		loadGraphic(AssetPaths.bat__png, true, 32, 32);
		updateHitbox();
		setFacingFlip(FlxObject.RIGHT, true, false);
		setFacingFlip(FlxObject.LEFT, false, false);
		animation.add("fly", [0, 1, 3, 4, 3, 1], 18, true);
		animation.play("fly");
		danio = 75;
		velocity.y = 0;
		acceleration.y = 0;
		actionState = EstadosEnemy.IDLE;
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		checkEstados();
		movimientoEnemy1();
	}
	
	function checkEstados() 
	{
		switch(actionState)
		{
		//IDLE
		case EstadosEnemy.IDLE:
			if (isOnScreen()) 
			{
				actionState = EstadosEnemy.ATTACK;
			}
			
		//RUN
		case EstadosEnemy.RUN:
			velocity.y = -100;
			if ((velocity.x < 0 && (playerRef.x - this.x >=200)) || (velocity.x > 0 && (this.x - playerRef.x>=200))) 
			{
				actionState = EstadosEnemy.ATTACK;
			}
		//JUMP
		case EstadosEnemy.JUMP:
		//FALLING
		case EstadosEnemy.FALLING:
		//ATTACK
		case EstadosEnemy.ATTACK:
			if (playerRef.x > this.x) 
			{
				velocity.x = 100;
			} else if (playerRef.x < this.x) 
			{
				velocity.x = -100;
			}
			
			if (playerRef.y >this.y) 
			{
				velocity.y = 100;
			} else if (playerRef.y < this.y) 
			{
				velocity.y = -100;
			} 
			
			if (FlxG.collide(this,playerRef)) 
			{
				actionState = EstadosEnemy.RUN;
			}
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