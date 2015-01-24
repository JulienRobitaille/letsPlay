/**
 * Created by damon-karelab on 1/24/2015.
 */
package com.letsplay.game {
import com.drawm.mvc.model.Model;
import com.drawm.mvc.view.View;
import com.letsplay.game.ui.TextBubble;

import starling.events.Event;

import starling.text.TextField;

public class GameView extends View {
	private var model:GameModel;
	public function GameView(model:Model) {
		this.model = model as GameModel;

		super(model);
	}

	private function onShowText(event:Event):void {
		var texts : Vector.<String> = event.data.texts as Vector.<String>;
		for(var i : int = 0 ; i < texts.length; i++){
			var bubble : TextBubble = new TextBubble(texts[i]);
			addChild(bubble);

			var txt : TextField = new TextField(stage.stageWidth, 200, "default", "fluorine", 24, 0xFF0000);
			txt.text = texts[i] + "sfafas";
			addChild(txt);
		}
	}

	override public function resume():void {
		model.addEventListener(BubbleEvent.SHOW_TEXT, onShowText);
		super.resume();
	}

	override public function start():void {
		super.start();


	}
}
}
