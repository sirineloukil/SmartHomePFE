package com.asm.smarthome.coreservices.service;


import com.asm.smarthome.coremodels.model.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Optional;

public interface UserService {
    List<User> findAll();
    Page<User> findAll(Pageable pageable);
    User save(User user);
    Optional<User> findById(String id);
    Optional<User> findByEmail(String email);
    void delete(User user);
    void deleteById(String id);
}
