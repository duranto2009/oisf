package com.revesoft.springboot.web.office.officeunitorganogram;

import java.sql.Timestamp;

/**
 * Created by reve on 11/8/2017.
 */
public class OfficeUnitOrganogramDTO {
    private int id;
    private int officeId;
    private int officeUnitId;
    private int superiorUnitId;
    private int superiorDesignationId;
    private int refOriginUnitOrgId;
    private int refSupOriginUnitDesigId;
    private int refSupOriginUnitId;
    private String designationEng;
    private String designationBng;
    private String shortNameEng;
    private String shortNameBng;
    private int designationLevel;
    private int designationSequence;
    private String designationDescription;
    private byte status;
    private int createdBy;
    private int modifiedBy;
    private Timestamp created;
    private Timestamp modified;

    public OfficeUnitOrganogramDTO() {
    }

    public OfficeUnitOrganogramDTO(int id, int officeId, int officeUnitId, int superiorUnitId, int superiorDesignationId, int refOriginUnitOrgId, int refSupOriginUnitDesigId, int refSupOriginUnitId, String designationEng, String designationBng, String shortNameEng, String shortNameBng, int designationLevel, int designationSequence, String designationDescription, byte status, int createdBy, int modifiedBy, Timestamp created, Timestamp modified) {
        this.id = id;
        this.officeId = officeId;
        this.officeUnitId = officeUnitId;
        this.superiorUnitId = superiorUnitId;
        this.superiorDesignationId = superiorDesignationId;
        this.refOriginUnitOrgId = refOriginUnitOrgId;
        this.refSupOriginUnitDesigId = refSupOriginUnitDesigId;
        this.refSupOriginUnitId = refSupOriginUnitId;
        this.designationEng = designationEng;
        this.designationBng = designationBng;
        this.shortNameEng = shortNameEng;
        this.shortNameBng = shortNameBng;
        this.designationLevel = designationLevel;
        this.designationSequence = designationSequence;
        this.designationDescription = designationDescription;
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

    public int getOfficeId() {
        return officeId;
    }

    public void setOfficeId(int officeId) {
        this.officeId = officeId;
    }

    public int getOfficeUnitId() {
        return officeUnitId;
    }

    public void setOfficeUnitId(int officeUnitId) {
        this.officeUnitId = officeUnitId;
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

    public int getRefOriginUnitOrgId() {
        return refOriginUnitOrgId;
    }

    public void setRefOriginUnitOrgId(int refOriginUnitOrgId) {
        this.refOriginUnitOrgId = refOriginUnitOrgId;
    }

    public int getRefSupOriginUnitDesigId() {
        return refSupOriginUnitDesigId;
    }

    public void setRefSupOriginUnitDesigId(int refSupOriginUnitDesigId) {
        this.refSupOriginUnitDesigId = refSupOriginUnitDesigId;
    }

    public int getRefSupOriginUnitId() {
        return refSupOriginUnitId;
    }

    public void setRefSupOriginUnitId(int refSupOriginUnitId) {
        this.refSupOriginUnitId = refSupOriginUnitId;
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

    public String getDesignationDescription() {
        return designationDescription;
    }

    public void setDesignationDescription(String designationDescription) {
        this.designationDescription = designationDescription;
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

        OfficeUnitOrganogramDTO that = (OfficeUnitOrganogramDTO) o;

        if (id != that.id) return false;
        if (officeId != that.officeId) return false;
        if (officeUnitId != that.officeUnitId) return false;
        if (superiorUnitId != that.superiorUnitId) return false;
        if (superiorDesignationId != that.superiorDesignationId) return false;
        if (refOriginUnitOrgId != that.refOriginUnitOrgId) return false;
        if (refSupOriginUnitDesigId != that.refSupOriginUnitDesigId) return false;
        if (refSupOriginUnitId != that.refSupOriginUnitId) return false;
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
        if (designationDescription != null ? !designationDescription.equals(that.designationDescription) : that.designationDescription != null)
            return false;
        if (created != null ? !created.equals(that.created) : that.created != null) return false;
        if (modified != null ? !modified.equals(that.modified) : that.modified != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + officeId;
        result = 31 * result + officeUnitId;
        result = 31 * result + superiorUnitId;
        result = 31 * result + superiorDesignationId;
        result = 31 * result + refOriginUnitOrgId;
        result = 31 * result + refSupOriginUnitDesigId;
        result = 31 * result + refSupOriginUnitId;
        result = 31 * result + (designationEng != null ? designationEng.hashCode() : 0);
        result = 31 * result + (designationBng != null ? designationBng.hashCode() : 0);
        result = 31 * result + (shortNameEng != null ? shortNameEng.hashCode() : 0);
        result = 31 * result + (shortNameBng != null ? shortNameBng.hashCode() : 0);
        result = 31 * result + designationLevel;
        result = 31 * result + designationSequence;
        result = 31 * result + (designationDescription != null ? designationDescription.hashCode() : 0);
        result = 31 * result + (int) status;
        result = 31 * result + createdBy;
        result = 31 * result + modifiedBy;
        result = 31 * result + (created != null ? created.hashCode() : 0);
        result = 31 * result + (modified != null ? modified.hashCode() : 0);
        return result;
    }
}
