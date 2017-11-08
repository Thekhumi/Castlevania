package entities;
import entities.Cura;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.math.FlxRandom;
import flixel.FlxG;
import entities.Player.Estados;
import entities.Balas;
/**
 * ...
 * @author
 */
class Caja extends FlxSprite 
{
	private var jugador:Player;
	private var estado:PlayState;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset, player:Player, state:PlayState) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.CTileset__png, true, 32, 32);
		animation.add("box", [5], 1, true);
		animation.play("box");
		jugador = player;
		estado = state;
		updateHitbox;
		//acceleration.y = Reg.gravedad;
		this.immovable = true;
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if (FlxG.overlap(jugador.woahHit, this) && jugador.actionState == Estados.ATTACK)
		{
			var r:FlxRandom = new FlxRandom();
			var obj:Item;
			FlxG.sound.play(AssetPaths.caja__ogg, 0.15, false, true);
			switch (r.int(0,4)) 
			{
				case 0:
					obj = new Balas(this.x,this.y,jugador);
				case 1:
					obj = new Cura(this.x,this.y,jugador);
				case 2:
					obj = new Escopeta(this.x,this.y,jugador);
				case 3:
					obj = new Metralleta(this.x,this.y,jugador);
				case 4:
					obj = new Pistola(this.x,this.y,jugador);
				default:
					obj = new Balas(this.x,this.y,jugador);
			}
			estado.add(obj);
			this.destroy();   
		}
	}
}