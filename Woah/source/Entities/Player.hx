package entities;

import flash.text.TextFieldAutoSize;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import flixel.FlxObject;
import entities.WoahHitbox;

enum Estados
{
	IDLE;
	JUMP;
	RUN;
	FALLING;
	ATTACK;
	CLIMB;
	DAMAGE;
}

class Player extends FlxSprite 
{
	public var atacc:FlxSprite;
	public var actionState(get, null):Estados;
	private var vida:Float;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.clone__png, true, 92, 38);
		scale.set(2, 2);
		updateHitbox();
		setFacingFlip(FlxObject.RIGHT, false, false);
		setFacingFlip(FlxObject.LEFT, true, false);
		
		animation.add("idle", [0, 1, 2], 8, true);
		animation.add("run", [3, 4, 5, 6], 8, true);
		animation.add("jump", [7, 8], 8, false);
		animation.add("fall", [9], 8, false);
		animation.add("atacc", [10, 11, 12, 13, 14, 15, 16, 17], 12, false);
		animation.add("ataccflip", [10, 11, 12, 13, 18, 19, 20, 21], 12, false);
		animation.add("up", [22, 23], 6, true);
		animation.add("damn", [24, 25, 24, 25, 24, 25], 8, false);
		
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
				{
					actionState = Estados.ATTACK;
					FlxG.sound.play(AssetPaths.woah__wav);
				}
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
				if (FlxG.keys.justPressed.Z)
				{
					actionState = Estados.ATTACK;
					velocity.x = 0;
					FlxG.sound.play(AssetPaths.woah__wav);
				}
			//JUMP
			case Estados.JUMP:
				animation.play("jump");
				if (velocity.y == 0)
					actionState = Estados.FALLING;
				if (FlxG.keys.justPressed.Z)
				{
					actionState = Estados.ATTACK;
					FlxG.sound.play(AssetPaths.woah__wav);
				}
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
				if (FlxG.keys.justPressed.Z)
				{
					actionState = Estados.ATTACK;
					FlxG.sound.play(AssetPaths.woah__wav);
				}
			//ATTACK
			case Estados.ATTACK:
				if (facing == FlxObject.LEFT)
				{
					animation.play("ataccflip");
					if (animation.name == "ataccflip" && animation.curAnim.curFrame == 7)
						actionState = Estados.IDLE;
				}
				else if (facing == FlxObject.RIGHT)
				{
					animation.play("atacc");
					if (animation.name == "atacc" && animation.curAnim.curFrame == 7)
						actionState = Estados.IDLE;
				}
			//CLIMB
			case Estados.CLIMB:
				animation.play("up");
				if (!FlxG.keys.pressed.UP)
					actionState = Estados.IDLE;
			//DAMAGE
			case Estados.DAMAGE:
				velocity.x = -velocity.x;
				velocity.y = -velocity.y;
				animation.play("damn");
				if (animation.name == "damn" && animation.curAnim.curFrame == 5)
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
		actionState = Estados.DAMAGE;
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
			velocity.y -= 350;
	}
	
	function get_actionState():Estados 
	{
		return actionState;
	}
}