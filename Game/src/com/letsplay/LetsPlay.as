/**
 * Created by damon-karelab on 1/24/2015.
 */
package com.letsplay {
import com.letsplay.game.Game;

import starling.display.Quad;
import starling.display.Sprite;

public class LetsPlay extends Sprite {
	private var game:Game;
	public function LetsPlay() {
		super();

		this.game = new Game();
		addChild(this.game);
	}
}
}
