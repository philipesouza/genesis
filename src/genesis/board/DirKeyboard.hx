/*
* This file is part of Genesis.
* For Copyright info see notice in Game.hx
* */

package genesis.board;

import genesis.events.Trigger;

class DirKeyboard
{
	public var mobile: BoardMobile;
	public var map: DirKey;
	
	public function new(mobile: BoardMobile, ?map: DirKey)
	{
		if (map == null) map = new DirKey(38, 39, 40, 37);
		this.map = map;
		
		this.mobile = mobile;
		
		Trigger.onKeyDown(handleKeyDown);
		Trigger.onKeyUp(handleKeyUp);
	}
	
	public function handleKeyDown(event: Dynamic): Void
	{
		switch map.toCoord(event.keyCode)
		{
			case DirMapping.UP: mobile.moveUp();
			case DirMapping.RIGHT: mobile.moveRight();
			case DirMapping.DOWN: mobile.moveDown();
			case DirMapping.LEFT: mobile.moveLeft();
		}
	}
	
	public function handleKeyUp(event: Dynamic): Void
	{
		if (map.toCoord(event.keyCode) != -1) mobile.stopMoving();
	}
}
