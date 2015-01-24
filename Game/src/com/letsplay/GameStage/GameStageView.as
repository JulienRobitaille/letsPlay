/**
 * Created by julien on 1/24/15.
 */
package com.letsplay.GameStage {
import com.drawm.mvc.model.Model;
import com.drawm.mvc.view.View;
import com.drawm.ui.interactive.InteractiveImage;
import com.greensock.TweenLite;
import com.letsplay.Atlas.Asset;

public class GameStageView extends View {
    private var closedScene:InteractiveImage;

    public function GameStageView(model:Model) {
        super(model);
    }

    override public function start():void {
        super.start();
        var sWidth:int = this.stage.stageWidth;
        var sHeight:int = this.stage.stageHeight;
        var topScene:InteractiveImage = new InteractiveImage(null,Asset.TopScene);
            closedScene = new InteractiveImage(null,Asset.ClosedScene);
        var scene:InteractiveImage = new InteractiveImage(null,Asset.Scene);
        scene.y = sHeight - scene.height - 30;
        closedScene.y = topScene.height - 45;
        closedScene.x = ( topScene.width - closedScene.width ) >> 1;
        this.addChild(scene);
        this.addChild(closedScene);
        this.addChild(topScene);

    }
    public function curtainLift():void{
        TweenLite.to(this.closedScene,3, {y:-115});
    }
}
}
