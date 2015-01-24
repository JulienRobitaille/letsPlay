/**
 * Created by damon-karelab on 1/24/2015.
 */
package com.letsplay.game.ui.answerBubble {
import com.drawm.mvc.model.Model;
import com.letsplay.data.Choice;
import com.letsplay.game.ui.answerBubble.event.AnswerBubbleEvent;

public class AnswerBubbleModel extends Model {
	public var choices:Vector.<Choice>;
	public function AnswerBubbleModel() {
		super();
	}


	override public function resume():void {
		super.resume();

		dispatchEventWith(AnswerBubbleEvent.SHOW_ANSWERS, false, { width:300, choices : this.choices });
	}

	public function overAnswer(id:String):void {
		dispatchEventWith(AnswerBubbleEvent.OVER_ANSWER, false, { id : id});
	}
}
}
