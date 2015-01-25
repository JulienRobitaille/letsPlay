/**
 * Created by julien on 1/24/15.
 */
package com.letsplay.menu {
import com.drawm.mvc.model.Model;
import com.drawm.ui.UI;

public class MenuModel extends Model {
   public var id_play:String = UI.createUUID();
   public var id_credit:String = UI.createUUID();
   public var id_credit_box:String = UI.createUUID();
    public function MenuModel() {
        super();
    }
}
}
