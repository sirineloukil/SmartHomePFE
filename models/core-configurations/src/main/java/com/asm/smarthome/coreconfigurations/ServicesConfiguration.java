package com.asm.smarthome.coreconfigurations;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.mongodb.repository.config.EnableMongoRepositories;

@Configuration
@ComponentScan("com.asm.smarthome")
@EnableMongoRepositories("com.asm.smarthome")
public class ServicesConfiguration {

}
