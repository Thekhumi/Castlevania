package;

import flixel.FlxState;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

class Gameover extends FlxState
{
	var butonNew:FlxButton;
	var back:FlxSprite;

	public function new() 
	{
		back = new FlxSprite(0, 0, AssetPaths.gameover__png);
		
		var init_x:Int = Math.floor(FlxG.width / 2 - 40);
		butonNew = new FlxButton(init_x, 175, "Woah Again", onNew);
	}
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
	}
	private function onNew(): Void
	{
		var playState:PlayState = new PlayState();
		FlxG.switchState(playState);
	}
	override public function destroy():Void
	{
		super.destroy();
	}
}