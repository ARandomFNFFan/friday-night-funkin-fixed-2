package;

import flixel.FlxState;
import flixel.FlxG;

class CoolGameDataStuff extends FlxState
{
    //COOL GAME DATA SETTINGS POG
    static public var dfjk:Bool = false;
	static public var ghost:Bool = false;
	static public var advancedscore:Bool = false;
    static public var hitsound:Bool = false;
    static public var chadui:Bool = false;
	static public var middlescroll:Bool = false; //the thing im not adding soon lmaooooo
    //that text did not age well at all lmao

    static public var gameName:Array<String> = ["Friday", "Night", "Funkin"]; // games name for stuff

    static public var devs:Array<String> = ["ninjamuffin", "phantom arcade", "kawaisprite", "EvilSkr", "Bam"]; // self explanitory

    static public var weekData:Array<Dynamic> = [
		['Tutorial'],
		['Bopeebo', 'Fresh', 'Dadbattle'],
		['Spookeez', 'South', "Monster"],
		['Pico', 'Philly', "Blammed"],
		['Satin-Panties', "High", "Milf"],
		['Cocoa', 'Eggnog', 'Winter-Horrorland'], //BAD WEEK
		['Senpai', 'Roses', 'Thorns']
	]; //ripped from story menu

    static public var weekCharacters:Array<Dynamic> = [
		['dad', 'bf', 'gf'],
		['dad', 'bf', 'gf'],
		['spooky', 'bf', 'gf'],
		['pico', 'bf', 'gf'],
		['mom', 'bf', 'gf'],
		['parents-christmas', 'bf', 'gf'], //WORST FUCKIGN WEEK
		['senpai', 'bf', 'gf']
	]; //also ripped from sotry menu

	static public var weekNames:Array<String> = [
		"Tutorial with your funky gf",
		"Daddy Dearest",
		"Spooky Month",
		"PICO",
		"MOMMY MUST MURDER",
		"RED SNOW", //FUCK YOU WEEK5
		"hating simulator ft. moawling"
	]; //fuck

    override public function create():Void
    {
        super.create();
    }

    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);
    }
}