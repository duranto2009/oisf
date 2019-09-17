package com.revesoft.springboot.web.office.origin;

import java.sql.Timestamp;

/**
 * Created by Bony on 11/5/2017.
 */
public class OriginDTO {
    private int id;
    private int officeMinistryId;
    private int officeLayerId;
    private String officeNameEng;
    private String officeNameBng;
    private int parentOfficeId;
    private int officeLevel;
    private int officeSequence;
    private byte status;
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

    public int getParentOfficeId() {
        return parentOfficeId;
    }

    public void setParentOfficeId(int parentOfficeId) {
        this.parentOfficeId = parentOfficeId;
    }

    public int getOfficeLevel() {
        return officeLevel;
    }

    public void setOfficeLevel(int officeLevel) {
        this.officeLevel = officeLevel;
    }

    public int getOfficeSequence() {
        return officeSequence;
    }

    public void setOfficeSequence(int officeSequence) {
        this.officeSequence = officeSequence;
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

        OriginDTO that = (OriginDTO) o;

        if (id != that.id) return false;
        if (officeMinistryId != that.officeMinistryId) return false;
        if (officeLayerId != that.officeLayerId) return false;
        if (parentOfficeId != that.parentOfficeId) return false;
        if (officeLevel != that.officeLevel) return false;
        if (officeSequence != that.officeSequence) return false;
        if (status != that.status) return false;
        if (createdBy != that.createdBy) return false;
        if (modifiedBy != that.modifiedBy) return false;
        if (officeNameEng != null ? !officeNameEng.equals(that.officeNameEng) : that.officeNameEng != null)
            return false;
        if (officeNameBng != null ? !officeNameBng.equals(that.officeNameBng) : that.officeNameBng != null)
            return false;
        if (created != null ? !created.equals(that.created) : that.created != null) return false;
        if (modified != null ? !modified.equals(that.modified) : that.modified != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + officeMinistryId;
        result = 31 * result + officeLayerId;
        result = 31 * result + (officeNameEng != null ? officeNameEng.hashCode() : 0);
        result = 31 * result + (officeNameBng != null ? officeNameBng.hashCode() : 0);
        result = 31 * result + parentOfficeId;
        result = 31 * result + officeLevel;
        result = 31 * result + officeSequence;
        result = 31 * result + (int) status;
        result = 31 * result + createdBy;
        result = 31 * result + modifiedBy;
        result = 31 * result + (created != null ? created.hashCode() : 0);
        result = 31 * result + (modified != null ? modified.hashCode() : 0);
        return result;
    }
}
