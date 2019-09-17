package com.revesoft.springboot.web.employee.batch;

import java.sql.Timestamp;

public class EmployeeBatchDTO {
    private int id;
    private String batchNo;
    private String batchYear;
    private Integer createdBy;
    private Integer modifiedBy;
    private Timestamp created;
    private Timestamp modified;


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getBatchNo() {
        return batchNo;
    }

    public void setBatchNo(String batchNo) {
        this.batchNo = batchNo;
    }

    public String getBatchYear() {
        return batchYear;
    }

    public void setBatchYear(String batchYear) {
        this.batchYear = batchYear;
    }

    public Integer getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(Integer createdBy) {
        this.createdBy = createdBy;
    }

    public Integer getModifiedBy() {
        return modifiedBy;
    }

    public void setModifiedBy(Integer modifiedBy) {
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

        EmployeeBatchDTO that = (EmployeeBatchDTO) o;

        if (id != that.id) return false;
        if (batchNo != null ? !batchNo.equals(that.batchNo) : that.batchNo != null) return false;
        if (batchYear != null ? !batchYear.equals(that.batchYear) : that.batchYear != null) return false;
        if (createdBy != null ? !createdBy.equals(that.createdBy) : that.createdBy != null) return false;
        if (modifiedBy != null ? !modifiedBy.equals(that.modifiedBy) : that.modifiedBy != null) return false;
        if (created != null ? !created.equals(that.created) : that.created != null) return false;
        if (modified != null ? !modified.equals(that.modified) : that.modified != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (batchNo != null ? batchNo.hashCode() : 0);
        result = 31 * result + (batchYear != null ? batchYear.hashCode() : 0);
        result = 31 * result + (createdBy != null ? createdBy.hashCode() : 0);
        result = 31 * result + (modifiedBy != null ? modifiedBy.hashCode() : 0);
        result = 31 * result + (created != null ? created.hashCode() : 0);
        result = 31 * result + (modified != null ? modified.hashCode() : 0);
        return result;
    }
}
