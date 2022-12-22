package com.asm.smarthome.machine;

import com.asm.smarthome.coreconfigurations.MessageTopicMapping;
import com.asm.smarthome.coremodels.model.Home;
import org.springframework.stereotype.Component;


//server/smarthome/create
//server/smarthome/update


@MessageTopicMapping("ouhgsdjlgnhl/smarthome")
@Component
public class CreateSmarthomeHandler {

    @MessageTopicMapping("create")
    public void create(Home create) {
        System.out.println(String.format("create %s", create.getLabel()));
    }


    @MessageTopicMapping("update")
    public void update(Home update) {
        System.out.println(String.format("update %s", update.getLabel()));
    }

}
