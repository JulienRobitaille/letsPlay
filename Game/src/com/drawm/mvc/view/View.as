package com.drawm.mvc.view
{
	import com.drawm.mvc.event.MVCEvent;
	import com.drawm.mvc.model.Model;
	import com.drawm.ui.interactive.InteractiveUI;

import starling.display.Sprite;

import starling.events.Event;
	
	public class View extends Sprite {
		
		protected var _model:Model;
		
		public function View(model:Model){
			_model = model;
			setupListeners();
			super();
		}
		
		/**
		 * Activé au tout début du lifecircle de la page
		 */
		private function onStart(event:MVCEvent):void{
			start();
		}
		/**
		 * Set les valeurs par défaut de la page et affiche les éléments visuels
		 */
		private function onUpdate(event:MVCEvent):void{
			update();
		}

		/** 
		 * Active les écouteurs d'événement, les timers, etc
		 */
		private function onResume(event:MVCEvent):void{
			resume();
		}
		/**
		 * Arrête les écouteurs d'événement, les timers, etc
		 */
		private function onPause(event:MVCEvent):void{
			pause();
		}
		/**
		 * Arrête tout fonctionnement de la page 
		 */
		private function onStop(event:MVCEvent):void{
			stop();
		}

        private function onOrientationChanged(event:Event):void {
            orientationChanged();
        }

        private function onOrientatonChanging(event:Event):void {
            orientationChanging();
        }
		
		// Désactive temporairement la page
		public function pause():void { }

		// Réactive la view
		public function resume():void { }

		// permet d'initialiser/installer la page
		public function start():void { }

		// Arrête tout fonctionnement de la page
		public function stop():void { }

        public function update():void { }

        public function orientationChanging():void { }

        public function orientationChanged():void { }
		
		/**
		 * Vide la mémoire de la view
		 */
		private function onDispose(event:MVCEvent):void{
			event.target.removeEventListener(event.type, arguments.callee);
		}
		
		protected function removeListeners():void {
            // Événement d'initialisation
			if(_model.hasEventListener(MVCEvent.START))
				_model.removeEventListener(MVCEvent.START, onStart);
            if(_model.hasEventListener(MVCEvent.RESUME))
                _model.removeEventListener(MVCEvent.RESUME, onResume);

            // Événement de modification
            if(_model.hasEventListener(MVCEvent.UPDATE))
                _model.removeEventListener(MVCEvent.UPDATE, onUpdate);
            if(_model.hasEventListener(MVCEvent.ORIENTATION_CHANGING))
                _model.removeEventListener(MVCEvent.ORIENTATION_CHANGING, onOrientatonChanging);
            if(_model.hasEventListener(MVCEvent.ORIENTATION_CHANGED))
                _model.removeEventListener(MVCEvent.ORIENTATION_CHANGED, onOrientationChanged);

            // Événement de suppression
            if(_model.hasEventListener(MVCEvent.PAUSE))
                _model.removeEventListener(MVCEvent.PAUSE, onPause);
			if(_model.hasEventListener(MVCEvent.STOP))
				_model.removeEventListener(MVCEvent.STOP, onStop);
			if(_model.hasEventListener(MVCEvent.DISPOSE))
				_model.removeEventListener(MVCEvent.DISPOSE, onDispose);
		}

		
		public function setupListeners():void {
            // Événement d'initialisation
			_model.addEventListener(MVCEvent.START,   onStart);
            _model.addEventListener(MVCEvent.RESUME,  onResume);

            // Événement de modification
            _model.addEventListener(MVCEvent.ORIENTATION_CHANGING, onOrientatonChanging);
            _model.addEventListener(MVCEvent.ORIENTATION_CHANGED,  onOrientationChanged);
			_model.addEventListener(MVCEvent.UPDATE,  onUpdate);

            // Événement de suppression
			_model.addEventListener(MVCEvent.PAUSE,   onPause);
			_model.addEventListener(MVCEvent.STOP, 	  onStop);
            _model.addEventListener(MVCEvent.DISPOSE, onDispose);
        }
		
	}
}