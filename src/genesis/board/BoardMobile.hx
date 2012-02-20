/*
* This file is part of Genesis.
* For Copyright info see notice in Game.hx
* */

package genesis.board;

interface BoardMobile
{
	public function moveUp(): Void;
	public function moveLeft(): Void;
	public function moveDown(): Void;
	public function moveRight(): Void;
	public function stopMoving(): Void;
}
