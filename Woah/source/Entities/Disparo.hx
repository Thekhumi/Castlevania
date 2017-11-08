package entities;

import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import entities.enemies.Enemy;
import flixel.tile.FlxTilemap;
/**
 * ...
 * @author Tomás Mugetti
 */
class Disparo extends FlxSprite 
{
	
	private static var enemyGroup:FlxTypedGroup<Enemy>;
	private static var terreno:FlxTilemap;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset, direc:Bool, ?angulo:Int=0) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(30, 5, 0xFFFFFFFF, false);
		updateHitbox();
		FlxG.sound.play(AssetPaths.disparo__ogg,1,false,true);
		if (direc) 
		{
			velocity.x = 300;
		} else 
		{
			velocity.x = -300;
		}
		velocity.y = angulo;
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if (!isOnScreen()) 
		{
			this.destroy();
		}
		if (FlxG.collide(this,terreno)) 
		{
			contraTerreno();
		}
		if (FlxG.overlap(this,enemyGroup)) 
		{
			for (i in 0... enemyGroup.length) 
			{
				if (FlxG.overlap(this, enemyGroup.members[i])) 
				{
					contraEnemigo(enemyGroup.members[i]);
				}
				
			}
			
		}
	}
	public static function setEnemigo(_enemyGroup:FlxTypedGroup<Enemy>):Void
	{
		enemyGroup = _enemyGroup;
	}
	public static function setTerreno(_terreno:FlxTilemap):Void
	{
		terreno = _terreno;
	}
	private function contraTerreno():Void
	{
		//this.destroy();
	}
	private function contraEnemigo(a:Enemy):Void
	{
		this.destroy();
		a.destroy();
	}
	
}