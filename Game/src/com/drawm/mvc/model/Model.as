package com.drawm.mvc.model{
	import com.drawm.mvc.Page;
	import com.drawm.mvc.event.MVCEvent;
	
	import starling.events.EventDispatcher;

	/**
	 * Le model permet de modifier les données de la page 
	 * et d'avertir les view des changements qui ont été fait.
	 * <br/><br/>
	 * Il est inutile d'utiliser Model seul, 
	 * il faut faire une subclass de Model et override ses methods pour 
	 * qu'il puisse être completement fonctionnel.
	 * S'il est utilisé seul il est trop générique pour servir dans une application.
	 * <br/><br/>
	 * Methods à override
	 * <ul>
	 * 	<li>start():void</li>
	 * 	<li>stop():void</li>
	 * 	<li>play():void</li>
	 * 	<li>resume():void</li>
	 * 	<li>pause():void</li>
	 * 	<li>dispose():void</li>
	 * </ul>
	 * 
	 * 
	 */
	public class Model extends EventDispatcher{
		
		public function Model(){ }
		
		public var currentPage:Page;
		
		/**
		 * [override]
		 * <br/>
		 * <br/>
		 * La fonction se répend dans la page et lui permet d'être affiché.
		 * Permet d'initialiser/installer la page.
		 * */
		public function start():void{
			dispatchEvent(new MVCEvent(MVCEvent.START));
			dispatchEvent(new MVCEvent(MVCEvent.START_ENDED));
		}
        /**
         * Met à jour l'affichage
         * */
        public function update():void{
            dispatchEvent(new MVCEvent(MVCEvent.UPDATE));
        }
        /**
         * L'orientation du device vas changer
         * */
        public function orientationChanging():void{
            dispatchEvent(new MVCEvent(MVCEvent.ORIENTATION_CHANGING));
        }
        /**
         * L'orientation du device à changé
         * */
        public function orientationChanged():void{
            dispatchEvent(new MVCEvent(MVCEvent.ORIENTATION_CHANGED));
        }
		/**
		 * Dit aux view d'activer leur écouteur d'événement, activer les timer, etc
		 * */
		public function resume():void {
			dispatchEvent(new MVCEvent(MVCEvent.RESUME));
		}
		/**
		 * Dit aux view  d'arrêter toutes intéractions, timer, etc
		 * */
		public function pause():void{
			dispatchEvent(new MVCEvent(MVCEvent.PAUSE));
		}
		/**
		 * Arrête tout fonctionnement de la page 
		 * */
		public function stop():void{
			dispatchEvent(new MVCEvent(MVCEvent.STOP));
		}
		/**
		 * Vide la mémoire du model et dit au view de sider leur mémoire
		 * */
		// Fait pour être override et dispose la mémoire des subcass
		public function dispose():void{
			dispatchEvent(new MVCEvent(MVCEvent.DISPOSE));
		}

		public function updateUI():void {

		}
	}
}