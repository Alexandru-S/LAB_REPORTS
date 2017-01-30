package com.syzible.junkie.Objects;

/**
 * Created by ed on 30/09/2016
 */

public abstract class Junkie extends GameObject {
    private float intoxication;

    Junkie(float x, float y) {
        super(x, y);
    }

    public float getIntoxication() {
        return intoxication;
    }

    public void setIntoxication(float intoxication) {
        this.intoxication = intoxication;
    }
}
