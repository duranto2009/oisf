package com.revesoft.springboot.web.geo.union;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 * Created by reve on 10/30/2017.
 */


public class UnionDTO implements Serializable{
    private int id;
    private int geoDivisionId;
    private int geoDistrictId;
    private int geoUpazilaId;
    private String divisionBbsCode;
    private String districtBbsCode;
    private String upazilaBbsCode;
    private String unionNameEng;
    private String unionNameBng;
    private String bbsCode;
    private int status;
    private int createdBy;
    private int modifiedBy;
    private Timestamp created;
    private Timestamp modified;

    public UnionDTO() {

    }

    public UnionDTO(int id, int geoDivisionId, int geoDistrictId, int geoUpazilaId, String divisionBbsCode, String districtBbsCode, String upazilaBbsCode, String unionNameEng, String unionNameBng, String bbsCode, int status) {
        this.id = id;
        this.geoDivisionId = geoDivisionId;
        this.geoDistrictId = geoDistrictId;
        this.geoUpazilaId = geoUpazilaId;
        this.divisionBbsCode = divisionBbsCode;
        this.districtBbsCode = districtBbsCode;
        this.upazilaBbsCode = upazilaBbsCode;
        this.unionNameEng = unionNameEng;
        this.unionNameBng = unionNameBng;
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

    public String getUnionNameEng() {
        return unionNameEng;
    }

    public void setUnionNameEng(String unionNameEng) {
        this.unionNameEng = unionNameEng;
    }

    public String getUnionNameBng() {
        return unionNameBng;
    }

    public void setUnionNameBng(String unionNameBng) {
        this.unionNameBng = unionNameBng;
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
