package com.asm.smarthome.coreservices.service;

import com.asm.smarthome.coremodels.model.Pairing;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Optional;


public interface PairingService{
    List<Pairing> findAll();
    Page<Pairing> findAll(Pageable pageable);
    Pairing save(Pairing pairing);
    Optional<Pairing> findById(String id);
    void delete(Pairing pairing);
    void deleteById(String id);
}
