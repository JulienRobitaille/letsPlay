/**
 * Created by julien on 1/24/15.
 */
package com.letsplay.GameStage {
import com.drawm.mvc.Page;
import com.drawm.mvc.controler.Controller;
import com.drawm.mvc.model.Model;
import com.drawm.mvc.view.View;
import com.letsplay.AnimationTrigger;
import com.letsplay.GlobalDispatcher;

public class GameStage extends Page {
    private var stageView:GameStageView;
    public function GameStage() {
        super(GameStageModel, GameStageView, GameStageController);
        this.stageView = this._view as GameStageView;
    }

    public function curtainLift():void {
        this.stageView.curtainLift();
    }
    public function actTransition( act : int ):void {
		GlobalDispatcher.dispatchEventWith(AnimationTrigger.PLAYER_IDLE);
		switch (act){
			case 1:
				this.stageView.curtainLift();
				this.stageView.setAct1()
				break;
			case 2:
				this.stageView.curtainDropThenLift( this.stageView.setAct2 );
				break;
			case 3:
				this.stageView.curtainDropThenLift( this.stageView.setAct1 );

				// Cat destiny goes here

				break;
		}
	}
	public function theEnd():void {
		this.stageView.theEnd();
    }
    public function startThekitten():void {
        this.stageView.cat.play()
    }
}
}
