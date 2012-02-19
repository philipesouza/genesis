/*
* This file is part of Genesis.
* For Copyright info see notice in Game.hx
* */

package genesis.tiles;
import nme.display.Bitmap;

class TileRef
{
	public var x: Int;
	public var y: Int;
	
	public var index: Int;
	
	public var image: Bitmap;
	
	public var blocked: Bool;
	
	public function new(index: Int, x: Int, y: Int, image: Bitmap, blocked = false)
	{
		this.x = x;
		this.y = y;
		
		this.index = index;
		
		this.image = image;
		
		this.blocked = blocked;
	}
	
	public function copy(?index: Int): TileRef
	{
		if (index == null) index = this.index;
		return new TileRef(index, x, y, image, blocked);
	}
}
