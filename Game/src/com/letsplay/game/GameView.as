/**
 * Created by damon-karelab on 1/24/2015.
 */
package com.letsplay.game {
import com.drawm.mvc.model.Model;
import com.drawm.mvc.view.View;
import com.greensock.TweenLite;
import com.letsplay.data.Choice;
import com.letsplay.data.Choice;
import com.letsplay.data.Dialog;
import com.letsplay.game.ui.TextBubble;
import com.letsplay.game.ui.answerBubble.AnswerBubble;

import starling.events.Event;

public class GameView extends View {
	private var model:GameModel;
	private var bubble:TextBubble;
	private var answerBubble:AnswerBubble;

	public function GameView(model:Model) {
		this.model = model as GameModel;

		super(model);
	}

	override public function resume():void {
		model.addEventListener(BubbleEvent.SHOW_BUBBLE, onShowBubble);
		super.resume();
	}
	override public function pause():void {
		model.addEventListener(BubbleEvent.SHOW_BUBBLE, onShowBubble);
		super.pause();
	}

	private function onShowBubble(event:Event):void {
		var dialog : Dialog = event.data as Dialog;

		if(this.bubble){
			this.bubble.parent.removeChild(this.bubble);
			this.bubble = null;
		}

		if(this.answerBubble){
			this.answerBubble.parent.removeChild(this.answerBubble);
			this.answerBubble= null;
		}

		this.bubble = new TextBubble( dialog.text, stage.stageWidth * 0.8, 2 );
		this.bubble.addEventListener(Event.COMPLETE, showAnswers)
		this.bubble.alpha = 0;
		addChild(bubble);
		bubble.x = (stage.stageWidth - bubble.width >> 1);
		bubble.y = stage.stageHeight * 0.08;
		TweenLite.to(this.bubble, .5, { alpha : 1 });


		this.answerBubble = new AnswerBubble(event.data.choices as Vector.<Choice>, bubble.width);
		this.answerBubble.alpha = 0;
		this.addChild(this.answerBubble);
		this.answerBubble.x = (stage.stageWidth - this.answerBubble.width >> 1);
		this.answerBubble.y = stage.stageHeight*0.65;
	}

	private function showAnswers(event:Event):void {
		event.target.removeEventListener(event.type, arguments.callee);
		TweenLite.to(this.answerBubble, .5, { alpha : 1 });

	}

	override public function start():void {
		super.start();
	}
}
}
