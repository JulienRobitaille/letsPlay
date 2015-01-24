/**
 * Created by damon-karelab on 1/24/2015.
 */
package com.letsplay {
import com.drawm.mvc.Page;
import com.letsplay.intro.Intro;

import starling.display.Quad;
import starling.display.Sprite;

public class LetsPlay extends Sprite {
	private var sequences: Array;
	public function LetsPlay() {
		super();

		var intro:Intro = new Intro();
		this.addChild(intro);

	}

}
}
