package com.asm.smarthome.coreservices.service;

import com.asm.smarthome.coremodels.model.Zone;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Optional;

public interface ZoneService {
    List<Zone> findAll();
    Page<Zone> findAll(Pageable pageable);
    Zone save(Zone zone);
    Optional<Zone> findById(String id);
    void delete(Zone zone);
    void deleteById(String id);
}
