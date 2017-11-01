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
}


 
class Player extends FlxSprite 
{
	public var actionState(get, null):Estados;
	private var vida:Float;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		actionState = IDLE;
		vida = Reg.playerVidaMax;
		
	}
	
	override public function update(elapsed:Float):Void 
	{
		checkEstados();
		acceleration.y = Reg.gravedad; 
		super.update(elapsed);
		vida -= 1;
	}
	
	private function checkEstados():Void
	{
		switch(actionState)
		{
			//IDLE
			case Estados.IDLE:
			movimiento();
			salto();
			if (velocity.y < 0)
			{
				actionState = Estados.JUMP;
			}
			else if (velocity.y > 0)
			{
				actionState = Estados.FALLING;
			}
			else if (velocity.x != 0)
			{
				actionState = Estados.RUN;
			}
			else if (velocity.x == 0)
			{
				actionState = Estados.IDLE;
			}
			//RUN
			case Estados.RUN:
			movimiento();
			salto();
			if (velocity.y < 0)
			{
				actionState = Estados.JUMP;
			}
			else if (velocity.y > 0)
			{
				actionState = Estados.FALLING;
			}
			else if (velocity.x == 0)
			{
				actionState = Estados.IDLE;
			}
			//JUMP
			case Estados.JUMP:
			if (velocity.y == 0)
			{
				
				actionState = Estados.FALLING;
			}
			//FALLING
			case Estados.FALLING:
			if (velocity.y == 0)
			{
				if (velocity.x == 0)
				{
					actionState = Estados.IDLE;
				}
				else
				actionState = Estados.RUN;
			}
			//ATTACK
			case Estados.ATTACK:
		}
	}
	
	private function movimiento():Void
	{
	velocity.x = 0;
	if (FlxG.keys.pressed.RIGHT)
		{
		velocity.x += 150; 
		}
	if (FlxG.keys.pressed.LEFT)
		{
		velocity.x -= 150;
		}
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