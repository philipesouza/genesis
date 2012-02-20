/*
* This file is part of Genesis.
* For Copyright info see notice in Game.hx
* */

package genesis;

import genesis.actors.Actor;

class Scene extends Actor
{
	public var actors: Array<Actor>;
	
	public function new(actors: Array<Actor>)
	{
		super();
		setClip();
		
		this.actors = actors;
		for (actor in actors) clip.addChild(actor.clip);
	}
	
	public override function pause(): Void
	{
		super.pause();
		for (actor in actors) actor.pause();
	}
	
	public override function resume(): Void
	{
		super.resume();
		for (actor in actors) actor.resume();
	}
}
