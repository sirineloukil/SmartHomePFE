package com.asm.smarthome.human.controller;

import com.asm.smarthome.coreexceptions.exception.ResourceNotFoundException;
import com.asm.smarthome.coremodels.model.Home;
import com.asm.smarthome.coreservices.service.HomeService;
import org.springframework.http.HttpRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/v1/homes")
public class HomeController {

    private final HomeService homeService;


    public HomeController(HomeService homeService) {
        this.homeService = homeService;
    }


    @GetMapping
    public List<Home> getAllHomes(){
        return homeService.findAll();
    }

    // build create home REST API
    @PostMapping
    public Home createHome(@RequestBody Home home) {
        return homeService.save(home);
    }

    // build get home by id REST API
    @GetMapping("{id}")
    public ResponseEntity<Home> getHomeById(@PathVariable  String id){
        return ResponseEntity.ok(homeService.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Home not exist with id:" + id)));
    }

    // build update home REST API
    @PutMapping("{id}")
    public ResponseEntity<Home> updateHome(@PathVariable String id, @RequestBody Home homeDetails) {
        Home updateHome= homeService.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Home not exist with id: " + id));

        updateHome.setDateFab(homeDetails.getDateFab());
        updateHome.setDateOeuvre(homeDetails.getDateOeuvre());
        updateHome.setLabel(homeDetails.getLabel());
        updateHome.setLocation(homeDetails.getLocation());
        updateHome.setZones(homeDetails.getZones());
        updateHome.setVerHard(homeDetails.getVerHard());
        updateHome.setVerSoft(homeDetails.getVerSoft());

        homeService.save(updateHome);

        return ResponseEntity.ok(updateHome);
    }

    // build delete home REST API
    @DeleteMapping("{id}")
    public ResponseEntity<HttpRequest> deleteHome(@PathVariable String id){
        Home home = homeService.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("home not exist with id: " + id));
        homeService.delete(home);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);

    }
}
