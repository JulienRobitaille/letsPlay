package com.drawm.ui.interactive
{
import com.drawm.ui.*;

import flash.geom.Point;

import starling.display.DisplayObject;

public class InteractiveUI extends UI implements IInteractiveUI {

		private var _touchChildren:Boolean = true;

		public function InteractiveUI(id:String = null){
			this.touchable = true;
			this._touchChildren = false;
			super(id);
		}

		public function set touchChildren(value:Boolean):void{
			this._touchChildren = value;
		}
		public function get touchChildren():Boolean {
			return this._touchChildren;
		}

		public override function hitTest(localPoint:Point, forTouch:Boolean=false):DisplayObject{
			var target:DisplayObject = super.hitTest(localPoint, forTouch);

			if(target === null){
				return null
			}else if (this._touchChildren === true) {
				return target;
			} else{
				return this;
			}
		}

	// Called by Controler ---------------------------------------------------------//
		public function up():void{}
		public function out():void{}
		public function down():void{}

		public function get mouseX():Number {
			return 0;
		}

		public function get mouseY():Number {
			return 0;
		}
	}
}