package com.drawm.utils{
import flash.utils.describeType;

public class ParsableVO extends Object{
		
		
		public function ParsableVO(info:Object = null){
            if(info != null)
			    parseFromObject(info);

			super();
		}


        private static var i:int;
        private static var j:String;
        private static var name:String;

		final private function parseFromObject(update:Object):void{
            var propertysNames:XMLList = describeType(update).variable.@name;
            i = propertysNames.length();
            while((i--) >= 0)  // Cherche dans toutes les propriétés de class
                if(this.hasOwnProperty(name = propertysNames[i]))
                    this[name] = update[name];


			for(j in update)  // Cherche dans toutes les propriétés dynamiquement assigné
				if(this.hasOwnProperty(j))
					this[j] = update[j];
		}

		
		/**
		 * Ajoute les nouveux éléments du serveur dans le bidVO
		 */
		public function updateFromObject(object:Object):void{
			parseFromObject(object)
		}
	}
}