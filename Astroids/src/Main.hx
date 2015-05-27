package ;

import openfl.Lib.getTimer;
import flash.display.Sprite;
import flash.events.Event;
import flash.Lib;
import openfl.ui.Keyboard;
import openfl.events.KeyboardEvent;

/**
 * ...
 * @author Andor
 */

class Main extends Sprite 
{
	var inited:Bool;
	static var instance:Main;
	var ship:Ship = null;
	
	var lastTime:Int = 0;
	
	var keyLeft:Bool = false ;
	var keyRight:Bool = false ;
	var keySpace:Bool = false ;
	var keyUp:Bool = false ;
	
	public function new() 
	{
		super();	
		instance = this ;
		
		addEventListener( Event.ENTER_FRAME, onEnterFrame);
		stage.addEventListener (KeyboardEvent.KEY_DOWN, onKeyDown );
		stage.addEventListener (KeyboardEvent.KEY_UP, onKeyUp );
		
		ship = new Ship() ;
		ship.x = stage.stageWidth / 2 ;
		ship.y = stage.stageHeight / 2 ;
		
		addChild (ship);
	}
	
	private function onKeyDown(e:KeyboardEvent):Void 
	{	
		if (e.keyCode == Keyboard.UP)
		{
			keyUp = true ;
		}
		
		if (e.keyCode == Keyboard.LEFT)
		{
			keyLeft = true ;
		}
		
		if (e.keyCode == Keyboard.RIGHT)
		{
			keyRight = true ;
		}
		
		if (e.keyCode == Keyboard.SPACE)
		{
			keySpace = true ;
		}
	}
	
	private function onKeyUp(e:KeyboardEvent):Void 
	{
		if (e.keyCode == Keyboard.UP)
		{
			keyUp = false ;
		}
		
		if (e.keyCode == Keyboard.LEFT)
		{
			keyLeft = false ;
		}
		
		if (e.keyCode == Keyboard.RIGHT)
		{
			keyRight = false ;
		}
		
		if (e.keyCode == Keyboard.SPACE)
		{
			keySpace = false ;
		}
	}
	
	public static function getInstance():Main
	{
		return instance;
	}
	
	function onEnterFrame (event: Event)
	{
		var currentTime:Int = getTimer();
		// time since last update
		var elapsedTime:Float = (currentTime - lastTime)/1000 ;
		
		// update below this
		
		ship.throttle = keyUp ? 1.0 : 0.0 ;
		ship.steer = keyLeft ? -1.0 : (keyRight ? 1.0 : 0.0) ;
		ship.fire = keySpace ;
		
		// reset lasttime
		lastTime = currentTime ;
		//trace (elapsedTime);
		
		
		
	}
	
	
}
