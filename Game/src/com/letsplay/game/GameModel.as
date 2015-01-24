/**
 * Created by damon-karelab on 1/24/2015.
 */
package com.letsplay.game {
import com.drawm.mvc.model.Model;
import com.letsplay.data.Choice;
import com.letsplay.data.DialogTree;

public class GameModel extends Model {

	public const bubbleText : Vector.<String> = new <String>[];
	private var choices:Vector.<Choice> = new <Choice>[];
	private var dialogTree:DialogTree;

	public function GameModel() {
		super();

		this.dialogTree ||= new DialogTree();
	}


	override public function start():void {

		bubbleText.push("blablabla text de coquin");
		bubbleText.push("plein d'autre text super long plein d'autre text super long plein d'autre text super long plein d'autre text super long ");

		choices.push(
			new Choice({ id: "answerID_1", text : "choix no 1 lool"}),
			new Choice({ id: "answerID_2", text : "choixasggsg no 2 lool"}),
			new Choice({ id: "answerID_3", text : "choix no 3 lfassgAGool"})
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
