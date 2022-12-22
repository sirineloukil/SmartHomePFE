package com.asm.smarthome.admin.controller;

import com.asm.smarthome.coreexceptions.exception.ResourceNotFoundException;
import com.asm.smarthome.coremodels.model.Pairing;
import com.asm.smarthome.coreservices.service.PairingService;
import org.springframework.http.HttpRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/v1/pairings")
public class PairingController {

    private final PairingService pairingService;

    public PairingController(PairingService pairingService) {
        this.pairingService = pairingService;
    }

    @GetMapping
    public List<Pairing> getAllPairings(){
        return pairingService.findAll();
    }

    // build create Pairing REST API
    @PostMapping
    public Pairing createPairing(@RequestBody Pairing pairing) {
        return pairingService.save(pairing);
    }

    // build get Pairing by id REST API
    @GetMapping("{id}")
    public ResponseEntity<Pairing> getPairingById(@PathVariable  String id){
        return ResponseEntity.ok(pairingService.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Pairing not exist with id:" + id)));
    }

    // build update Pairing REST API
    @PutMapping("{id}")
    public ResponseEntity<Pairing> updatePairing(@PathVariable String id, @RequestBody Pairing pairingDetails) {
        Pairing updatePairing= pairingService.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Pairing not exist with id: " + id));

        updatePairing.setInstaller(pairingDetails.getInstaller());
        updatePairing.setOwner(pairingDetails.getOwner());

        pairingService.save(updatePairing);

        return ResponseEntity.ok(updatePairing);
    }

    // build delete Pairing REST API
    @DeleteMapping("{id}")
    public ResponseEntity<HttpRequest> deletePairing(@PathVariable String id){
        Pairing pairing = pairingService.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Pairing not exist with id: " + id));
        pairingService.delete(pairing);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);

    }
}
