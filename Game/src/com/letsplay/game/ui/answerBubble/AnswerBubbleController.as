/**
 * Created by damon-karelab on 1/24/2015.
 */
package com.letsplay.game.ui.answerBubble {
import com.drawm.mvc.Page;
import com.drawm.mvc.controler.Controller;
import com.drawm.mvc.model.Model;
import com.drawm.ui.interactive.IInteractiveUI;

import starling.events.Touch;

public class AnswerBubbleController extends Controller {
	public function AnswerBubbleController(model:Model, page:Page) {
		super(model, page);
	}

	override protected function over(touch:Touch):void {
		super.over(touch);

		if(touch.target is IInteractiveUI){
			(this._model as AnswerBubbleModel).overAnswer((touch.target as IInteractiveUI).id);
		}

	}
}
}
