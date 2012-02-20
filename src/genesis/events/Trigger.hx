/*
* This file is part of Genesis.
* For Copyright info see notice in Game.hx
* */

package genesis.events;

import nme.events.Event;
import nme.events.KeyboardEvent;
import nme.Lib;

class Trigger
{
	public static function onFrame(f: Dynamic->Void): Void
	{
		Lib.current.stage.addEventListener(Event.ENTER_FRAME, f);
	}
	
	public static function onKeyDown(f: Dynamic->Void): Void
	{
		Lib.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, f);
	}
	
	public static function onKeyUp(f: Dynamic->Void): Void
	{
		Lib.current.stage.addEventListener(KeyboardEvent.KEY_UP, f);
	}
}
