package com.asm.smarthome.coreevents;

import org.springframework.context.ApplicationEvent;

public class CreateDeviceEvent extends ApplicationEvent {
    private final String device;

    public CreateDeviceEvent(String device) {
        super(device);
        this.device = device;
    }
}

