package com.asm.smarthome.machine;

import com.asm.smarthome.coreconfigurations.MqttGateway;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RefreshScope
@RequestMapping
public class TestController {
    private final String hello;
    private final MqttGateway mqttGateway;

    public TestController(@Value("${app.hello}") String hello, MqttGateway mqttGateway) {
        this.hello = hello;
        this.mqttGateway = mqttGateway;
    }

    @RequestMapping("**")
    public String test() {
        mqttGateway.sendToMqtt("I am in the page");
        return hello;
    }
}

