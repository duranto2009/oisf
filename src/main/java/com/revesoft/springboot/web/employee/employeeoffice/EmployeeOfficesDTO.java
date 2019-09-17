package com.revesoft.springboot.web.employee.employeeoffice;

import com.revesoft.springboot.web.office.OfficeUnitsDTO;
import com.revesoft.springboot.web.office.offices.OfficeDTO;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;

/**
 * Created by Bony on 11/2/2017.
 */
public class EmployeeOfficesDTO {
    private long id;
    private long employeeRecordId;
    private String identificationNumber;
    private int officeId;
    private long officeUnitId;
    private long officeUnitOrganogramId;
    private String designation;
    private int designationLevel;
    private int designationSequence;
    private byte isDefaultRole;
    private byte officeHead;
    private byte summaryNothiPostType;
    private String inchargeLabel;



    private String joiningDate;
    private String lastOfficeDate;
    private byte status;
    private Timestamp statusChangeDate;
    private Timestamp created;
    private Timestamp modified;
    private long createdBy;
    private long modifiedBy;
    private OfficeDTO offices;
    private OfficeUnitsDTO officeUnits;




    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getEmployeeRecordId() {
        return employeeRecordId;
    }

    public void setEmployeeRecordId(long employeeRecordId) {
        this.employeeRecordId = employeeRecordId;
    }

    public String getIdentificationNumber() {
        return identificationNumber;
    }

    public void setIdentificationNumber(String identificationNumber) {
        this.identificationNumber = identificationNumber;
    }

    public int getOfficeId() {
        return officeId;
    }

    public void setOfficeId(int officeId) {
        this.officeId = officeId;
    }

    public long getOfficeUnitId() {
        return officeUnitId;
    }

    public void setOfficeUnitId(long officeUnitId) {
        this.officeUnitId = officeUnitId;
    }

    public long getOfficeUnitOrganogramId() {
        return officeUnitOrganogramId;
    }

    public void setOfficeUnitOrganogramId(long officeUnitOrganogramId) {
        this.officeUnitOrganogramId = officeUnitOrganogramId;
    }

    public String getDesignation() {
        return designation;
    }

    public void setDesignation(String designation) {
        this.designation = designation;
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

    public byte getIsDefaultRole() {
        return isDefaultRole;
    }

    public void setIsDefaultRole(byte isDefaultRole) {
        this.isDefaultRole = isDefaultRole;
    }

    public byte getOfficeHead() {
        return officeHead;
    }

    public void setOfficeHead(byte officeHead) {
        this.officeHead = officeHead;
    }

    public byte getSummaryNothiPostType() {
        return summaryNothiPostType;
    }

    public void setSummaryNothiPostType(byte summaryNothiPostType) {
        this.summaryNothiPostType = summaryNothiPostType;
    }

    public String getInchargeLabel() {
        return inchargeLabel;
    }

    public void setInchargeLabel(String inchargeLabel) {
        this.inchargeLabel = inchargeLabel;
    }

    public Integer getMainRoleId() {
        return mainRoleId;
    }

    public void setMainRoleId(Integer mainRoleId) {
        this.mainRoleId = mainRoleId;
    }

    public String getJoiningDate() {
        return joiningDate;
    }

    public void setJoiningDate(String joiningDate) {
        this.joiningDate = joiningDate;
    }

    public String getLastOfficeDate() {
        return lastOfficeDate;
    }

    public void setLastOfficeDate(String lastOfficeDate) {
        this.lastOfficeDate = lastOfficeDate;
    }

    public byte getStatus() {
        return status;
    }

    public void setStatus(byte status) {
        this.status = status;
    }

    public Timestamp getStatusChangeDate() {
        return statusChangeDate;
    }

    public void setStatusChangeDate(Timestamp statusChangeDate) {
        this.statusChangeDate = statusChangeDate;
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

    public long getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(long createdBy) {
        this.createdBy = createdBy;
    }

    public long getModifiedBy() {
        return modifiedBy;
    }

    public void setModifiedBy(long modifiedBy) {
        this.modifiedBy = modifiedBy;
    }

    public OfficeDTO getOffices() {
        return offices;
    }

    public OfficeUnitsDTO getOfficeUnits() {
        return officeUnits;
    }

    private Integer mainRoleId;

    public void setOffices(OfficeDTO offices) {
        this.offices = offices;
    }

    public void setOfficeUnits(OfficeUnitsDTO officeUnits) {
        this.officeUnits = officeUnits;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        EmployeeOfficesDTO that = (EmployeeOfficesDTO) o;

        if (id != that.id) return false;
        if (employeeRecordId != that.employeeRecordId) return false;
        if (officeId != that.officeId) return false;
        if (officeUnitId != that.officeUnitId) return false;
        if (officeUnitOrganogramId != that.officeUnitOrganogramId) return false;
        if (designationLevel != that.designationLevel) return false;
        if (designationSequence != that.designationSequence) return false;
        if (isDefaultRole != that.isDefaultRole) return false;
        if (officeHead != that.officeHead) return false;
        if (summaryNothiPostType != that.summaryNothiPostType) return false;
        if (status != that.status) return false;
        if (createdBy != that.createdBy) return false;
        if (modifiedBy != that.modifiedBy) return false;
        if (identificationNumber != null ? !identificationNumber.equals(that.identificationNumber) : that.identificationNumber != null)
            return false;
        if (designation != null ? !designation.equals(that.designation) : that.designation != null) return false;
        if (inchargeLabel != null ? !inchargeLabel.equals(that.inchargeLabel) : that.inchargeLabel != null)
            return false;
        if (mainRoleId != null ? !mainRoleId.equals(that.mainRoleId) : that.mainRoleId != null) return false;
        if (joiningDate != null ? !joiningDate.equals(that.joiningDate) : that.joiningDate != null) return false;
        if (lastOfficeDate != null ? !lastOfficeDate.equals(that.lastOfficeDate) : that.lastOfficeDate != null)
            return false;
        if (statusChangeDate != null ? !statusChangeDate.equals(that.statusChangeDate) : that.statusChangeDate != null)
            return false;
        if (created != null ? !created.equals(that.created) : that.created != null) return false;
        if (modified != null ? !modified.equals(that.modified) : that.modified != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (id ^ (id >>> 32));
        result = 31 * result + (int) (employeeRecordId ^ (employeeRecordId >>> 32));
        result = 31 * result + (identificationNumber != null ? identificationNumber.hashCode() : 0);
        result = 31 * result + officeId;
        result = 31 * result + (int) (officeUnitId ^ (officeUnitId >>> 32));
        result = 31 * result + (int) (officeUnitOrganogramId ^ (officeUnitOrganogramId >>> 32));
        result = 31 * result + (designation != null ? designation.hashCode() : 0);
        result = 31 * result + designationLevel;
        result = 31 * result + designationSequence;
        result = 31 * result + (int) isDefaultRole;
        result = 31 * result + (int) officeHead;
        result = 31 * result + (int) summaryNothiPostType;
        result = 31 * result + (inchargeLabel != null ? inchargeLabel.hashCode() : 0);
        result = 31 * result + (mainRoleId != null ? mainRoleId.hashCode() : 0);
        result = 31 * result + (joiningDate != null ? joiningDate.hashCode() : 0);
        result = 31 * result + (lastOfficeDate != null ? lastOfficeDate.hashCode() : 0);
        result = 31 * result + (int) status;
        result = 31 * result + (statusChangeDate != null ? statusChangeDate.hashCode() : 0);
        result = 31 * result + (created != null ? created.hashCode() : 0);
        result = 31 * result + (modified != null ? modified.hashCode() : 0);
        result = 31 * result + (int) (createdBy ^ (createdBy >>> 32));
        result = 31 * result + (int) (modifiedBy ^ (modifiedBy >>> 32));
        return result;
    }
}
