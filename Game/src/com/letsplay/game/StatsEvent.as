/**
 * Created by damon-karelab on 1/25/2015.
 */
package com.letsplay.game {
import starling.events.Event;

public class StatsEvent extends Event {

	public static const CHANGE_STATS : String = "CHANGE_STATS";
	public static const APPLY_STATS : String = "APPLY_STATS";

	public function StatsEvent(type:String, bubbles:Boolean = false, data:Object = null) {
		super(type, bubbles, data);
	}
}
}
