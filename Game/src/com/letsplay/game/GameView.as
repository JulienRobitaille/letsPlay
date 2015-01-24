/**
 * Created by damon-karelab on 1/24/2015.
 */
package com.letsplay.game {
import com.drawm.mvc.model.Model;
import com.drawm.mvc.view.View;
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
			//this.bubble.dispose();
			this.bubble = null;
		}
		if(this.answerBubble){
			this.answerBubble.parent.removeChild(this.answerBubble);
			//this.answerBubble.dispose();
			this.answerBubble= null;
		}

		this.bubble = new TextBubble( dialog.text, stage.stageWidth * 0.8, 2 );
		addChild(bubble);
		bubble.x = (stage.stageWidth - bubble.width >> 1) + 25;
		bubble.y = stage.stageHeight * 0.11;

		answerBubble = new AnswerBubble(event.data.choices as Vector.<Choice>, bubble.width);
		addChild(answerBubble);
		answerBubble.x = (stage.stageWidth - answerBubble.width >> 1) - 25
		answerBubble.y = bubble.y + bubble.height + 25;
	}

	override public function start():void {
		super.start();
	}
}
}
