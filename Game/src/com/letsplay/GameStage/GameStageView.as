/**
 * Created by julien on 1/24/15.
 */
package com.letsplay.GameStage {
import com.drawm.mvc.model.Model;
import com.drawm.mvc.view.View;
import com.drawm.ui.interactive.InteractiveImage;
import com.drawm.ui.text.InteractiveText;
import com.greensock.TweenLite;
import com.greensock.TweenMax;
import com.letsplay.AnimationTrigger;
import com.letsplay.Atlas.Asset;
import com.letsplay.GlobalDispatcher;
import com.letsplay.I18n;
import com.letsplay.LetsPlay;
import com.letsplay.SoundsAssets;
import com.letsplay.game.StatsEvent;


import com.letsplay.utils.Sounds;

import starling.core.Starling;
import starling.display.DisplayObject;

import starling.display.MovieClip;

import starling.display.Sprite;
import starling.events.Event;
import starling.text.TextFieldAutoSize;

public class GameStageView extends View {
    private var closedScene:InteractiveImage;
    private var act:Sprite;
    private var topScene:InteractiveImage;
    private var scene:InteractiveImage;
    public var cat:MovieClip;
    private var boyHappy:MovieClip;
    private var girlHappy:MovieClip;
	private var boySad:MovieClip;
	private var girlSad:MovieClip;
    private var boyMad:MovieClip;
    private var girlMad:MovieClip;
    private var boyIdle:MovieClip;
    private var girlIdle:MovieClip;
    private var sWidth:int;
    private var sHeight:int;


    public function GameStageView(model:Model) {
        super(model);
    }

    override public function start():void {
        super.start();

        sWidth = this.stage.stageWidth;
        sHeight = this.stage.stageHeight;
        this.scene = new InteractiveImage(null,Asset.Scene);
        this.topScene= new InteractiveImage(null,Asset.TopScene);
        this.closedScene = new InteractiveImage(null,Asset.ClosedScene);
        this.closedScene.y = this.topScene.height - 45;
        this.closedScene.x = ( this.topScene.width - closedScene.width ) >> 1;
        this.scene.y = sHeight - this.scene.height - 30;

        this.cat = new MovieClip(Asset.Cat,12);
		Starling.juggler.add(this.cat);
		this.cat.stop();
		this.cat.loop = false;
		this.cat.addEventListener(Event.ENTER_FRAME, this.enterFrameCat);

		//this.cat.addEventListener(Event.COMPLETE, function(event:Event):void{
		//	cat.stop();
		//});

        this.boyHappy = new MovieClip(Asset.BoyHappy,24);
        this.girlHappy = new MovieClip(Asset.GirlHappy,24);
        this.boySad = new MovieClip(Asset.BoySad,24);
        this.girlSad = new MovieClip(Asset.GirlSad,24);
		this.boyMad = new MovieClip(Asset.BoyMad,30);
		this.girlMad = new MovieClip(Asset.GirlMad,30);
		this.boyIdle = new MovieClip(Asset.BoyIdle,1);
		this.girlIdle = new MovieClip(Asset.GirlIdle,1);

        this.boyHappy.visible = false;
        this.girlHappy.visible = false;
        this.boySad.visible = false;
        this.girlSad.visible = false;
        this.boyMad.visible = false;
        this.girlMad.visible = false;
        this.boyIdle.visible = false;
        this.girlIdle.visible = false;

		Starling.juggler.add(this.boyHappy);
		Starling.juggler.add(this.girlHappy);
        Starling.juggler.add(this.boyMad);
		Starling.juggler.add(this.girlMad);
        Starling.juggler.add(this.boySad);
		Starling.juggler.add(this.girlSad);
		Starling.juggler.add(this.boyIdle);
		Starling.juggler.add(this.girlIdle);

        this.act ||= new Sprite();

        this.addChild(this.scene);
        this.addChild(this.act);
        this.addChild(this.closedScene);
        this.addChild(this.topScene);

    }

    public function curtainLift():void{
        TweenLite.to(this.closedScene,3, {y:-115});
		SoundsAssets.rideau.playSound();
    }

    public function curtainDrop( callback : Function ):void{
        TweenLite.to(this.closedScene,4, {y:95, onComplete:function():void{
            callback();
        }});
    }

    public function curtainDropThenLift( callback : Function ):void {
		SoundsAssets.rideau.playSound();
        var self:GameStageView = this;

        var curtain : DisplayObject = this.closedScene;

		TweenLite.killTweensOf(curtain);
        TweenLite.to(curtain,2, {y:95,onComplete:function():void{
			callback();
           self.curtainLift();
        }});
    }

    public function setAct1():void {
		this.act.removeChildren(0,-1,true);
        var cloud:InteractiveImage = new InteractiveImage(null,Asset.Cloud);
        cloud.x = sWidth/3;
        cloud.y = sHeight/5;
        TweenMax.to(cloud,8,{x:"+30",y:"+15",yoyo:true,repeat:4});


        var leftTree:InteractiveImage = new InteractiveImage(null,Asset.LeftTree);
        leftTree.x = sWidth/4;
        leftTree.y = sHeight/2.7;


        var house:InteractiveImage = new InteractiveImage(null,Asset.House);
        house.x = sWidth - (sWidth/2.5);
        house.y = sHeight/2.4;

        var bush:InteractiveImage = new InteractiveImage(null,Asset.Bush);
        bush.x =  sWidth/3;
        bush.y =  sHeight/1.95;

        this.cat.x =  sWidth - (sWidth/2);
        this.cat.y = sHeight/1.85

        this.boyIdle.x = this.boyHappy.x = this.boyMad.x = this.boySad.x = this.boyIdle.x = sWidth/4;
        this.boyIdle.y = this.boyHappy.y = this.boyMad.y = this.boySad.y = this.boyIdle.y = sHeight/2.2;

        this.girlHappy.x = this.girlMad.x = this.girlSad.x = this.girlIdle.x = sWidth - (sWidth/2.3);
        this.girlHappy.y = this.girlMad.y = this.girlSad.y = this.girlIdle.y = sHeight/2.2;

        this.animateKidIdle(null);
        this.animatePlayerIdle(null);


        this.catEvents()

        this.act.addChild(cloud);
        this.act.addChild(leftTree);
        this.act.addChild(house);
        this.act.addChild(bush);
        this.act.addChild(this.boyHappy);
        this.act.addChild(this.boyMad);
        this.act.addChild(this.boySad);
        this.act.addChild(this.girlHappy);
        this.act.addChild(this.girlSad);
        this.act.addChild(this.girlMad);
        this.act.addChild(this.boyIdle);
        this.act.addChild(this.girlIdle);
    }


	public function setAct2():void {
		this.act.removeChildren(0,-1,true);

        var cloud:InteractiveImage = new InteractiveImage(null,Asset.Cloud);
        cloud.x = sWidth/3;
        cloud.y = sHeight/5;

        TweenMax.to(cloud,7,{x:"-30",y:"+15",yoyo:true,repeat:4});

        var cloud2:InteractiveImage = new InteractiveImage(null,Asset.Cloud);
        cloud2.x = sWidth/2;
        cloud2.y = sHeight/5.2;
        cloud2.width = cloud2.width/2;
        cloud2.height = cloud2.height/2;
        TweenMax.to(cloud2,8,{x:"+30",y:"+15",yoyo:true,repeat:4});


        var leftTree:InteractiveImage = new InteractiveImage(null,Asset.LeftTree);
        leftTree.x = sWidth/4;
        leftTree.y = sHeight/2.6;


        var rightTree:InteractiveImage = new InteractiveImage(null,Asset.RightTree);
        rightTree.x = sWidth/1.6;
        rightTree.y = sHeight/2.6;

        var bush:InteractiveImage = new InteractiveImage(null,Asset.Bush);
        bush.x = sWidth/2.4;
        bush.y = sHeight/1.95;
        bush.scaleX = -1;

       var bush2:InteractiveImage = new InteractiveImage(null,Asset.Bush);
        bush2.x = sWidth/2.45;
        bush2.y = sHeight/1.95;

        var bush3:InteractiveImage = new InteractiveImage(null,Asset.Bush);
        bush3.x = sWidth/1.65;
        bush3.y = sHeight/1.95;
        bush3.scaleX = -1;

       var bush4:InteractiveImage = new InteractiveImage(null,Asset.Bush);
        bush4.x = sWidth/1.7;
        bush4.y = sHeight/1.95;


        this.boyIdle.x =this.boyHappy.x = this.boyMad.x = this.boySad.x = this.boyIdle.x = sWidth/4;
        this.boyIdle.y =this.boyHappy.y = this.boyMad.y = this.boySad.y = this.boyIdle.y = sHeight/2.2;

        this.girlHappy.x = this.girlMad.x = this.girlSad.x = this.girlIdle.x = sWidth - (sWidth/2.3);
        this.girlHappy.y = this.girlMad.y = this.girlSad.y = this.girlIdle.y = sHeight/2.2;


        this.animateKidIdle(null);
        this.animatePlayerIdle(null);


        this.act.addChild(cloud);
        this.act.addChild(cloud2);
        this.act.addChild(bush);
        this.act.addChild(bush2);
        this.act.addChild(bush3);
        this.act.addChild(bush4);
        this.act.addChild(leftTree);
        this.act.addChild(rightTree);

        this.act.addChild(this.boyHappy);
        this.act.addChild(this.boyMad);
        this.act.addChild(this.boySad);
        this.act.addChild(this.girlHappy);
        this.act.addChild(this.girlSad);
        this.act.addChild(this.girlMad);
        this.act.addChild(this.boyIdle);
        this.act.addChild(this.girlIdle);
    }


    //Cat buisness -----------------

    public function catEvents():void{
        //this.cat.addEventListener(Event.ADDED_TO_STAGE, this.onAdded);
		//this.cat.pause();
        this.act.addChild(this.cat);
    }

    //public function onAdded():void{
    //    this.cat.addEventListener(Event.ENTER_FRAME, this.entreFrameCat);
    //}

    public function enterFrameCat(evt:Event):void{
        if( this.cat.currentFrame >= this.cat.numFrames-10 ) {//@todo please ...
            this.cat.pause();
            this.cat.removeEventListener(Event.ENTER_FRAME, this.enterFrameCat);
        }
    }

    //------------------------
    //-----------------------------


    //Animation sexy time

    private function animatePlayerHappy(event:Event):void {
        this.boyHappy.visible = true;
        this.boySad.visible = false;
        this.boyMad.visible = false;
        this.boyIdle.visible = false;

		var sound : Sounds = SoundsAssets.kidHappy;
		sound.playSound();
    }

	private function animatePlayerSad(event:Event):void {
        this.boyHappy.visible = false;
        this.boySad.visible = true;
        this.boyMad.visible = false;
        this.boyIdle.visible = false;
		var sound : Sounds = SoundsAssets.kidSad;
		sound.playSound();
	}

	private function animatePlayerIdle(event:Event):void {
		this.boyHappy.visible = false;
		this.boySad.visible = false;
		this.boyMad.visible = false;
		this.boyIdle.visible = true;

	}
    private function animatePlayerMad(event:Event):void {
        this.boyHappy.visible = false;
        this.boySad.visible = false;
        this.boyMad.visible = true;
        this.boyIdle.visible = false;
		var sound : Sounds = SoundsAssets.kidAngry;
		sound.playSound();

	}

    private function animateCatFall(event:Event):void {
        trace("animateCatFall");
        this.cat.play();

		var sound : Sounds = SoundsAssets.catAngry;
		sound.playSound();
    }

	private function animateKidHappy(event:Event):void {
        this.girlHappy.visible = true;
        this.girlSad.visible = false;
        this.girlMad.visible = false;
        this.girlIdle.visible = false;


        var sound : Sounds = SoundsAssets.kidHappy;
		sound.playSound();
	}
    private function animateKidSad(event:Event):void {
        this.girlHappy.visible = false;
        this.girlSad.visible = true;
        this.girlMad.visible = false;
        this.girlIdle.visible = false;


		var sound : Sounds = SoundsAssets.kidSad;
		sound.playSound();
    }
    private function animateKidIdle(event:Event):void {
        this.girlHappy.visible = false;
        this.girlSad.visible = false;
        this.girlMad.visible = false;
        this.girlIdle.visible = true;
    }
	private function animateKidMad(event:Event):void {
		this.girlHappy.visible = false;
		this.girlSad.visible = false;
		this.girlMad.visible = true;
        this.girlIdle.visible = false;


        var sound : Sounds = SoundsAssets.kidAngry;
		sound.playSound();
	}

	private function animateCatPurr(event:Event):void {
		var sound : Sounds = SoundsAssets.catPurr;
		sound.playSound();
	}
	private function animateCatMeow(event:Event):void {
		var sound : Sounds = SoundsAssets.catMeow;
		sound.playSound();
	}

	private function animateKidJump(event:Event):void {
		trace("animateKidJump");

	}

    // The game ending
    public function theGoodEnd():void {
        this.cat.play();
        this.animatePlayerHappy(null);
        this.animateKidHappy(null);
        this.curtainDrop(function():void {

            var end:InteractiveText = new InteractiveText(null, sWidth, 1, I18n.END, "fluorine", 48);
            end.autoSize = TextFieldAutoSize.VERTICAL;
            end.y = -20;
            end.color = 0xD7D8D3;
            end.useHandCursor = true;

            TweenLite.to(end, 0.5, {y: (this.sHeight / 2 - end.height - 50)});
        });
    }
    // The game ending
    public function theBadEnd():void {
        this.animateKidMad(null);
        this.animatePlayerHappy(null);
    }


	override public function resume():void {
		super.resume();

		GlobalDispatcher.addEventListener(StatsEvent.APPLY_STATS, onApplyStats);

        GlobalDispatcher.addEventListener(AnimationTrigger.CAT_FALL, animateCatFall);
        GlobalDispatcher.addEventListener(AnimationTrigger.KID_JUMP, animateKidJump);
        GlobalDispatcher.addEventListener(AnimationTrigger.KID_MAD, animateKidMad);
		GlobalDispatcher.addEventListener(AnimationTrigger.KID_HAPPY, animateKidHappy);
		GlobalDispatcher.addEventListener(AnimationTrigger.KID_SAD, animateKidSad);
		GlobalDispatcher.addEventListener(AnimationTrigger.PLAYER_SAD, animatePlayerSad);
		GlobalDispatcher.addEventListener(AnimationTrigger.PLAYER_HAPPY, animatePlayerHappy);
		GlobalDispatcher.addEventListener(AnimationTrigger.PLAYER_MAD, animatePlayerMad);

		GlobalDispatcher.addEventListener(AnimationTrigger.CAT_PURR, animateCatPurr);
		GlobalDispatcher.addEventListener(AnimationTrigger.CAT_MEOW, animateCatMeow);

		GlobalDispatcher.addEventListener(AnimationTrigger.PLAYER_IDLE, animatePlayerIdle);
		GlobalDispatcher.addEventListener(AnimationTrigger.KID_IDLE, animatePlayerIdle);
	}


	private const shadeOfGray : Array = [
		0x444444,
		0x333333,
		0x222222,
		0x111111
	];
	private function onApplyStats(event:Event):void {
		// changer le mood??
	}


	override public function pause():void {
		super.pause();

		GlobalDispatcher.removeEventListener(StatsEvent.APPLY_STATS, onApplyStats);

		GlobalDispatcher.removeEventListener(AnimationTrigger.CAT_FALL, animateCatFall);
		GlobalDispatcher.removeEventListener(AnimationTrigger.KID_JUMP, animateKidJump);
		GlobalDispatcher.removeEventListener(AnimationTrigger.KID_MAD, animateKidMad);
		GlobalDispatcher.removeEventListener(AnimationTrigger.KID_HAPPY, animateKidHappy);
		GlobalDispatcher.removeEventListener(AnimationTrigger.KID_SAD, animateKidSad);
		GlobalDispatcher.removeEventListener(AnimationTrigger.PLAYER_SAD, animatePlayerSad);
		GlobalDispatcher.removeEventListener(AnimationTrigger.PLAYER_HAPPY, animatePlayerHappy);
		GlobalDispatcher.removeEventListener(AnimationTrigger.PLAYER_MAD, animatePlayerMad);
		GlobalDispatcher.removeEventListener(AnimationTrigger.CAT_PURR, animateCatPurr);
		GlobalDispatcher.removeEventListener(AnimationTrigger.CAT_MEOW, animateCatMeow);
		GlobalDispatcher.removeEventListener(AnimationTrigger.PLAYER_IDLE, animatePlayerIdle);
		GlobalDispatcher.removeEventListener(AnimationTrigger.KID_IDLE, animatePlayerIdle);
	}
}
}
