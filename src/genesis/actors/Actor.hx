/*
* This file is part of Genesis.
* For Copyright info see notice in Game.hx
* */

package genesis.actors;

import genesis.clips.Clip;

class Actor
{
	public var clip: Clip;
	
	public function new(?clip: Clip)
	{
		this.clip = clip;
	}
	
	public function setClip(?clip: Clip)
	{
		if (clip == null) clip = new Clip();
		this.clip = clip;
	}
	
	public function pause(): Void
	{
		clip.pause();
	}
	
	public function resume(): Void
	{
		clip.resume();
	}
}
