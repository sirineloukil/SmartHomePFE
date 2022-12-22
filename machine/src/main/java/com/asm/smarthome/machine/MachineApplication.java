package com.asm.smarthome.machine;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.integration.annotation.IntegrationComponentScan;



@SpringBootApplication
@EnableDiscoveryClient
@IntegrationComponentScan("com.asm.smarthome")
public class MachineApplication {

    public static void main(String[] args) {
        SpringApplication.run(MachineApplication.class, args);
    }

}
