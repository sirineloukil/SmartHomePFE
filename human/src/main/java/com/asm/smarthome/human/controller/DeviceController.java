package com.asm.smarthome.human.controller;


import com.asm.smarthome.coreexceptions.exception.ResourceNotFoundException;
import com.asm.smarthome.coremodels.model.Device;
import com.asm.smarthome.coreservices.service.DeviceService;
import org.springframework.http.HttpRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/v1/devices")
public class DeviceController {

    private final DeviceService deviceService;

    public DeviceController(DeviceService deviceService) {
        this.deviceService = deviceService;
    }


    @GetMapping
    public List<Device> getAllDevices(){
        return deviceService.findAll();
    }

    // build create Device REST API
    @PostMapping
    public Device createDevice(@RequestBody Device device) {
        return deviceService.save(device);
    }

    // build get Device by id REST API
    @GetMapping("{id}")
    public ResponseEntity<Device> getDeviceById(@PathVariable  String id){
        return ResponseEntity.ok(deviceService.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Device not exist with id:" + id)));
    }

    // build update Device REST API
    @PutMapping("{id}")
    public ResponseEntity<Device> updateDevice(@PathVariable String id, @RequestBody Device deviceDetails) {
        Device updateDevice= deviceService.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Device not exist with id: " + id));

        updateDevice.setRef(deviceDetails.getRef());

        deviceService.save(updateDevice);

        return ResponseEntity.ok(updateDevice);
    }

    // build delete Device REST API
    @DeleteMapping("{id}")
    public ResponseEntity<HttpRequest> deleteDevice(@PathVariable String id){
        Device device = deviceService.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Device not exist with id: " + id));
       deviceService.delete(device);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);

    }
}
