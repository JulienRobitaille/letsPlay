/**
 * Created by damon-karelab on 1/24/2015.
 */
package com.letsplay.game {
import com.drawm.mvc.model.Model;

public class GameModel extends Model {

	public const bubbleText : Vector.<String> = new <String>[];

	public function GameModel() {
		super();
	}


	override public function start():void {

		bubbleText.push("blablabla text de coquin");
		bubbleText.push("plein d'autre text super long plein d'autre text super long plein d'autre text super long plein d'autre text super long ");


		super.start();
	}


	override public function resume():void {
		super.resume();


		this.dispatchEventWith(BubbleEvent.SHOW_TEXT, false, {texts : bubbleText});
	}
}
}
