package com.revesoft.springboot.web.geo.municipality;

import java.sql.Timestamp;

/**
 * Created by reve on 10/31/2017.
 */
public class MunicipalityDTO {
    private int id;
    private int geoDivisionId;
    private int geoDistrictId;
    private int geoUpazilaId;
    private String divisionBbsCode;
    private String districtBbsCode;
    private String upazilaBbsCode;
    private String municipalityNameEng;
    private String municipalityNameBng;
    private String bbsCode;
    private int status;
    private int createdBy;
    private int modifiedBy;
    private Timestamp created;
    private Timestamp modified;

    public MunicipalityDTO(){

    }

    public MunicipalityDTO(int id, int geoDivisionId, int geoDistrictId, int geoUpazilaId, String divisionBbsCode, String districtBbsCode, String upazilaBbsCode, String municipalityNameEng, String municipalityNameBng, String bbsCode, int status) {
        this.id = id;
        this.geoDivisionId = geoDivisionId;
        this.geoDistrictId = geoDistrictId;
        this.geoUpazilaId = geoUpazilaId;
        this.divisionBbsCode = divisionBbsCode;
        this.districtBbsCode = districtBbsCode;
        this.upazilaBbsCode = upazilaBbsCode;
        this.municipalityNameEng = municipalityNameEng;
        this.municipalityNameBng = municipalityNameBng;
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

    public int getGeoUpazilaId() {
        return geoUpazilaId;
    }

    public void setGeoUpazilaId(int geoUpazilaId) {
        this.geoUpazilaId = geoUpazilaId;
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

    public String getUpazilaBbsCode() {
        return upazilaBbsCode;
    }

    public void setUpazilaBbsCode(String upazilaBbsCode) {
        this.upazilaBbsCode = upazilaBbsCode;
    }

    public String getMunicipalityNameEng() {
        return municipalityNameEng;
    }

    public void setMunicipalityNameEng(String municipalityNameEng) {
        this.municipalityNameEng = municipalityNameEng;
    }

    public String getMunicipalityNameBng() {
        return municipalityNameBng;
    }

    public void setMunicipalityNameBng(String municipalityNameBng) {
        this.municipalityNameBng = municipalityNameBng;
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
