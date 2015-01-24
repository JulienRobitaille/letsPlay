/**
 * Created by damon-karelab on 1/24/2015.
 */
package com.letsplay.game.ui {
import flash.events.TimerEvent;
import flash.utils.Timer;

import starling.display.Quad;

import starling.display.Sprite;
import starling.events.Event;
import starling.text.TextField;
import starling.text.TextFieldAutoSize;
import starling.utils.HAlign;

public class TextBubble extends Sprite {
	private var textfield:TextField;
	private var textAnimationTimer:Timer;
	private var text:Array;
	private var bubble:Quad;



	public function TextBubble(text:String, width:int, height:int) {
		super();
		this.text = text.split("");

		this.textfield ||= new TextField(Math.max(2,width),Math.max(2,height)," ", "fluorine", 24);
		this.textfield.autoSize = TextFieldAutoSize.VERTICAL;
		this.textfield.hAlign = HAlign.LEFT;
		this.addChild(this.textfield);

		this.bubble = new Quad(this.textfield.width, this.textfield.height, 0xFFFFFF);
		this.bubble = new Quad(this.textfield.width+2, this.textfield.height+2, 0xFFFFFF);



		this.textAnimationTimer = new Timer(50,0);
		this.textAnimationTimer.addEventListener(TimerEvent.TIMER, tick)

		this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
	}

	private function onAddedToStage(event:Event):void {
		event.target.removeEventListener(event.type, arguments.callee);
		this.addEventListener(Event.REMOVED_FROM_STAGE, onRemoveFromStage)
		this.textAnimationTimer.start();
	}

	private function onRemoveFromStage(event:Event):void {
		event.target.removeEventListener(event.type, arguments.callee);
		this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		this.textAnimationTimer.stop();
	}
	
	private function tick(event:TimerEvent):void {
		if(this.text.length <= 0){
			this.disposeTimer();
		}else{
			this.textfield.text += this.text.shift();
		}
	}

	private function disposeTimer():void{
		if(this.textAnimationTimer){
			this.textAnimationTimer.stop();
			this.textAnimationTimer.removeEventListener(TimerEvent.TIMER, tick);
			this.textAnimationTimer = null;
		}
	}

	override public function dispose():void {
		this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		this.removeEventListener(Event.REMOVED_FROM_STAGE, onRemoveFromStage);
		this.disposeTimer();
		this.removeChildren(0,-1,true);

		super.dispose();
	}
}
}
