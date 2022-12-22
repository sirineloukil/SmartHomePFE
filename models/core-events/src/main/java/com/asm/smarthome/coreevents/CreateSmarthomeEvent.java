package com.asm.smarthome.coreevents;

import org.springframework.context.ApplicationEvent;

public class CreateSmarthomeEvent extends ApplicationEvent {
    private final String home;

    public CreateSmarthomeEvent(String home) {
        super(home);
        this.home = home;
    }
}
