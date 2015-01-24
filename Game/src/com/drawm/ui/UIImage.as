package com.drawm.ui 
{
import flash.display.Bitmap;

import starling.display.Image;
import starling.display.Sprite;
import starling.textures.Texture;
import starling.textures.Texture;


/**
	 * ...
	 * @author Damon Perron-Laurin
	 */
	public class UIImage extends Sprite implements IUI
	{

        private var _id:String;

        public function UIImage(id:String, texture:Texture){

            _id = id;
            UI.addUI(this);

            addChild(new Image(texture));
        }

        public function get id():String{
            return _id;
        }
	}
}