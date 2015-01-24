/**
 * Created by julien on 1/24/15.
 */
package com.letsplay.intro {
import com.drawm.mvc.Page;
import com.drawm.mvc.controler.Controller;
import com.drawm.mvc.model.Model;

import starling.events.Touch;

public class IntroController extends Controller {
    public var introModel:IntroModel;
    public function IntroController(model:Model, page:Page) {
        super(model, page);
        this.introModel = model as IntroModel;
    }

    override protected function click(touch:Touch):void {
        super.click(touch);
        this.introModel.stop();
    }
}
}
