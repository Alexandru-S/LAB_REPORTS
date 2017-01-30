package com.syzible.junkie.Objects;

/**
 * Created by ed on 30/09/2016
 */

abstract class GameObject {
    private float x, y;
    private float health;

    GameObject(float x, float y) {
        this.x = x;
        this.y = y;
    }

    public void setX(float x) {
        this.x = x;
    }

    public void setY(float y) {
        this.y = y;
    }

    public float getX() {
        return x;
    }

    public float getY() {
        return y;
    }
}
