package entities;

import flash.text.TextFieldAutoSize;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import flixel.FlxObject;
import entities.Item;
import haxe.Timer;

enum Estados
{
	IDLE;
	JUMP;
	RUN;
	FALLING;
	ATTACK;
	SHOOT;
	CLIMB;
	DAMAGE;
}

class Player extends FlxSprite
{
	private var escalando:Bool;
	public var atacc:FlxSprite;
	public var woahHit(get, null):FlxSprite;
	public var actionState(get, null):Estados;
	public var vida:Float;
	private var mun:Int;
	private var arma:Tipo;
	private var estado:PlayState;
	private var cooldown:Float;
	private var vulnerable:Bool;
	private var reloj:Timer;
	public function new(?X:Float = 0, ?Y:Float = 0, ?SimpleGraphic:FlxGraphicAsset, _estado:PlayState)
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.clone__png, true, 92, 38);
		updateHitbox();
		setFacingFlip(FlxObject.RIGHT, false, false);
		setFacingFlip(FlxObject.LEFT, true, false);

		animation.add("idle", [0, 1, 2], 8, true);
		animation.add("run", [4, 5, 6, 3], 8, true);
		animation.add("jump", [7, 8], 8, false);
		animation.add("fall", [9], 8, false);
		animation.add("atacc", [11, 12, 13, 14, 15, 16, 17], 18, false);
		animation.add("ataccflip", [11, 12, 13, 18, 19, 20, 21], 18, false);
		animation.add("up", [22, 23], 6, true);
		animation.add("damn", [24, 25, 24, 25, 24, 25], 8, false);

		this.width = 16;
		this.height = 32;
		this.offset.x = 36;
		this.offset.y = 6;

		
		estado = _estado;
		actionState = IDLE;
		vida = Reg.playerVidaMax;
		mun = 0;
		arma = NADA;
		vulnerable = true;
		woahHit = new FlxSprite();
		woahHit.makeGraphic(30,12, 0x00000000);
		woahHit.kill();
		cooldown = 0;
		arma = Tipo.NADA;
		escalando = false;
	}

	override public function update(elapsed:Float):Void
	{
		checkEstados();
		if (!escalando) 
		{
			acceleration.y = Reg.gravedad;
		}
		super.update(elapsed);
		if (vida > 1000)
		{
			vida = 1000;
		}
		if (cooldown < 1)
		{
			cooldown += elapsed;
		}
		if (vida <=0)
		{
			muerte();
		}
	}

	private function checkEstados():Void
	{
		switch (actionState)
		{
			//IDLE
			case Estados.IDLE:
				animation.play("idle");
				movimiento();
				salto();
				woahHit.kill();
				if (velocity.y < 0)
					actionState = Estados.JUMP;
				else if (velocity.y > 0)
					actionState = Estados.FALLING;
				else if (velocity.x != 0)
					actionState = Estados.RUN;
				else if (FlxG.keys.justPressed.Z)
				{
					actionState = Estados.ATTACK;
					FlxG.sound.play(AssetPaths.woah__wav);
				}
				else if (FlxG.keys.justPressed.C)
				{
					actionState = Estados.SHOOT;
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
				else if (FlxG.keys.justPressed.C)
				{
					actionState = Estados.SHOOT;
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
				else if (FlxG.keys.justPressed.C)
				{
					actionState = Estados.SHOOT;
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
				else if (FlxG.keys.justPressed.C)
				{
					actionState = Estados.SHOOT;
				}
			//ATTACK
			case Estados.ATTACK:
				if (facing == FlxObject.LEFT)
				{
					animation.play("ataccflip");
					if (animation.name == "ataccflip" && animation.curAnim.curFrame == 4)
					{
						woahHit.reset(this.x - 22, this.y + 15);
					}
					if (animation.name == "ataccflip" && animation.curAnim.curFrame == 6)
					{
						woahHit.reset(this.x - 29, this.y + 15);
						actionState = Estados.IDLE;
					}
				}
				else if (facing == FlxObject.RIGHT)
				{
					animation.play("atacc");
					if (animation.name == "atacc" && animation.curAnim.curFrame == 3)
					{
						woahHit.reset(this.x +10, this.y + 15);
					}
					if (animation.name == "atacc" && animation.curAnim.curFrame == 6)
					{
						woahHit.reset(this.x +17, this.y + 15);
						actionState = Estados.IDLE;
					}
				}
			//DISPARAR
			case Estados.SHOOT:
				if (arma != Tipo.NADA)
				{
					disparar();
				}
				else
				{
					actionState = Estados.IDLE;
				}
				if (velocity.y == 0)
				{
					if (velocity.x == 0)
						actionState = Estados.IDLE;
					else
						actionState = Estados.RUN;
				}
			//CLIMB
			case Estados.CLIMB:
				animation.play("up");
				if (!FlxG.keys.pressed.UP)
					actionState = Estados.IDLE;
			//DAMAGE
			case Estados.DAMAGE:
				//velocity.x = -velocity.x;
				//velocity.y = -velocity.y;
				animation.play("damn");
				if (animation.name == "damn" && animation.curAnim.curFrame == 5)
					actionState = Estados.IDLE;
		}
	}
	private function disparar():Void
	{
		if (mun > 0 && cooldown >= 1)
		{
			var direc:Bool;
			if (facing == FlxObject.RIGHT)
			{
				direc = true;
			}
			else
			{
				direc = false;
			}
			switch (arma)
			{
				case Tipo.PISTOLA:
					unDisparo(direc);
					cooldown = 0;
					actionState = Estados.IDLE;
				case Tipo.METRALLETA:
					if (mun >=3)
					{
						var reloj:Timer = new Timer(100);
						var contador:Int = 0;
						reloj.run = function()
						{
							unDisparo(direc);
							contador++;
							if (contador >= 3)
							{
								reloj.stop();
							}
						}
					}
					else
					{
						FlxG.sound.play(AssetPaths.sinBalas__ogg,1,false,true);
					}
					cooldown = 0;
					actionState = Estados.IDLE;
				case Tipo.ESCOPETA:
					if (mun >=5)
					{
						unDisparo(direc, 8);
						unDisparo(direc, 4);
						unDisparo(direc, 0);
						unDisparo(direc, -4);
						unDisparo(direc, -8);
					}
					else
					{
						FlxG.sound.play(AssetPaths.sinBalas__ogg,1,false,true);
					}
					cooldown = 0;
					actionState = Estados.IDLE;
				default:
			}
		}
		if (mun<=0)
		{
			FlxG.sound.play(AssetPaths.sinBalas__ogg, 1, false, true);
			actionState = Estados.IDLE;
		}
	}
	private function unDisparo(direc:Bool,?angulo:Int):Void
	{
		var tiro:Disparo = new Disparo(this.x + (this.width/2), this.y + (this.height/2), direc, angulo);
		estado.add(tiro);
		mun--;

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
		if (vulnerable && vida > 0)
		{
			actionState = Estados.DAMAGE;
			vida -= cantidad;
			vulnerable = false;
			var contador:Int = 0;
			reloj = new Timer(300);
			if (this.x > xFuente)
			{
				velocity.x = 200;
			}
			else
			{
				velocity.x = -200;
			}
			reloj.run = function ()
			{
				visible = !visible;
				contador++;
				if (contador>=4) 
				{
					velocity.x = 0;
				}
				if (contador >=8)
				{
					vulnerable = true;
					visible = true;
					reloj.stop();
				}
				
			}
		}
	}
	
	public function curarse():Void
	{
		vida += 100;
	}
	public function fueguin():Void
	{
		FlxG.sound.play(AssetPaths.quemadura__ogg,1,false,true);
		actionState = Estados.DAMAGE;
		velocity.y = -200;
		vida -= 75;
	}

	public function trepar():Void
	{
		actionState = Estados.CLIMB;
		if (FlxG.keys.pressed.UP){
			velocity.y = -80;
			acceleration.y = 0;
			escalando = true;
		}
		if (FlxG.keys.pressed.DOWN){
			velocity.y = 80;
			acceleration.y = 0;
			escalando = true;
		}
		if (!FlxG.keys.pressed.UP && !FlxG.keys.pressed.DOWN) 
		{
			escalando = false;
		}
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
	function get_woahHit():FlxSprite
	{
		return woahHit;
	}

	public function addMun(cant:Int):Void
	{
		mun += cant;
	}
	public function getMun():Int
	{
		return mun;
	}
	public function setArma(tipo:Tipo):Void
	{
		arma = tipo;
	}
	public function getArma():Tipo
	{
		return arma;
	}
	public function esVulnerable():Bool
	{
		return vulnerable;
	}
	private function muerte():Void
	{
		reloj.stop();
		var gameover:Gameover = new Gameover();
		FlxG.switchState(gameover);
	}
}