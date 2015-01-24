package com.drawm.mvc.data{

	public class DisplayData{
		
		public var width    : uint = 0;
		public var height   : uint = 0;

		public function get isPortrait():Boolean {
			return !isLandscape;
		}
		public function get isLandscape():Boolean {
			return (width > height);
		}

		// SINGLETON
		private static var _instance:DisplayData;
		public function DisplayData(){
			if(_instance) {
				throw(new Error("DisplayData is a singleton"),9001);
            } else {
				_instance = this;
            }
		}
		public static function get instance():DisplayData{
			if(!_instance)
				new DisplayData();
			return _instance;
		}
	}
}