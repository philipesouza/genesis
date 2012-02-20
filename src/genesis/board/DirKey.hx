/*
* This file is part of Genesis.
* For Copyright info see notice in Game.hx
* */

package genesis.board;

class DirKey
{
	public var up: Int;
	public var right: Int;
	public var down: Int;
	public var left: Int;
	
	public function new(up: Int, right: Int, down: Int, left: Int)
	{
		this.up = up;
		this.right = right;
		this.down = down;
		this.left = left;
	}
	
	public function toCoord(key: Int): Int
	{
		switch key
		{
			case up: return DirMapping.UP;
			case right: return DirMapping.RIGHT;
			case down: return DirMapping.DOWN;
			case left: return DirMapping.LEFT;
			default: return -1;
		}
	}
	
	public function toKey(facing: Int): Int
	{
		switch facing
		{
			case DirMapping.UP: return up;
			case DirMapping.RIGHT: return right;
			case DirMapping.DOWN: return down;
			case DirMapping.LEFT: return left;
			default: return -1;
		}
	}
}