package com.revesoft.springboot.web.office.originunitorganogram;

import java.sql.Timestamp;

/**
 * Created by reve on 11/8/2017.
 */
public class OriginUnitOrganogramDTO {

    private int id;
    private int officeOriginUnitId;
    private int superiorUnitId;
    private int superiorDesignationId;
    private String designationEng;
    private String designationBng;
    private String shortNameEng;
    private String shortNameBng;
    private int designationLevel;
    private int designationSequence;
    private byte status;
    private int createdBy;
    private int modifiedBy;
    private Timestamp created;
    private Timestamp modified;

    public OriginUnitOrganogramDTO() {
    }

    public OriginUnitOrganogramDTO(int id, String designationBng) {
        this.id = id;
        this.designationBng = designationBng;
    }

    public OriginUnitOrganogramDTO(int id, int officeOriginUnitId, int superiorUnitId, int superiorDesignationId, String designationEng, String designationBng, String shortNameEng, String shortNameBng, int designationLevel, int designationSequence, byte status, int createdBy, int modifiedBy, Timestamp created, Timestamp modified) {
        this.id = id;
        this.officeOriginUnitId = officeOriginUnitId;
        this.superiorUnitId = superiorUnitId;
        this.superiorDesignationId = superiorDesignationId;
        this.designationEng = designationEng;
        this.designationBng = designationBng;
        this.shortNameEng = shortNameEng;
        this.shortNameBng = shortNameBng;
        this.designationLevel = designationLevel;
        this.designationSequence = designationSequence;
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

    public int getOfficeOriginUnitId() {
        return officeOriginUnitId;
    }

    public void setOfficeOriginUnitId(int officeOriginUnitId) {
        this.officeOriginUnitId = officeOriginUnitId;
    }

    public int getSuperiorUnitId() {
        return superiorUnitId;
    }

    public void setSuperiorUnitId(int superiorUnitId) {
        this.superiorUnitId = superiorUnitId;
    }

    public int getSuperiorDesignationId() {
        return superiorDesignationId;
    }

    public void setSuperiorDesignationId(int superiorDesignationId) {
        this.superiorDesignationId = superiorDesignationId;
    }

    public String getDesignationEng() {
        return designationEng;
    }

    public void setDesignationEng(String designationEng) {
        this.designationEng = designationEng;
    }

    public String getDesignationBng() {
        return designationBng;
    }

    public void setDesignationBng(String designationBng) {
        this.designationBng = designationBng;
    }

    public String getShortNameEng() {
        return shortNameEng;
    }

    public void setShortNameEng(String shortNameEng) {
        this.shortNameEng = shortNameEng;
    }

    public String getShortNameBng() {
        return shortNameBng;
    }

    public void setShortNameBng(String shortNameBng) {
        this.shortNameBng = shortNameBng;
    }

    public int getDesignationLevel() {
        return designationLevel;
    }

    public void setDesignationLevel(int designationLevel) {
        this.designationLevel = designationLevel;
    }

    public int getDesignationSequence() {
        return designationSequence;
    }

    public void setDesignationSequence(int designationSequence) {
        this.designationSequence = designationSequence;
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

        OriginUnitOrganogramDTO that = (OriginUnitOrganogramDTO) o;

        if (id != that.id) return false;
        if (officeOriginUnitId != that.officeOriginUnitId) return false;
        if (superiorUnitId != that.superiorUnitId) return false;
        if (superiorDesignationId != that.superiorDesignationId) return false;
        if (designationLevel != that.designationLevel) return false;
        if (designationSequence != that.designationSequence) return false;
        if (status != that.status) return false;
        if (createdBy != that.createdBy) return false;
        if (modifiedBy != that.modifiedBy) return false;
        if (designationEng != null ? !designationEng.equals(that.designationEng) : that.designationEng != null)
            return false;
        if (designationBng != null ? !designationBng.equals(that.designationBng) : that.designationBng != null)
            return false;
        if (shortNameEng != null ? !shortNameEng.equals(that.shortNameEng) : that.shortNameEng != null) return false;
        if (shortNameBng != null ? !shortNameBng.equals(that.shortNameBng) : that.shortNameBng != null) return false;
        if (created != null ? !created.equals(that.created) : that.created != null) return false;
        if (modified != null ? !modified.equals(that.modified) : that.modified != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + officeOriginUnitId;
        result = 31 * result + superiorUnitId;
        result = 31 * result + superiorDesignationId;
        result = 31 * result + (designationEng != null ? designationEng.hashCode() : 0);
        result = 31 * result + (designationBng != null ? designationBng.hashCode() : 0);
        result = 31 * result + (shortNameEng != null ? shortNameEng.hashCode() : 0);
        result = 31 * result + (shortNameBng != null ? shortNameBng.hashCode() : 0);
        result = 31 * result + designationLevel;
        result = 31 * result + designationSequence;
        result = 31 * result + (int) status;
        result = 31 * result + createdBy;
        result = 31 * result + modifiedBy;
        result = 31 * result + (created != null ? created.hashCode() : 0);
        result = 31 * result + (modified != null ? modified.hashCode() : 0);
        return result;
    }
}
