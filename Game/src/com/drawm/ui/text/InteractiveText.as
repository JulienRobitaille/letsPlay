package com.drawm.ui.text {
	
	import com.drawm.ui.interactive.IInteractiveUI;

	public class InteractiveText extends UIText implements IInteractiveUI{
		public function InteractiveText(id:String) {
			super(id);
		}
		
		public function up():void {}
		
		public function out():void {}
		
		public function down():void {}
		
	}
}