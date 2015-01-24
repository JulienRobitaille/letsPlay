/**
 * Created by damon-karelab on 1/24/2015.
 */
package com.letsplay.game {
import com.drawm.mvc.model.Model;
import com.drawm.mvc.view.View;

import starling.display.Quad;
import starling.text.TextField;

public class GameView extends View {
	public function GameView(model:Model) {
		super(model);
	}

	override public function resume():void {
		super.resume();
	}

	override public function start():void {
		this.addChild(new Quad(stage.stageWidth, stage.stageHeight,0xFF0000));


		var txt : TextField = new TextField(stage.stageWidth, stage.stageHeight, "default", "Verdana", 12, 0xFF0000);
		txt.text = "apres default lol";
		txt.color = 0x00FF00;


		addChild(txt);


		super.start();
	}
}
}
