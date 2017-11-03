package entities;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
/**
 * ...
 * @author hello darkness my old friend~ 
 */
class WoahHitbox extends FlxSprite
{

	public function new(?X:Float=0,?Y:Float=0)
	{
		super(X,Y);
		makeGraphic( 27, 12, 0x00000000);
	}
	
}