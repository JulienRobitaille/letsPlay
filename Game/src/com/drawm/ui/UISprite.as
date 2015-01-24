/**
 * Created with IntelliJ IDEA.
 * User: Damon
 * Date: 13-08-08
 * Time: 21:03
 * To change this template use File | Settings | File Templates.
 */
package com.drawm.ui {
import starling.display.Sprite;

public class UISprite extends Sprite implements IUI{
    private var _id:String;


    public function UISprite(id:String = null){
        super();

        if(id == null){
            _id = UI.createUUID();
        }else{
            _id = id;
        }

        UI.addUI(this);
    }

    public function get id():String{
        return _id;
    }
}
}
