package com.asm.smarthome.coreservices.service.internal;

import com.asm.smarthome.coremodels.model.User;
import com.asm.smarthome.coreservices.repository.UserRepository;
import com.asm.smarthome.coreservices.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class DefaultUserService implements UserService {

    private final UserRepository userRepository;
    private final Logger logger = LoggerFactory.getLogger(DefaultUserService.class);

    public DefaultUserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }


    @Override
    public List<User> findAll() {
        logger.info("Fetch all users");
        return userRepository.findAll();
    }

    @Override
    public Page<User> findAll(Pageable pageable) {
        logger.info("Fetch a page of users");
        return userRepository.findAll(pageable);
    }

    @Override
    public User save(User user) {
        return this.userRepository.save(user);
    }

    @Override
    public Optional<User> findById(String id) {
        return userRepository.findById(id);
    }

    @Override
    public Optional<User> findByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    @Override
    public void delete(User user) {
        userRepository.delete(user);
    }

    @Override
    public void deleteById(String id) {
        userRepository.deleteById(id);
    }
}
