package com.syzible.junkie;

import com.syzible.junkie.States.GameState;

/**
 * Created by ed on 30/09/2016
 */

class Manager {
    private GameState gameState;

    private Manager(){}

    private static Manager manager;
    public static Manager getInstance() {
        manager = manager == null ? new Manager() : manager;
        return manager;
    }

    public GameState getGameState() {
        return gameState;
    }

    public void setGameState(GameState gameState) {
        this.gameState = gameState;
    }
}
