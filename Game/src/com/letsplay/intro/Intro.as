/**
 * Created by julien on 1/24/15.
 */
package com.letsplay.intro {
import com.drawm.mvc.Page;

public class Intro extends Page {
    public function Intro() {
        super(IntroModel, IntroView, IntroController);
    }
}
}
