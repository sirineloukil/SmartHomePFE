package com.asm.smarthome.coreservices.service;


import com.asm.smarthome.coremodels.model.Home;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Optional;

public interface HomeService {
    List<Home> findAll();
    Page<Home> findAll(Pageable pageable);
    Home save(Home home);
    Optional<Home> findById(String id);

    void delete(Home home);
    void deleteById(String id);
}
