package com.asm.smarthome.coreconfigurations;

import java.lang.annotation.*;

@Target({ElementType.TYPE, ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
public @interface MessageTopicMapping {

    String value();

}
