/*
* This file is part of Genesis.
*
* Genesis is free software: you can redistribute it and/or modify
* it under the terms of the GNU Lesser General Public License as published by
* the Free Software Foundation, either version 3 of the License, or
* (at your option) any later version.
*
* Genesis is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
* GNU Lesser General Public License for more details.
*
* You should have received a copy of the GNU Lesser General Public License
* along with Genesis. If not, see <http://www.gnu.org/licenses/>
* */

package genesis;

import genesis.actors.Actor;
import genesis.clips.Clip;
import nme.events.KeyboardEvent;

import nme.Lib;

class Game extends Actor
{
	public var scene: Scene;
	
	public function new(scene: Scene)
	{
		super(new Clip());
		Lib.current.addChild(clip);
		this.scene = scene;
	}
	
	public override function pause(): Void
	{
		super.pause();
		scene.pause();
	}
	
	public override function resume(): Void
	{
		super.resume();
		scene.resume();
	}
	
	private function pauseEvent(event: Dynamic): Void
	{
		if (event.keyCode == 192)
		{
			if (clip.playing) pause();
			else resume();
		}
		
		else if (event.keyCode == 9)
		{
			if (clip.stage.frameRate > 50) clip.stage.frameRate = 10;
			else clip.stage.frameRate = 60;
		}
	}
	
	public function start(): Void
	{
		clip.addChild(scene.clip);
		clip.stage.addEventListener(KeyboardEvent.KEY_DOWN, pauseEvent);
	}
}
