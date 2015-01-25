/**
 * Created by damon-karelab on 1/24/2015.
 */
package com.letsplay.game.ui {
import flash.events.TimerEvent;
import flash.utils.Timer;

import starling.display.Quad;

import starling.display.Sprite;
import starling.events.Event;
import starling.events.TouchEvent;
import starling.events.TouchPhase;
import starling.text.TextField;
import starling.text.TextFieldAutoSize;
import starling.utils.HAlign;

public class TextBubble extends Sprite {
	private var textfield:TextField;
	private var nameTextfield:TextField;
	private var textAnimationTimer:Timer;
	private var text:Array;
	private var bubble:Quad;
	private var bubbleBackground:Quad;

	public function TextBubble(text:String, width:int, height:int) {
		super();
		this.text = text.split("");

		this.nameTextfield ||= new TextField(Math.max(2,width),Math.max(2,height),"Jocelyne : ", "fluorine", 24);
		this.nameTextfield.autoSize = TextFieldAutoSize.VERTICAL;
		this.nameTextfield.hAlign = HAlign.LEFT;
		this.addChild(this.nameTextfield);

		this.textfield ||= new TextField(Math.max(2,width),Math.max(2,height),text, "fluorine", 24);
		this.textfield.autoSize = TextFieldAutoSize.VERTICAL;
		this.textfield.hAlign = HAlign.LEFT;
		this.addChild(this.textfield);
		this.textfield.y = this.nameTextfield.height;

		this.bubble = new Quad(1,1, 0xFFFFFF);
		this.bubbleBackground = new Quad(1,1, 0);

		this.addChildAt(this.bubble,0);
		this.addChildAt(this.bubbleBackground,0);

		//this.bubble.x = this.textfield.width - this.bubble.width >>1;
		//this.bubble.y = this.textfield.height - this.bubble.height>>1;
		//this.bubbleBackground.x = this.textfield.width - this.bubbleBackground.width >>1;
		//this.bubbleBackground.y = this.textfield.height- this.bubbleBackground.height >>1;

		this.updateBubble();

		this.textAnimationTimer = new Timer(50,0);
		this.textAnimationTimer.addEventListener(TimerEvent.TIMER, tick);

		this.textfield.text = "";

		this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
	}

	private function onAddedToStage(event:Event):void {
		event.target.removeEventListener(event.type, arguments.callee);
		this.addEventListener(Event.REMOVED_FROM_STAGE, onRemoveFromStage);
		if(this.textAnimationTimer) {
			this.textAnimationTimer.start();
		}
		this.stage.addEventListener(TouchEvent.TOUCH, onTouchStage);
	}

	private function onTouchStage(event:TouchEvent):void {
		if(event.getTouch(stage,TouchPhase.BEGAN) !== null){
			this.skipAnimation();
		}
	}

	private function onRemoveFromStage(event:Event):void {
		event.target.removeEventListener(event.type, arguments.callee);
		this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		if(this.textAnimationTimer){
			this.textAnimationTimer.stop();
		}
	}
	
	private function tick(event:TimerEvent):void {
		if(this.text.length <= 0){
			this.disposeTimer();
		}else{
			this.textfield.text += this.text.shift();
			updateBubble();
		}
	}

	public function skipAnimation():void{
		this.textfield.text += this.text.join("");
		updateBubble();
		disposeTimer();
	}

	private function updateBubble():void {

		this.bubble.width = this.textfield.width +8;
		this.bubble.height = this.nameTextfield.height+this.textfield.height +8;

		this.bubbleBackground.width  = this.bubble.width + 2;
		this.bubbleBackground.height = this.bubble.height + 2;

		this.bubble.x = this.nameTextfield.x - 8;
		this.bubble.y = this.nameTextfield.y - 8;
		this.bubbleBackground.x = this.bubble.x - 1;
		this.bubbleBackground.y = this.bubble.y - 1;
	}


	override public function set x(value:Number):void {
		super.x = value;
		updateBubble();
	}

	override public function set y(value:Number):void {
		super.y = value;
		updateBubble();
	}

	private function disposeTimer():void{
		this.stage.removeEventListener(TouchEvent.TOUCH, onTouchStage);

		if(this.textAnimationTimer){
			this.textAnimationTimer.stop();
			this.textAnimationTimer.removeEventListener(TimerEvent.TIMER, tick);
			this.textAnimationTimer = null;
			this.dispatchEventWith(Event.COMPLETE);
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
