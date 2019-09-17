package com.revesoft.springboot.web.employee;

import java.sql.Timestamp;

/**
 * Created by Bony on 11/2/2017.
 */
public class DesignationUpdateHistoryDTO {
    private int id;
    private int designationId;
    private int officeId;
    private int officeUnitId;
    private Integer superiorUnitId;
    private Integer superiorDesignationId;
    private Integer refOriginUnitOrgId;
    private String oldDesignationEng;
    private String oldDesignationBng;
    private String designationEng;
    private String designationBng;
    private int employeeOfficeId;
    private int employeeUnitId;
    private int employeeDesignationId;
    private Timestamp created;
    private Timestamp modified;
    private int createdBy;
    private int modifiedBy;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getDesignationId() {
        return designationId;
    }

    public void setDesignationId(int designationId) {
        this.designationId = designationId;
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

    public Integer getSuperiorUnitId() {
        return superiorUnitId;
    }

    public void setSuperiorUnitId(Integer superiorUnitId) {
        this.superiorUnitId = superiorUnitId;
    }

    public Integer getSuperiorDesignationId() {
        return superiorDesignationId;
    }

    public void setSuperiorDesignationId(Integer superiorDesignationId) {
        this.superiorDesignationId = superiorDesignationId;
    }

    public Integer getRefOriginUnitOrgId() {
        return refOriginUnitOrgId;
    }

    public void setRefOriginUnitOrgId(Integer refOriginUnitOrgId) {
        this.refOriginUnitOrgId = refOriginUnitOrgId;
    }

    public String getOldDesignationEng() {
        return oldDesignationEng;
    }

    public void setOldDesignationEng(String oldDesignationEng) {
        this.oldDesignationEng = oldDesignationEng;
    }

    public String getOldDesignationBng() {
        return oldDesignationBng;
    }

    public void setOldDesignationBng(String oldDesignationBng) {
        this.oldDesignationBng = oldDesignationBng;
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

    public int getEmployeeOfficeId() {
        return employeeOfficeId;
    }

    public void setEmployeeOfficeId(int employeeOfficeId) {
        this.employeeOfficeId = employeeOfficeId;
    }

    public int getEmployeeUnitId() {
        return employeeUnitId;
    }

    public void setEmployeeUnitId(int employeeUnitId) {
        this.employeeUnitId = employeeUnitId;
    }

    public int getEmployeeDesignationId() {
        return employeeDesignationId;
    }

    public void setEmployeeDesignationId(int employeeDesignationId) {
        this.employeeDesignationId = employeeDesignationId;
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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        DesignationUpdateHistoryDTO that = (DesignationUpdateHistoryDTO) o;

        if (id != that.id) return false;
        if (designationId != that.designationId) return false;
        if (officeId != that.officeId) return false;
        if (officeUnitId != that.officeUnitId) return false;
        if (employeeOfficeId != that.employeeOfficeId) return false;
        if (employeeUnitId != that.employeeUnitId) return false;
        if (employeeDesignationId != that.employeeDesignationId) return false;
        if (createdBy != that.createdBy) return false;
        if (modifiedBy != that.modifiedBy) return false;
        if (superiorUnitId != null ? !superiorUnitId.equals(that.superiorUnitId) : that.superiorUnitId != null)
            return false;
        if (superiorDesignationId != null ? !superiorDesignationId.equals(that.superiorDesignationId) : that.superiorDesignationId != null)
            return false;
        if (refOriginUnitOrgId != null ? !refOriginUnitOrgId.equals(that.refOriginUnitOrgId) : that.refOriginUnitOrgId != null)
            return false;
        if (oldDesignationEng != null ? !oldDesignationEng.equals(that.oldDesignationEng) : that.oldDesignationEng != null)
            return false;
        if (oldDesignationBng != null ? !oldDesignationBng.equals(that.oldDesignationBng) : that.oldDesignationBng != null)
            return false;
        if (designationEng != null ? !designationEng.equals(that.designationEng) : that.designationEng != null)
            return false;
        if (designationBng != null ? !designationBng.equals(that.designationBng) : that.designationBng != null)
            return false;
        if (created != null ? !created.equals(that.created) : that.created != null) return false;
        if (modified != null ? !modified.equals(that.modified) : that.modified != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + designationId;
        result = 31 * result + officeId;
        result = 31 * result + officeUnitId;
        result = 31 * result + (superiorUnitId != null ? superiorUnitId.hashCode() : 0);
        result = 31 * result + (superiorDesignationId != null ? superiorDesignationId.hashCode() : 0);
        result = 31 * result + (refOriginUnitOrgId != null ? refOriginUnitOrgId.hashCode() : 0);
        result = 31 * result + (oldDesignationEng != null ? oldDesignationEng.hashCode() : 0);
        result = 31 * result + (oldDesignationBng != null ? oldDesignationBng.hashCode() : 0);
        result = 31 * result + (designationEng != null ? designationEng.hashCode() : 0);
        result = 31 * result + (designationBng != null ? designationBng.hashCode() : 0);
        result = 31 * result + employeeOfficeId;
        result = 31 * result + employeeUnitId;
        result = 31 * result + employeeDesignationId;
        result = 31 * result + (created != null ? created.hashCode() : 0);
        result = 31 * result + (modified != null ? modified.hashCode() : 0);
        result = 31 * result + createdBy;
        result = 31 * result + modifiedBy;
        return result;
    }
}
