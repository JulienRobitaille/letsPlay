/**
 * Created by damon-karelab on 1/24/2015.
 */
package com.letsplay.game.ui.answerBubble {
import com.drawm.mvc.model.Model;
import com.drawm.mvc.view.View;
import com.drawm.ui.text.InteractiveText;
import com.letsplay.data.Choice;
import com.letsplay.game.ui.answerBubble.event.AnswerBubbleEvent;

import starling.display.Quad;

import starling.events.Event;
import starling.text.TextField;

import starling.text.TextFieldAutoSize;
import starling.utils.HAlign;

public class AnswerBubbleView extends View {
	private var answersText : Vector.<InteractiveText> = new <InteractiveText>[];
	private var model:AnswerBubbleModel;
	private var background:Quad;
	private var backgroundBorder:Quad;
	private var nameTextfield : TextField;

	public function AnswerBubbleView(model:Model) {
		super(model);

		this.model = model as AnswerBubbleModel;
	}

	override public function resume():void {
		//this.model.addEventListener(AnswerBubbleEvent.OVER_ANSWER, onOverAnswer);
		this.model.addEventListener(AnswerBubbleEvent.SHOW_ANSWERS, onShowAnswers);

		super.resume();
	}
	override public function pause():void {
		this.model.removeEventListener(AnswerBubbleEvent.SHOW_ANSWERS, onShowAnswers);
		//this.model.removeEventListener(AnswerBubbleEvent.OVER_ANSWER, onOverAnswer);

		super.pause();
	}

	//private function onOverAnswer(event:Event):void {
	//	var child : DisplayObject;
	//	for(var i : int = 0 ; i < this.numChildren ; i++){
	//		child = this.getChildAt(i);
	//		if(child is InteractiveText){
	//			TweenLite.killTweensOf(child);
	//			TweenLite.to(child, .5, {alpha : 1});
	//		}
	//	}
	//
	//	var answer : DisplayObject = UI.getUI(event.data.id) as DisplayObject;
	//	TweenLite.killTweensOf(answer);
	//	TweenLite.to(answer, .5, {alpha : .8});
	//}

	private function onShowAnswers(event:Event):void {
		this.removeChildren(0,-1,true);

		this.nameTextfield ||= new TextField(event.data.width, 20," You : ", "fluorine", 24);
		this.nameTextfield.autoSize = TextFieldAutoSize.VERTICAL;
		this.nameTextfield.hAlign = HAlign.LEFT;
		this.addChild(this.nameTextfield);

		answersText.length = 0;
		var data : Vector.<Choice> = event.data.choices as Vector.<Choice>;
		var text : InteractiveText;
		var nextY : int = nameTextfield.height;
		for(var i : int = 0 ; i < data.length ; i++){
			text = new InteractiveText(i.toString(), event.data.width, 20, " > "+data[i].text, "fluorine", 24);
			text.autoSize = TextFieldAutoSize.VERTICAL;
			text.hAlign = HAlign.LEFT;
			addChild(text);
			text.y = nextY;

			nextY += text.height;
		}

		background = new Quad(event.data.width-2, nextY-2, 0xFFFFFF);
		addChildAt(background,0);

		backgroundBorder = new Quad(event.data.width, nextY, 0);
		addChildAt(backgroundBorder,0);

		this.backgroundBorder.x = event.data.width - this.backgroundBorder.width >>1;
		this.backgroundBorder.y = nextY - this.backgroundBorder.height>>1;
		this.background.x = event.data.width - this.background.width >>1;
		this.background.y = nextY - this.background.height >>1;

	}
}
}
