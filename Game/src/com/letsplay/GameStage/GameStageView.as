/**
 * Created by julien on 1/24/15.
 */
package com.letsplay.GameStage {
import com.drawm.mvc.model.Model;
import com.drawm.mvc.view.View;
import com.drawm.ui.interactive.InteractiveImage;
import com.greensock.TweenLite;
import com.greensock.TweenMax;
import com.letsplay.Atlas.Asset;

import flash.utils.setTimeout;

import starling.core.Starling;

import starling.display.MovieClip;

import starling.display.Sprite;
import starling.events.Event;

public class GameStageView extends View {
    private var closedScene:InteractiveImage;
    private var act1:Sprite;
    private var act2:Sprite;
    private var act3:Sprite;
    private var topScene:InteractiveImage;
    private var scene:InteractiveImage;

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

        this.setAct1();
       // this.setAct2();
        //this.setAct3();

        this.addChild(this.scene);
        this.addChild(this.act1);
        //this.addChild(this.act2);
       // this.addChild(this.act3);
        this.addChild(this.closedScene);
        this.addChild(this.topScene);

    }
    public function curtainLift():void{
        TweenLite.to(this.closedScene,3, {y:-115});
    }

    public function curtainDropThenLift( data:Object ):void {
        TweenLite.to(this.closedScene,2, {y:"+115",onComplete:function():void{
            trace(data);
            TweenLite.to(this.closedScene,3, {y:-115});
        }});
    }

    public function theEnd():void {
        //todo
    }

    private function setAct1():void {
        this.act1 = new Sprite();

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

        var cat:MovieClip = new MovieClip(Asset.Cat,12);
        cat.x = (( this.topScene.width - this.closedScene.width ) >> 1) + 250;
        cat.y = this.topScene.height + 165;
        cat.loop = false;

        Starling.juggler.add(cat);

        //WTF CAT LOOP !?!?!?!

        this.act1.addChild(cloud);
        this.act1.addChild(leftTree);
        this.act1.addChild(house);
        this.act1.addChild(bush);
        this.act1.addChild(cat);
    }
    private function setAct2():void {
        this.act2= new Sprite();

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


        this.act2.addChild(cloud);
        this.act2.addChild(cloud2);
        this.act2.addChild(bush);
        this.act2.addChild(bush2);
        this.act2.addChild(bush3);
        this.act2.addChild(bush4);
        this.act2.addChild(leftTree);
        this.act2.addChild(rightTree);
    }

    private function setAct3():void {
        this.act3 = new Sprite();

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

        var cat:MovieClip = new MovieClip(Asset.Cat,12);
        cat.x = (( this.topScene.width - this.closedScene.width ) >> 1) + 250;
        cat.y = this.topScene.height + 175;
        cat.loop = false;

        Starling.juggler.add(cat);

        //WTF CAT LOOP !?!?!?!

        this.act3.addChild(cloud);
        this.act3.addChild(leftTree);
        this.act3.addChild(house);
        this.act3.addChild(bush);
        this.act3.addChild(cat);
    }
}
}
