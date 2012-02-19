/*
* This file is part of Genesis.
* For Copyright info see notice in Game.hx
* */

package genesis.tiles;

import genesis.actors.Actor;

class Tile extends Actor
{
	public var ref: TileRef;
	
	public var x: Int;
	public var y: Int;
	
	public function new(ref: TileRef, x: Int, y: Int)
	{
		super();
		
		this.ref = ref;
		
		this.x = x;
		this.y = y;
	}
	
	public function copy()
	{
		return new Tile(ref, x, y);
	}
}
