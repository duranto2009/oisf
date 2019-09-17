package com.revesoft.springboot.web.geo.citycorporationward;

import java.sql.Timestamp;

/**
 * Created by Bony on 10/31/2017.
 */
public class CityCorporationWardDTO {
    private int id;
    private int divisionId;
    private int districtId;
    private int cityCorporationId;
    private String divisionBbsCode;
    private String districtBbsCode;
    private String cityCorporationBbsCode;
    private String nameEng;
    private String nameBng;
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

    public int getDivisionId() {
        return divisionId;
    }

    public void setDivisionId(int divisionId) {
        this.divisionId = divisionId;
    }

    public int getDistrictId() {
        return districtId;
    }

    public void setDistrictId(int districtId) {
        this.districtId = districtId;
    }

    public int getCityCorporationId() {
        return cityCorporationId;
    }

    public void setCityCorporationId(int cityCorporationId) {
        this.cityCorporationId = cityCorporationId;
    }

    public String getDivisionBbsCode() {
        return divisionBbsCode;
    }

    public void setDivisionBbsCode(String divisionBbsCode) {
        this.divisionBbsCode = divisionBbsCode;
    }

    public String getDistrictBbsCode() {
        return districtBbsCode;
    }

    public void setDistrictBbsCode(String districtBbsCode) {
        this.districtBbsCode = districtBbsCode;
    }

    public String getCityCorporationBbsCode() {
        return cityCorporationBbsCode;
    }

    public void setCityCorporationBbsCode(String cityCorporationBbsCode) {
        this.cityCorporationBbsCode = cityCorporationBbsCode;
    }

    public String getNameEng() {
        return nameEng;
    }

    public void setNameEng(String nameEng) {
        this.nameEng = nameEng;
    }

    public String getNameBng() {
        return nameBng;
    }

    public void setNameBng(String nameBng) {
        this.nameBng = nameBng;
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
