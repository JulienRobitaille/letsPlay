/**
 * Created by damon-karelab on 1/24/2015.
 */
package com.letsplay.game.ui.answerBubble {
import com.drawm.mvc.Page;
import com.drawm.mvc.controler.Controller;
import com.drawm.mvc.model.Model;
import com.drawm.ui.interactive.IInteractiveUI;
import com.letsplay.data.Choice;
import com.letsplay.game.BubbleEvent;
import com.letsplay.game.ui.answerBubble.event.AnswerBubbleEvent;

import starling.events.Touch;

public class AnswerBubbleController extends Controller {
	public function AnswerBubbleController(model:Model, page:Page) {
		super(model, page);
	}

	override protected function click(touch:Touch):void {
		super.click(touch);

		if(touch.target is IInteractiveUI){
			var choices : Choice = (this._model as AnswerBubbleModel).choices[parseInt((touch.target as IInteractiveUI).id)];

			this._page.dispatchEventWith(AnswerBubbleEvent.CLICK_ANSWER, true, choices);
		}

	}
}
}
