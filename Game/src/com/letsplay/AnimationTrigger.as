/**
 * Created by damon-karelab on 1/25/2015.
 */
package com.letsplay {
import starling.events.Event;

public class AnimationTrigger extends Event {
	public static const CAT_FALL:String = "CAT_FALL";
	public static const KID_ANGRY:String = "KID_ANGRY";
	public static const KID_JUMP:String = "KID_JUMP";
	public static const KID_HAPPY:String = "KID_HAPPY";
	public static const PLAYER_SAD:String = "PLAYER_SAD";

	public function AnimationTrigger(type:String, bubbles:Boolean = false, data:Object = null) {
		super(type, bubbles, data);
	}
}
}
