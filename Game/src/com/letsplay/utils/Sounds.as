/**
 * Created by damon-karelab on 7/24/2014.
 */
package com.letsplay.utils {
import com.greensock.events.LoaderEvent;

import flash.display.Shape;
import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.ProgressEvent;
import flash.media.Sound;
import flash.media.SoundChannel;
import flash.media.SoundLoaderContext;
import flash.media.SoundTransform;

public class Sounds extends EventDispatcher {
	private var vars:Object;

	/** @private for ENTER_FRAME listeners **/
	private static var _shape:Shape = new Shape();

	/** Event type constant for when the sound completes. **/
	public static const SOUND_COMPLETE:String = "soundComplete";
	/** Event type constant for when the sound is paused. **/
	public static const SOUND_PAUSE:String = "soundPause";
	/** Event type constant for when the sound begins or resumes playing. **/
	public static const SOUND_PLAY:String = "soundPlay";
	/** Event type constant for when the playback progresses (only dispatched when the sound is playing). **/
	public static const PLAY_PROGRESS:String = "playProgress";

	/** @private **/
	protected var _sound:Sound;
	/** @private **/
	protected var _context:SoundLoaderContext;
	/** @private **/
	protected var _soundPaused:Boolean;
	/** @private **/
	protected var _soundComplete:Boolean;
	/** @private **/
	protected var _position:Number;
	/** @private **/
	protected var _soundTransform:SoundTransform;
	/** @private **/
	protected var _duration:Number;
	/** @private Improves performance **/
	protected var _dispatchPlayProgress:Boolean;
	/** @private -1 = not initted, no ID3 data, 0 = received ID3 data, 1 = fully initted **/
	protected var _initPhase:int;
	/** @private **/
	protected var _repeatCount:uint;

	/** The minimum number of <code>bytesLoaded</code> to wait for before the <code>LoaderEvent.INIT</code> event is dispatched - the higher the number the more accurate the <code>duration</code> estimate will be when the INIT event is dispatched (the default value is 102400 which is 100k). The MP3's duration cannot be determined with 100% accuracy until it has completely loaded, but it is estimated with more and more accuracy as the file loads. **/
	public var initThreshold:uint;
	/** The SoundChannel object that results from the most recent <code>playSound()</code> call (or when <code>autoPlay</code> is <code>true</code> in the constructor's <code>vars</code> parameter). Typically there isn't much reason to use this directly. Instead, use the MP3Loader's controls like <code>playSound(), pauseSound(), gotoSoundTime(), playProgress, duration, soundTime</code>, etc. **/
	public var channel:SoundChannel;

	public function Sounds(sound:Sound, vars:Object = null) {
		this.vars = vars != null ? vars : { volume: 1, autoPlay: true};
		this.vars.volume *= 0.5;
		_position = 0;
		_duration = 0;
		_soundPaused = true;
		_soundTransform = new SoundTransform(("volume" in this.vars) ? this.vars.volume : 1);
		this.initThreshold = ("initThreshold" in this.vars) ? uint(this.vars.initThreshold) : 102400;
		_initSound();
		_load(sound);
	}

	/** @private **/
	protected function _initSound():void {
		if (_sound != null) {
			try {
				_sound.close();
			} catch (error:Error) {

			}
			_sound.removeEventListener(ProgressEvent.PROGRESS, _progressHandler);
			_sound.removeEventListener(Event.COMPLETE, _completeHandler);
			_sound.removeEventListener("ioError", onError);
			_sound.removeEventListener(Event.ID3, _id3Handler);
		}
		_initPhase = -1;
		_sound = _sound = new Sound();
		_sound.addEventListener(ProgressEvent.PROGRESS, _progressHandler, false, 0, true);
		_sound.addEventListener(Event.COMPLETE, _completeHandler, false, 0, true);
		_sound.addEventListener("ioError", onError, false, 0, true);
		_sound.addEventListener(Event.ID3, _id3Handler, false, 0, true);
	}

	private function onError(event:Error):void {
		trace(event.message);
	}

	/** @private **/
	protected function _load(newSound:Sound):void {
		_sound = newSound;
		_soundComplete = false;
		_initPhase = -1;
		_position = 0;
		_duration = 0;
		try {
			if (this.vars.autoPlay != false) {
				playSound();
			}
		} catch (error:Error) {
			onError(error);
		}
	}

	/**
	 * Plays the sound.
	 *
	 * @param event An optional Event which simply makes it easier to use the method as a handler for mouse clicks or other events.
	 * @return The SoundChannel object created by the play()
	 *
	 * @see #soundPaused
	 * @see #pauseSound()
	 * @see #gotoSoundTime()
	 * @see #soundTime
	 * @see #playProgress
	 **/
	public function playSound(event:Event = null):SoundChannel {
		this.soundPaused = false;
		return this.channel;
	}

	/**
	 * Pauses playback of the sound.
	 *
	 * @param event An optional Event which simply makes it easier to use the method as a handler for mouse clicks or other events.
	 *
	 * @see #soundPaused
	 * @see #gotoSoundTime()
	 * @see #playSound()
	 * @see #soundTime
	 * @see #playProgress
	 **/
	public function pauseSound(event:Event = null):void {
		this.soundPaused = true;
	}

	/**
	 * Attempts to jump to a certain time in the sound. If the sound hasn't downloaded enough to get to
	 * the new time, it will get as close as possible.
	 * For example, to jump to exactly 3-seconds into the sound and play from there:<br /><br /><code>
	 *
	 * loader.gotoSoundTime(3, true);<br /><br /></code>
	 *
	 * @param time The time (in seconds, offset from the very beginning) at which to place the virtual playhead in the sound.
	 * @param forcePlay If <code>true</code>, the sound will resume playback immediately after seeking to the new position.
	 * @param resetRepeatCount If the MP3Loader has a non-zero <code>repeat</code> value (meaning it loops/repeats at least once), setting <code>resetRepeatCount</code> to <code>true</code> will cause it to act like this is the first time through (no repeats yet). For example, if the MP3Loader had a <code>repeat</code> value of 3 and it already repeated twice when <code>gotoSoundTime()</code> was called, it would act like it forgot that it repeated twice already.
	 * @see #pauseSound()
	 * @see #playSound()
	 * @see #soundTime
	 * @see #playProgress
	 **/
	public function gotoSoundTime(time:Number, forcePlay:Boolean = false, resetRepeatCount:Boolean = true):void {
		if (time > _duration) {
			time = _duration;
		}
		_position = time * 1000;
		_soundComplete = false;
		if (resetRepeatCount) {
			_repeatCount = 0;
		}

		if (!_soundPaused || forcePlay) {
			_playSound(_position);
			if (_soundPaused) {
				_soundPaused = false;
				dispatchEvent(new LoaderEvent(SOUND_PLAY, this));
			}
		}
	}

	protected function _playSound(position:Number):void {
		if (this.channel != null) {
			this.channel.removeEventListener(Event.SOUND_COMPLETE, _soundCompleteHandler);
			this.channel.stop();
		}
		_position = position;
		this.channel = _sound.play(_position, 1, _soundTransform);
		if (this.channel != null) { //if the device doesn't have a sound card or sound capabilities, this.channel will be null!
			this.channel.addEventListener(Event.SOUND_COMPLETE, _soundCompleteHandler);
			_shape.addEventListener(Event.ENTER_FRAME, _enterFrameHandler, false, 0, true);
		}
	}

//---- EVENT HANDLERS ------------------------------------------------------------------------------------

	/** @private **/
	protected function _id3Handler(event:Event):void {
		if (_sound.bytesLoaded > this.initThreshold) {
			_initPhase = 1;
			dispatchEvent(new LoaderEvent(LoaderEvent.INIT, this));
		} else {
			_initPhase = 0;
		}
	}

	/** @private **/
	protected function _progressHandler(event:Event):void {
		if (_initPhase == 0 && _sound.bytesLoaded > this.initThreshold) {
			_initPhase = 1;
			dispatchEvent(new LoaderEvent(LoaderEvent.INIT, this));
		}
	}

	/** @private **/
	protected function _soundCompleteHandler(event:Event):void {
		if (uint(this.vars.repeat) > _repeatCount || int(this.vars.repeat) == -1) {
			_repeatCount++;
			_playSound(0);
		} else {
			_repeatCount = 0;
			_soundComplete = true;
			this.soundPaused = true;
			_position = _duration * 1000;
			_enterFrameHandler(null);
			dispatchEvent(new LoaderEvent(SOUND_COMPLETE, this));
		}
	}

	/** @private **/
	protected function _enterFrameHandler(event:Event):void {
		if (_dispatchPlayProgress) {
			dispatchEvent(new LoaderEvent(PLAY_PROGRESS, this));
		}
	}

	/** @inheritDoc **/
	override public function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false):void {
		if (type == PLAY_PROGRESS) {
			_dispatchPlayProgress = true;
		}
		super.addEventListener(type, listener, useCapture, priority, useWeakReference);
	}

	/** @private **/
	protected function _completeHandler(event:Event = null):void {
		_duration = _sound.length / 1000;
		if (_initPhase != 1) {
			_initPhase = 1;
			dispatchEvent(new LoaderEvent(LoaderEvent.INIT, this));
		}
	}


//---- GETTERS / SETTERS -------------------------------------------------------------------------

	/** The playback status of the sound: <code>true</code> if the sound's playback is paused, <code>false</code> if it isn't. **/
	public function get soundPaused():Boolean {
		return _soundPaused;
	}

	public function set soundPaused(value:Boolean):void {
		var changed:Boolean = Boolean(value != _soundPaused);
		_soundPaused = value;
		if (!changed) {
			return;
		}
		if (_soundPaused) {
			if (this.channel != null) {
				_position = this.channel.position;
				this.channel.removeEventListener(Event.SOUND_COMPLETE, _soundCompleteHandler);
				_shape.removeEventListener(Event.ENTER_FRAME, _enterFrameHandler);
				this.channel.stop();
			}
		} else {
			_playSound(_position);
			if (this.channel == null) { //if the device doesn't have a sound card or sound capabilities, this.channel will be null!
				return; //so that no event is dispatched
			}
		}
		dispatchEvent(new LoaderEvent(((_soundPaused) ? SOUND_PAUSE : SOUND_PLAY), this));
	}

	/** A value between 0 and 1 describing the playback progress where 0 means the virtual playhead is at the very beginning of the sound, 0.5 means it is at the halfway point and 1 means it is at the end of the sound. **/
	public function get playProgress():Number {
		return (_soundComplete) ? 1 : (this.soundTime / this.duration);
	}

	public function set playProgress(value:Number):void {
		if (this.duration != 0) {
			gotoSoundTime((value * _duration), !_soundPaused);
		}
	}

	/** The volume of the sound (a value between 0 and 1). **/
	public function get volume():Number {
		return _soundTransform.volume;
	}

	public function set volume(value:Number):void {
		_soundTransform.volume = value;
		if (this.channel != null) {
			this.channel.soundTransform = _soundTransform;
		}
	}

	/** The time (in seconds) at which the virtual playhead is positioned on the sound. For example, if the virtual playhead is currently at the 3-second position (3 seconds from the beginning), this value would be 3. **/
	public function get soundTime():Number {
		return (!_soundPaused && this.channel != null) ? this.channel.position / 1000 : _position / 1000;
	}

	public function set soundTime(value:Number):void {
		gotoSoundTime(value, !_soundPaused);
	}

	/** The duration (in seconds) of the sound. This value cannot be determined with 100% accuracy until the file has completely loaded, but it is estimated with more and more accuracy as the file loads. **/
	public function get duration():Number {
		if (_sound.bytesLoaded < _sound.bytesTotal) {
			_duration = (_sound.length / 1000) / (_sound.bytesLoaded / _sound.bytesTotal);
		}
		return _duration;
	}
}
}
