package {

import com.letsplay.LetsPlay;

import flash.display.Sprite;
import flash.events.Event;

import starling.core.Starling;

[SWF(width=680,height=560,frameRate=60,backgroundColor=000000)]
public class Main extends Sprite {

    public function Main() {
		this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
    }

	private function onAddedToStage(event:Event):void {
		event.target.removeEventListener(event.type, arguments.callee);

		var starling : Starling = new Starling(LetsPlay, stage);
		starling.start();
	}
}
}
