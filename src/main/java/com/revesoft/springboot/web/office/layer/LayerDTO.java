package com.revesoft.springboot.web.office.layer;

import java.sql.Timestamp;

/**
 * Created by Bony on 11/5/2017.
 */
public class LayerDTO {
    private int id;
    private int officeMinistryId;
    private Integer parentLayerId;
    private String layerNameEng;
    private String layerNameBng;
    private int layerLevel;
    private int layerSequence;
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

    public Integer getParentLayerId() {
        return parentLayerId;
    }

    public void setParentLayerId(Integer parentLayerId) {
        this.parentLayerId = parentLayerId;
    }

    public String getLayerNameEng() {
        return layerNameEng;
    }

    public void setLayerNameEng(String layerNameEng) {
        this.layerNameEng = layerNameEng;
    }

    public String getLayerNameBng() {
        return layerNameBng;
    }

    public void setLayerNameBng(String layerNameBng) {
        this.layerNameBng = layerNameBng;
    }

    public int getLayerLevel() {
        return layerLevel;
    }

    public void setLayerLevel(int layerLevel) {
        this.layerLevel = layerLevel;
    }

    public int getLayerSequence() {
        return layerSequence;
    }

    public void setLayerSequence(int layerSequence) {
        this.layerSequence = layerSequence;
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

        LayerDTO that = (LayerDTO) o;

        if (id != that.id) return false;
        if (officeMinistryId != that.officeMinistryId) return false;
        if (layerLevel != that.layerLevel) return false;
        if (layerSequence != that.layerSequence) return false;
        if (status != that.status) return false;
        if (createdBy != that.createdBy) return false;
        if (modifiedBy != that.modifiedBy) return false;
        if (parentLayerId != null ? !parentLayerId.equals(that.parentLayerId) : that.parentLayerId != null)
            return false;
        if (layerNameEng != null ? !layerNameEng.equals(that.layerNameEng) : that.layerNameEng != null) return false;
        if (layerNameBng != null ? !layerNameBng.equals(that.layerNameBng) : that.layerNameBng != null) return false;
        if (created != null ? !created.equals(that.created) : that.created != null) return false;
        if (modified != null ? !modified.equals(that.modified) : that.modified != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + officeMinistryId;
        result = 31 * result + (parentLayerId != null ? parentLayerId.hashCode() : 0);
        result = 31 * result + (layerNameEng != null ? layerNameEng.hashCode() : 0);
        result = 31 * result + (layerNameBng != null ? layerNameBng.hashCode() : 0);
        result = 31 * result + layerLevel;
        result = 31 * result + layerSequence;
        result = 31 * result + (int) status;
        result = 31 * result + createdBy;
        result = 31 * result + modifiedBy;
        result = 31 * result + (created != null ? created.hashCode() : 0);
        result = 31 * result + (modified != null ? modified.hashCode() : 0);
        return result;
    }
}
