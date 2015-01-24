package com.drawm.ui.interactive{
import com.drawm.ui.*;
	public interface IInteractiveUI extends IUI{

		// Is this relly necessary? common man
		function out():void;
//        function hover():void;
        function down():void;
        function up():void;

		function get x():Number;
		function get y():Number;
		function set x(value:Number):void;
		function set y(value:Number):void;

		function get width():Number;
		function get height():Number;
		function set width(value:Number):void;
		function set height(value:Number):void;
	}
}