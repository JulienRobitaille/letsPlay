/**
 * Created by damon-karelab on 1/25/2015.
 */
package com.letsplay {
import starling.events.Event;

public class AnimationTrigger extends Event {
	public static const CAT_FALL:String = "CAT_FALL";
	public static const KID_JUMP:String = "KID_JUMP";
	public static const KID_HAPPY:String = "KID_HAPPY";
	public static const KID_SAD:String = "KID_SAD";
	public static const KID_MAD:String = "KID_MAD";
	public static const PLAYER_SAD:String = "PLAYER_SAD";
	public static const PLAYER_MAD:String = "PLAYER_MAD";
	public static const PLAYER_HAPPY:String = "PLAYER_HAPPY";

	public static const CAT_PURR:String = "CAT_PURR";
	public static const CAT_MEOW:String = "CAT_MEOW";
	public static const PLAYER_IDLE:String = "PLAYER_IDLE";
	public static const KID_IDLE:String = "KID_IDLE";

	public static const GOOD_END:String = "GOOD_END";
	public static const BAD_END:String = "BAD_END";



	public function AnimationTrigger(type:String, bubbles:Boolean = false, data:Object = null) {
		super(type, bubbles, data);
	}
}
}
