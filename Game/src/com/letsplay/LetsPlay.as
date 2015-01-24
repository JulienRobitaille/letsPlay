/**
 * Created by damon-karelab on 1/24/2015.
 */
package com.letsplay {
import starling.display.Quad;
import starling.display.Sprite;

public class LetsPlay extends Sprite {
	public function LetsPlay() {
		super();

		var quad : Quad = new Quad(150,150,0x00FF00);
		this.addChild(quad);
	}
}
}
