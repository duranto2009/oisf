package com.revesoft.springboot.web.geo.municipalityward;

import java.sql.Timestamp;

/**
 * Created by reve on 10/31/2017.
 */
public class MunicipalityWardDTO {
    private int id;
    private int geoDivisionId;
    private int geoDistrictId;
    private int geoUpazilaId;
    private int geoMunicipalityId;
    private String divisionBbsCode;
    private String districtBbsCode;
    private String upazilaBbsCode;
    private String municipalityBbsCode;
    private String wardNameEng;
    private String wardNameBng;
    private String bbsCode;
    private int status;
    private int createdBy;
    private int modifiedBy;
    private Timestamp created;
    private Timestamp modified;

    public MunicipalityWardDTO() {

    }

    public MunicipalityWardDTO(int id, int geoDivisionId, int geoDistrictId, int geoUpazilaId, int geoMunicipalityId, String divisionBbsCode, String districtBbsCode, String upazilaBbsCode, String municipalityBbsCode, String wardNameEng, String wardNameBng, String bbsCode, int status) {
        this.id = id;
        this.geoDivisionId = geoDivisionId;
        this.geoDistrictId = geoDistrictId;
        this.geoUpazilaId = geoUpazilaId;
        this.geoMunicipalityId = geoMunicipalityId;
        this.divisionBbsCode = divisionBbsCode;
        this.districtBbsCode = districtBbsCode;
        this.upazilaBbsCode = upazilaBbsCode;
        this.municipalityBbsCode = municipalityBbsCode;
        this.wardNameEng = wardNameEng;
        this.wardNameBng = wardNameBng;
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

    public int getGeoMunicipalityId() {
        return geoMunicipalityId;
    }

    public void setGeoMunicipalityId(int geoMunicipalityId) {
        this.geoMunicipalityId = geoMunicipalityId;
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

    public String getMunicipalityBbsCode() {
        return municipalityBbsCode;
    }

    public void setMunicipalityBbsCode(String municipalityBbsCode) {
        this.municipalityBbsCode = municipalityBbsCode;
    }

    public String getWardNameEng() {
        return wardNameEng;
    }

    public void setWardNameEng(String wardNameEng) {
        this.wardNameEng = wardNameEng;
    }

    public String getWardNameBng() {
        return wardNameBng;
    }

    public void setWardNameBng(String wardNameBng) {
        this.wardNameBng = wardNameBng;
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
