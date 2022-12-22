package com.asm.smarthome.machine.controller;


import com.asm.smarthome.coremodels.model.User;
import com.asm.smarthome.coreservices.service.UserService;
import org.springframework.data.rest.webmvc.ResourceNotFoundException;
import org.springframework.http.HttpRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@CrossOrigin("*")
@RestController
@RequestMapping("/api/v1/users")
public class UserController {
    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping
    public List<User> getAllUsers(){
        return userService.findAll();
    }

    // build create user REST API
    @PostMapping
    public User createUser(@RequestBody User user) {
        return userService.save(user);
    }

    // build get user by id REST API
    @GetMapping("{id}")
    public ResponseEntity<User> getUserById(@PathVariable  String id){
        return ResponseEntity.ok(userService.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("User not exist with id:" + id)));
    }

    // build update user REST API
    @PutMapping("{id}")
    public ResponseEntity<User> updateUser(@PathVariable String id, @RequestBody User userDetails) {
        User updateUser= userService.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("User not exist with id: " + id));

        updateUser.setName(userDetails.getName());
        updateUser.setLastname(userDetails.getLastname());
        updateUser.setEmail(userDetails.getEmail());
        updateUser.setRole(userDetails.getRole());

        userService.save(updateUser);

        return ResponseEntity.ok(updateUser);
    }

    // build delete user REST API
    @DeleteMapping("{id}")
    public ResponseEntity<HttpRequest> deleteUser(@PathVariable String id){
        User user = userService.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("user not exist with id: " + id));
        userService.delete(user);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);

    }
}
