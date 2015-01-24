/**
 * Created by damon-karelab on 1/24/2015.
 */
package com.letsplay.game {
import com.drawm.mvc.model.Model;
import com.letsplay.data.Choice;

public class GameModel extends Model {

	public const bubbleText : Vector.<String> = new <String>[];
	private var choices:Vector.<Choice>;

	public function GameModel() {
		super();
	}


	override public function start():void {

		bubbleText.push("blablabla text de coquin");
		bubbleText.push("plein d'autre text super long plein d'autre text super long plein d'autre text super long plein d'autre text super long ");

		choices.push(
			new Choice({text : "choix no 1 lool"}),
			new Choice({text : "choixasggsg no 2 lool"}),
			new Choice({text : "choix no 3 lfassgAGool"})
		);

		super.start();
	}


	override public function resume():void {
		super.resume();

		this.dispatchEventWith(BubbleEvent.SHOW_TEXT, false, {texts : bubbleText});
		this.dispatchEventWith(BubbleEvent.SHOW_ANSWER, false, {choices: choices});
	}
}
}
