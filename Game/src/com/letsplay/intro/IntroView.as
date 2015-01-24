/**
 * Created by julien on 1/24/15.
 */
package com.letsplay.intro {
import com.drawm.mvc.model.Model;
import com.drawm.mvc.view.View;
import com.drawm.ui.interactive.InteractiveQuad;
import com.greensock.TweenLite;
import com.letsplay.I18n;

import flash.utils.Timer;
import flash.utils.setTimeout;

import starling.display.Quad;
import starling.text.TextField;
import starling.text.TextFieldAutoSize;

public class IntroView extends View {
    private var introText:TextField;
    private var introBackground:InteractiveQuad;
    public function IntroView(model:Model) {
        super(model);


    }

    override public function resume():void {
        super.resume();
    }

    override public function start():void {
        super.start();

        var self:IntroView = this;
        var sWidth:int = this.stage.stageWidth;
        var sHeight:int = this.stage.stageHeight;

        this.introBackground = new InteractiveQuad(null,sWidth,sHeight,0x000000);

        this.addChild(this.introBackground);

            this.introText = new TextField(sWidth, 1, I18n.INTRO,"fluorine",24);
            this.introText.autoSize = TextFieldAutoSize.VERTICAL;
            this.introText.y = (sHeight - this.introText.height-20) >> 1;
            this.introText.color = 0xD7D8D3;
            this.introText.alpha = 0;
            this.introText.touchable = false;

        TweenLite.to(this.introText,1.5,{alpha:1});
        setTimeout(function():void{
            TweenLite.to(self.introText,1.5,{alpha:0,onComplete:function():void{
                TweenLite.to(self.introBackground,1,{alpha:0,onComplete:function():void{
                    self.introBackground.parent.removeChild(self.introBackground);
                    self.introText.parent.removeChild(self.introText);
                }});
            }});
        },3500)


        this.addChild(this.introText);
    }


    override public function stop():void {
        super.stop();
        TweenLite.killTweensOf(this.introBackground);
        TweenLite.killTweensOf(this.introText);
        this.introBackground.parent.removeChild(this.introBackground);
        this.introText.parent.removeChild(this.introText);
    }
}
}
