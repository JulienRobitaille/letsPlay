package com.drawm.mvc{

import com.drawm.mvc.data.DisplayData;

	import com.drawm.mvc.controler.Controller;
	import com.drawm.mvc.event.MVCEvent;
	import com.drawm.mvc.model.Model;
	import com.drawm.mvc.view.View;

    import starling.display.Sprite;
import starling.events.Event;
import flash.geom.Rectangle;

import flash.system.System;

	import starling.display.DisplayObjectContainer;

	public class Page extends Sprite {
		
		private var currentOrientation : String = "";

        private var _displayData : DisplayData;
		
		/**
		 * Défini si la fonction start a déjà été appelé
		 * Si isStarted == true, l'application contient ses élément graphiques 
		 * et les informations nécéssaires pour qu'elle sois fonctionnel.
		 * Il est donc inutile d'appeler start dans ce cas, il faut plutot appeler resume();
		 */
		private var _isStarted:Boolean = false;
		
		protected var _model : Model;
		protected var _view	 : View;

		public function get _controler():Controller {
			return __controler;
		}

		public function set _controler(value:Controller):void {
			statusStack.push("_controler from "+__controler+" to "+value);
			__controler = value;
		}

		public function get isStarted():Boolean {
			return _isStarted;
		}
		private var _isPaused:Boolean = false;
		public function get isPaused():Boolean {
			return _isPaused;
		}
		
		public function get view():View{
			return _view;
		}
		protected var __controler : Controller;
		
		/**
		 * Défini si la page est visible / est complètement initialisé
		 */
		private var _isInitialized:Boolean = false;
		
		/**
		 * Garde men mémoire la dernière trnasition utilisé sur la page
		 */
		public var lastTransition:uint;
		
		public var statusStack:Array = new Array();
		
		public function Page(model:Class,view:Class,controler:Class){
			this.addEventListener(Event.ADDED_TO_STAGE, screen_addedToStageHandler);

            // Init les variables nécéssaires au fonctionnement de la page
            _displayData = DisplayData.instance;
            _isInitialized = false;

            // Init le model
			_model = Model(new model());
			_model.currentPage = this;

            // Init la view de base
			_view = View(new view(_model));

            // Init le controler
			_controler = Controller(new controler(_model,this));

			super();
		}
		
		private function restartPage():void {
			if(isStarted){
				if(!isPaused){
					pause();
				
					_isInitialized = false;
					resume();
				}
			}
		}
		
		// LEGACY' LEGACY EVERYWHERE
		protected function removeAllChild(target:DisplayObjectContainer):void{
            while(target.numChildren != 0){
                target.removeChildAt(0);
            }
		}

		// Fonctions pour le life cycle du wrapper -------------------------------------------------- //
        // ------------------------------------------------------------------------------------------ //
		
		// Désactive temporairement la page
		public function pause():void {
			statusStack.push("pause");
			_controler.pause();
			_isPaused = true;
			this.touchable = false;
		}
		
		// Réactive la page
		public function resume():void {
			statusStack.push("resume");
			_controler.resume();
			_isPaused = false;
			this.touchable = true;
		}

		// permet d'initialiser/installer la page
		public function start():void{
			_view.setupListeners();
			
			statusStack.push("start");
			_model.addEventListener(MVCEvent.START_ENDED, onStartEnded);
			addChild(_view);
			_controler.start();
			_isStarted = true;
		}

		public function startEnded():void{
            stage.addEventListener(Event.RESIZE, onStageResize);

        }

    protected function onStageResize(event:Event):void {
        _displayData.width  = stage.stageWidth;
        _displayData.height = stage.stageHeight;
        updateDimensions(stage.stageWidth,stage.stageHeight); // Met à jour les info sur l'affichage
    }

        private function updateDimensions(width:int, height:int):void {
            _displayData.width  = width;
            _displayData.height = height;

            _controler.update(); // Notifie le reste de l'application que l'affichage changé
        }
		
		private function onStartEnded(event:Event):void {
			startEnded();
			statusStack.push("onStartEnded");
			event.target.removeEventListener(MVCEvent.START_ENDED, onStartEnded);
			_isInitialized = true;

            _controler.update();
			resume();
		}
		
		// Arrête tout fonctionnement de la page
		public function stop():void{
            stage.removeEventListener(Event.RESIZE, onStageResize);
            stage.removeEventListener(Event.RESIZE, onStageResize);

			statusStack.push("stop");
			_controler.stop();
			_isStarted = false;
        }

		// Supprime / vide la page
		override public function dispose():void {
			statusStack.push("dispose");

			_controler.dispose();
			
			if(_view){
				removeAllChild(_view);
				
				// à revoir pour s'assurer de ne pas faire de memory leak ------------------------------------------------- //
				if(_view.parent)
					_view.parent.removeChild(_view);
			}
			_model	   = null;
			_view  	   = null;
			_controler = null;
			
			System.gc();

			super.dispose();
		}
		// Supprime / vide la page
		public function shallowDispose():void {
			statusStack.push("shallowDispose");

			removeAllChild(_view);
			
			System.gc();
		}
		
		protected function screen_addedToStageHandler(event:Event):void{

            _displayData.width  = stage.stageWidth;
            _displayData.height = stage.stageHeight;

			this.removeEventListener(Event.ADDED_TO_STAGE, screen_addedToStageHandler);
			this.addEventListener(Event.REMOVED_FROM_STAGE, screen_removedFromStageHandler);
			
			statusStack.push("screen_addedToStageHandler");
			start();
		}
		
		protected function screen_removedFromStageHandler(event:Event):void{
			statusStack.push("screen_removedFromStageHandler");
			stop();
			this.addEventListener(Event.ADDED_TO_STAGE, screen_addedToStageHandler);
			this.removeEventListener(Event.REMOVED_FROM_STAGE, screen_removedFromStageHandler);
		}
	}
}