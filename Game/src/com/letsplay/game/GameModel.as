/**
 * Created by damon-karelab on 1/24/2015.
 */
package com.letsplay.game {
import com.drawm.mvc.model.Model;
import com.letsplay.data.Choice;
import com.letsplay.data.Dialog;
import com.letsplay.data.DialogTree;

public class GameModel extends Model {

	public const bubbleText : Vector.<String> = new <String>[];
	private var choices:Vector.<Choice> = new <Choice>[];
	private var dialogTree:DialogTree;
	private var currentDialog:Dialog;

	public function GameModel() {
		super();

		this.dialogTree ||= new DialogTree();

		this.dialogTree.add("startDialog", new Dialog({
			text : "Do you wanna play with me?",
			choices : Vector.<Choice>([
				new Choice({
					text : "NO YOU STINK!",
					destinationId : "kidAngry_1",
					stats : {
						parents : 5,
						kid : -5
					}
				}),
				new Choice({
					text : "With pleasure!",
					destinationId : "parentsBored_1",
					stats : {
						parents : -5,
						kid : 5
					}
				})
			])
		}));

		this.dialogTree.add("parentsBored_1", new Dialog({
			text : "YAY! Lets play pretend!",
			choices : Vector.<Choice>([
				new Choice({
					text : "This game suck! lets play ball!",
					destinationId : "kidAngry_3",
					stats : {
						parents : 5,
						kid : -5
					}
				}),
				new Choice({
					text : "Even better! Lets make mud cake!",
					destinationId : "parentsBored_3",
					stats : {
						parents : -5,
						kid : 5
					}
				})
			])
		}));

		this.dialogTree.add("kidAngry_1", new Dialog({
			text : "NO YOU STINK! IMM GONNA TELL MOMMY!!",
			choices : Vector.<Choice>([
				new Choice({
					text : "LIAR!",
					destinationId : "kidAngry_2",
					stats : {
						parents : 5,
						kid : -5
					}
				}),
				new Choice({
					text : "Please don't... i'm sorry",
					destinationId : "parentsBored_2",
					stats : {
						parents : -5,
						kid : 5
					}
				})
			])
		}))

	}


	override public function start():void {

		this.currentDialog = dialogTree.get("startDialog");

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

		this.dispatchEventWith(BubbleEvent.SHOW_BUBBLE, false, this.currentDialog);

		//this.dispatchEventWith(BubbleEvent.SHOW_TEXT, false, {texts : bubbleText});
		//this.dispatchEventWith(BubbleEvent.SHOW_ANSWER, false, {choices: choices});
	}

	public function goToDialog(destinationId:String):void {
		this.currentDialog = dialogTree.get(destinationId);
		this.dispatchEventWith(BubbleEvent.SHOW_BUBBLE, false, this.currentDialog);
	}
}
}
