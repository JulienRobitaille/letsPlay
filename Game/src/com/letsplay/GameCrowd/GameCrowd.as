/**
 * Created by julien on 1/24/15.
 */
package com.letsplay.GameCrowd {
import com.drawm.mvc.Page;

public class GameCrowd extends Page {
    private var gameView:GameCrowdView;
    public function GameCrowd() {
        super(GameCrowdModel, GameCrowdView, GameCrowdControler);
        this.gameView = this._view as GameCrowdView;
    }

    public function startLevelOne():void {
        this.gameView.crowdInteractiveLevelTwo();
    }
    public function startLevelTwo():void {
        this.gameView.crowdInteractiveLevelTwo();
    }
    public function startLevelThree():void {
       this.gameView.crowdInteractiveLevelThree();
    }
}
}
