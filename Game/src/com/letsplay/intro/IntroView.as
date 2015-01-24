/**
 * Created by julien on 1/24/15.
 */
package com.letsplay.intro {
import com.drawm.mvc.model.Model;
import com.drawm.mvc.view.View;

import starling.display.Quad;
import starling.text.TextField;
import starling.text.TextFieldAutoSize;

public class IntroView extends View {
    public function IntroView(model:Model) {
        super(model);


    }

    override public function resume():void {
        super.resume();
    }

    override public function start():void {
        super.start();

        var sWidth:int = this.stage.stageWidth,
            sHeight:int = this.stage.stageHeight,
            introBackground:Quad = new Quad(sWidth,sHeight,0x000000);

        this.addChild(introBackground);

        var introText:TextField = new TextField(100, 100, "test hahahahahahahah");
          //  introText.autoSize = TextFieldAutoSize.HORIZONTAL;
        //introText.x = sWidth >> 1;
        introText.color = 0xFF0000;

        this.addChild(introText);


    }

}
}
