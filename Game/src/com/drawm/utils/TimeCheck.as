package com.drawm.utils{
	
	import flash.utils.getTimer;

	public class TimeCheck{ 
	
		public function TimeCheck(){}
		
		
		private static var _startTime:int = 0;
		private static var _lastTime:int  = 0;
		private static var _lastTag:String;
		
		
		private static var _tagQueue:Vector.<String> = Vector.<String>([]);
		private static var _timeQueue:Vector.<int>   = Vector.<int>([]);
		
		
		public static function start():void{
			
			while(_tagQueue.length > 0)
				_tagQueue.pop();
			
			while(_timeQueue.length > 0)
				_timeQueue.pop();
			
			_startTime = getTimer();
			_lastTime = 0;
			_lastTag = "";
			lap("start");
		}
		public static function stop():void{
			var stackTrace:String = "-------------------------------------------------------------------\n";
			var total		: int = 0;
			var currentTime : int = 0;
			var timeCount 	: int = _timeQueue.length-1; // enlève 1 pour le start
			
			while(_tagQueue.length > 0){
				currentTime = _timeQueue.shift();
				stackTrace += _tagQueue.shift() + " - " + currentTime +"\n";
				total += currentTime;
			}
			
			stackTrace += "Average = "+(total-_startTime)+"/"+timeCount+" = "+int((total-_startTime)/timeCount)+" --------------------------------------------------------------\n";
			
			trace(stackTrace);
		}
		public static function lap(tag:String, traceNow:Boolean = false):void{
			var newTime:int = getTimer();
			
			if(traceNow)
				trace((newTime-_lastTime)+" FROM "+_lastTag+" TO "+tag);
			
			_tagQueue.push(tag);
			_timeQueue.push(newTime-_lastTime);
			
			_lastTag = tag;
			_lastTime = newTime;
		}
	}
}