/**
 * Created by damon-karelab on 1/24/2015.
 */
package com.letsplay.game {
import com.drawm.mvc.Page;
import com.drawm.mvc.controler.Controller;
import com.drawm.mvc.model.Model;
import com.letsplay.StateEvent.StateEvent;
import com.letsplay.data.Choice;
import com.letsplay.data.Dialog;
import com.letsplay.game.ui.answerBubble.event.AnswerBubbleEvent;

import starling.events.Event;

public class GameController extends Controller {
	private var model:GameModel;
	public function GameController(model:Model, page:Page) {

		this.model = model as GameModel;

		super(model, page);
	}


	override public function resume():void {
		this._page.addEventListener(AnswerBubbleEvent.CLICK_ANSWER, onClickAnswer);
		super.resume();
	}

	override public function pause():void {
		this._page.addEventListener(AnswerBubbleEvent.CLICK_ANSWER, onClickAnswer);
		super.pause();
	}

	private function onClickAnswer(event:Event):void {
		var id : String = (event.data as Choice).destinationId;
		if(this.model.getDialog(id) == null){
			this._page.dispatchEventWith(StateEvent.ACTCHANGE);
		}else{
			this.model.goToDialog(id);

		}

	}
}
}
