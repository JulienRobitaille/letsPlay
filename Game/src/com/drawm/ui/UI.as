package com.drawm.ui
{
import starling.display.Sprite;
import starling.events.Event;
	
	public class UI extends Sprite implements IUI{
		
		private static var _uiList:Vector.<IUI> = new Vector.<IUI>();
		
		private static var idCount:uint = 0;
		protected var _id:String;
		
		public function get id():String{
			return _id;
		}
		public function UI(id:String = null){
			
			if(id == null)
				_id = createUUID();
			else
				_id = id;
			
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			super();
		}
		
		protected function onAddedToStage(event:Event):void{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			addUI(this);
			addEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
		}
		
		protected function onRemovedFromStage(event:Event):void{
			removeEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
			removeUI(_id);
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		public static function addUI(ui:IUI):void{
			_uiList.push(ui);
		}
		
		public static function createUUID() : String {
			return ""+(idCount++);
			//return (new Date()).time*100+int(Math.random()*100);
		}
		public static function getUI(id:String):IUI{
			// Pas optimisé...
			var limit:int = _uiList.length-1;
			var ui:IUI;
			while(limit >= 0){
				ui = _uiList[limit];
				if(ui.id == id)
					return ui;
				
				limit--;
			}
			return null;
		}
		public static function removeUI(id:String):void{
			// Pas optimisé...
			var newList:Vector.<IUI> = new Vector.<IUI>();
			var limit:int = _uiList.length-1;
			var ui:IUI;
			while((limit--) >= 0){
				ui = _uiList.shift();
				if(ui.id != id){
					newList.push(ui);
				}
			}
			_uiList = null;
			_uiList = newList;
		}
	}
}