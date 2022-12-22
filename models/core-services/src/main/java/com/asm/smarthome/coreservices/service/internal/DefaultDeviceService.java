package com.asm.smarthome.coreservices.service.internal;



import com.asm.smarthome.coremodels.model.Device;
import com.asm.smarthome.coreservices.repository.DeviceRepository;
import com.asm.smarthome.coreservices.service.DeviceService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class DefaultDeviceService implements DeviceService {

    private final DeviceRepository deviceRepository;

    public DefaultDeviceService(DeviceRepository deviceRepository) {
        this.deviceRepository = deviceRepository;
    }


    @Override
    public List<Device> findAll() {
        return deviceRepository.findAll();
    }

    @Override
    public Page<Device> findAll(Pageable pageable) {
        return deviceRepository.findAll(pageable);
    }

    @Override
    public Device save(Device device) {
        return this.deviceRepository.save(device);
    }

    @Override
    public Optional<Device> findById(String id) {
        return deviceRepository.findById(id);
    }


    @Override
    public void delete(Device device) {
        deviceRepository.delete(device);

    }

    @Override
    public void deleteById (String ref) {

        deviceRepository.deleteById(ref);
    }
}