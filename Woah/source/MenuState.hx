package;

import flixel.FlxState;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

class MenuState extends FlxState 
{
	private var fondo:FlxSprite;
	var logo:FlxSprite;
	var butonNew:flixel.ui.FlxButton;
	var text:FlxText;

	override public function create():Void
	{
		super.create();
		logo = new FlxSprite(62,30);
		logo.loadGraphic(AssetPaths.Chikologo__png, true, 150, 150);
		logo.animation.add("chiko", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12,0,0,0,0,0], 10, false);
		logo.animation.play("chiko");
		add(logo);
		
		text = new FlxText(62, 200, 0, "Chikoritos Team presenta", 8);
		add(text);
		
		fondo = new FlxSprite(0, 0, AssetPaths.Menu__png);
		
		var init_x:Int = Math.floor(FlxG.width / 2 - 40);
		butonNew = new FlxButton(init_x, 175, "Start!", onNew);
	}
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		if (logo.animation.name == "chiko" && logo.animation.curAnim.curFrame == 17)
			{
				logo.kill();
				add(fondo);
				add(butonNew);
			}
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
