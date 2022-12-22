package com.asm.smarthome.coreservices.repository;

import com.asm.smarthome.coremodels.model.Device;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface DeviceRepository extends MongoRepository <Device,String> {

}
