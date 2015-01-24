package com.drawm.ui.text {
	
	import com.drawm.ui.interactive.IInteractiveUI;

	public class InteractiveText extends UIText implements IInteractiveUI{
		public function InteractiveText(id:String,width:int,height:int,text:String,fontName:String = "Verdana",fontSize:Number = 12,color:uint = 0,bold:Boolean = false) {
			super(id, width, height, text, fontName, fontSize, color, bold);
		}
		
		public function up():void {}
		
		public function out():void {}
		
		public function down():void {}
		
	}
}