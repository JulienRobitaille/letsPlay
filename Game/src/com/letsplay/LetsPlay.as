/**
 * Created by damon-karelab on 1/24/2015.
 */
package com.letsplay {
import com.drawm.mvc.Page;
import com.letsplay.game.Game;
import com.letsplay.intro.Intro;

import starling.display.Quad;
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


	public function LetsPlay() {
		super();

		var atlas : TextureAtlas = new TextureAtlas(Texture.fromEmbeddedAsset(AtlasTexture), XML(new AtlasXml));
		TextField.registerBitmapFont(new BitmapFont(atlas.getTexture("fluorine"), XML(new FontXml())), "fluorine");

		//var intro:Intro = new Intro();
		//this.addChild(intro);

		var game:Game = new Game();
		this.addChild(game);

	}

}
}
