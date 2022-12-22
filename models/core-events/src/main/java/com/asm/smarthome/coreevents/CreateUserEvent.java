package com.asm.smarthome.coreevents;

import org.springframework.context.ApplicationEvent;

public class CreateUserEvent extends ApplicationEvent {
    private final String user;

    public CreateUserEvent(String user) {
        super(user);
        this.user = user;
    }
}
