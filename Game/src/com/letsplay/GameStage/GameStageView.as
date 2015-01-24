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

import starling.display.Sprite;

public class GameStageView extends View {
    private var closedScene:InteractiveImage;
    private var act1:Sprite;
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

        this.addChild(this.scene);
        this.addChild(act1);
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

        var cat:InteractiveImage = new InteractiveImage(null,Asset.Cat);
        cat.x = (( this.topScene.width - this.closedScene.width ) >> 1) + 250;
        cat.y = this.topScene.height + 175;

        this.act1.addChild(cloud);
        this.act1.addChild(leftTree);
        this.act1.addChild(house);
        this.act1.addChild(bush);
        this.act1.addChild(cat);
    }
}
}
