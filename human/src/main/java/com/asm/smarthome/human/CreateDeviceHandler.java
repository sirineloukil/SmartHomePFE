package com.asm.smarthome.human;

import com.asm.smarthome.coreconfigurations.MessageTopicMapping;
import com.asm.smarthome.coremodels.model.Device;
import org.springframework.stereotype.Component;

@MessageTopicMapping("ouhgsdjlgnhl/device")
@Component
public class CreateDeviceHandler {

    @MessageTopicMapping("create")
    public void create(Device create) {
        System.out.println(String.format("create %s", create.getRef()));
    }

}

