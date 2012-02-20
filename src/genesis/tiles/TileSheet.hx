/*
* This file is part of Genesis.
* For Copyright info see notice in Game.hx
* */

package genesis.tiles;

import nme.Assets;
import nme.display.Bitmap;
import nme.display.BitmapData;
import nme.geom.Point;
import nme.geom.Rectangle;

class TileSheet
{
	public var tilewidth: Int;
	public var tileheight: Int;
	
	public var ref: Array<TileRef>;
	
	public var image: Bitmap;
	
	public function new(filename: String, tilewidth: Int, tileheight: Int)
	{
		image = new Bitmap(Assets.getBitmapData(filename));
		
		this.tilewidth = tilewidth;
		this.tileheight = tileheight;
		
		ref = new Array<TileRef>();
	}
	
	public function addTile(x: Int, y: Int): Int
	{
		var subimage = new BitmapData(tilewidth, tileheight, true);
		
		subimage.copyPixels(
			image.bitmapData,
			new Rectangle(x, y, tilewidth, tileheight),
			new Point(0, 0)
		);
		
		ref.push(new TileRef (ref.length, x, y, new Bitmap(subimage)));
		return ref.length - 1;
	}
	
	public function addTiles(tiles: Array<Int>)
	{
		var i = 0;
		while (i < tiles.length)
		{
			addTile(tiles[i], tiles[i + 1]);
			i += 2;
		}
	}
	
	public function addFacingTiles(
		north_x: Int, north_y: Int,
		east_x: Int, east_y: Int,
		south_x: Int, south_y: Int,
		west_x: Int, west_y: Int)
	{
		ref = new Array<TileRef>();
		
		addTile(north_x, north_y);
		addTile(east_x, east_y);
		addTile(south_x, south_y);
		addTile(west_x, west_y);
	}
	
	public function makeTile(index: Int, x: Int, y: Int): Tile
	{
		return new Tile(ref[index], x, y);
	}
}
