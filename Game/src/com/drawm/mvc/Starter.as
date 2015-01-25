package com.drawm.mvc {

	import com.drawm.mvc.data.DisplayData;

    import starling.display.Sprite;

    import flash.display.Stage;



	public class Starter extends Sprite{

		private static var instance : Starter;

        private var _displayData : DisplayData;


		public function Starter(stage:Stage){
			instance = this;
            _displayData = DisplayData.instance;

			validateDisplay(stage);

			super();
		}

		public static function addEventListener(type:String, listener:Function):void{
			instance.addEventListener(type, listener);
		}
		public static function removeEventListener(type:String, listener:Function):void{
			instance.removeEventListener(type, listener);
		}

		protected function validateDisplay(stage:Stage):void {
            _displayData.width  = stage.stageWidth;
            _displayData.height = stage.stageHeight;
		}
	}
}