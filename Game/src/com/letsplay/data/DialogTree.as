/**
 * Created by damon-karelab on 1/24/2015.
 */
package com.letsplay.data {

public class DialogTree {

	private var tree : Object = new Object();

	public function DialogTree() {}

	public function add(key:String, dialog:Dialog):void{
		tree[key] = dialog;
	}
	public function get(key:String):Dialog{
		return tree[key] as Dialog;
	}
}
}
