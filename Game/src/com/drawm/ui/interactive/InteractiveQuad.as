package com.drawm.ui.interactive
{
import com.drawm.ui.*;

import starling.display.Quad;

import starling.display.Sprite;

	/**
	 * ...
	 * @author Damon Perron-Laurin
	 */
	public class InteractiveQuad extends InteractiveUI implements IInteractiveUI {


        public function InteractiveQuad(id:String, width:Number, height:Number, color:uint = 16777215) {
			if (id == null){
                _id = UI.createUUID();
            } else {
                _id = id;
            }

			UI.addUI(this);

			addChild(new Quad(width,height, color));
		}
	}

}