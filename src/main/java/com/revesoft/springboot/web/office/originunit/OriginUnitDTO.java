package com.revesoft.springboot.web.office.originunit;

import java.sql.Timestamp;

/**
 * Created by reve on 11/8/2017.
 */
public class OriginUnitDTO {
    private int id;
    private int officeMinistryId;
    private int officeLayerId;
    private int officeOriginId;
    private String unitNameBng;
    private String unitNameEng;
    private String officeUnitCategory;
    private int parentUnitId;
    private int unitLevel;
    private byte status;
    private int createdBy;
    private int modifiedBy;
    private Timestamp created;
    private Timestamp modified;
    public OriginUnitDTO(){

    }

    public OriginUnitDTO(int id, String unitNameBng) {
        this.id = id;
        this.unitNameBng = unitNameBng;
    }

    public OriginUnitDTO(int id, int officeMinistryId, int officeLayerId, int officeOriginId, String unitNameBng, String unitNameEng, String officeUnitCategory, int parentUnitId, int unitLevel, byte status, int createdBy, int modifiedBy, Timestamp created, Timestamp modified) {
        this.id = id;
        this.officeMinistryId = officeMinistryId;
        this.officeLayerId = officeLayerId;
        this.officeOriginId = officeOriginId;
        this.unitNameBng = unitNameBng;
        this.unitNameEng = unitNameEng;
        this.officeUnitCategory = officeUnitCategory;
        this.parentUnitId = parentUnitId;
        this.unitLevel = unitLevel;
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

    public String getUnitNameBng() {
        return unitNameBng;
    }

    public void setUnitNameBng(String unitNameBng) {
        this.unitNameBng = unitNameBng;
    }

    public String getUnitNameEng() {
        return unitNameEng;
    }

    public void setUnitNameEng(String unitNameEng) {
        this.unitNameEng = unitNameEng;
    }

    public String getOfficeUnitCategory() {
        return officeUnitCategory;
    }

    public void setOfficeUnitCategory(String officeUnitCategory) {
        this.officeUnitCategory = officeUnitCategory;
    }

    public int getParentUnitId() {
        return parentUnitId;
    }

    public void setParentUnitId(int parentUnitId) {
        this.parentUnitId = parentUnitId;
    }

    public int getUnitLevel() {
        return unitLevel;
    }

    public void setUnitLevel(int unitLevel) {
        this.unitLevel = unitLevel;
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

        OriginUnitDTO that = (OriginUnitDTO) o;

        if (id != that.id) return false;
        if (officeMinistryId != that.officeMinistryId) return false;
        if (officeLayerId != that.officeLayerId) return false;
        if (officeOriginId != that.officeOriginId) return false;
        if (parentUnitId != that.parentUnitId) return false;
        if (unitLevel != that.unitLevel) return false;
        if (status != that.status) return false;
        if (createdBy != that.createdBy) return false;
        if (modifiedBy != that.modifiedBy) return false;
        if (unitNameBng != null ? !unitNameBng.equals(that.unitNameBng) : that.unitNameBng != null) return false;
        if (unitNameEng != null ? !unitNameEng.equals(that.unitNameEng) : that.unitNameEng != null) return false;
        if (officeUnitCategory != null ? !officeUnitCategory.equals(that.officeUnitCategory) : that.officeUnitCategory != null)
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
        result = 31 * result + officeOriginId;
        result = 31 * result + (unitNameBng != null ? unitNameBng.hashCode() : 0);
        result = 31 * result + (unitNameEng != null ? unitNameEng.hashCode() : 0);
        result = 31 * result + (officeUnitCategory != null ? officeUnitCategory.hashCode() : 0);
        result = 31 * result + parentUnitId;
        result = 31 * result + unitLevel;
        result = 31 * result + (int) status;
        result = 31 * result + createdBy;
        result = 31 * result + modifiedBy;
        result = 31 * result + (created != null ? created.hashCode() : 0);
        result = 31 * result + (modified != null ? modified.hashCode() : 0);
        return result;
    }
}
