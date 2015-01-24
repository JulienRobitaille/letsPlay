package com.drawm.ui {

import com.drawm.ui.interactive.IInteractiveUI;

import starling.display.Sprite;

public class UITextButton extends Sprite implements IInteractiveUI {
		
		private var _id:String;
		
		public function UITextButton(id:String) {
			_id = id;
			super();
		}
		
		public function get id():String {
			return _id;
		}
		public function set id(value:String):void {
			_id = value;
		}
		
		public function down():void {}
		
		override public function get height():Number {
			return super.height;
		}
		
		override public function set height(value:Number):void {
			super.height = value;
		}
		
		public function out():void { }
		
		public function up():void { }
		
		override public function get width():Number {
			return super.width;
		}
		
		override public function set width(value:Number):void {
			if(super.width != value)
				super.width = value;
		}

	public function get mouseX():Number {
		return 0;
	}

	public function get mouseY():Number {
		return 0;
	}
}
}