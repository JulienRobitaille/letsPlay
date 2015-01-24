/**
 * Created by damon-karelab on 1/24/2015.
 */
package com.letsplay.game.ui.answerBubble.event {
import starling.events.Event;

public class AnswerBubbleEvent extends Event {
	public static const SHOW_ANSWERS:String = "SHOW_ANSWERS";
	public static const OVER_ANSWER:String = "OVER_ANSWER";

	public function AnswerBubbleEvent(type:String, bubbles:Boolean = false, data:Object = null) {
		super(type, bubbles, data);
	}
}
}
