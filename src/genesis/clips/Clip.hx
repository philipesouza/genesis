/*
* This file is part of Genesis.
* For Copyright info see notice in Game.hx
* */

package genesis.clips;

import nme.display.MovieClip;

class Clip extends MovieClip
{
	public var playing: Bool;
	
	public function new(x = 0, y = 0)
	{
		super();
		playing = true;
		
		this.x = x;
		this.y = y;
	}
	
	public function pause(): Void
	{
		playing = false;
	}
	
	public function resume(): Void
	{
		playing = true;
	}
	
	public function handleFrame(event: Dynamic): Void
	{
	}
	
	public function move(x: Int, y: Int): Void
	{
		this.x += x;
		this.y += y;
	}
}
