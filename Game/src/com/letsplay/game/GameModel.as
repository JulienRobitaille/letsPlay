/**
 * Created by damon-karelab on 1/24/2015.
 */
package com.letsplay.game {
import com.drawm.mvc.model.Model;
import com.letsplay.AnimationTrigger;
import com.letsplay.GlobalDispatcher;
import com.letsplay.data.Choice;
import com.letsplay.data.Dialog;
import com.letsplay.data.DialogTree;

import flash.utils.setTimeout;

public class GameModel extends Model {

	public const bubbleText : Vector.<String> = new <String>[];
	private var choices:Vector.<Choice> = new <Choice>[];
	private var dialogTree:DialogTree;
	private var currentDialog:Dialog;

	public function GameModel() {
		super();

		this.dialogTree ||= new DialogTree();

		//#1
		this.dialogTree.add("startDialog", new Dialog({
			text : "Est ce que tu préfère les chiens ou les chats?",
			choices : Vector.<Choice>([
				new Choice({
					text : "Les chiens",
					destinationId : "#2",
					animationTrigger : [],
					stats : {
						people : 0,
						kid : 0
					}
				}),
				new Choice({
					text : "Les chats",
					destinationId : "#2",
					animationTrigger : [],
					stats : {
						parents : 0,
						kid : 0
					}
				}),
				new Choice({
					text : "... (psss Jocelyne? C'est quoi déjà mon texte?)",
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
			text : "Les chiens son bruiant, bruns et ils puent!\nJ'aimerais avoir un chat, mais maman ne veut pas.",
			choices : Vector.<Choice>([
				new Choice({
					text : "Brun? Ce n'est même pas vrai! (Mais qu'est-ce que je fait ici?)",
					destinationId : "#4",
					animationTrigger : [],
					stats : {
						people : 1,
						kid : 0
					}
				}),
				new Choice({
					text : "Oh ! Regarde le jolie chaton!",
					destinationId : "#5",
					animationTrigger : [],
					stats : {
						parents : 0,
						kid : 1
					}
				}),
				new Choice({
					text : "... (Oups j'ai un blanc; ma soeur ne sera vraiment pas contente.)",
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
			text : "... Timmy aime-tu les chats? (Il n'a vraiment aucune mémoire!)",
			choices : Vector.<Choice>([
				new Choice({
					text : "Oui beaucoup.",
					destinationId : "#2",
					animationTrigger : [],
					stats : {
						people : 1,
						kid : 0
					}
				}),
				new Choice({
					text : "Vraiment pas.",
					destinationId : "#2",
					animationTrigger : [],
					stats : {
						parents : 0,
						kid : 1
					}
				}),
				new Choice({
					text : "... (Qu'est-ce que je fait)",
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
			text : "Oh regarde le chaton. Attrapons-le! Aide moi! Aide moi!",
			choices : Vector.<Choice>([
				new Choice({
					text : "Je vais à droite tu vas à gauche!",
					destinationId : "#6",
					animationTrigger : [AnimationTrigger.CAT_FALL],
					stats : {
						people : 0,
						kid : 1
					}
				}),
				new Choice({
					text : "Ce n'ais même pas un vria chat. Mathieu la fabriqué pour la pièce.",
					destinationId : "#7",
					animationTrigger : [AnimationTrigger.CAT_FALL],
					stats : {
						parents : 1,
						kid : 0
					}
				}),
				new Choice({
					text : "...",
					destinationId : "#7",
					animationTrigger : [AnimationTrigger.CAT_FALL],
					stats : {
						parents : -1,
						kid : -1
					}
				})
			])
		}));
		//#5
		this.dialogTree.add("#5", new Dialog({
			text : "Ohhhh. Il est si beau! Attrapons-le. Ramenons le chez moi. Dis rien à maman.",
			choices : Vector.<Choice>([
				new Choice({
					text : "Il a l'aire sale et méchant. Ce n'est pas une bonne idée.",
					destinationId : "#7",
					animationTrigger : [AnimationTrigger.CAT_FALL],
					stats : {
						people : 1,
						kid : 0
					}
				}),
				new Choice({
					text : "Seulement si je peux le flatter en premier.",
					destinationId : "#6",
					animationTrigger : [AnimationTrigger.CAT_FALL],
					stats : {
						parents : 0,
						kid : 1
					}
				}),
				new Choice({
					text : "... (Je pers vraiment mon temps. Pourquoi une grenouille adopterait un chat?)",
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
			text : "Le chat s'enfuit !!! Vite Vite ! Suivons-le.",
			choices : Vector.<Choice>([
				new Choice({
					text : "... (Je crois que je n'ai pas vraiment le choix.)",
					destinationId : "act-fin",
					animationTrigger : [],
					stats : {
						people : -1,
						kid : -1
					}
				})
			])
		}));
		//#7
		this.dialogTree.add("#7", new Dialog({
			text : "Tu l'as laisser s'enfuire ! C'est de ta faute !!! (Elle court dans le parc)",
			choices : Vector.<Choice>([
				new Choice({
					text : "... (Se met à suivre Jocelyne.)",
					destinationId : "act-fin",
					animationTrigger : [],
					stats : {
						people : -1,
						kid : -1
					}
				})
			])
		}));

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
