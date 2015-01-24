package com.drawm.utils
{
	public class TimeInfo {
		
		public static const millisecondsPerMinute	: int = 1000 * 60; 
		public static const millisecondsPerHour		: int = 1000 * 60 * 60; 
		public static const millisecondsPerDay		: int = 1000 * 60 * 60 * 24;

        private var _date:Date;
		
		public function TimeInfo(year:*=null, month:*=null, date:*=null, hours:*=null, minutes:*=null, seconds:*=null, ms:*=null) {
            _date = new Date(year, month, date, hours, minutes, seconds, ms);
		}
		
		public static function getTimeLeft(futureDate:Date):Number{
			var time:Date = new Date();
			time.setTime((new Date()).getTime() - futureDate.getTime());
			return time.time;
		}
		
		public static function totalTimeToString(totalTime:Date):String{
			return  ((totalTime.getUTCMonth()	> 10 ) ? totalTime.getUTCMonth() 	: "0"+totalTime.getUTCMonth() )+":"+
					((totalTime.getUTCDay()		> 10 ) ? totalTime.getUTCDay() 		: "0"+totalTime.getUTCDay() )+":"+
					((totalTime.getUTCHours() 	> 10 ) ? totalTime.getUTCHours() 	: "0"+totalTime.getUTCHours() )+":"+
					((totalTime.getUTCMinutes()	> 10 ) ? totalTime.getUTCMinutes() 	: "0"+totalTime.getUTCMinutes() )
		}
	}
}