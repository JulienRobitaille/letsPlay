package com.drawm.mvc.event {
	
	import starling.events.Event;
	
	public class MVCEvent extends Event {
		
		public static const START       : String = "START";        // Début de l'initialisation
        public static const START_ENDED : String = "START_ENDED";  // Fin de l'initialisation
		public static const RESUME      : String = "RESUME";       // Démarage de l'intéractivité / écouteur d'événement
        public static const UPDATE      : String = "UPDATE";       // Update de l'affichage (onResize + orienttion change)
		public static const PAUSE       : String = "PAUSE";        // Arrêt de l'intéractivité / écouteur d'événement
        public static const STOP        : String = "STOP";         // Arrêt complet de la page
		public static const DISPOSE     : String = "DISPOSE";      // Suppression de la mémoire occupé par la page

        public static const ORIENTATION_CHANGED    : String = "ORIENTATION_CHANGED";  // Après le changement d'orientation
        public static const ORIENTATION_CHANGING   : String = "ORIENTATION_CHANGING"; // Changement d'orientation

		public static const LIST_CHANGE : String = "LIST_CHANGE";

		public function MVCEvent(type:String, bubbles:Boolean=false){
			super(type, bubbles);
		}
	}
}