package com.syzible.junkie.Objects;

import com.syzible.junkie.Interfaces.Character;
import com.syzible.junkie.Interfaces.NPC;

/**
 * Created by ed on 30/09/2016
 */

public class Citizen extends GameObject implements NPC, Character {
    public Citizen(float x, float y) {
        super(x, y);
    }

    @Override
    public void interact() {

    }

    @Override
    public void onSpawn() {

    }

    @Override
    public void onMove() {

    }

    @Override
    public void onStand() {

    }

    @Override
    public void onHit() {

    }

    @Override
    public void onDeath() {

    }
}
