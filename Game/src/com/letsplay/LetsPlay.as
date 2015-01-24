/**
 * Created by damon-karelab on 1/24/2015.
 */
package com.letsplay {
import com.letsplay.StateEvent.StateEvent;
import com.letsplay.game.Game;
import com.letsplay.intro.Intro;
import com.letsplay.menu.Menu;

import flash.display.Bitmap;

import starling.display.Sprite;
import starling.text.BitmapFont;
import starling.text.TextField;
import starling.textures.Texture;
import starling.textures.TextureAtlas;

public class LetsPlay extends Sprite {
	private var sequences: Array;

	[Embed(source="./../../../assets/fluorine.fnt", mimeType="application/octet-stream")]
	public static const FontXml:Class;

	[Embed(source="./../../../assets/atlas.xml", mimeType="application/octet-stream")]
	public static const AtlasXml:Class;

	[Embed(source = "./../../../assets/atlas.png")]
	public static const AtlasTexture:Class;
	private var menu:Menu;


	public function LetsPlay() {
		super();
		var self:LetsPlay = this;
		var atlas : TextureAtlas = new TextureAtlas(Texture.fromEmbeddedAsset(AtlasTexture), XML(new AtlasXml));
		var intro:Intro = new Intro();
			menu = new Menu();

		TextField.registerBitmapFont(new BitmapFont(atlas.getTexture("fluorine"), XML(new FontXml())), "fluorine");

		this.addChild(menu);
		this.addChild(intro);

		intro.addEventListener(StateEvent.DONE, function():void{
			self.removeChild(intro);
			menu.oppeningAnimation();
		});

		this.bindMenu();

		//var game:Game = new Game();
		//this.addChild(game);


	}

	private function bindMenu():void {
		menu.addEventListener(StateEvent.PLAY, function():void{
//play
		});
		menu.addEventListener(StateEvent.CREDIT, function():void{
			//credit
		});
	}
}
}
