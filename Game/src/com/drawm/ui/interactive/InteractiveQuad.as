package com.drawm.ui.interactive
{
import com.drawm.ui.*;

import starling.display.Quad;

import starling.display.Sprite;

	/**
	 * ...
	 * @author Damon Perron-Laurin
	 */
	public class InteractiveQuad extends Sprite implements IInteractiveUI {

		private var _id : String;

        public function InteractiveQuad(id:String, width:Number, height:Number, color:uint = 16777215) {
			if (id == null){
                _id = UI.createUUID();
            } else {
                _id = id;
            }

			UI.addUI(this);

			addChild(new Quad(width,height, color));
		}

		public function up():void {}
		
		public function out():void {}
		
		public function down():void {}
		
		public function get id():String {
			return _id;
		}

		public function get mouseX():Number {
			return 0;
		}

		public function get mouseY():Number {
			return 0;
		}
	}

}