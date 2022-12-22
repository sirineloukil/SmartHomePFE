package com.asm.smarthome.coreconfigurations;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.NoSuchBeanDefinitionException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.data.util.Pair;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Parameter;
import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@Service
public class MappingDispatcher implements ApplicationContextAware {
    private ApplicationContext applicationContext;
    private final ObjectMapper objectMapper;
    private final Map<String, Pair<String, Method>> config = new HashMap<>();

    public MappingDispatcher(ApplicationContext applicationContext, ObjectMapper objectMapper) {
        this.applicationContext = applicationContext;
        this.objectMapper = objectMapper;
        init();
    }

    private void init() {
        Map<String, Object> messageTopics = this.applicationContext.getBeansWithAnnotation(MessageTopicMapping.class);
        messageTopics.forEach((s, o) -> {
            MessageTopicMapping annotation = o.getClass().getAnnotation(MessageTopicMapping.class);
            List<String> parts = Arrays.stream(annotation.value().trim().split("/")).toList();
            Arrays.stream(o.getClass().getMethods())
                    .filter(method -> method.isAnnotationPresent(MessageTopicMapping.class))
                    .forEach(method -> {
                        MessageTopicMapping annotationMethod = method.getAnnotation(MessageTopicMapping.class);
                        List<String> partsMethod = Arrays.stream(annotationMethod.value().trim().split("/")).toList();
                        String topicName = Stream.concat(parts.stream(), partsMethod.stream()).collect(Collectors.joining("/"));
                        if (config.containsKey(topicName)) {
                            throw new IllegalStateException("conflicts in topics");
                        } else {
                            config.put(topicName, Pair.of(s, method));
                        }
                    });
        });
    }


    public void execute(String topic, String message) {
        Pair<String, Method> stringMethodPair = config.get(topic);
        if (stringMethodPair != null) {
            Object bean = applicationContext.getBean(stringMethodPair.getFirst());
            Method method = stringMethodPair.getSecond();
            try {
                Parameter[] parametersRequest = method.getParameters();
                Object[] parameterValues = new Object[parametersRequest.length];
                for (int i = 0; i < parametersRequest.length; i++) {
                    Parameter parameter = parametersRequest[i];
                    try {
                        parameterValues[i] = applicationContext.getBean(parameter.getName());
                        continue;
                    } catch (NoSuchBeanDefinitionException ignored) {}
                    if (Authentication.class.isAssignableFrom(parameter.getType())) {
                        parameterValues[i] = null;
                        continue;
                    }
                    try {
                        parameterValues[i] = objectMapper.readValue(message, parameter.getType());
                    } catch (JsonProcessingException e) {
                        throw new RuntimeException(e);
                    }
                }

                method.invoke(bean, parameterValues);
            } catch (IllegalAccessException | InvocationTargetException e) {
                throw new RuntimeException(e);
            }
        }
    }

    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        this.applicationContext = applicationContext;
    }
}
