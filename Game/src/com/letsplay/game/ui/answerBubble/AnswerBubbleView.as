/**
 * Created by damon-karelab on 1/24/2015.
 */
package com.letsplay.game.ui.answerBubble {
import com.drawm.mvc.model.Model;
import com.drawm.mvc.view.View;
import com.drawm.ui.UI;
import com.drawm.ui.text.InteractiveText;
import com.greensock.TweenLite;
import com.letsplay.data.Choice;
import com.letsplay.game.ui.answerBubble.event.AnswerBubbleEvent;

import starling.display.DisplayObject;

import starling.events.Event;

import starling.text.TextFieldAutoSize;

public class AnswerBubbleView extends View {
	private var answersText : Vector.<InteractiveText> = new <InteractiveText>[];

	public function AnswerBubbleView(model:Model) {
		super(model);
	}

	override public function resume():void {
		this._model.addEventListener(AnswerBubbleEvent.SHOW_ANSWERS, onShowAnswers);
		this._model.addEventListener(AnswerBubbleEvent.OVER_ANSWER, onOverAnswer);

		super.resume();
	}
	override public function pause():void {
		this._model.removeEventListener(AnswerBubbleEvent.SHOW_ANSWERS, onShowAnswers);
		this._model.removeEventListener(AnswerBubbleEvent.OVER_ANSWER, onOverAnswer);

		super.pause();
	}

	private function onOverAnswer(event:Event):void {
		var child : DisplayObject;
		for(var i : int = 0 ; i < this.numChildren ; i++){
			child = this.getChildAt(i);
			if(child is InteractiveText){
				TweenLite.killTweensOf(child);
				TweenLite.to(child, .5, {alpha : 1});
			}
		}

		var answer : DisplayObject = UI.getUI(event.data.id) as DisplayObject;
		TweenLite.killTweensOf(answer);
		TweenLite.to(answer, .5, {alpha : .8});
	}

	private function onShowAnswers(event:Event):void {
		this.removeChildren(0,-1,true);
		answersText.length = 0;
		var data : Vector.<Choice> = event.data.choices as Vector.<Choice>;
		var text : InteractiveText;
		var nextY : int = 0;
		for(var i : int = 0 ; i < data.length ; i++){
			text = new InteractiveText(data[i].id, event.data.width, 20, data[i].text, "fluorine", 24);
			text.autoSize = TextFieldAutoSize.VERTICAL;
			addChild(text);
			text.y = nextY;

			nextY += text.height;
		}
	}
}
}
