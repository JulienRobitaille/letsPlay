/**
 * Created by damon-karelab on 1/24/2015.
 */
package com.letsplay.game.ui.answerBubble {
import com.letsplay.game.*;
import com.drawm.mvc.Page;
import com.letsplay.data.Choice;
import com.letsplay.game.ui.answerBubble.AnswerBubbleModel;
import com.letsplay.game.ui.answerBubble.AnswerBubbleView;

public class AnswerBubble extends Page {
	public function AnswerBubble(choices:Vector.<Choice>, width : int) {
		super(AnswerBubbleModel,AnswerBubbleView,AnswerBubbleController);

		var model : AnswerBubbleModel = this._model as AnswerBubbleModel;
		model.width = width;
		model.choices = choices;

	}
}
}
