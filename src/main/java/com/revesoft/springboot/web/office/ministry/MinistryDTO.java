package com.revesoft.springboot.web.office.ministry;

import java.sql.Timestamp;

/**
 * Created by Bony on 11/5/2017.
 */
public class MinistryDTO {
    private int id;
    private byte officeType;
    private String nameEng;
    private String nameBng;
    private String nameEngShort;
    private String referenceCode;
    private byte status;
    private int createdBy;
    private int modifiedBy;
    private Timestamp created;
    private Timestamp modified;

    public MinistryDTO(){

    }
    public MinistryDTO(int id, byte officeType, String nameEng, String nameBng, String nameEngShort, String referenceCode, byte status, int createdBy, int modifiedBy, Timestamp created, Timestamp modified) {
        this.id = id;
        this.officeType = officeType;
        this.nameEng = nameEng;
        this.nameBng = nameBng;
        this.nameEngShort = nameEngShort;
        this.referenceCode = referenceCode;
        this.status = status;
        this.createdBy = createdBy;
        this.modifiedBy = modifiedBy;
        this.created = created;
        this.modified = modified;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public byte getOfficeType() {
        return officeType;
    }

    public void setOfficeType(byte officeType) {
        this.officeType = officeType;
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

    public String getNameEngShort() {
        return nameEngShort;
    }

    public void setNameEngShort(String nameEngShort) {
        this.nameEngShort = nameEngShort;
    }

    public String getReferenceCode() {
        return referenceCode;
    }

    public void setReferenceCode(String referenceCode) {
        this.referenceCode = referenceCode;
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

        MinistryDTO that = (MinistryDTO) o;

        if (id != that.id) return false;
        if (officeType != that.officeType) return false;
        if (status != that.status) return false;
        if (createdBy != that.createdBy) return false;
        if (modifiedBy != that.modifiedBy) return false;
        if (nameEng != null ? !nameEng.equals(that.nameEng) : that.nameEng != null) return false;
        if (nameBng != null ? !nameBng.equals(that.nameBng) : that.nameBng != null) return false;
        if (nameEngShort != null ? !nameEngShort.equals(that.nameEngShort) : that.nameEngShort != null) return false;
        if (referenceCode != null ? !referenceCode.equals(that.referenceCode) : that.referenceCode != null)
            return false;
        if (created != null ? !created.equals(that.created) : that.created != null) return false;
        if (modified != null ? !modified.equals(that.modified) : that.modified != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (int) officeType;
        result = 31 * result + (nameEng != null ? nameEng.hashCode() : 0);
        result = 31 * result + (nameBng != null ? nameBng.hashCode() : 0);
        result = 31 * result + (nameEngShort != null ? nameEngShort.hashCode() : 0);
        result = 31 * result + (referenceCode != null ? referenceCode.hashCode() : 0);
        result = 31 * result + (int) status;
        result = 31 * result + createdBy;
        result = 31 * result + modifiedBy;
        result = 31 * result + (created != null ? created.hashCode() : 0);
        result = 31 * result + (modified != null ? modified.hashCode() : 0);
        return result;
    }
}
