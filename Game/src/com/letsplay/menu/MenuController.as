/**
 * Created by julien on 1/24/15.
 */
package com.letsplay.menu {
import com.drawm.mvc.Page;
import com.drawm.mvc.controler.Controller;
import com.drawm.mvc.model.Model;
import com.drawm.ui.interactive.IInteractiveUI;
import com.drawm.ui.text.InteractiveText;
import com.letsplay.StateEvent.StateEvent;

import starling.events.Touch;

public class MenuController extends Controller {
    private var menuModel:MenuModel;
    public function MenuController(model:Model, page:Page) {
        super(model, page);
        this.menuModel = model as MenuModel;
    }

    override protected function click(touch:Touch):void {
        super.click(touch);
        var target:IInteractiveUI = touch.target as IInteractiveUI;

        switch( target.id ){
            case this.menuModel.id_play:
                this._page.dispatchEventWith(StateEvent.PLAY);
                break;
            case this.menuModel.id_credit:
                this._page.dispatchEventWith(StateEvent.CREDIT);
                break;
        }
    }
}
}
