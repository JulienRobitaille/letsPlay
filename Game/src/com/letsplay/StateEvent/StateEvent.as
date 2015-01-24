/**
 * Created by julien on 1/24/15.
 */
package com.letsplay.StateEvent {
import starling.events.Event;

public class StateEvent extends Event {
    public static const DONE:String = "done";
    public static const PLAY:String = "play";
    public static const CREDIT:String = "credit";
    public static const ACTCHANGE:String = "actchange";
    public static const THEEND:String = "theend";

    public function StateEvent(type:String, bubbles:Boolean = false, data:Object = null) {
        super(type, bubbles, data);
    }
}
}
