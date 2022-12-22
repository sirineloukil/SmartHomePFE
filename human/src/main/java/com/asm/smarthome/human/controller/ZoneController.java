package com.asm.smarthome.human.controller;

import com.asm.smarthome.coremodels.model.Zone;
import com.asm.smarthome.coreservices.service.ZoneService;
import com.asm.smarthome.coreexceptions.exception.ResourceNotFoundException;
import org.springframework.http.HttpRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/v1/zones")
public class ZoneController {

    private final ZoneService zoneService;

    public ZoneController(ZoneService zoneService) {
        this.zoneService = zoneService;
    }

    @GetMapping
    public List<Zone> getAllZones(){
        return zoneService.findAll();
    }

    // build create Zone REST API
    @PostMapping
    public Zone createZone(@RequestBody Zone zone) {
        return zoneService.save(zone);
    }

    // build get Zone by id REST API
    @GetMapping("{id}")
    public ResponseEntity<Zone> getZoneById(@PathVariable  String id){
        return ResponseEntity.ok(zoneService.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Zone not exist with id:" + id)));
    }

    // build update Zone REST API
    @PutMapping("{id}")
    public ResponseEntity<Zone> updateZone(@PathVariable String id, @RequestBody Zone zoneDetails) {
        Zone updateZone= zoneService.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Zone not exist with id: " + id));

        updateZone.setDevices(zoneDetails.getDevices());
        updateZone.setLabel(zoneDetails.getLabel());
        updateZone.setPairings(zoneDetails.getPairings());

        zoneService.save(updateZone);

        return ResponseEntity.ok(updateZone);
    }

    // build delete Zone REST API
    @DeleteMapping("{id}")
    public ResponseEntity<HttpRequest> deleteZone(@PathVariable String id){
        Zone zone = zoneService.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Zone not exist with id: " + id));
       zoneService.delete(zone);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);

    }
}
