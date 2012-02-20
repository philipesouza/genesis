/*
* This file is part of Genesis.
* For Copyright info see notice in Game.hx
* */

package genesis.tiles;

import genesis.board.BoardWalk;

class TileCharClip extends BoardWalk
{
	public function new(sheet: TileSheet, x: Int, y: Int, direction: Int, xoffset: Int, yoffset: Int, step: Int, cycles: Int)
	{
		super(sheet, direction, cycles, step);
		
		this.x = x + xoffset;
		this.y = y + yoffset;
	}
}