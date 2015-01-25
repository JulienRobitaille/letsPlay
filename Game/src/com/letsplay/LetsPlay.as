/**
 * Created by damon-karelab on 1/24/2015.
 */
package com.letsplay {
import com.greensock.TweenLite;
import com.letsplay.Atlas.Asset;
import com.letsplay.GameCrowd.GameCrowd;
import com.letsplay.GameStage.GameStage;
import com.letsplay.StateEvent.StateEvent;
import com.letsplay.game.Game;
import com.letsplay.game.StatsEvent;
import com.letsplay.intro.Intro;
import com.letsplay.menu.Menu;
import com.letsplay.utils.Sounds;

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

	public static var act : int = 1;
	private var game:Game;

	private var theaterSound : Sounds = SoundsAssets.theater;

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

		intro.addEventListener(StateEvent.DONE, function(event:Event):void{
			self.removeChild(intro);
			menu.oppeningAnimation();

			theaterSound.volume = 0;
			theaterSound.playSound();
			TweenLite.to(theaterSound, 5, { volume : .4});
		});

		this.bindMenu();


		GlobalDispatcher.addEventListener(StatsEvent.CHANGE_STATS, onChangeStats);
	}

	private var stats : Object = {
		people : 0,
		kid : 0
	};

	private function onChangeStats(event:Event):void {
		stats.people = Math.max(0,stats.people + event.data.people);
		stats.kid = Math.max(0,stats.kid + event.data.kid);

		GlobalDispatcher.dispatchEventWith(StatsEvent.APPLY_STATS, false, this.stats);
	}

	private function bindMenu():void {
		var self:LetsPlay = this;
		menu.addEventListener(StateEvent.PLAY, function(event:Event):void{
			TweenLite.to(theaterSound, 2, { volume : .1});

			self.menu.removeMenuWithStyle();
			self.gameCrowd.startLevelOne();
			self.gameStage.curtainLift();
			self.game = new Game();
			self.addChild(self.game);
			self.gameStage.actTransition(1);
			self.bindGameStage();
		});
		menu.addEventListener(StateEvent.CREDIT, function(event:Event):void{
			self.menu.showCredit();
		});
		menu.addEventListener(StateEvent.REMOVE_CREDIT, function(event:Event):void{
			self.menu.hideCredit();
		});
	}
	private function bindGameStage():void {
		var self:LetsPlay = this;
		this.game.addEventListener(StateEvent.ACTCHANGE, function(evt:Event):void{
			LetsPlay.act++;
			self.gameStage.actTransition( LetsPlay.act );
		});

		GlobalDispatcher.addEventListener(AnimationTrigger.GOOD_END, self.gameStage.theGoodEnd );
		GlobalDispatcher.addEventListener(AnimationTrigger.BAD_END, self.gameStage.theBadEnd );

}

}
}
