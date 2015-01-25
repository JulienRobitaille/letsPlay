package {

import flash.display.Sprite;
import flash.text.TextField;

public class Mobile extends Sprite {
    public function Mobile() {
        var textField:TextField = new TextField();
        textField.text = "Hello, World";
        addChild(textField);

		addChild(new Main());
    }
}
}
