/**
 * Created by damon-karelab on 1/25/2015.
 */
package com.letsplay {
import starling.events.Event;
import starling.events.EventDispatcher;

public class GlobalDispatcher extends EventDispatcher {
	private static var _instance:GlobalDispatcher;

	public function GlobalDispatcher() {
		super();
	}

	public static function get instance():GlobalDispatcher{
		return (_instance ||= new GlobalDispatcher());
	}

	public static function addEventListener(type:String, listener:Function):void {
		instance.addEventListener(type, listener);
	}

	public static function removeEventListener(type:String, listener:Function):void {
		instance.removeEventListener(type, listener);
	}

	public static function removeEventListeners(type:String = null):void {
		instance.removeEventListeners(type);
	}

	public static function dispatchEvent(event:Event):void {
		instance.dispatchEvent(event);
	}

	public static function dispatchEventWith(type:String, bubbles:Boolean = false, data:Object = null):void {
		instance.dispatchEventWith(type, bubbles, data);
	}

	public static function hasEventListener(type:String):Boolean {
		return instance.hasEventListener(type);
	}
}
}
