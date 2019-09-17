package com.revesoft.springboot.web.office.offices;

import java.sql.Timestamp;

/**
 * Created by Bony on 11/5/2017.
 */
public class OfficeDTO {
    private int id=0;
    private int officeMinistryId=0;
    private int officeLayerId=0;
    private int officeOriginId=0;
    private String officeNameEng="";
    private String officeNameBng="";
    private int geoDivisionId=0;
    private int geoDistrictId=0;
    private int geoUpazilaId=0;

    public int getGeoThanaId() {
        return geoThanaId;
    }

    public void setGeoThanaId(int geoThanaId) {
        this.geoThanaId = geoThanaId;
    }

    public int getGeoPostofficeId() {
        return geoPostofficeId;
    }

    public void setGeoPostofficeId(int geoPostofficeId) {
        this.geoPostofficeId = geoPostofficeId;
    }

    private int geoThanaId=0;
    private int geoPostofficeId=0;
    private int geoCityCorporationId=0;
    private int geoCityCorporationWardId=0;
    private  int geoMunicipalityId=0;
    private int geoMunicipalityWardId=0;
    private int geoUnionId=0;
    private String officeAddress="";
    private String digitalNothiCode="";
    private String referenceCode="";
    private String officeCode="";
    private String officePhone="";
    private String officeMobile="";
    private String officeFax="";
    private String officeEmail="";
    private String officeWeb="";
    private int countryId=0;
    private int parentOfficeId=0;
    private byte status=0;
    private int createdBy=0;
    private int modifiedBy=0;
    private Timestamp created;
    private Timestamp modified;


    public OfficeDTO() {
    }

    public OfficeDTO(int id, int officeMinistryId, int officeLayerId, int officeOriginId, String officeNameEng, String officeNameBng, int geoDivisionId, int geoDistrictId, int geoUpazilaId, int geoCityCorporationId, int geoCityCorporationWardId, int geoMunicipalityId, int geoMunicipalityWardId, int geoUnionId, String officeAddress, String digitalNothiCode, String referenceCode, String officeCode, String officePhone, String officeMobile, String officeFax, String officeEmail, String officeWeb,int thanaId, int postOfficeId, int countryId, int parentOfficeId, byte status, int createdBy, int modifiedBy, Timestamp created, Timestamp modified) {
        this.id = id;
        this.officeMinistryId = officeMinistryId;
        this.officeLayerId = officeLayerId;
        this.officeOriginId = officeOriginId;
        this.officeNameEng = officeNameEng;
        this.officeNameBng = officeNameBng;
        this.geoDivisionId = geoDivisionId;
        this.geoDistrictId = geoDistrictId;
        this.geoUpazilaId = geoUpazilaId;
        this.geoCityCorporationId = geoCityCorporationId;
        this.geoCityCorporationWardId = geoCityCorporationWardId;
        this.geoMunicipalityId = geoMunicipalityId;
        this.geoMunicipalityWardId = geoMunicipalityWardId;
        this.geoUnionId = geoUnionId;
        this.officeAddress = officeAddress;
        this.digitalNothiCode = digitalNothiCode;
        this.referenceCode = referenceCode;
        this.officeCode = officeCode;
        this.officePhone = officePhone;
        this.officeMobile = officeMobile;
        this.officeFax = officeFax;
        this.officeEmail = officeEmail;
        this.officeWeb = officeWeb;
        this.parentOfficeId = parentOfficeId;
        this.status = status;
        this.createdBy = createdBy;
        this.modifiedBy = modifiedBy;
        this.created = created;
        this.modified = modified;
        this.geoThanaId = thanaId;
        this.geoPostofficeId = postOfficeId;
        this.countryId = countryId;
    }

    public int getGeoMunicipalityId() {
        return geoMunicipalityId;
    }

    public void setGeoMunicipalityId(int geoMunicipalityId) {
        this.geoMunicipalityId = geoMunicipalityId;
    }

    public int getGeoCityCorporationWardId() {
        return geoCityCorporationWardId;
    }

    public void setGeoCityCorporationWardId(int geoCityCorporationWardId) {
        this.geoCityCorporationWardId = geoCityCorporationWardId;
    }

    public int getGeoMunicipalityWardId() {
        return geoMunicipalityWardId;
    }

    public void setGeoMunicipalityWardId(int geoMunicipalityWardId) {
        this.geoMunicipalityWardId = geoMunicipalityWardId;
    }

    public int getGeoCityCorporationId() {
        return geoCityCorporationId;
    }

    public void setGeoCityCorporationId(int geoCityCorporationId) {
        this.geoCityCorporationId = geoCityCorporationId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getOfficeMinistryId() {
        return officeMinistryId;
    }

    public void setOfficeMinistryId(int officeMinistryId) {
        this.officeMinistryId = officeMinistryId;
    }

    public int getOfficeLayerId() {
        return officeLayerId;
    }

    public void setOfficeLayerId(int officeLayerId) {
        this.officeLayerId = officeLayerId;
    }

    public int getOfficeOriginId() {
        return officeOriginId;
    }

    public void setOfficeOriginId(int officeOriginId) {
        this.officeOriginId = officeOriginId;
    }

    public String getOfficeNameEng() {
        return officeNameEng;
    }

    public void setOfficeNameEng(String officeNameEng) {
        this.officeNameEng = officeNameEng;
    }

    public String getOfficeNameBng() {
        return officeNameBng;
    }

    public void setOfficeNameBng(String officeNameBng) {
        this.officeNameBng = officeNameBng;
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

    public int getGeoUnionId() {
        return geoUnionId;
    }

    public void setGeoUnionId(int geoUnionId) {
        this.geoUnionId = geoUnionId;
    }

    public String getOfficeAddress() {
        return officeAddress;
    }

    public void setOfficeAddress(String officeAddress) {
        this.officeAddress = officeAddress;
    }

    public String getDigitalNothiCode() {
        return digitalNothiCode;
    }

    public void setDigitalNothiCode(String digitalNothiCode) {
        this.digitalNothiCode = digitalNothiCode;
    }

    public String getReferenceCode() {
        return referenceCode;
    }

    public void setReferenceCode(String referenceCode) {
        this.referenceCode = referenceCode;
    }

    public String getOfficeCode() {
        return officeCode;
    }

    public void setOfficeCode(String officeCode) {
        this.officeCode = officeCode;
    }

    public String getOfficePhone() {
        return officePhone;
    }

    public void setOfficePhone(String officePhone) {
        this.officePhone = officePhone;
    }

    public String getOfficeMobile() {
        return officeMobile;
    }

    public void setOfficeMobile(String officeMobile) {
        this.officeMobile = officeMobile;
    }

    public String getOfficeFax() {
        return officeFax;
    }

    public void setOfficeFax(String officeFax) {
        this.officeFax = officeFax;
    }

    public String getOfficeEmail() {
        return officeEmail;
    }

    public void setOfficeEmail(String officeEmail) {
        this.officeEmail = officeEmail;
    }

    public String getOfficeWeb() {
        return officeWeb;
    }

    public void setOfficeWeb(String officeWeb) {
        this.officeWeb = officeWeb;
    }

    public int getParentOfficeId() {
        return parentOfficeId;
    }

    public void setParentOfficeId(int parentOfficeId) {
        this.parentOfficeId = parentOfficeId;
    }

    public byte getStatus() {
        return status;
    }

    public void setStatus(byte status) {
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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        OfficeDTO that = (OfficeDTO) o;

        if (id != that.id) return false;
        if (officeMinistryId != that.officeMinistryId) return false;
        if (officeLayerId != that.officeLayerId) return false;
        if (officeOriginId != that.officeOriginId) return false;
        if (geoDivisionId != that.geoDivisionId) return false;
        if (geoDistrictId != that.geoDistrictId) return false;
        if (geoUpazilaId != that.geoUpazilaId) return false;
        if (geoUnionId != that.geoUnionId) return false;
        if (parentOfficeId != that.parentOfficeId) return false;
        if (status != that.status) return false;
        if (createdBy != that.createdBy) return false;
        if (modifiedBy != that.modifiedBy) return false;
        if (officeNameEng != null ? !officeNameEng.equals(that.officeNameEng) : that.officeNameEng != null)
            return false;
        if (officeNameBng != null ? !officeNameBng.equals(that.officeNameBng) : that.officeNameBng != null)
            return false;
        if (officeAddress != null ? !officeAddress.equals(that.officeAddress) : that.officeAddress != null)
            return false;
        if (digitalNothiCode != null ? !digitalNothiCode.equals(that.digitalNothiCode) : that.digitalNothiCode != null)
            return false;
        if (referenceCode != null ? !referenceCode.equals(that.referenceCode) : that.referenceCode != null)
            return false;
        if (officeCode != null ? !officeCode.equals(that.officeCode) : that.officeCode != null) return false;
        if (officePhone != null ? !officePhone.equals(that.officePhone) : that.officePhone != null) return false;
        if (officeMobile != null ? !officeMobile.equals(that.officeMobile) : that.officeMobile != null) return false;
        if (officeFax != null ? !officeFax.equals(that.officeFax) : that.officeFax != null) return false;
        if (officeEmail != null ? !officeEmail.equals(that.officeEmail) : that.officeEmail != null) return false;
        if (officeWeb != null ? !officeWeb.equals(that.officeWeb) : that.officeWeb != null) return false;
        if (created != null ? !created.equals(that.created) : that.created != null) return false;
        if (modified != null ? !modified.equals(that.modified) : that.modified != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + officeMinistryId;
        result = 31 * result + officeLayerId;
        result = 31 * result + officeOriginId;
        result = 31 * result + (officeNameEng != null ? officeNameEng.hashCode() : 0);
        result = 31 * result + (officeNameBng != null ? officeNameBng.hashCode() : 0);
        result = 31 * result + geoDivisionId;
        result = 31 * result + geoDistrictId;
        result = 31 * result + geoUpazilaId;
        result = 31 * result + geoUnionId;
        result = 31 * result + (officeAddress != null ? officeAddress.hashCode() : 0);
        result = 31 * result + (digitalNothiCode != null ? digitalNothiCode.hashCode() : 0);
        result = 31 * result + (referenceCode != null ? referenceCode.hashCode() : 0);
        result = 31 * result + (officeCode != null ? officeCode.hashCode() : 0);
        result = 31 * result + (officePhone != null ? officePhone.hashCode() : 0);
        result = 31 * result + (officeMobile != null ? officeMobile.hashCode() : 0);
        result = 31 * result + (officeFax != null ? officeFax.hashCode() : 0);
        result = 31 * result + (officeEmail != null ? officeEmail.hashCode() : 0);
        result = 31 * result + (officeWeb != null ? officeWeb.hashCode() : 0);
        result = 31 * result + parentOfficeId;
        result = 31 * result + (int) status;
        result = 31 * result + createdBy;
        result = 31 * result + modifiedBy;
        result = 31 * result + (created != null ? created.hashCode() : 0);
        result = 31 * result + (modified != null ? modified.hashCode() : 0);
        return result;
    }

    public int getCountryId() {
        return countryId;
    }

    public void setCountryId(int countryId) {
        this.countryId = countryId;
    }
}
