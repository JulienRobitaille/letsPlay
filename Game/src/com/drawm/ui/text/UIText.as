package com.drawm.ui.text
{
	import com.drawm.ui.IUI;
	import com.drawm.ui.UI;

    import starling.text.TextField;


public class UIText extends TextField implements IUI{
		
		private var _id:String;
		
		public function UIText(id:String,width:int,height:int,text:String){
			super(width,height,text);
			
			_id = id;
			UI.addUI(this);
		}
		
		public function get id():String{
			return _id;
		}
	}
}

