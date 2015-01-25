/**
 * Created by damon-karelab on 1/24/2015.
 */
package com.letsplay.data {
import com.drawm.utils.ParsableVO;

public class Choice extends ParsableVO{

	public var text : String;
	public var destinationId : String;
	public var animationTrigger : Array;
	public var stats : Object;


	public function Choice(data:Object) {
		super(data);
	}
}
}
