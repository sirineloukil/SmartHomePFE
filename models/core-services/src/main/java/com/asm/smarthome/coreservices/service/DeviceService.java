package com.asm.smarthome.coreservices.service;


import com.asm.smarthome.coremodels.model.Device;

import com.asm.smarthome.coremodels.model.Home;
import org.bson.types.ObjectId;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import java.util.List;
import java.util.Optional;


public interface DeviceService {
    List<Device> findAll();
    Page<Device> findAll(Pageable pageable);
    Device save(Device device);
    Optional<Device> findById(String id);
    void delete(Device device);
    void deleteById(String id);
}
