/**
 * Created by damon-karelab on 1/24/2015.
 */
package com.letsplay.game {
import com.drawm.mvc.Page;

public class Game extends Page {
	public function Game() {
		super(GameModel, GameView, GameController);
	}
}
}
