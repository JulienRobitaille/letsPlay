/**
 * Created by julien on 1/24/15.
 */
package com.letsplay.menu {
import com.drawm.mvc.Page;
import com.greensock.TweenLite;
import com.letsplay.SoundsAssets;

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

    public function removeMenuWithStyle():void {
        this._viewMenu.removeMenuWithStyle();
    }

    public function showCredit():void {
		SoundsAssets.shut.playSound();
		TweenLite.to(SoundsAssets.theater, 2, { volume : .0});
        this._viewMenu.creditMenu();
    }

    public function hideCredit():void {
		TweenLite.to(SoundsAssets.theater, 3, { volume : .4});
        this._viewMenu.hideCredit();
    }
}
}
