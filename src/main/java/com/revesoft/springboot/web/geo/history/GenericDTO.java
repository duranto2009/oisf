package com.revesoft.springboot.web.geo.history;


import java.sql.Date;

/**
 * Created by Bony on 11/26/2017.
 */
public class GenericDTO {

    String divisionName = "";
    String districtName = "";
    String upazilaName = "";
    String thanaName = "";
    String cityCorporationName = "";
    String postofficeName = "";
    String unionName = "";
    String municipalityName = "";
    String municipalityWardName = "";
    String cityCorporationWardName = "";

    String divisionNameEng = "";
    String districtNameEng = "";
    String upazilaNameEng = "";
    String thanaNameEng = "";
    String cityCorporationNameEng = "";
    String postofficeNameEng = "";
    String unionNameEng = "";
    String municipalityNameEng = "";
    String municipalityWardNameEng = "";
    String cityCorporationWardNameEng = "";

    String divisionBbsCode;
    String districtBbsCode;
    String upazilaBbsCode;
    String cityCorporationBbsCode;
    String thanaBbsCode;
    String postOfficeBbsCode;
    String unionBbsCode;
    String municipalityBbsCode;
    String cityCorporationWardBbsCode;
    String municipalityWardBbsCode;

    int divisionId = -1;
    int districtId = -1;
    int upazilaId = -1;
    int thanaId = -1;
    int cityCorporationId = -1;
    int postofficeId = -1;
    int unionId = -1;
    int municipalityId = -1;
    int municipalityWardId = -1;
    int cityCorporationWardId = -1;

    int divisionStatus = -1;
    int districtStatus = -1;
    int upazilaStatus = -1;
    int thanaStatus = -1;
    int cityCorporationStatus = -1;
    int postofficeStatus = -1;
    int unionStatus = -1;
    int municipalityStatus = -1;
    int municipalityWardStatus = -1;
    int cityCorporationWardStatus = -1;

    String fromDate;
    String toDate;
    String typeName;

    int sourceType;
    int parentType;

    public int getSourceType() {
        return sourceType;
    }

    public void setSourceType(int sourceType) {
        this.sourceType = sourceType;
    }

    public int getParentType() {
        return parentType;
    }

    public void setParentType(int parentType) {
        this.parentType = parentType;
    }

    public String getDivisionNameEng() {
        return divisionNameEng;
    }

    public void setDivisionNameEng(String divisionNameEng) {
        this.divisionNameEng = divisionNameEng;
    }

    public String getDistrictNameEng() {
        return districtNameEng;
    }

    public void setDistrictNameEng(String districtNameEng) {
        this.districtNameEng = districtNameEng;
    }

    public String getUpazilaNameEng() {
        return upazilaNameEng;
    }

    public void setUpazilaNameEng(String upazilaNameEng) {
        this.upazilaNameEng = upazilaNameEng;
    }

    public String getThanaNameEng() {
        return thanaNameEng;
    }

    public void setThanaNameEng(String thanaNameEng) {
        this.thanaNameEng = thanaNameEng;
    }

    public String getCityCorporationNameEng() {
        return cityCorporationNameEng;
    }

    public void setCityCorporationNameEng(String cityCorporationNameEng) {
        this.cityCorporationNameEng = cityCorporationNameEng;
    }

    public String getPostofficeNameEng() {
        return postofficeNameEng;
    }

    public void setPostofficeNameEng(String postofficeNameEng) {
        this.postofficeNameEng = postofficeNameEng;
    }

    public String getUnionNameEng() {
        return unionNameEng;
    }

    public void setUnionNameEng(String unionNameEng) {
        this.unionNameEng = unionNameEng;
    }

    public String getMunicipalityNameEng() {
        return municipalityNameEng;
    }

    public void setMunicipalityNameEng(String municipalityNameEng) {
        this.municipalityNameEng = municipalityNameEng;
    }

    public String getMunicipalityWardNameEng() {
        return municipalityWardNameEng;
    }

    public void setMunicipalityWardNameEng(String municipalityWardNameEng) {
        this.municipalityWardNameEng = municipalityWardNameEng;
    }

    public String getCityCorporationWardNameEng() {
        return cityCorporationWardNameEng;
    }

    public void setCityCorporationWardNameEng(String cityCorporationWardNameEng) {
        this.cityCorporationWardNameEng = cityCorporationWardNameEng;
    }

    public String getFromDate() {
        return fromDate;
    }

    public void setFromDate(String fromDate) {
        this.fromDate = fromDate;
    }

    public String getToDate() {
        return toDate;
    }

    public void setToDate(String toDate) {
        this.toDate = toDate;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public String getDivisionName() {
        return divisionName;
    }

    public void setDivisionName(String divisionName) {
        this.divisionName = divisionName;
    }

    public String getDistrictName() {
        return districtName;
    }

    public void setDistrictName(String districtName) {
        this.districtName = districtName;
    }

    public String getUpazilaName() {
        return upazilaName;
    }

    public void setUpazilaName(String upazilaName) {
        this.upazilaName = upazilaName;
    }

    public String getThanaName() {
        return thanaName;
    }

    public void setThanaName(String thanaName) {
        this.thanaName = thanaName;
    }

    public String getCityCorporationName() {
        return cityCorporationName;
    }

    public void setCityCorporationName(String cityCorporationName) {
        this.cityCorporationName = cityCorporationName;
    }

    public String getPostofficeName() {
        return postofficeName;
    }

    public void setPostofficeName(String postofficeName) {
        this.postofficeName = postofficeName;
    }

    public String getUnionName() {
        return unionName;
    }

    public void setUnionName(String unionName) {
        this.unionName = unionName;
    }

    public String getMunicipalityName() {
        return municipalityName;
    }

    public void setMunicipalityName(String municipalityName) {
        this.municipalityName = municipalityName;
    }

    public String getMunicipalityWardName() {
        return municipalityWardName;
    }

    public void setMunicipalityWardName(String municipalityWardName) {
        this.municipalityWardName = municipalityWardName;
    }

    public String getCityCorporationWardName() {
        return cityCorporationWardName;
    }

    public void setCityCorporationWardName(String cityCorporationWardName) {
        this.cityCorporationWardName = cityCorporationWardName;
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

    public int getUpazilaId() {
        return upazilaId;
    }

    public void setUpazilaId(int upazilaId) {
        this.upazilaId = upazilaId;
    }

    public int getThanaId() {
        return thanaId;
    }

    public void setThanaId(int thanaId) {
        this.thanaId = thanaId;
    }

    public int getCityCorporationId() {
        return cityCorporationId;
    }

    public void setCityCorporationId(int cityCorporationId) {
        this.cityCorporationId = cityCorporationId;
    }

    public int getPostofficeId() {
        return postofficeId;
    }

    public void setPostofficeId(int postofficeId) {
        this.postofficeId = postofficeId;
    }

    public int getUnionId() {
        return unionId;
    }

    public void setUnionId(int unionId) {
        this.unionId = unionId;
    }

    public int getMunicipalityId() {
        return municipalityId;
    }

    public void setMunicipalityId(int municipalityId) {
        this.municipalityId = municipalityId;
    }

    public int getMunicipalityWardId() {
        return municipalityWardId;
    }

    public void setMunicipalityWardId(int municipalityWardId) {
        this.municipalityWardId = municipalityWardId;
    }

    public int getCityCorporationWardId() {
        return cityCorporationWardId;
    }

    public void setCityCorporationWardId(int cityCorporationWardId) {
        this.cityCorporationWardId = cityCorporationWardId;
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

    public String getCityCorporationBbsCode() {
        return cityCorporationBbsCode;
    }

    public void setCityCorporationBbsCode(String cityCorporationBbsCode) {
        this.cityCorporationBbsCode = cityCorporationBbsCode;
    }

    public String getThanaBbsCode() {
        return thanaBbsCode;
    }

    public void setThanaBbsCode(String thanaBbsCode) {
        this.thanaBbsCode = thanaBbsCode;
    }

    public String getPostOfficeBbsCode() {
        return postOfficeBbsCode;
    }

    public void setPostOfficeBbsCode(String postOfficeBbsCode) {
        this.postOfficeBbsCode = postOfficeBbsCode;
    }

    public String getUnionBbsCode() {
        return unionBbsCode;
    }

    public void setUnionBbsCode(String unionBbsCode) {
        this.unionBbsCode = unionBbsCode;
    }

    public String getMunicipalityBbsCode() {
        return municipalityBbsCode;
    }

    public void setMunicipalityBbsCode(String municipalityBbsCode) {
        this.municipalityBbsCode = municipalityBbsCode;
    }

    public String getCityCorporationWardBbsCode() {
        return cityCorporationWardBbsCode;
    }

    public void setCityCorporationWardBbsCode(String cityCorporationWardBbsCode) {
        this.cityCorporationWardBbsCode = cityCorporationWardBbsCode;
    }

    public String getMunicipalityWardBbsCode() {
        return municipalityWardBbsCode;
    }

    public void setMunicipalityWardBbsCode(String municipalityWardBbsCode) {
        this.municipalityWardBbsCode = municipalityWardBbsCode;
    }


    public int getDivisionStatus() {
        return divisionStatus;
    }

    public void setDivisionStatus(int divisionStatus) {
        this.divisionStatus = divisionStatus;
    }

    public int getDistrictStatus() {
        return districtStatus;
    }

    public void setDistrictStatus(int districtStatus) {
        this.districtStatus = districtStatus;
    }

    public int getUpazilaStatus() {
        return upazilaStatus;
    }

    public void setUpazilaStatus(int upazilaStatus) {
        this.upazilaStatus = upazilaStatus;
    }

    public int getThanaStatus() {
        return thanaStatus;
    }

    public void setThanaStatus(int thanaStatus) {
        this.thanaStatus = thanaStatus;
    }

    public int getCityCorporationStatus() {
        return cityCorporationStatus;
    }

    public void setCityCorporationStatus(int cityCorporationStatus) {
        this.cityCorporationStatus = cityCorporationStatus;
    }

    public int getPostofficeStatus() {
        return postofficeStatus;
    }

    public void setPostofficeStatus(int postofficeStatus) {
        this.postofficeStatus = postofficeStatus;
    }

    public int getUnionStatus() {
        return unionStatus;
    }

    public void setUnionStatus(int unionStatus) {
        this.unionStatus = unionStatus;
    }

    public int getMunicipalityStatus() {
        return municipalityStatus;
    }

    public void setMunicipalityStatus(int municipalityStatus) {
        this.municipalityStatus = municipalityStatus;
    }

    public int getMunicipalityWardStatus() {
        return municipalityWardStatus;
    }

    public void setMunicipalityWardStatus(int municipalityWardStatus) {
        this.municipalityWardStatus = municipalityWardStatus;
    }

    public int getCityCorporationWardStatus() {
        return cityCorporationWardStatus;
    }

    public void setCityCorporationWardStatus(int cityCorporationWardStatus) {
        this.cityCorporationWardStatus = cityCorporationWardStatus;
    }
}

