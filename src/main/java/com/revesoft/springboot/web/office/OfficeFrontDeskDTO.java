package com.revesoft.springboot.web.office;

import java.sql.Timestamp;

/**
 * Created by Bony on 11/5/2017.
 */
public class OfficeFrontDeskDTO {
    private long id;
    private long officeId;
    private String officeName;
    private String officeAddress;
    private long officeUnitId;
    private String officeUnitName;
    private long officeUnitOrganogramId;
    private String designationLabel;
    private long officerId;
    private String officerName;
    private Long createdBy;
    private Timestamp created;
    private Timestamp modified;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getOfficeId() {
        return officeId;
    }

    public void setOfficeId(long officeId) {
        this.officeId = officeId;
    }

    public String getOfficeName() {
        return officeName;
    }

    public void setOfficeName(String officeName) {
        this.officeName = officeName;
    }

    public String getOfficeAddress() {
        return officeAddress;
    }

    public void setOfficeAddress(String officeAddress) {
        this.officeAddress = officeAddress;
    }

    public long getOfficeUnitId() {
        return officeUnitId;
    }

    public void setOfficeUnitId(long officeUnitId) {
        this.officeUnitId = officeUnitId;
    }

    public String getOfficeUnitName() {
        return officeUnitName;
    }

    public void setOfficeUnitName(String officeUnitName) {
        this.officeUnitName = officeUnitName;
    }

    public long getOfficeUnitOrganogramId() {
        return officeUnitOrganogramId;
    }

    public void setOfficeUnitOrganogramId(long officeUnitOrganogramId) {
        this.officeUnitOrganogramId = officeUnitOrganogramId;
    }

    public String getDesignationLabel() {
        return designationLabel;
    }

    public void setDesignationLabel(String designationLabel) {
        this.designationLabel = designationLabel;
    }

    public long getOfficerId() {
        return officerId;
    }

    public void setOfficerId(long officerId) {
        this.officerId = officerId;
    }

    public String getOfficerName() {
        return officerName;
    }

    public void setOfficerName(String officerName) {
        this.officerName = officerName;
    }

    public Long getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(Long createdBy) {
        this.createdBy = createdBy;
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

        OfficeFrontDeskDTO that = (OfficeFrontDeskDTO) o;

        if (id != that.id) return false;
        if (officeId != that.officeId) return false;
        if (officeUnitId != that.officeUnitId) return false;
        if (officeUnitOrganogramId != that.officeUnitOrganogramId) return false;
        if (officerId != that.officerId) return false;
        if (officeName != null ? !officeName.equals(that.officeName) : that.officeName != null) return false;
        if (officeAddress != null ? !officeAddress.equals(that.officeAddress) : that.officeAddress != null)
            return false;
        if (officeUnitName != null ? !officeUnitName.equals(that.officeUnitName) : that.officeUnitName != null)
            return false;
        if (designationLabel != null ? !designationLabel.equals(that.designationLabel) : that.designationLabel != null)
            return false;
        if (officerName != null ? !officerName.equals(that.officerName) : that.officerName != null) return false;
        if (createdBy != null ? !createdBy.equals(that.createdBy) : that.createdBy != null) return false;
        if (created != null ? !created.equals(that.created) : that.created != null) return false;
        if (modified != null ? !modified.equals(that.modified) : that.modified != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (id ^ (id >>> 32));
        result = 31 * result + (int) (officeId ^ (officeId >>> 32));
        result = 31 * result + (officeName != null ? officeName.hashCode() : 0);
        result = 31 * result + (officeAddress != null ? officeAddress.hashCode() : 0);
        result = 31 * result + (int) (officeUnitId ^ (officeUnitId >>> 32));
        result = 31 * result + (officeUnitName != null ? officeUnitName.hashCode() : 0);
        result = 31 * result + (int) (officeUnitOrganogramId ^ (officeUnitOrganogramId >>> 32));
        result = 31 * result + (designationLabel != null ? designationLabel.hashCode() : 0);
        result = 31 * result + (int) (officerId ^ (officerId >>> 32));
        result = 31 * result + (officerName != null ? officerName.hashCode() : 0);
        result = 31 * result + (createdBy != null ? createdBy.hashCode() : 0);
        result = 31 * result + (created != null ? created.hashCode() : 0);
        result = 31 * result + (modified != null ? modified.hashCode() : 0);
        return result;
    }

}
