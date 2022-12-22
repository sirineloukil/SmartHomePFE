package com.asm.smarthome.coremodels.model;

import org.bson.types.ObjectId;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.DBRef;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;
import java.util.Date;

@Document(collection = "homes")
public class Home {
    @Id
    private ObjectId idSHFab;
    @Field
    private String verHard;
    @Field
    private String verSoft;
    @Field
    private Date dateFab;
    @Field
    private Date dateOeuvre;
    @Field
    @DBRef
    private Zone zones;
    @Field
    private String label;
    @Field
    private String location;

    public ObjectId getId() {
        return idSHFab; }

    public void setId(ObjectId idSHFab) {
        this.idSHFab = idSHFab;
    }

    public String getVerHard() {
        return verHard;
    }

    public void setVerHard(String verHard) {
        this.verHard = verHard;
    }

    public String getVerSoft() {
        return verSoft;
    }

    public void setVerSoft(String verSoft) {
        this.verSoft = verSoft;
    }

    public Date getDateFab() {
        return dateFab;
    }

    public void setDateFab(Date dateFab) {
        this.dateFab = dateFab;
    }

    public Date getDateOeuvre() {
        return dateOeuvre;
    }

    public void setDateOeuvre(Date dateOeuvre) {
        this.dateOeuvre = dateOeuvre;
    }

    public Zone getZones() {
        return zones;
    }

    public void setZones(Zone zones) {
        this.zones = zones;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }
}
