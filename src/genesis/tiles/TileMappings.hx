/*
* This file is part of Genesis.
* For Copyright info see notice in Game.hx
* */

package genesis.tiles;

class TileFace
{
	public static inline var NORTH = 0;
	public static inline var EAST = 1;
	public static inline var SOUTH = 2;
	public static inline var WEST = 3;
}

class TileKey
{
	public var north: Int;
	public var east: Int;
	public var south: Int;
	public var west: Int;
	
	public function new(north: Int, east: Int, south: Int, west: Int)
	{
		this.north = north;
		this.east = east;
		this.south = south;
		this.west = west;
		this.west = west;
	}
	
	public function toFacing(key: Int): Int
	{
		switch key
		{
			case north: return TileFace.NORTH;
			case east: return TileFace.EAST;
			case south: return TileFace.SOUTH;
			case west: return TileFace.WEST;
			default: return -1;
		}
	}
	
	public function toKey(facing: Int): Int
	{
		switch facing
		{
			case TileFace.NORTH: return north;
			case TileFace.EAST: return east;
			case TileFace.SOUTH: return south;
			case TileFace.WEST: return west;
			default: return -1;
		}
	}
}