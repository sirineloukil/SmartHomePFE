package com.asm.smarthome.coremodels.model;

import org.bson.types.ObjectId;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.DBRef;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;


@Document(collection = "zones")
public class Zone {
    @Id
    private ObjectId idZ;
    @Field
    private String label;
    @DBRef
    @Field
    private Device devices;
    @Field
    @DBRef
    private Pairing pairings;

    public ObjectId getIdZ() {
        return idZ;
    }

    public void setIdZ(ObjectId idZ) {
        this.idZ = idZ;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    public Device getDevices() {
        return devices;
    }

    public void setDevices(Device devices) {
        this.devices = devices;
    }

    public Pairing getPairings() {
        return pairings;
    }

    public void setPairings(Pairing pairings) {
        this.pairings = pairings;
    }
}
