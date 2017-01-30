package com.syzible.junkie;

import com.badlogic.gdx.Game;
import com.badlogic.gdx.graphics.g2d.SpriteBatch;
import com.syzible.junkie.Screens.MainStage;

public class Junkie extends Game {
	private SpriteBatch spriteBatch;

	@Override
	public void create () {
		spriteBatch = new SpriteBatch();
		setScreen(new MainStage(this));
	}

	@Override
	public void dispose() {
		super.dispose();
		spriteBatch.dispose();
	}

	public SpriteBatch getSpriteBatch() {
		return spriteBatch;
	}
}
