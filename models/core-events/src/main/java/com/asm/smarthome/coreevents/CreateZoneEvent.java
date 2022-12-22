package com.asm.smarthome.coreevents;

import org.springframework.context.ApplicationEvent;

public class CreateZoneEvent extends ApplicationEvent {
    public final String zone;

    public CreateZoneEvent(String zone) {
        super(zone);
        this.zone = zone;
    }
}
