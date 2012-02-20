/*
* This file is part of Genesis.
* For Copyright info see notice in Game.hx
* */

package genesis.board;

import genesis.events.Trigger;
import genesis.clips.Clip;
import genesis.tiles.TileSheet;

class BoardWalk extends Clip, implements BoardMobile
{
	private var sheet: TileSheet;
	private var facing: Int;
	
	private var cycles: Int;
	
	private var step: Int;
	
	private var direction: Int;
	private var newdirection: Int;
	
	private var moving: Bool;
	private var curcycle: Int;
	
	public function new(sheet: TileSheet, facing = 0, cycles: Int, step: Int)
	{
		super();
		
		this.facing = facing;
		this.sheet = sheet;
		addChildAt(sheet.ref[facing].image, 0);
		
		this.cycles = cycles;
		
		this.step = step;
		
		direction = -1;
		newdirection = -1;
		moving = false;
		curcycle = 0;
		
		Trigger.onFrame(handleFrame);
	}
	
	public function setFacing(facing: Int)
	{
		if (!playing) return;
		
		removeChildAt(0);
		addChildAt(sheet.ref[facing].image, 0);
		this.facing = facing;
	}
	
	public function moveUp(): Void
	{
		startMoving(DirMapping.UP);
	}
	
	public function moveLeft(): Void
	{
		startMoving(DirMapping.LEFT);
	}
	
	public function moveDown(): Void
	{
		startMoving(DirMapping.DOWN);
	}
	
	public function moveRight(): Void
	{
		startMoving(DirMapping.RIGHT);
	}
	
	public function startMoving(direction: Int): Void
	{
		newdirection = direction;
	}
	
	public function stopMoving(): Void
	{
		newdirection = -1;
	}
	
	public override function handleFrame(event: Dynamic): Void
	{
		if (!playing) return;
		
		if (curcycle == 0)
		{
			if (newdirection == -1) return;
			curcycle = cycles;
			direction = newdirection;
		}
		
		curcycle -= 1;
		
		var xstep = 0, ystep = 0;
		switch direction
		{
			case DirMapping.UP: ystep = -step;
			case DirMapping.RIGHT: xstep = step;
			case DirMapping.DOWN: ystep = step;
			case DirMapping.LEFT: xstep = -step;
		}
		
		move(xstep, ystep);
	}
}
