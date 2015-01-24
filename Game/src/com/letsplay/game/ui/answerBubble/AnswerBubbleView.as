/**
 * Created by damon-karelab on 1/24/2015.
 */
package com.letsplay.game.ui.answerBubble {
import com.drawm.mvc.model.Model;
import com.drawm.mvc.view.View;
import com.drawm.ui.text.InteractiveText;
import com.letsplay.data.Choice;
import com.letsplay.game.ui.answerBubble.event.AnswerBubbleEvent;

public class AnswerBubbleView extends View {

	private var answersText : Vector.<InteractiveText> = new <InteractiveText>[];

	public function AnswerBubbleView(model:Model) {
		super(model);
	}

	override public function resume():void {
		this._model.addEventListener(AnswerBubbleEvent.SHOW_ANSWERS, onShowAnswers);

		super.resume();
	}
	override public function pause():void {
		this._model.removeEventListener(AnswerBubbleEvent.SHOW_ANSWERS, onShowAnswers);

		super.pause();
	}

	private function onShowAnswers(event:AnswerBubbleEvent):void {
		this.removeChildren(0,-1,true);
		answersText.length = 0;
		var data : Vector.<Choice> = event.data.choices as Vector.<Choice>;
		var text : InteractiveText;
		for(var i : int = 0 ; i < data.length ; i++){
			//text = new InteractiveText();
		}
	}
}
}
