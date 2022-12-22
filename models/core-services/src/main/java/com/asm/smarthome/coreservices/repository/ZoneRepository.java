package com.asm.smarthome.coreservices.repository;


import com.asm.smarthome.coremodels.model.Zone;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ZoneRepository extends MongoRepository <Zone, String> {
}
