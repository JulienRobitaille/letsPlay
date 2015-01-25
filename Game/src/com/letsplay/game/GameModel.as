/**
 * Created by damon-karelab on 1/24/2015.
 */
package com.letsplay.game {
import com.drawm.mvc.model.Model;
import com.letsplay.AnimationTrigger;
import com.letsplay.GlobalDispatcher;
import com.letsplay.I18n;
import com.letsplay.data.Choice;
import com.letsplay.data.Dialog;
import com.letsplay.data.DialogTree;

import flash.utils.setTimeout;

public class GameModel extends Model {

	private var dialogTree:DialogTree;
	private var currentDialog:Dialog;

	public function GameModel() {
		super();

		this.dialogTree ||= new DialogTree();

		//#1
		this.dialogTree.add("startDialog", new Dialog({
			text :I18n.QUESTION1,
			choices : Vector.<Choice>([
				new Choice({
					text :I18n.CHOICE1,
					destinationId : "#2",
					animationTrigger : [],
					stats : {
						people : 0,
						kid : 0
					}
				}),
				new Choice({
					text : I18n.CHOICE2,
					destinationId : "#2",
					animationTrigger : [],
					stats : {
						parents : 0,
						kid : 0
					}
				}),
				new Choice({
					text : I18n.CHOICE3,
					destinationId : "#3",
					animationTrigger : [],
					stats : {
						parents : 0,
						kid : 0
					}
				})
			])
		}));

		//#2
		this.dialogTree.add("#2", new Dialog({
			text :I18n.QUESTION2,
			choices : Vector.<Choice>([
				new Choice({
					text :I18n.CHOICE4,
					destinationId : "#4",
					animationTrigger : [AnimationTrigger.PLAYER_SAD],
					stats : {
						people : 1,
						kid : 0
					}
				}),
				new Choice({
					text :I18n.CHOICE5,
					destinationId : "#5",
					animationTrigger : [],
					stats : {
						parents : 0,
						kid : 1
					}
				}),
				new Choice({
					text :I18n.CHOICE6,
					destinationId : "#4",
					animationTrigger : [],
					stats : {
						parents : 0,
						kid : 1
					}
				})
			])
		}));

		//#3
		this.dialogTree.add("#3", new Dialog({
			text :I18n.QUESTION3,
			choices : Vector.<Choice>([
				new Choice({
					text :I18n.CHOICE7,
					destinationId : "#2",
					animationTrigger : [],
					stats : {
						people : 1,
						kid : 0
					}
				}),
				new Choice({
					text :I18n.CHOICE8,
					destinationId : "#2",
					animationTrigger : [AnimationTrigger.KID_MAD],
					stats : {
						parents : 0,
						kid : 1
					}
				}),
				new Choice({
					text :I18n.CHOICE9,
					destinationId : "#3",
					animationTrigger : [],
					stats : {
						parents : -1,
						kid : -1
					}
				})
			])
		}));
		//#4
		this.dialogTree.add("#4", new Dialog({
			text :I18n.QUESTION4,
			choices : Vector.<Choice>([
				new Choice({
					text :I18n.CHOICE10,
					destinationId : "#6",
					animationTrigger : [AnimationTrigger.CAT_FALL, AnimationTrigger.KID_HAPPY,AnimationTrigger.PLAYER_HAPPY],
					stats : {
						people : 0,
						kid : 1
					}
				}),
				new Choice({
					text :I18n.CHOICE11,
					destinationId : "#7",
					animationTrigger : [AnimationTrigger.CAT_FALL, AnimationTrigger.KID_MAD,AnimationTrigger.PLAYER_HAPPY],
					stats : {
						parents : 1,
						kid : 0
					}
				}),
				new Choice({
					text :I18n.CHOICE12,
					destinationId : "#7",
					animationTrigger : [AnimationTrigger.CAT_FALL, AnimationTrigger.KID_HAPPY,AnimationTrigger.PLAYER_HAPPY],
					stats : {
						parents : -1,
						kid : -1
					}
				})
			])
		}));
		//#5
		this.dialogTree.add("#5", new Dialog({
			text :I18n.QUESTION5,
			choices : Vector.<Choice>([
				new Choice({
					text :I18n.CHOICE13,
					destinationId : "#7",
					animationTrigger : [AnimationTrigger.CAT_FALL],
					stats : {
						people : 1,
						kid : 0
					}
				}),
				new Choice({
					text :I18n.CHOICE14,
					destinationId : "#6",
					animationTrigger : [AnimationTrigger.CAT_FALL],
					stats : {
						parents : 0,
						kid : 1
					}
				}),
				new Choice({
					text :I18n.CHOICE15,
					destinationId : "#7",
					animationTrigger : [AnimationTrigger.CAT_FALL],
					stats : {
						parents : -1,
						kid : -1
					}
				})
			])
		}));
		//#6
		this.dialogTree.add("#6", new Dialog({
			text :I18n.QUESTION6,
			choices : Vector.<Choice>([
				new Choice({
					text :I18n.CHOICE16,
					destinationId : "act-fin",
					animationTrigger : [AnimationTrigger.KID_HAPPY,AnimationTrigger.PLAYER_HAPPY],
					stats : {
						people : -1,
						kid : -1
					}
				})
			])
		}));
		//#7
		this.dialogTree.add("#7", new Dialog({
			text :I18n.QUESTION7,
			choices : Vector.<Choice>([
				new Choice({
					text :I18n.CHOICE17,
					destinationId : "act-fin",
					animationTrigger : [AnimationTrigger.KID_HAPPY,AnimationTrigger.PLAYER_HAPPY],
					stats : {
						people : -1,
						kid : -1
					}
				})
			])
		}));
	}

	public function changeAct( $id:int ):void{

		this.dialogTree = new DialogTree();

		switch ( $id ) {
			case 2:
				this.act2()

				break;

			case 3:
				this.act3()
				break;
		}

		this.currentDialog = dialogTree.get("startDialog");
		this.showCurrentDialog();
	}

	private function act2():void{

		//#1
		this.dialogTree.add("startDialog", new Dialog({
			text :I18n.QUESTION8,
			choices : Vector.<Choice>([
				new Choice({
					text :I18n.CHOICE18,
					destinationId : "#2",
					animationTrigger : [AnimationTrigger.PLAYER_HAPPY,AnimationTrigger.KID_HAPPY],
					stats : {
						people : 0,
						kid : 0
					}
				}),
				new Choice({
					text : I18n.CHOICE19,
					destinationId : "#3",
					animationTrigger : [AnimationTrigger.PLAYER_MAD,AnimationTrigger.KID_MAD],
					stats : {
						parents : 0,
						kid : 0
					}
				}),
				new Choice({
					text : I18n.CHOICE20,
					destinationId : "#4",
					animationTrigger : [],
					stats : {
						parents : 0,
						kid : 0
					}
				})
			])
		}));

		//#2
		this.dialogTree.add("#2", new Dialog({
			text :I18n.QUESTION9,
			choices : Vector.<Choice>([
				new Choice({
					text :I18n.CHOICE21,
					destinationId : "#5",
					animationTrigger : [],
					stats : {
						people : 0,
						kid : 0
					}
				}),
				new Choice({
					text : I18n.CHOICE22,
					destinationId : "#6",
					animationTrigger : [],
					stats : {
						parents : 0,
						kid : 0
					}
				}),
				new Choice({
					text : I18n.CHOICE23,
					destinationId : "#4",
					animationTrigger : [AnimationTrigger.KID_MAD],
					stats : {
						parents : 0,
						kid : 0
					}
				})
			])
		}));

		//#3
		this.dialogTree.add("#3", new Dialog({
			text :I18n.QUESTION10,
			choices : Vector.<Choice>([
				new Choice({
					text :I18n.CHOICE24,
					destinationId : "#5",
					animationTrigger : [],
					stats : {
						people : 0,
						kid : 0
					}
				}),
				new Choice({
					text : I18n.CHOICE25,
					destinationId : "#6",
					animationTrigger : [],
					stats : {
						parents : 0,
						kid : 0
					}
				}),
				new Choice({
					text : I18n.CHOICE26,
					destinationId : "#4",
					animationTrigger : [AnimationTrigger.KID_MAD],
					stats : {
						parents : 0,
						kid : 0
					}
				})
			])
		}));

		//#4
		this.dialogTree.add("#4", new Dialog({
			text :I18n.QUESTION11,
			choices : Vector.<Choice>([
				new Choice({
					text :I18n.CHOICE27,
					destinationId : "#5",
					animationTrigger : [],
					stats : {
						people : 0,
						kid : 0
					}
				}),
				new Choice({
					text : I18n.CHOICE28,
					destinationId : "#6",
					animationTrigger : [AnimationTrigger.KID_MAD],
					stats : {
						parents : 0,
						kid : 0
					}
				}),
				new Choice({
					text : I18n.CHOICE29,
					destinationId : "#4",
					animationTrigger : [AnimationTrigger.KID_SAD],
					stats : {
						parents : 0,
						kid : 0
					}
				})
			])
		}));

		//#5
		this.dialogTree.add("#5", new Dialog({
			text :I18n.QUESTION12,
			choices : Vector.<Choice>([
				new Choice({
					text :I18n.CHOICE30,
					destinationId : "#7",
					animationTrigger : [AnimationTrigger.KID_HAPPY,AnimationTrigger.PLAYER_HAPPY],
					stats : {
						people : 0,
						kid : 0
					}
				}),
				new Choice({
					text : I18n.CHOICE31,
					destinationId : "#7",
					animationTrigger : [AnimationTrigger.KID_SAD,AnimationTrigger.PLAYER_SAD],
					stats : {
						parents : 0,
						kid : 0
					}
				})
			])
		}));

		//#6
		this.dialogTree.add("#6", new Dialog({
			text :I18n.QUESTION12,
			choices : Vector.<Choice>([
				new Choice({
					text :I18n.CHOICE32,
					destinationId : "#7",
					animationTrigger : [AnimationTrigger.KID_MAD,AnimationTrigger.PLAYER_MAD],
					stats : {
						people : 0,
						kid : 0
					}
				}),
				new Choice({
					text : I18n.CHOICE33,
					destinationId : "#7",
					animationTrigger : [AnimationTrigger.KID_HAPPY,AnimationTrigger.PLAYER_SAD],
					stats : {
						parents : 0,
						kid : 0
					}
				})
			])
		}));

		//#7
		this.dialogTree.add("#7", new Dialog({
			text :I18n.QUESTION12,
			choices : Vector.<Choice>([
				new Choice({
					text :I18n.CHOICE34,
					destinationId : "act-fin",
					animationTrigger : [AnimationTrigger.KID_MAD,AnimationTrigger.PLAYER_MAD],
					stats : {
						people : 0,
						kid : 0
					}
				})
			])
		}));

	}

	private function act3():void{
		//#1
		this.dialogTree.add("startDialog", new Dialog({
			text :I18n.QUESTION15,
			choices : Vector.<Choice>([
				new Choice({
					text :I18n.CHOICE35,
					destinationId : "#2",
					animationTrigger : [],
					stats : {
						people : 0,
						kid : 0
					}
				}),
				new Choice({
					text : I18n.CHOICE36,
					destinationId : "#3",
					animationTrigger : [],
					stats : {
						parents : 0,
						kid : 0
					}
				})
			])
		}));
		//#2
		this.dialogTree.add("#2", new Dialog({
			text :I18n.QUESTION16,
			choices : Vector.<Choice>([
				new Choice({
					text :I18n.CHOICE37,
					destinationId : "#5",
					animationTrigger : [AnimationTrigger.GOOD_END],
					stats : {
						people : 0,
						kid : 0
					}
				}),
				new Choice({
					text : I18n.CHOICE38,
					destinationId : "#6",
					animationTrigger : [AnimationTrigger.KID_HAPPY,AnimationTrigger.PLAYER_SAD,AnimationTrigger.BAD_END],
					stats : {
						parents : 0,
						kid : 0
					}
				})
			])
		}));
		//#3
		this.dialogTree.add("#3", new Dialog({
			text :I18n.QUESTION17,
			choices : Vector.<Choice>([
				new Choice({
					text :I18n.CHOICE39,
					destinationId : "#5",
					animationTrigger : [AnimationTrigger.PLAYER_IDLE/*,AnimationTrigger.KID_IDLE*/,AnimationTrigger.GOOD_END],
					stats : {
						people : 0,
						kid : 0
					}
				}),
				new Choice({
					text : I18n.CHOICE40,
					destinationId : "#6",
					animationTrigger : [AnimationTrigger.KID_MAD,AnimationTrigger.PLAYER_HAPPY,AnimationTrigger.BAD_END],
					stats : {
						parents : 0,
						kid : 0
					}
				})
			])
		}));
		//#5
		this.dialogTree.add("#5", new Dialog({
			text: "",
			choices : Vector.<Choice>([	])
		}));
	}

	override public function start():void {
		this.currentDialog = dialogTree.get("startDialog");
		super.start();
	}

	override public function resume():void {
		super.resume();

		this.dispatchEventWith(BubbleEvent.SHOW_BUBBLE, false, this.currentDialog);
	}

	public function triggerAnimationFromChoice(choice:Choice):void{
		for(var i:int = 0 ; i < choice.animationTrigger.length; i++){
			GlobalDispatcher.dispatchEventWith(choice.animationTrigger[i]);
		}
	}

	public function goToDialog(destinationId:String):void {
		this.currentDialog = dialogTree.get(destinationId);
		setTimeout(showCurrentDialog, 2000);
	}

	private function showCurrentDialog():void{
		this.dispatchEventWith(BubbleEvent.SHOW_BUBBLE, false, this.currentDialog);
	}

	public function getDialog(id:String):Dialog {
		return dialogTree.get(id);
	}
}
}
