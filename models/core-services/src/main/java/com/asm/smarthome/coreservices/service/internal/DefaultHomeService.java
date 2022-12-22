package com.asm.smarthome.coreservices.service.internal;

import com.asm.smarthome.coremodels.model.Home;
import com.asm.smarthome.coreservices.repository.HomeRepository;
import com.asm.smarthome.coreservices.service.HomeService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;


@Service
public class DefaultHomeService implements HomeService {

    private final HomeRepository homeRepository;


    public DefaultHomeService(HomeRepository homeRepository) {
        this.homeRepository = homeRepository;}

    @Override
    public List<Home> findAll() {
        return homeRepository.findAll();
    }

    @Override
    public Page<Home> findAll(Pageable pageable) {
        return homeRepository.findAll(pageable);
    }

    @Override
    public Home save(Home home) {
        return this.homeRepository.save(home);
    }

    @Override
    public Optional<Home> findById(String id) {
        return homeRepository.findById(id);
    }

    @Override
    public void delete(Home home) {
        homeRepository.delete(home);
    }

    @Override
    public void deleteById(String id) {
        homeRepository.deleteById(id);
    }
}
