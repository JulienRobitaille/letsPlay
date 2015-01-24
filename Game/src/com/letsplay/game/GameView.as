/**
 * Created by damon-karelab on 1/24/2015.
 */
package com.letsplay.game {
import com.drawm.mvc.model.Model;
import com.drawm.mvc.view.View;

import starling.display.Quad;

public class GameView extends View {
	public function GameView(model:Model) {
		super(model);
	}


	override public function resume():void {
		super.resume();
	}

	override public function start():void {

		this.addChild(new Quad(100,100,0xFF0000));

		super.start();
	}
}
}
