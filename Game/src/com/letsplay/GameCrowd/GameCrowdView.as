/**
 * Created by julien on 1/24/15.
 */
package com.letsplay.GameCrowd {
import com.drawm.mvc.model.Model;
import com.drawm.mvc.view.View;
import com.drawm.ui.interactive.InteractiveImage;
import com.greensock.TweenLite;
import com.greensock.TweenMax;
import com.letsplay.Atlas.Asset;

import starling.display.Sprite;

import starling.textures.Texture;

public class GameCrowdView extends View {
    public const AMOUNTOFROWS:int = 3;
    public const AMOUNTOFPEOPLEPERROW:int = 10;
    private var peoples:Array = [];
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
                    TweenMax.to(guy,2,{y:"+20",repeat:100,yoyo:true});
                } else if( Math.random() *5 > 2) {
                    guy = new InteractiveImage(null,Asset.PublicOdd);
                    TweenMax.to(guy,4,{y:"+14",x:"+2",repeat:100,yoyo:true});
                } else {
                    guy = new InteractiveImage(null,Asset.PublicRandom);
                    TweenMax.to(guy,4,{y:"+6",x:"+7",repeat:100,yoyo:true});
                }
                guy.x = ( (guy.width * j) + 20 ) + odd;
                guy.y = 450 + (i * 30);

                this.peoples.push(guy);
                publicSprite.addChild(guy);
            }
        }


        this.addChild(publicSprite);
    }

    public function stopAnimation():void {
        for( var i:int = 0; i < this.peoples.length; i++) {
            TweenLite.killTweensOf(this.peoples[i]);
        }
    }
    public function crowdInteractiveLevelOne():void {
        this.stopAnimation();
        for( var i:int = 0; i < this.peoples.length; i++) {
            if( (Math.random()*5 ) > 3 ) {
                TweenMax.to(this.peoples[i],4,{y:"+7",x:"+3",repeat:100,yoyo:true});
            }
        }
    }
    public function crowdInteractiveLevelTwo():void {
        this.stopAnimation();
        for( var i:int = 0; i < this.peoples.length; i++) {
            if( i%7) {
                TweenMax.to(this.peoples[i],3,{y:"+15",x:"+6",repeat:100,yoyo:true});
            } else if( (Math.random()*5 ) > 2 ) {
                TweenMax.to(this.peoples[i],3,{y:"+10",x:"+4",repeat:100,yoyo:true});
            }
        }
    }
    public function crowdInteractiveLevelThree():void {
        this.stopAnimation();
        for( var i:int = 0; i < this.peoples.length; i++) {
            if( i%5) {
                TweenMax.to(this.peoples[i],2,{y:"+22",x:"+12",repeat:100,yoyo:true});
            } else if( (Math.random()*5 ) > 1 ) {
                TweenMax.to(this.peoples[i],2,{y:"+12",x:"+6",repeat:100,yoyo:true});
            }
        }
    }
}
}
