package com.asm.smarthome.coremodels.model;

import org.bson.types.ObjectId;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

@Document(collection = "devices")
public class Device {

    @Id
    private ObjectId idD;

    @Field
    private String ref;

    public ObjectId getIdD() {
        return idD;
    }

    public void setIdD(ObjectId idD) {
        this.idD = idD;
    }

    public String getRef() {
        return ref;
    }

    public void setRef(String ref) {
        this.ref = ref;
    }
}
