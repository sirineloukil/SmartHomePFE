package com.asm.smarthome.coreservices.service.internal;

import com.asm.smarthome.coremodels.model.Zone;
import com.asm.smarthome.coreservices.repository.ZoneRepository;
import com.asm.smarthome.coreservices.service.ZoneService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class DefaultZoneService implements ZoneService {
    private final ZoneRepository zoneRepository;

    public DefaultZoneService(ZoneRepository zoneRepository) {
        this.zoneRepository = zoneRepository;
    }

    @Override
    public List<Zone> findAll() {
        return zoneRepository.findAll();
    }

    @Override
    public Page<Zone> findAll(Pageable pageable) {
        return zoneRepository.findAll(pageable);
    }

    @Override
    public Zone save(Zone zone) {
        return this.zoneRepository.save(zone);
    }

    @Override
    public Optional<Zone> findById(String id) {
        return zoneRepository.findById(id);
    }

    @Override
    public void delete(Zone zone) {
        zoneRepository.delete(zone);
    }

    @Override
    public void deleteById(String id) {
    zoneRepository.deleteById(id);
    }
}
