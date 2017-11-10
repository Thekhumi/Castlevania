package entities.enemies;

import entities.enemies.Boss.Estados;
import flixel.FlxSprite;
import flixel.math.FlxRandom;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import flixel.FlxObject;

enum Estados
{
	IDLE;
	BEAM;
	RUSH;
	TELEPORT;
}
class Boss extends FlxSprite
{
	public var actionState(get, null):Estados;
	public var beam(get, null):FlxSprite;
	public function new(?X:Float=0, ?Y:Float=0) 
	{
		super(X, Y);
		loadGraphic(AssetPaths.BOSS__png, true, 64, 64);
		updateHitbox();
		animation.add("teleport", [0, 1, 0, 1, 0, 1, 0, 1], 8, false);
		animation.add("idle", [1, 2, 1, 2, 1, 2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1], 8, true);
		animation.add("beam", [2, 3, 4, 3, 4, 3, 4, 3, 4, 3, 4, 3, 4, 3, 4, 3, 4], 8, false);
		
		beam = new FlxSprite(this.x + 10, this.y + 5, AssetPaths.beam__png);
		beam.kill();
		
		actionState = Estados.IDLE;
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		checkEstados();
	}
	private function setEstados():Void
	{
		var r:FlxRandom = new FlxRandom();
		switch (r.int(0, 3))
		{
			case 0:
				actionState = Estados.IDLE;
			case 1:
				actionState = Estados.BEAM;
			case 2:
				actionState = Estados.RUSH;
			case 3:
				actionState = Estados.TELEPORT;
			default:
				actionState = Estados.IDLE;
		}
	}
	private function checkEstados():Void
	{
		switch (actionState)
		{
			case Estados.IDLE:
				animation.play("idle");
				this.x = 4480;
				this.y = 864;
				beam.kill();
				if (animation.name == "idle" && animation.curAnim.curFrame == 20)
				{
					setEstados();
				}
			case Estados.RUSH:
				beam.kill();
				animation.play("beam");
					this.x = 4480;
					this.y = 864;
				if (animation.name == "beam" && animation.curAnim.curFrame == 16)
				{
					setEstados();
				}
			case Estados.BEAM:
				animation.play("beam");
				this.x = 4480;
				this.y = 864;
				beam.reset(this.x + 10, this.y + 5);
				if (animation.name == "beam" && animation.curAnim.curFrame == 3)
				{
					beam.setSize(30, 200);
				}
				if (animation.name == "beam" && animation.curAnim.curFrame == 16)
				{
					setEstados();
				}
			case Estados.TELEPORT:
				beam.kill();
				animation.play("teleport");					
				if (animation.name == "teleport" && animation.curAnim.curFrame == 6)
				{	
					animation.stop();
					animation.play("beam");
					//this.acceleration.x = 75;
					//if (this.x == 5120)
					//{
						//this.acceleration.x = -140;
						//if (this.x == 4100)
						//{
							//this.acceleration.x = 0;
							//setEstados();
						//}
					//}
				}
		}
	}
	function get_actionState():Estados
	{
		return actionState;
	}
	function get_beam():FlxSprite
	{
		return beam;
	}
	
}