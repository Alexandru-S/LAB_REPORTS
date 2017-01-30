package com.syzible.junkie.Screens;

import com.badlogic.gdx.Screen;
import com.syzible.junkie.Junkie;

/**
 * Created by ed on 30/09/2016
 */

public class MainStage implements Screen {

    Junkie junkie;

    public MainStage(Junkie junkie) {
        this.junkie = junkie;
    }

    @Override
    public void show() {

    }

    @Override
    public void render(float delta) {

    }

    @Override
    public void resize(int width, int height) {

    }

    @Override
    public void pause() {

    }

    @Override
    public void resume() {

    }

    @Override
    public void hide() {

    }

    @Override
    public void dispose() {

    }

    public Junkie getJunkie() {
        return junkie;
    }
}
