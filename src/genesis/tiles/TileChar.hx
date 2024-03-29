/*
* This file is part of Genesis.
* For Copyright info see notice in Game.hx
* */

package genesis.tiles;
import genesis.actors.Actor;

class TileChar extends Actor
{	
	public function new(sheet: TileSheet, x: Int, y: Int, direction: Int, xoffset: Int, yoffset: Int, step: Int, cycles: Int)
	{
		super(new TileCharClip(sheet, x, y, direction, xoffset, yoffset, step, cycles));
	}
}