/**
 * Created by damon-karelab on 1/24/2015.
 */
package com.letsplay.data {

import com.drawm.utils.ParsableVO;

public class Dialog extends ParsableVO {

	public var id : String;
	public var text : String;
	public var choices : Vector.<Choice>;

	public function Dialog(info:Object = null) {
		super(info);
	}
}
}
