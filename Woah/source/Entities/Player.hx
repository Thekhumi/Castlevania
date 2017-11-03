package entities;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import flixel.FlxObject;

enum Estados
{
	IDLE;
	JUMP;
	RUN;
	FALLING;
	ATTACK;
	CLIMB;
}


 
class Player extends FlxSprite 
{
	public var actionState(get, null):Estados;
	private var vida:Float;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.CFULLclone__png, true, 35, 38);
		scale.set(2, 2);
		updateHitbox();
		setFacingFlip(FlxObject.RIGHT, false, false);
		setFacingFlip(FlxObject.LEFT, true, false);
		
		animation.add("idle", [0, 1, 2], 8, true);
		animation.add("run", [3, 4, 5, 6], 8, true);
		animation.add("jump", [7, 8], 8, false);
		animation.add("fall", [9], 8, false);
		animation.add("atacc", [10, 11, 12, 13, 14, 15, 16, 17], 8, false);
		animation.add("up", [18, 19], 6, true);
		
		actionState = IDLE;
		vida = Reg.playerVidaMax;
		
	}
	
	override public function update(elapsed:Float):Void 
	{
		checkEstados();
		acceleration.y = Reg.gravedad; 
		super.update(elapsed);
	}
	
	private function checkEstados():Void
	{
		switch(actionState)
		{
			//IDLE
			case Estados.IDLE:
				animation.play("idle");
				movimiento();
				salto();
				if (velocity.y < 0)
					actionState = Estados.JUMP;
				else if (velocity.y > 0)
					actionState = Estados.FALLING;
				else if (velocity.x != 0)
					actionState = Estados.RUN;
				else if (FlxG.keys.pressed.UP)
					actionState = Estados.CLIMB;
				else if (FlxG.keys.justPressed.Z)
					actionState = Estados.ATTACK;
				else if (velocity.x == 0)
					actionState = Estados.IDLE;
			//RUN
			case Estados.RUN:
				animation.play("run");
				movimiento();
				salto();
				if (velocity.y < 0)
					actionState = Estados.JUMP;
				else if (velocity.y > 0)
					actionState = Estados.FALLING;
				else if (velocity.x == 0)
					actionState = Estados.IDLE;
			//JUMP
			case Estados.JUMP:
				animation.play("jump");
				if (velocity.y == 0)
					actionState = Estados.FALLING;
			//FALLING
			case Estados.FALLING:
				animation.play("fall");
				if (velocity.y == 0)
				{
					if (velocity.x == 0)
						actionState = Estados.IDLE;
					else
					actionState = Estados.RUN;
				}
			//ATTACK
			case Estados.ATTACK:
				animation.play("atacc");
				if (animation.name == "atacc" && animation.curAnim.curFrame == 7)
					actionState = Estados.IDLE;
			//CLIMB
			case Estados.CLIMB:
				animation.play("up");
				if (!FlxG.keys.pressed.UP)
					actionState = Estados.IDLE;
		}
	}
	
	private function movimiento():Void
	{
	velocity.x = 0;
	if (FlxG.keys.pressed.RIGHT)
		velocity.x += 150; 
	if (FlxG.keys.pressed.LEFT)
		velocity.x -= 150;
		
	if (velocity.x < 0)
		facing = FlxObject.LEFT;
	if (velocity.x > 0)
		facing = FlxObject.RIGHT;
	}
	
	public function recibirDanio(?cantidad:Int, ?xFuente:Float):Void
	{
		vida -= cantidad;
		
		if (this.x > xFuente)
		{
			x +=  25;
		}
		else x -= 25;

	}
	
	private function salto():Void
	{
		if (FlxG.keys.justPressed.SPACE)
		{
			velocity.y -= 350;
		}
	}
	
	function get_actionState():Estados 
	{
		return actionState;
	}
}