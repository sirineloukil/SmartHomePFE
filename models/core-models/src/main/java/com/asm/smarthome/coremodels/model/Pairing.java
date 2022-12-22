package com.asm.smarthome.coremodels.model;

import org.bson.types.ObjectId;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

import javax.annotation.processing.Generated;

@Document(collection = "pairings")
public class Pairing {

    @Id
    private ObjectId id;
    @Field
    private Boolean owner;
    @Field
    private Boolean installer;

    public ObjectId getId() {
        return id;
    }

    public void setId(ObjectId id) {
        this.id = id;
    }

    public Boolean getOwner() {
        return owner;
    }

    public void setOwner(Boolean owner) {
        this.owner = owner;
    }

    public Boolean getInstaller() {
        return installer;
    }

    public void setInstaller(Boolean installer) {
        this.installer = installer;
    }
}
