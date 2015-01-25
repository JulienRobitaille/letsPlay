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
        this.cat.loop = false;

        this.boyHappy.x = sWidth/4;
        this.boyHappy.y =  sHeight/2.1;

        this.girlHappy.x = sWidth - (sWidth/2.3);
        this.girlHappy.y = sHeight/2.1;

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
        this.cat.addEventListener(Event.ADDED_TO_STAGE, this.onAdded);
       this.cat.pause();
        this.act.addChild(this.cat);
    }

    public function onAdded():void{
        this.cat.addEventListener(Event.ENTER_FRAME, this.entreFrameCat);
        Starling.juggler.add(this.cat);
    }

    public function entreFrameCat(evt:Event):void{
        if( this.cat.currentFrame >= this.cat.numFrames-10 ) {//@todo please ...
            this.cat.pause();
            this.cat.removeEventListener(Event.ENTER_FRAME, this.entreFrameCat);
        }
    }

    //------------------------
    //-----------------------------


    //Animation sexy time


	private function animatePlayerSad(event:Event):void {
        this.cat.play();
	}

	private function animateKidHappy(event:Event):void {
		
	}

	private function animateKidJump(event:Event):void {
		
	}

	private function animateCatFall(event:Event):void {
		
	}

	private function animateKidAngry(event:Event):void {
		
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
