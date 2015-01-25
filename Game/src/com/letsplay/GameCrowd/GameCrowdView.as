/**
 * Created by julien on 1/24/15.
 */
package com.letsplay.GameCrowd {
import com.drawm.mvc.model.Model;
import com.drawm.mvc.view.View;
import com.drawm.ui.interactive.InteractiveImage;
import com.greensock.TweenMax;
import com.letsplay.Atlas.Asset;

import starling.display.Sprite;

import starling.textures.Texture;

public class GameCrowdView extends View {
    public const AMOUNTOFROWS:int = 3;
    public const AMOUNTOFPEOPLEPERROW:int = 10;
    public function GameCrowdView(model:Model) {
        super(model);
    }

    override public function start():void {
        super.start();
        var publicSprite:Sprite = new Sprite();

        for( var i:int = 0; i < this.AMOUNTOFROWS; i++) {

            for( var j:int = 0; j < this.AMOUNTOFPEOPLEPERROW; j++) {
                var odd:int = (i%2 ? 0 : 20);
                var guy:InteractiveImage;
                if( odd ) {
                    guy = new InteractiveImage(null,Asset.Public);
                    TweenMax.to(guy,2,{y:"+10",repeat:100,yoyo:true});
                } else {
                    guy = new InteractiveImage(null,Asset.PublicOdd);
                    TweenMax.to(guy,4,{y:"+7",x:"+2",repeat:100,yoyo:true});
                }
                guy.x = ( (guy.width * j) + 20 ) + odd;
                guy.y = 450 + (i * 30);
                publicSprite.addChild(guy);
            }
        }


        this.addChild(publicSprite);
    }
}
}
