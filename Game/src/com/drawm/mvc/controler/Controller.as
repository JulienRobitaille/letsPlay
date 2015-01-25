package com.drawm.mvc.controler
{
import com.drawm.mvc.Page;
import com.drawm.mvc.event.MVCEvent;
import com.drawm.mvc.model.Model;
import com.drawm.ui.interactive.IInteractiveUI;

import flash.display.Stage;

import flash.geom.Point;
import flash.system.Capabilities;

import starling.core.Starling;
import starling.events.Event;
import starling.events.Touch;
import starling.events.TouchEvent;
import starling.events.TouchPhase;

/**
 * Le controler permet de capturer les intéraction de l'utilisateur (click, touch, drag, etc)
 * Quand l'utilisateur intéragie avec l'application, le controleur détermine
 * ce que l'application doit faire en retour.
 * EX: Click sur un bouton -> change le bouton de couleur
 *
 * Une fois que le retour de l'Application est déterminé, le controler appel le model pour qu'il modifie
 * les Data de l'application.
 *
 * <br/><br/>
 * Il est inutile d'utiliser Controler seul,
 * il faut faire une subclass de Controler et override ses methods pour
 * qu'il puisse être completement fonctionnel.
 * S'il est utilisé seul il est trop générique pour servir dans une application.
 * <br/><br/>
 * Methods à override :
 * <br/><br/>
 * <b>Lifecircle</b>
 * <ul>
 * 	<li>startControl():void</li>
 * 	<li>stopControl():void</li>
 * 	<li>start():void</li>
 * 	<li>stop():void</li>
 * 	<li>play():void</li>
 * 	<li>resume():void</li>
 * 	<li>pause():void</li>
 * 	<li>dispose():void</li>
 * </ul>
 * <br/>
 * <b>Intéraction</b>
 * <ul>
 * 	<li>onTouchStationnary(Touch):void </li>
 * 	<li>onMouseOver(Touch):void</li>
 * 	<li>onTouchDown(Touch):void</li>
 * 	<li>onTouchOut(Touch):void</li>
 * 	<li>onTouchUp(Touch):void</li>
 * 	<li>onTouchMove(Touch):void</li>
 * 	<li>click(Touch):void</li>
 * </ul>
 *
 */
public class Controller {
	/**
	 * Prremier Point(x,y) que l'utilisateur a fait dans un mouvement
	 *
	 * <b>Futur</b>
	 * Utiliser un dictionnary pour supporter du multitouch
	 */
	private var _startTouchPos:Point = new Point(0, 0);
	protected var _model:Model;
	protected var _page:Page;

	private const clickTreshold:uint = Capabilities.screenDPI>>1;

	/**
	 * Contient le id du dernier text input sélectionné
	 * Permet de gérer les donné du textfield une fois le texte écris
	 */
	protected var selectedTextInput:uint;
	/**
	 * Permet de faire le pond entre les intéraction de l'utilisateur et le comportement de l'application.
	 * Pour qu'un composant visuel soit persu comme intéractif, il doit absolument implementer IInteractiveUI
	 *
	 * @param	model
	 * @param	page
	 */
	public function Controller(model:Model, page:Page){
		_model = model;
		_page  = page;
	}

	// Function lié au lifecircle de la page ---------------------------------------------------------- //
	[Inline]
	final private function startControl():void{
		if(!_page.hasEventListener(TouchEvent.TOUCH))
			_page.addEventListener(TouchEvent.TOUCH, onTouch);

		if(!_page.hasEventListener(MVCEvent.LIST_CHANGE))
			_page.addEventListener(MVCEvent.LIST_CHANGE, onListChange);

	}

	[Inline]
	public function updateUI():void {
		_model.updateUI();
	}

	[Inline]
	final public function stopControl():void{
		if(_page.hasEventListener(TouchEvent.TOUCH))
			_page.removeEventListener(TouchEvent.TOUCH, onTouch);

		if(_page.hasEventListener(MVCEvent.LIST_CHANGE))
			_page.removeEventListener(MVCEvent.LIST_CHANGE, onListChange);
	}

	/**
	 * Appel le model pour rendre la page visible
	 */
	public function start():void{
		_model.start();
	}

	/**
	 * Active l'intéraction de la page avec startControl() et
	 * appel le model pour qu'il amorce le fonctionnement de la page
	 *
	 * Définie les valeurs par défaut du controler (Timer, Point, etc)
	 * Appel le model pour définir les valeur par défaut de la page
	 * et appel resume pour activer l'intéraction, les timers, etc.
	 */

	public function resume():void {
		startControl();
		_model.resume();
	}
	/**
	 * Dit au model d'arrêter temporairement la page.
	 * Arrête toute intéraction avec la page, mais elle est encore visible.
	 */
	public function pause():void{
		_model.pause();
		stopControl();
	}
	/**
	 * Dit au model de faire disparaitre la page de la displaylist
	 */
	public function stop():void{
		_model.stop();
	}
	/**
	 * Vide la mémoire du controleur
	 * Dit au model de vider sa mémoire
	 */
		//La page disparais de la memoire
	public function dispose():void {
		_model.dispose();
	}

	// FIN -Function lié au lifecircle de la page ---------------------------------------------------------- //
	private function isClick(touchX:int,touchY:int):Boolean{
		// Define if the touch was ment to be a click and not a drag
		var value:int  = _startTouchPos.x - touchX;
		var diffX:uint = value < 0 ? -value : value;
		value = _startTouchPos.y - touchY;
		var diffY:uint = value < 0 ? -value : value;

		//Click/Tap
		return diffX < clickTreshold && diffY < clickTreshold;
	}

	// Define what has been touched and how
	private function onTouch(event:TouchEvent):void{
		var stage:Stage = Starling.current.nativeStage;
		for each(var touch:Touch in event.touches){
			if(touch.phase != TouchPhase.HOVER){ // out of place for debug purposes
				if(touch.phase == TouchPhase.BEGAN){
					onTouchDown(touch);
				}else if(touch.phase == TouchPhase.ENDED){
					onTouchUp(touch);
				}else if(touch.phase == TouchPhase.MOVED){
					onTouchMove(touch);
				}else if(touch.phase == TouchPhase.STATIONARY){
					stationnary(touch);
				}
			}else{
				over(touch);
			}
		}
	}

	protected function onTouchDown(touch:Touch):void{
		if(touch.target is IInteractiveUI){
			_startTouchPos.x = Starling.current.nativeStage.mouseX;
			_startTouchPos.y = Starling.current.nativeStage.mouseY;
		}
	}

	protected function onTouchUp(touch:Touch):void{
		onTouchMove(touch);
		if(touch.target is IInteractiveUI){
			if(isClick(Starling.current.nativeStage.mouseX, Starling.current.nativeStage.mouseY)){
				click(touch);
			}
		}

	}
	protected function onTouchMove(touch:Touch):void {
		if(touch.target is IInteractiveUI){
			if(!isClick(touch.globalX,touch.globalY)){
				this.out(touch);
				IInteractiveUI(touch.target).out();
			}
		}
	}

	protected function click(touch:Touch):void{ }
	protected function stationnary(touch:Touch):void{ }
	protected function over(touch:Touch):void{}
	protected function out(touch:Touch):void{}

	protected function onTextInputChange(event:Event):void{}
	protected function onListChange(event:Event):void{}


	public function changePage(page:Page):void {
		_page = page;
	}

	public function update():void {

	}
}
}