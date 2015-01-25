/**
 * Created by damon-karelab on 1/24/2015.
 */
package com.letsplay {
import com.letsplay.Atlas.Asset;
import com.letsplay.GameCrowd.GameCrowd;
import com.letsplay.GameStage.GameStage;
import com.letsplay.StateEvent.StateEvent;
import com.letsplay.game.Game;
import com.letsplay.intro.Intro;
import com.letsplay.menu.Menu;

import starling.display.Sprite;
import starling.events.Event;
import starling.text.BitmapFont;
import starling.text.TextField;
import starling.textures.Texture;
import starling.textures.TextureAtlas;

public class LetsPlay extends Sprite {
	private var menu:Menu;
	private var gameStage:GameStage;
	private var gameCrowd:GameCrowd;

	private var act : int = 0;
	private var game:Game;

	public function LetsPlay() {
		super();

		var atlas : TextureAtlas = new TextureAtlas(Texture.fromEmbeddedAsset(Asset.AtlasTexture), XML(new Asset.AtlasXml));
		TextField.registerBitmapFont(new BitmapFont(atlas.getTexture("fluorine"), XML(new Asset.FontXml())), "fluorine");

		var self:LetsPlay = this;
		var intro:Intro = new Intro();
		menu = new Menu();
		gameStage = new GameStage();
		gameCrowd = new GameCrowd();

		this.addChild(gameStage);
		this.addChild(menu);
		this.addChild(gameCrowd);
		this.addChild(intro);

		intro.addEventListener(StateEvent.DONE, function():void{
			self.removeChild(intro);
			menu.oppeningAnimation();
		});

		this.bindMenu();
	}

	private function bindMenu():void {
		var self:LetsPlay = this;
		menu.addEventListener(StateEvent.PLAY, function():void{
			self.menu.removeMenuWithStyle();
			self.gameCrowd.startLevelOne();
			self.gameStage.curtainLift();
			self.game = new Game();
			self.addChild(self.game);
			self.gameStage.actTransition(1);
			self.bindGameStage();

		});
		menu.addEventListener(StateEvent.CREDIT, function():void{
			self.menu.showCredit();
		});
		menu.addEventListener(StateEvent.REMOVE_CREDIT, function():void{
			self.menu.hideCredit();
		});
	}
	private function bindGameStage():void {
		var self:LetsPlay = this;
		this.game.addEventListener(StateEvent.ACTCHANGE, function(evt:Event):void{
			self.act++;
			self.gameStage.actTransition( self.act );
		});

		gameStage.addEventListener(StateEvent.THEEND, function():void{
			self.gameStage.theEnd();
		});
	}

}
}
