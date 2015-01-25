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
import com.greensock.TweenMax;
import com.letsplay.Atlas.Asset;
import com.letsplay.I18n;

import flash.display.Bitmap;
import flash.utils.setTimeout;

import starling.text.TextField;

import starling.text.TextFieldAutoSize;
import starling.utils.deg2rad;

public class MenuView extends View {
    private var menuModel:MenuModel;
    private var jouer:InteractiveText;
    private var credit:InteractiveText;
    private var title:InteractiveText;
    private var backgroundCredit:InteractiveQuad;
    private var creditText:TextField;

   // private var menuModel:
    public function MenuView(model:Model) {
        super(model);
        this.menuModel = model as MenuModel;
    }

    override public function start():void {
        super.start();
    }

    public function oppeningAnimation():void {
        var self:MenuView = this;
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


        this.title = new InteractiveText(null, sWidth, 1, I18n.TITLE, "fluorine", 48);
        this.title.autoSize = TextFieldAutoSize.VERTICAL;
        this.title.y = -10;
        this.title.color = 0xD7D8D3;
        this.title.useHandCursor = false;
        this.title.rotation = starling.utils.deg2rad(3.5);



        this.addChild(this.jouer);
        this.addChild(this.credit);
        this.addChild(this.title);

        TweenLite.to(this.title,0.5,{y:(half-this.title.height - 50),onComplete:function():void{
            setTimeout(function():void{
                TweenMax.to(self.title,0.1,{ x:"+10", yoyo:true, repeat:5  });
            }, 200)
        }});
        TweenLite.to(this.jouer,0.5,{y:(half-this.jouer.height - 20)});
        TweenLite.to(this.credit,0.5,{y:(half-this.credit.height + 30)});
    }

    public function removeMenuWithStyle():void {
        TweenLite.to(this.jouer,0.5,{y: -60});
        TweenLite.to(this.credit,0.7,{y:-50});
        TweenLite.to(this.title,0.3,{y:-70});
    }
    public function creditMenu():void {
        var sWidth:int = this.stage.stageWidth;
        var sHeight:int = this.stage.stageHeight;
        backgroundCredit = new InteractiveQuad(this.menuModel.id_credit_box,sWidth,sHeight,0x000000);


        creditText = new TextField(sWidth, 1, I18n.CREDITTEXT,"fluorine",23);
        trace(I18n.CREDITTEXT);
        creditText.autoSize = TextFieldAutoSize.VERTICAL;
        creditText.y = sHeight;
        creditText.color = 0xD7D8D3;
        creditText.touchable = false;
        TweenLite.to(creditText,5,{y:-65});
        this.addChild( backgroundCredit );
        this.addChild( creditText );

    }

    public function hideCredit():void {
        this.backgroundCredit.parent.removeChild(this.backgroundCredit);
        this.creditText.parent.removeChild(this.creditText);
    }
}
}
