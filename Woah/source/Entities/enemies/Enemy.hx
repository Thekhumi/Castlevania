package entities.enemies;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import entities.Player;

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
	private var playerRef:Player;
	public var danio:Int;
	public function new(?X:Float=0, ?Y:Float=0, player:Player) 
	{
		super(X, Y);
		actionState = IDLE;
		vida = Reg.enemyVidaBase;
		playerRef = player;
		acceleration.y = Reg.gravedad;
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
	}
	
	
	function get_actionState():EstadosEnemy 
	{
		return actionState;
	}
}