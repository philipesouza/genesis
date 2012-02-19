/*
* This file is part of Genesis.
* For Copyright info see notice in Game.hx
* */

package genesis.tiles;

import genesis.actors.Actor;
import genesis.tiles.TileMappings.TileKey;

import nme.geom.Point;
import nme.display.Bitmap;
import nme.display.BitmapData;
import nme.geom.Rectangle;

class TileMap extends Actor
{
	public var sheet: TileSheet;
	public var map: Array<Array<Tile>>;
	
	public var keys: TileKey;
	public var player: TileChar;
	
	public function new(sheet: TileSheet, matrix: Array<Array<Int>>)
	{
		super();
		setClip();
		
		var image = new BitmapData(sheet.tilewidth * matrix[0].length, sheet.tileheight * matrix.length, true);
		clip.addChildAt(new Bitmap(image), 0);
		
		this.sheet = sheet;
		
		var y = 0;
		map = new Array<Array<Tile>>();
		
		for (row in matrix)
		{
			var x = 0;
			
			var newrow = new Array<Tile>();
			map.push(newrow);
			
			for (tile in row)
			{
				var newtile = sheet.makeTile(tile, x, y);
				newrow.push(newtile);
				image.copyPixels(
					sheet.ref[tile].image.bitmapData,
					new Rectangle(0, 0, sheet.tilewidth, sheet.tileheight),
					new Point(x, y)
				);
				x += sheet.tileheight;
			}
			
			y += sheet.tilewidth;
		}
	}
	
	private function handleKeyDown(event: Dynamic): Void
	{
		var facing = keys.toFacing(event.keyCode);
		if (facing == -1) return;
		
		player.startMoving(facing);
	}
	
	private function handleKeyUp(event: Dynamic): Void
	{	
		if (player.facing != keys.toFacing(event.keyCode)) return;
		player.stopMoving();
	}
	
	public function setMovePlayer(player: TileChar, ?keys: TileKey)
	{
		this.player = player;
		
		if (keys == null) keys = new TileKey(38, 39, 40, 37);
		this.keys = keys;
		
		onKeyDown(handleKeyDown);
		onKeyUp(handleKeyUp);
		onFrame(player.handleFrame);
	}
}
