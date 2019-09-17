package com.revesoft.springboot.web.geo.postoffice;

import java.sql.Timestamp;

/**
 * Created by reve on 10/31/2017.
 */
public class PostOfficeDTO {
    private int id;
    private int geoDivisionId;
    private int geoDistrictId;
    private int geoUpazilaId;
    private int geoThanaId;
    private String divisionBbsCode;
    private String districtBbsCode;
    private String upazilaBbsCode;
    private String thanaBbsCode;
    private String postofficeNameEng;
    private String postofficeNameBng;
    private String bbsCode;
    private int status;
    private int createdBy;
    private int modifiedBy;
    private Timestamp created;
    private Timestamp modified;

    public PostOfficeDTO() {

    }

    public PostOfficeDTO(int id, int geoDivisionId, int geoDistrictId, int geoUpazilaId, int geoThanaId, String divisionBbsCode, String districtBbsCode, String upazilaBbsCode, String thanaBbsCode, String postofficeNameEng, String postofficeNameBng, String bbsCode, int status) {
        this.id = id;
        this.geoDivisionId = geoDivisionId;
        this.geoDistrictId = geoDistrictId;
        this.geoUpazilaId = geoUpazilaId;
        this.geoThanaId = geoThanaId;
        this.divisionBbsCode = divisionBbsCode;
        this.districtBbsCode = districtBbsCode;
        this.upazilaBbsCode = upazilaBbsCode;
        this.thanaBbsCode = thanaBbsCode;
        this.postofficeNameEng = postofficeNameEng;
        this.postofficeNameBng = postofficeNameBng;
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

    public int getGeoThanaId() {
        return geoThanaId;
    }

    public void setGeoThanaId(int geoThanaId) {
        this.geoThanaId = geoThanaId;
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

    public String getThanaBbsCode() {
        return thanaBbsCode;
    }

    public void setThanaBbsCode(String thanaBbsCode) {
        this.thanaBbsCode = thanaBbsCode;
    }

    public String getPostOfficeNameEng() {
        return postofficeNameEng;
    }

    public void setPostOfficeNameEng(String postofficeNameEng) {
        this.postofficeNameEng = postofficeNameEng;
    }

    public String getPostOfficeNameBng() {
        return postofficeNameBng;
    }

    public void setPostOfficeNameBng(String postofficeNameBng) {
        this.postofficeNameBng = postofficeNameBng;
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
