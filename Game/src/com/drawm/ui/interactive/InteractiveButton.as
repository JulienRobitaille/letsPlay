package com.drawm.ui.interactive
{
import com.drawm.ui.*;

import starling.display.Sprite;

	public class InteractiveButton extends Sprite implements IInteractiveUI{
		
		private var _id:String;
		
		public function InteractiveButton(id:String) {
			if (id == null)
				_id = UI.createUUID();
			else
				_id = id;
			
			UI.addUI(this);
			
			super();
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