package com.asm.smarthome.admin;

import com.asm.smarthome.coreconfigurations.MessageTopicMapping;
import com.asm.smarthome.coremodels.model.Zone;
import org.springframework.stereotype.Component;

@MessageTopicMapping("ouhgsdjlgnhl/zone")
@Component
public class CreateZoneHandler {

    @MessageTopicMapping("create")
    public void create(Zone create) {
        System.out.println(String.format("create %s", create.getLabel()));
    }

}
