package tiles;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

class RandomFloor extends FlxSprite 
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.bloqueR__png, true, 32, 32);
		updateHitbox();
		animation.add("randomfloor", 
		[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 
		0, 1, 0,1, 2, 3, 4, 3, 4, 4, 4, 4, 4, 4, 4, 4], 8, true);
		animation.play("randomfloor");
		this.immovable = true;
	}
	
	//@:setter(path)
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		if (animation.name == "randomfloor" && animation.curAnim.curFrame == 26)
		{
			this.solid = false;
		}
		if (animation.name == "randomfloor" && animation.curAnim.curFrame == 0)
		{
			this.solid = true;
		}
	}
}