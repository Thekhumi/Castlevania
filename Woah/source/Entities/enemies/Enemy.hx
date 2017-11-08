package entities.enemies;

import entities.Balas;
import entities.Cura;
import entities.Item;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import entities.Player;
import flixel.system.FlxSound;
import flixel.math.FlxRandom;

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
	private var sonido:FlxSound;
	private var sonidoVez:Bool;
	private var tieneEscudo(get, null):Bool;
	private var attackDirection(get, null):String;
	private var estado:PlayState;
	public function new(?X:Float=0, ?Y:Float=0, player:Player, _estado:PlayState) 
	{
		super(X, Y);
		actionState = IDLE;
		attackDirection = null;
		tieneEscudo = false;
		vida = Reg.enemyVidaBase;
		playerRef = player;
		acceleration.y = Reg.gravedad;
		sonido = new FlxSound();
		sonidoVez = true;
		sonido.looped = true;
		sonido.volume = 1;
		estado = _estado;
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		controlarSonido();
	}
	
	
	function get_actionState():EstadosEnemy 
	{
		return actionState;
	}
	private function controlarSonido():Void
	{
		if (isOnScreen() && sonidoVez) 
		{
			sonido.play();
		} else if (!isOnScreen())
		{
			sonido.fadeOut(5,0);
		}
	}
	
	public function get_tieneEscudo():Bool 
	{
		return tieneEscudo;
	}
	
	public function get_attackDirection():String 
	{
		return attackDirection;
	}
	public function drop():Void
	{
		trace("si");
		var r:FlxRandom = new FlxRandom();
		var obj:Item;
		switch (r.int(0,4)) 
		{
			case 0:
				obj = new Cura(this.x, this.y, playerRef);
				estado.add(obj);
				trace("algo");
			case 1:
				obj = new Balas(this.x, this.y, playerRef);
				estado.add(obj);
				trace("algo");
			default:
				trace("algo");
		}
	}
}