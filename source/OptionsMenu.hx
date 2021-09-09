package;

import Controls.Control;
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.input.keyboard.FlxKey;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import lime.utils.Assets;
import Controls.KeyboardScheme;

class OptionsMenu extends MusicBeatState
{
	var selector:FlxText;
	var curSelected:Int = 0;

	var controlsStrings:Array<String> = ["Dfjk keys", "Ghost Tapping", "Advanced Score Text", "Hit Sounds", "New UI", "Latency Test", "middle scroll"];

	private var grpControls:FlxTypedGroup<Alphabet>;

	var cooloptiontext:FlxText;

	override function create()
	{
		var menuBG:FlxSprite = new FlxSprite().loadGraphic(Paths.image('menuDesat'));
		menuBG.color = 0xFFea71fd;
		menuBG.setGraphicSize(Std.int(menuBG.width * 1.1));
		menuBG.updateHitbox();
		menuBG.screenCenter();
		menuBG.antialiasing = true;
		add(menuBG);

		grpControls = new FlxTypedGroup<Alphabet>();
		add(grpControls);

		for (i in 0...controlsStrings.length)
		{
				var controlLabel:Alphabet = new Alphabet(0, (70 * i) + 30, controlsStrings[i], true, false);
				controlLabel.isMenuItem = true;
				controlLabel.targetY = i;
				grpControls.add(controlLabel);
			// DONT PUT X IN THE FIRST PARAMETER OF new ALPHABET() !!
		}

		cooloptiontext = new FlxText(5, FlxG.height - 148, 0, "Placetheholderhere", 12);
		cooloptiontext.scrollFactor.set();
		cooloptiontext.setFormat("VCR OSD Mono", 24, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(cooloptiontext);

		super.create();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
		if (controls.BACK)
		{
			FlxG.switchState(new MainMenuState());
		}
		if (controls.UP_P)
		{
			changeSelection(-1);
		}
		if (controls.DOWN_P)
		{
			changeSelection(1);
		}
		if (controls.ACCEPT)
		{
			if (curSelected == 0)
			{
				if (CoolGameDataStuff.dfjk)
				{
					controls.setKeyboardScheme(KeyboardScheme.Solo, true);
					CoolGameDataStuff.dfjk = false;
				}
				else
				{
					controls.setKeyboardScheme(KeyboardScheme.Duo(true), true);
					CoolGameDataStuff.dfjk = true;
				}
				FlxG.save.data.dfjk = CoolGameDataStuff.dfjk;
				FlxG.save.flush();
				
			}
			if (curSelected == 1)
			{
				if (CoolGameDataStuff.ghost)
					CoolGameDataStuff.ghost = false;
				else
					CoolGameDataStuff.ghost = true;
				FlxG.save.data.ghost = CoolGameDataStuff.ghost;
				FlxG.save.flush();
			}
			if (curSelected == 2)
			{
				if (CoolGameDataStuff.advancedscore)
					CoolGameDataStuff.advancedscore = false;
				else
					CoolGameDataStuff.advancedscore = true;
				FlxG.save.data.advancedscore = CoolGameDataStuff.advancedscore;
				FlxG.save.flush();
			}
			if (curSelected == 3)
			{
				if (CoolGameDataStuff.hitsound)
					CoolGameDataStuff.hitsound = false;
				else
					CoolGameDataStuff.hitsound = true;
				FlxG.save.data.hitsound = CoolGameDataStuff.hitsound;
				FlxG.save.flush();
			}
			if (curSelected == 4)
			{
				if (CoolGameDataStuff.chadui)
					CoolGameDataStuff.chadui = false;
				else
					CoolGameDataStuff.chadui = true;
				FlxG.save.data.chadui = CoolGameDataStuff.chadui;
				FlxG.save.flush();
			}
			if (curSelected == 5)
			{
				FlxG.switchState(new LatencyState());
			}
			if (curSelected == 6)
			{
				if (CoolGameDataStuff.middlescroll)
					CoolGameDataStuff.middlescroll = false;
				else
					CoolGameDataStuff.middlescroll = true;
				FlxG.save.data.middlescroll = CoolGameDataStuff.middlescroll;
				FlxG.save.flush();
			}
		}
		if (curSelected == 0)
		{
			cooloptiontext.text = "DFJK: " + CoolGameDataStuff.dfjk;
		}
		if (curSelected == 1)
		{
			cooloptiontext.text = "Ghost Tapping: " + CoolGameDataStuff.ghost;
		}
		if (curSelected == 2)
		{
			cooloptiontext.text = "Advanced Score Text (shows misses and hits): " + CoolGameDataStuff.advancedscore;
		}
		if (curSelected == 3)
		{
			cooloptiontext.text = "Hit Sounds (plays a sound when you hit a note): " + CoolGameDataStuff.hitsound;
		}
		if (curSelected == 4)
		{
			cooloptiontext.text = "New UI (Makes ratings, icons and other stuff better): " + CoolGameDataStuff.chadui;
		}
		if (curSelected == 5)
		{
			cooloptiontext.text = "Latency Testing";
		}
		if (curSelected == 6)
		{
			cooloptiontext.text = "Middle Scroll, puts your notes in the middle and disables dads notes: " + CoolGameDataStuff.middlescroll;
		}
	}

	function changeSelection(change:Int = 0)
	{
		#if !switch
		NGio.logEvent('Fresh');
		#end

		FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);

		curSelected += change;

		if (curSelected < 0)
			curSelected = grpControls.length - 1;
		if (curSelected >= grpControls.length)
			curSelected = 0;

		// selector.y = (70 * curSelected) + 30;

		var bullShit:Int = 0;

		for (item in grpControls.members)
		{
			item.targetY = bullShit - curSelected;
			bullShit++;

			item.alpha = 0.6;
			// item.setGraphicSize(Std.int(item.width * 0.8));

			if (item.targetY == 0)
			{
				item.alpha = 1;
				// item.setGraphicSize(Std.int(item.width));
			}
		}
	}
}
