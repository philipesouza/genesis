/*
* This file is part of Genesis.
* For Copyright info see notice in Game.hx
* */

package genesis.tiles;

import genesis.actors.Actor;
import genesis.tiles.TileMappings.TileFace;

class TileChar extends Actor
{
	public var sheet: TileSheet;
	
	public var x: Int;
	public var y: Int;
	
	public var facing: Int;
	
	public var xoffset: Int;
	public var yoffset: Int;
	
	public var step: Int;
	public var cycles: Int;
	public var moving: Bool;
	private var curcycle: Int;
	
	public function new(sheet: TileSheet, x: Int, y: Int, facing: Int, xoffset: Int, yoffset: Int, step: Int, cycles: Int)
	{
		super();
		setClip();
		
		clip.x = x + xoffset;
		clip.y = y + yoffset;
		
		this.sheet = sheet;
		
		this.x = x;
		this.y = y;
		
		this.xoffset = xoffset;
		this.yoffset = yoffset;
		
		clip.addChildAt(sheet.ref[facing].image, 0);
		this.facing = facing;
		
		this.step = step;
		this.cycles = cycles;
		curcycle = 0;
	}
	
	public function setFacing(facing: Int): Void
	{
		clip.removeChildAt(0);
		clip.addChildAt(sheet.ref[facing].image, 0);
		this.facing = facing;
	}
	
	public function startMoving(direction: Int): Void
	{
		if (curcycle > 0 || !playing) return;
		
		setFacing(direction);
		
		switch facing
		{
			case TileFace.NORTH: y -= 1;
			case TileFace.EAST: x += 1;
			case TileFace.SOUTH: y += 1;
			case TileFace.WEST: x -= 1;
		}
		
		moving = true;
		curcycle = cycles;
	}
	
	public function stopMoving(): Void
	{
		moving = false;
	}
	
	public function handleFrame(event: Dynamic): Void
	{
		if (!playing) return;
		
		if (curcycle == 0)
		{
			if (!moving) return;
			curcycle = cycles;
		}
		
		curcycle -= 1;
		
		var xstep = 0, ystep = 0;
		switch facing
		{
			case TileFace.NORTH: ystep = -step;
			case TileFace.EAST: xstep = step;
			case TileFace.SOUTH: ystep = step;
			case TileFace.WEST: xstep = -step;
		}
		
		move(xstep, ystep);
	}
}