/**
 * Created by julien on 1/24/15.
 */
package com.letsplay.GameStage {
import com.drawm.mvc.Page;
import com.drawm.mvc.controler.Controller;
import com.drawm.mvc.model.Model;
import com.drawm.mvc.view.View;

public class GameStage extends Page {
    private var stageView:GameStageView;
    public function GameStage() {
        super(GameStageModel, GameStageView, GameStageController);
        this.stageView = this._view as GameStageView;
    }

    public function curtainLift():void {
        this.stageView.curtainLift();
    }
    public function actTransition( data:Object ):void {
        this.stageView.curtainDropThenLift( data);
    }
    public function theEnd():void {
        this.stageView.theEnd();
    }
    public function startThekitten():void {
        this.stageView.animateKitten();
    }
}
}
