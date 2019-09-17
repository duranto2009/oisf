package com.revesoft.springboot.web.employee;

import java.sql.Timestamp;

/**
 * Created by Bony on 11/2/2017.
 */
public class EmployeeOfficeDomainsDTO {
    private int id;
    private int officeId;
    private int officeDomainsId;
    private long employeeRecordId;
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

    public int getOfficeId() {
        return officeId;
    }

    public void setOfficeId(int officeId) {
        this.officeId = officeId;
    }

    public int getOfficeDomainsId() {
        return officeDomainsId;
    }

    public void setOfficeDomainsId(int officeDomainsId) {
        this.officeDomainsId = officeDomainsId;
    }

    public long getEmployeeRecordId() {
        return employeeRecordId;
    }

    public void setEmployeeRecordId(long employeeRecordId) {
        this.employeeRecordId = employeeRecordId;
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

        EmployeeOfficeDomainsDTO that = (EmployeeOfficeDomainsDTO) o;

        if (id != that.id) return false;
        if (officeId != that.officeId) return false;
        if (officeDomainsId != that.officeDomainsId) return false;
        if (employeeRecordId != that.employeeRecordId) return false;
        if (status != that.status) return false;
        if (createdBy != that.createdBy) return false;
        if (modifiedBy != that.modifiedBy) return false;
        if (created != null ? !created.equals(that.created) : that.created != null) return false;
        if (modified != null ? !modified.equals(that.modified) : that.modified != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + officeId;
        result = 31 * result + officeDomainsId;
        result = 31 * result + (int) (employeeRecordId ^ (employeeRecordId >>> 32));
        result = 31 * result + (int) status;
        result = 31 * result + createdBy;
        result = 31 * result + modifiedBy;
        result = 31 * result + (created != null ? created.hashCode() : 0);
        result = 31 * result + (modified != null ? modified.hashCode() : 0);
        return result;
    }
}
