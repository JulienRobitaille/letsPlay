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
    private var jouer:InteractiveText;
    private var credit:InteractiveText;

   // private var menuModel:
    public function MenuView(model:Model) {
        super(model);
        this.menuModel = model as MenuModel;
    }

    override public function start():void {
        super.start();
    }

    public function oppeningAnimation():void {
        var sWidth:int = this.stage.stageWidth;
        var sHeight:int = this.stage.stageHeight;

        var half:int = sHeight>>1;

            this.jouer= new InteractiveText(this.menuModel.id_play, sWidth, 1, I18n.JOUER,"fluorine",48);
            this.jouer.autoSize = TextFieldAutoSize.VERTICAL;
            this.jouer.y = -20;
            this.jouer.color = 0xD7D8D3;
            this.jouer.useHandCursor = true;

            this.credit = new InteractiveText(this.menuModel.id_credit, sWidth, 1, I18n.CREDIT,"fluorine",48);
            this.credit.autoSize = TextFieldAutoSize.VERTICAL;
            this.credit.y = -40;
            this.credit.color = 0xD7D8D3;
            this.credit.useHandCursor = true;


        this.addChild(this.jouer);
        this.addChild(this.credit);

        TweenLite.to(this.jouer,0.5,{y:(half-this.jouer.height - 20)});
        TweenLite.to(this.credit,0.5,{y:(half-this.credit.height + 30)});
    }

    public function removeMenuWithStyle():void {
        TweenLite.to(this.jouer,0.7,{y: -60});
        TweenLite.to(this.credit,0.7,{y:-50});
    }
}
}
