package com.asm.smarthome.coreservices.repository;


import com.asm.smarthome.coremodels.model.Pairing;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PairingRepository extends MongoRepository<Pairing, String> {
}
