/**
 * Created by damon-karelab on 1/25/2015.
 */
package com.letsplay {
import com.letsplay.utils.Sounds;

import flash.media.Sound;

public class SoundsAssets {

	[Embed(source="/../assets/sounds/Cat_Angry-001.mp3")]
	private static var cat_angry_001Class:Class;
	private static var cat_angry_001:Sounds = new Sounds(new cat_angry_001Class(), { volume: 0.5, autoPlay: false });

	[Embed(source="/../assets/sounds/Cat_Angry-002.mp3")]
	private static var cat_angry_002Class:Class;
	private static var cat_angry_002:Sounds = new Sounds(new cat_angry_002Class(), { volume: 0.5, autoPlay: false });

	[Embed(source="/../assets/sounds/Cat_Meow-001.mp3")]
	private static var cat_meow_001Class:Class;
	private static var cat_meow_001:Sounds = new Sounds(new cat_meow_001Class(), { volume: 0.5, autoPlay: false });

	[Embed(source="/../assets/sounds/Cat_Meow-002.mp3")]
	private static var cat_meow_002Class:Class;
	private static var cat_meow_002:Sounds = new Sounds(new cat_meow_002Class(), { volume: 0.5, autoPlay: false });

	[Embed(source="/../assets/sounds/Cat_Meow-003.mp3")]
	private static var cat_meow_003Class:Class;
	private static var cat_meow_003:Sounds = new Sounds(new cat_meow_003Class(), { volume: 0.5, autoPlay: false });

	[Embed(source="/../assets/sounds/Cat_Meow-004.mp3")]
	private static var cat_meow_004Class:Class;
	private static var cat_meow_004:Sounds = new Sounds(new cat_meow_004Class(), { volume: 0.5, autoPlay: false });

	[Embed(source="/../assets/sounds/Cat_Meow-005.mp3")]
	private static var cat_meow_005Class:Class;
	private static var cat_meow_005:Sounds = new Sounds(new cat_meow_005Class(), { volume: 0.5, autoPlay: false });

	[Embed(source="/../assets/sounds/Cat_Meow-006.mp3")]
	private static var cat_meow_006Class:Class;
	private static var cat_meow_006:Sounds = new Sounds(new cat_meow_006Class(), { volume: 0.5, autoPlay: false });

	[Embed(source="/../assets/sounds/Cat_Purr.mp3")]
	private static var cat_purrClass:Class;
	private static var cat_purr:Sounds = new Sounds(new cat_purrClass(), { volume: 0.5, autoPlay: false });

	[Embed(source="/../assets/sounds/Kid_Angry-001.mp3")]
	private static var kid_angry_001Class:Class;
	private static var kid_angry_001:Sounds = new Sounds(new kid_angry_001Class(), { volume: 0.5, autoPlay: false });

	[Embed(source="/../assets/sounds/Kid_Angry-002.mp3")]
	private static var kid_angry_002Class:Class;
	private static var kid_angry_002:Sounds = new Sounds(new kid_angry_002Class(), { volume: 0.5, autoPlay: false });

	[Embed(source="/../assets/sounds/Kid_Angry-003.mp3")]
	private static var kid_angry_003Class:Class;
	private static var kid_angry_003:Sounds = new Sounds(new kid_angry_003Class(), { volume: 0.5, autoPlay: false });

	[Embed(source="/../assets/sounds/Kid_Happy-001.mp3")]
	private static var kid_happy_001Class:Class;
	private static var kid_happy_001:Sounds = new Sounds(new kid_happy_001Class(), { volume: 0.5, autoPlay: false });

	[Embed(source="/../assets/sounds/Kid_Happy-002.mp3")]
	private static var kid_happy_002Class:Class;
	private static var kid_happy_002:Sounds = new Sounds(new kid_happy_002Class(), { volume: 0.5, autoPlay: false });

	[Embed(source="/../assets/sounds/Kid_Happy-003.mp3")]
	private static var kid_happy_003Class:Class;
	private static var kid_happy_003:Sounds = new Sounds(new kid_happy_003Class(), { volume: 0.5, autoPlay: false });

	[Embed(source="/../assets/sounds/Narration.mp3")]
	private static var narrationClass:Class;
	private static var narration:Sounds = new Sounds(new narrationClass(), { volume: 0.5, autoPlay: false });

	[Embed(source="/../assets/sounds/Shuuut-001.mp3")]
	private static var shuuut_001Class:Class;
	private static var shuuut_001:Sounds = new Sounds(new shuuut_001Class(), { volume: 0.5, autoPlay: false });

	[Embed(source="/../assets/sounds/Shuuut-002.mp3")]
	private static var shuuut_002Class:Class;
	private static var shuuut_002:Sounds = new Sounds(new shuuut_002Class(), { volume: 0.5, autoPlay: false });

	[Embed(source="/../assets/sounds/Shuuut-003.mp3")]
	private static var shuuut_003Class:Class;
	private static var shuuut_003:Sounds = new Sounds(new shuuut_003Class(), { volume: 0.5, autoPlay: false });

	[Embed(source="/../assets/sounds/kid_sad_001.mp3")]
	private static var kid_sad_001Class:Class;
	private static var kid_sad_001:Sounds = new Sounds(new kid_sad_001Class(), { volume: 0.5, autoPlay: false });


	[Embed(source="/../assets/sounds/theater.mp3")]
	private static var theaterClass:Class;
	public static var theater:Sounds = new Sounds(new theaterClass(), { volume: 0.2, autoPlay: false, loop : true });

	[Embed(source="/../assets/sounds/theater.mp3")]
	private static var applause_lowClass:Class;
	public static var applause_low:Sounds = new Sounds(new applause_lowClass(), { volume: 0.2, autoPlay: false, loop : false });




	private static const angryCatArray:Array = [
		cat_angry_001,
		cat_angry_002
	];
	private static const purrCatArray:Array = [
		cat_purr
	];
	private static const meowCatArray:Array = [
		cat_meow_001,
		cat_meow_002,
		cat_meow_003,
		cat_meow_004,
		cat_meow_005,
		cat_meow_006
	];
	private static const angryKidArray:Array = [
		kid_angry_001,
		kid_angry_002,
		kid_angry_003
	];
	private static const happyKidArray:Array = [
		kid_happy_001,
		kid_happy_002,
		kid_happy_003
	];
	private static const shutArray:Array = [
		shuuut_001,
		shuuut_002,
		shuuut_003
	];
	private static const sadKidArray:Array = [
		kid_sad_001,
	];

	public function SoundsAssets() {}

	public static function get catAngry():Sounds{
		return getRandomSoundFromArray(angryCatArray);
	};
	public static function get catPurr():Sounds{
		return getRandomSoundFromArray(purrCatArray);
	};
	public static function get catMeow():Sounds{
		return getRandomSoundFromArray(meowCatArray);
	};
	public static function get kidAngry():Sounds{
		return getRandomSoundFromArray(angryKidArray);
	};
	public static function get kidHappy():Sounds{
		return getRandomSoundFromArray(happyKidArray);
	};
	public static function get shut():Sounds{
		return getRandomSoundFromArray(shutArray);
	};
	public static function get kidSad():Sounds{
		return getRandomSoundFromArray(sadKidArray);
	};

	private static function getRandomSoundFromArray(soundArray:Array):Sounds{
		var index : int = Math.floor(Math.random()*soundArray.length);
		var sound:Sounds =  soundArray[index];
		return sound;
	}
}
}
