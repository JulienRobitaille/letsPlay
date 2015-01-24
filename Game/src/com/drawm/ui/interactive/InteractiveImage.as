package com.drawm.ui.interactive {
import com.drawm.ui.*;

import flash.display.Bitmap;

import starling.textures.Texture;


/**
	 * ...
	 * @author Damon Perron-Laurin
	 */
	public class InteractiveImage extends UIImage implements IInteractiveUI
	{
		
		public function InteractiveImage(id:String, texture:Texture = null){
			super(id, texture);
		}
		
		// Called by Controler ---------------------------------------------------------//
        public function up():void{}
        public function out():void{}
        public function down():void { }

		public function get mouseX():Number {
			return 0;
		}

		public function get mouseY():Number {
			return 0;
		}
	}
}