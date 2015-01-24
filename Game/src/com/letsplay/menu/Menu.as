/**
 * Created by julien on 1/24/15.
 */
package com.letsplay.menu {
import com.drawm.mvc.Page;

public class Menu extends Page {
    private var _viewMenu:MenuView;
    public function Menu() {
        super(MenuModel, MenuView, MenuController);
        this._viewMenu = this._view as MenuView;
    }

    override public function start():void {
        super.start();
    }

    public function oppeningAnimation():void {
        this._viewMenu.oppeningAnimation();
    }
}
}
