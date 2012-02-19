/*
* This file is part of Genesis.
* For Copyright info see notice in Game.hx
* */

package genesis.actors;

import genesis.Game;
import nme.display.MovieClip;
import nme.events.Event;
import nme.events.KeyboardEvent;
import nme.Lib;

class Actor
{
	public var clip: MovieClip;
	public var playing: Bool;
	
	public function new(?clip: MovieClip)
	{
		this.clip = clip;
		if (clip == null) playing = false;
		playing = true;
	}
	
	public function setClip(?clip: MovieClip)
	{
		if (clip == null) clip = new MovieClip();
		this.clip = clip;
		playing = true;
	}
	
	public function pause(): Void
	{
		playing = false;
	}
	
	public function resume(): Void
	{
		playing = true;
	}
	
	/* Basic events*/
	public function onFrame(f: Dynamic->Void): Void
	{
		Lib.current.stage.addEventListener(Event.ENTER_FRAME, f);
	}
	
	public function onKeyDown(f: Dynamic->Void): Void
	{
		Lib.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, f);
	}
	
	public function onKeyUp(f: Dynamic->Void): Void
	{
		Lib.current.stage.addEventListener(KeyboardEvent.KEY_UP, f);
	}
	
	/* Basic actions*/
	public function move(x: Int, y: Int): Void
	{
		clip.x += x;
		clip.y += y;
	}
}
