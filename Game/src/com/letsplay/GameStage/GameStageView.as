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

    public function GameStageView(model:Model) {
        super(model);
    }

    override public function start():void {
        super.start();
        var sWidth:int = this.stage.stageWidth;
        var sHeight:int = this.stage.stageHeight;
        var topScene:InteractiveImage = new InteractiveImage(null,Asset.TopScene);
        var scene:InteractiveImage = new InteractiveImage(null,Asset.Scene);

        this.closedScene = new InteractiveImage(null,Asset.ClosedScene);
        this.closedScene.y = topScene.height - 45;
        this.closedScene.x = ( topScene.width - closedScene.width ) >> 1;
        scene.y = sHeight - scene.height - 30;

        this.act1 = new Sprite();

        var cloud:InteractiveImage = new InteractiveImage(null,Asset.Cloud);
            cloud.x = (( topScene.width - closedScene.width ) >> 1) + 100;
            cloud.y = topScene.height - 25;
        TweenMax.to(cloud,8,{x:"+30",y:"+15",yoyo:true,repeat:4});
        this.act1.addChild(cloud);

        this.addChild(scene);
        this.addChild(act1);
        this.addChild(this.closedScene);
        this.addChild(topScene);

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
}
}
