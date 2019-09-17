package com.revesoft.springboot.web.geo.division;

import java.sql.Timestamp;

/**
 * Created by Bony on 10/22/2017.
 */
public class DivisionDTO {

    private int id;
    private String divisionName;
    private String divisionNameBng;
    private String bbsCode;
    private int status;
    private int createdBy;
    private int modifiedBy;
    private Timestamp created;
    private Timestamp modified;


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDivisionName() {
        return divisionName;
    }

    public void setDivisionName(String divisionName) {
        this.divisionName = divisionName;
    }

    public String getDivisionNameBng() {
        return divisionNameBng;
    }

    public void setDivisionNameBng(String divisionNameBng) {
        this.divisionNameBng = divisionNameBng;
    }

    public String getBbsCode() {
        return bbsCode;
    }

    public void setBbsCode(String bbsCode) {
        this.bbsCode = bbsCode;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(int createdBy) {
        this.createdBy = createdBy;
    }

    public int getModifiedBy() {
        return modifiedBy;
    }

    public void setModifiedBy(int modifiedBy) {
        this.modifiedBy = modifiedBy;
    }

    public Timestamp getCreated() {
        return created;
    }

    public void setCreated(Timestamp created) {
        this.created = created;
    }

    public Timestamp getModified() {
        return modified;
    }

    public void setModified(Timestamp modified) {
        this.modified = modified;
    }
}
