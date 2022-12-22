package com.asm.smarthome.machine;

import com.asm.smarthome.coreconfigurations.MessageTopicMapping;
import com.asm.smarthome.coremodels.model.Home;
import com.asm.smarthome.coremodels.model.Zone;

public class CreateZoneHandler {
    @MessageTopicMapping("create")
    public void create(Zone create) {
        System.out.println(String.format("create %s", create.getLabel()));
    }

}
