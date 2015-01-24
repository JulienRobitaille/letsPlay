/**
 * Created by damon-karelab on 1/24/2015.
 */
package com.letsplay.game {
import starling.events.Event;

public class BubbleEvent extends Event {
	public static const SHOW_TEXT:String = "SHOW_TEXT";
	public function BubbleEvent(type:String, bubbles:Boolean = false, data:Object = null) {
		super(type, bubbles, data);
	}
}
}
