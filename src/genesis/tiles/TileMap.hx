/*
* This file is part of Genesis.
* For Copyright info see notice in Game.hx
* */

package genesis.tiles;

import genesis.actors.Actor;
import genesis.board.BoardMobile;
import genesis.board.DirKey;
import genesis.board.DirMapping;

import nme.geom.Point;
import nme.display.Bitmap;
import nme.display.BitmapData;
import nme.geom.Rectangle;

class TileMap extends Actor, implements BoardMobile
{
	public var sheet: TileSheet;
	public var map: Array<Array<Tile>>;
	
	public var keys: DirKey;
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
	
	public function setPlayer(player: TileChar)
	{
		this.player = player;
	}
	
	public function moveUp(): Void
	{
		player.clip.setFacing(DirMapping.UP);
		player.clip.moveUp();
	}
	
	public function moveLeft(): Void
	{
		player.clip.setFacing(DirMapping.LEFT);
		player.clip.moveLeft();
	}
	
	public function moveDown(): Void
	{
		player.clip.setFacing(DirMapping.DOWN);
		player.clip.moveDown();
	}
	
	public function moveRight(): Void
	{
		player.clip.setFacing(DirMapping.RIGHT);
		player.clip.moveRight();
	}
	
	public function stopMoving(): Void
	{
		player.clip.stopMoving();
	}
}
