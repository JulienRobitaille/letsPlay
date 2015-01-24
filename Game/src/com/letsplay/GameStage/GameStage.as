/**
 * Created by julien on 1/24/15.
 */
package com.letsplay.GameStage {
import com.drawm.mvc.Page;
import com.drawm.mvc.controler.Controller;
import com.drawm.mvc.model.Model;
import com.drawm.mvc.view.View;

public class GameStage extends Page {
    public function GameStage() {
        super(GameStageModel, GameStageView, GameStageController);
    }
}
}
