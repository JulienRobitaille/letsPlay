/**
 * Created by julien on 1/24/15.
 */
package com.letsplay.GameStage {
import com.drawm.mvc.model.Model;
import com.drawm.mvc.view.View;
import com.drawm.ui.interactive.InteractiveImage;
import com.greensock.TweenLite;
import com.greensock.TweenMax;
import com.letsplay.AnimationTrigger;
import com.letsplay.Atlas.Asset;
import com.letsplay.GlobalDispatcher;

import flash.utils.setTimeout;

import starling.core.Starling;
import starling.display.DisplayObject;

import starling.display.MovieClip;

import starling.display.Sprite;
import starling.events.Event;

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

    public function GameStageView(model:Model) {
        super(model);
    }

    override public function start():void {
        super.start();

        var sWidth:int = this.stage.stageWidth;
        var sHeight:int = this.stage.stageHeight;


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



        this.act ||= new Sprite();

        this.addChild(this.scene);
        this.addChild(this.act);
        this.addChild(this.closedScene);
        this.addChild(this.topScene);

    }

    public function curtainLift():void{
        TweenLite.to(this.closedScene,3, {y:-115});
    }

    public function curtainDropThenLift( callback : Function ):void {
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
        cloud.x = (( this.topScene.width - this.closedScene.width ) >> 1) + 100;
        cloud.y = this.topScene.height - 25;
        TweenMax.to(cloud,8,{x:"+30",y:"+15",yoyo:true,repeat:4});


        var leftTree:InteractiveImage = new InteractiveImage(null,Asset.LeftTree);
        leftTree.x = (( this.topScene.width - this.closedScene.width ) >> 1) + 70;
        leftTree.y = this.topScene.height + 85;


        var house:InteractiveImage = new InteractiveImage(null,Asset.House);
        house.x = (( this.topScene.width + this.closedScene.width ) >> 1) - 170 ;
        house.y = this.topScene.height + 100;

        var bush:InteractiveImage = new InteractiveImage(null,Asset.Bush);
        bush.x = (( this.topScene.width - this.closedScene.width ) >> 1) + 160;
        bush.y = this.topScene.height + 160;

        this.cat.x = (( this.topScene.width - this.closedScene.width ) >> 1) + 250;
        this.cat.y = this.topScene.height + 165;


        this.boyHappy.x = (( this.topScene.width - this.closedScene.width ) >> 1) + 225;
        this.boyHappy.y = this.topScene.height + 115;

        this.girlHappy.x = (( this.topScene.width - this.closedScene.width ) >> 1) + 275;
        this.girlHappy.y = this.topScene.height + 115;

        Starling.juggler.add(this.boyHappy);
        Starling.juggler.add(this.girlHappy);

        this.catEvents()
        this.act.addChild(cloud);
        this.act.addChild(leftTree);
        this.act.addChild(house);
        this.act.addChild(bush);
        this.act.addChild(this.boyHappy);
        this.act.addChild(this.girlHappy);
    }


	public function setAct2():void {
		this.act.removeChildren(0,-1,true);

        var cloud:InteractiveImage = new InteractiveImage(null,Asset.Cloud);
        cloud.x = (( this.topScene.width - this.closedScene.width ) >> 1) + 170;
        cloud.y = this.topScene.height - 25;
        TweenMax.to(cloud,7,{x:"-30",y:"+15",yoyo:true,repeat:4});

        var cloud2:InteractiveImage = new InteractiveImage(null,Asset.Cloud);
        cloud2.x = (( this.topScene.width - this.closedScene.width ) >> 1) + 250;
        cloud2.y = this.topScene.height -10;
        cloud2.width = cloud2.width/2;
        cloud2.height = cloud2.height/2;
        TweenMax.to(cloud2,8,{x:"+30",y:"+15",yoyo:true,repeat:4});


        var leftTree:InteractiveImage = new InteractiveImage(null,Asset.LeftTree);
        leftTree.x = (( this.topScene.width - this.closedScene.width ) >> 1) + 60;
        leftTree.y = this.topScene.height + 85;


        var rightTree:InteractiveImage = new InteractiveImage(null,Asset.RightTree);
        rightTree.x = (( this.topScene.width + this.closedScene.width ) >> 1) - 150 ;
        rightTree.y = this.topScene.height + 90;

        var bush:InteractiveImage = new InteractiveImage(null,Asset.Bush);
        bush.x = (( this.topScene.width - this.closedScene.width ) >> 1) + 160;
        bush.y = this.topScene.height + 160;
        bush.scaleX = -1;

        var bush2:InteractiveImage = new InteractiveImage(null,Asset.Bush);
        bush2.x = (( this.topScene.width - this.closedScene.width ) >> 1) + 160 + bush2.width;
        bush2.y = this.topScene.height + 160;

        var bush3:InteractiveImage = new InteractiveImage(null,Asset.Bush);
        bush3.x = (( this.topScene.width - this.closedScene.width ) >> 1) + 160 + bush3.width;
        bush3.y = this.topScene.height + 160;
        bush3.scaleX = -1;
        var bush4:InteractiveImage = new InteractiveImage(null,Asset.Bush);
        bush4.x = (( this.topScene.width - this.closedScene.width ) >> 1) + 160 + bush4.width + 70;
        bush4.y = this.topScene.height + 160;

        this.act.addChild(cloud);
        this.act.addChild(cloud2);
        this.act.addChild(bush);
        this.act.addChild(bush2);
        this.act.addChild(bush3);
        this.act.addChild(bush4);
        this.act.addChild(leftTree);
        this.act.addChild(rightTree);
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


	private function animatePlayerSad(event:Event):void {
		trace("animatePlayerSad");
	}

	private function animateKidHappy(event:Event):void {
		trace("animateKidHappy");
		
	}

	private function animateKidJump(event:Event):void {
		trace("animateKidJump");
		
	}

	private function animateCatFall(event:Event):void {
		trace("animateCatFall");
		this.cat.play();
	}

	private function animateKidAngry(event:Event):void {
		trace("animateKidAngry");
		
	}


    // The game ending
    public function theEnd():void {
        //todo
    }


	override public function resume():void {
		super.resume();
		GlobalDispatcher.addEventListener(AnimationTrigger.KID_ANGRY, animateKidAngry);
		GlobalDispatcher.addEventListener(AnimationTrigger.CAT_FALL, animateCatFall);
		GlobalDispatcher.addEventListener(AnimationTrigger.KID_JUMP, animateKidJump);
		GlobalDispatcher.addEventListener(AnimationTrigger.KID_HAPPY, animateKidHappy);
		GlobalDispatcher.addEventListener(AnimationTrigger.PLAYER_SAD, animatePlayerSad);
	}

	override public function pause():void {
		super.pause();
		GlobalDispatcher.removeEventListener(AnimationTrigger.KID_ANGRY, animateKidAngry);
		GlobalDispatcher.removeEventListener(AnimationTrigger.CAT_FALL, animateCatFall);
		GlobalDispatcher.removeEventListener(AnimationTrigger.KID_JUMP, animateKidJump);
		GlobalDispatcher.removeEventListener(AnimationTrigger.KID_HAPPY, animateKidHappy);
		GlobalDispatcher.removeEventListener(AnimationTrigger.PLAYER_SAD, animatePlayerSad);
	}
}
}
