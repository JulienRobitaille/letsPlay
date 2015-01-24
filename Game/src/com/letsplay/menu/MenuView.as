/**
 * Created by julien on 1/48/15.
 */
package com.letsplay.menu {
import com.drawm.mvc.model.Model;
import com.drawm.mvc.view.View;
import com.drawm.ui.interactive.InteractiveImage;
import com.drawm.ui.interactive.InteractiveQuad;
import com.drawm.ui.text.InteractiveText;
import com.greensock.TweenLite;
import com.letsplay.Atlas.Asset;
import com.letsplay.I18n;

import flash.display.Bitmap;

import starling.text.TextField;

import starling.text.TextFieldAutoSize;

public class MenuView extends View {
    private var menuModel:MenuModel;

   // private var menuModel:
    public function MenuView(model:Model) {
        super(model);
        this.menuModel = model as MenuModel;
    }

    override public function start():void {
        super.start();
        var sWidth:int = this.stage.stageWidth;
        var sHeight:int = this.stage.stageHeight;
        var topScene:InteractiveImage = new InteractiveImage(null,Asset.TopScene);
        var closedScene:InteractiveImage = new InteractiveImage(null,Asset.ClosedScene);
        var scene:InteractiveImage = new InteractiveImage(null,Asset.Scene);
        scene.y = sHeight - scene.height - 30;
        closedScene.y = topScene.height - 45;
        closedScene.x = ( topScene.width - closedScene.width ) >> 1;
        this.addChild(scene);
        this.addChild(closedScene);
        this.addChild(topScene);
    }

    public function oppeningAnimation():void {
        var sWidth:int = this.stage.stageWidth;
        var sHeight:int = this.stage.stageHeight;
        var half:int = sHeight>>1;

        var jouer:InteractiveText = new InteractiveText(this.menuModel.id_play, sWidth, 1, I18n.JOUER,"fluorine",48);
            jouer.autoSize = TextFieldAutoSize.VERTICAL;
            jouer.y = -20;
            jouer.color = 0xD7D8D3;
            jouer.useHandCursor = true;

        var credit:InteractiveText = new InteractiveText(this.menuModel.id_credit, sWidth, 1, I18n.CREDIT,"fluorine",48);
            credit.autoSize = TextFieldAutoSize.VERTICAL;
            credit.y = -40;
            credit.color = 0xD7D8D3;
            credit.useHandCursor = true;

        this.addChild(jouer);
        this.addChild(credit);

        TweenLite.to(jouer,0.5,{y:(half-jouer.height - 20)});
        TweenLite.to(credit,0.5,{y:(half-credit.height + 30)});
    }
}
}