package entities;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;

enum EstadosEnemy
{
	IDLE;
	JUMP;
	RUN;
	FALLING;
	ATTACK;
}

class Enemy extends FlxSprite 
{
	private var vida:Float;
	private var actionState(get, null):EstadosEnemy;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		actionState = IDLE;
		vida = Reg.enemyVidaBase;
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
	
	function get_actionState():EstadosEnemy 
	{
		return actionState;
	}
	

	
}