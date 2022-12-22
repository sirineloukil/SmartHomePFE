package com.asm.smarthome.coreservices.repository;


import com.asm.smarthome.coremodels.model.Home;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface HomeRepository extends MongoRepository <Home,String> {
}
