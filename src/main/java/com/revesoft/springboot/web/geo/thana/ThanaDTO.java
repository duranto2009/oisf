package com.revesoft.springboot.web.geo.thana;

import java.sql.Time;
import java.sql.Timestamp;

/**
 * Created by Bony on 10/31/2017.
 */
public class ThanaDTO {
    private int id;
    private int geoDivisionId;
    private int geoDistrictId;
    private String divisionBbsCode;
    private String districtBbsCode;
    private String thanaNameEng;
    private String thanaNameBng;
    private String bbsCode;
    private int status;
    private int createdBy;
    private int modifiedBy;
    private Timestamp created;
    private  Timestamp modified;

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

    public ThanaDTO(){

    }

    public ThanaDTO(int id, int geoDivisionId, int geoDistrictId, String divisionBbsCode, String districtBbsCode, String thanaNameEng, String thanaNameBng, String bbsCode, int status) {
        this.id = id;
        this.geoDivisionId = geoDivisionId;
        this.geoDistrictId = geoDistrictId;
        this.districtBbsCode = districtBbsCode;
        this.thanaNameEng = thanaNameEng;
        this.thanaNameBng = thanaNameBng;
        this.bbsCode = bbsCode;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getGeoDivisionId() {
        return geoDivisionId;
    }

    public void setGeoDivisionId(int geoDivisionId) {
        this.geoDivisionId = geoDivisionId;
    }

    public int getGeoDistrictId() {
        return geoDistrictId;
    }

    public void setGeoDistrictId(int geoDistrictId) {
        this.geoDistrictId = geoDistrictId;
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

    public String getThanaNameEng() {
        return thanaNameEng;
    }

    public void setThanaNameEng(String thanaNameEng) {
        this.thanaNameEng = thanaNameEng;
    }

    public String getThanaNameBng() {
        return thanaNameBng;
    }

    public void setThanaNameBng(String thanaNameBng) {
        this.thanaNameBng = thanaNameBng;
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
}
