package com.revesoft.springboot.web.employee;

import java.sql.Timestamp;

/**
 * Created by Bony on 11/2/2017.
 */
public class EmployeeGradesDTO {
    private int id;
    private int employeeCadreId;
    private int employeeRankId;
    private String gradeNameEng;
    private String gradeNameBng;
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

    public int getEmployeeCadreId() {
        return employeeCadreId;
    }

    public void setEmployeeCadreId(int employeeCadreId) {
        this.employeeCadreId = employeeCadreId;
    }

    public int getEmployeeRankId() {
        return employeeRankId;
    }

    public void setEmployeeRankId(int employeeRankId) {
        this.employeeRankId = employeeRankId;
    }

    public String getGradeNameEng() {
        return gradeNameEng;
    }

    public void setGradeNameEng(String gradeNameEng) {
        this.gradeNameEng = gradeNameEng;
    }

    public String getGradeNameBng() {
        return gradeNameBng;
    }

    public void setGradeNameBng(String gradeNameBng) {
        this.gradeNameBng = gradeNameBng;
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

        EmployeeGradesDTO that = (EmployeeGradesDTO) o;

        if (id != that.id) return false;
        if (employeeCadreId != that.employeeCadreId) return false;
        if (employeeRankId != that.employeeRankId) return false;
        if (createdBy != that.createdBy) return false;
        if (modifiedBy != that.modifiedBy) return false;
        if (gradeNameEng != null ? !gradeNameEng.equals(that.gradeNameEng) : that.gradeNameEng != null) return false;
        if (gradeNameBng != null ? !gradeNameBng.equals(that.gradeNameBng) : that.gradeNameBng != null) return false;
        if (created != null ? !created.equals(that.created) : that.created != null) return false;
        if (modified != null ? !modified.equals(that.modified) : that.modified != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + employeeCadreId;
        result = 31 * result + employeeRankId;
        result = 31 * result + (gradeNameEng != null ? gradeNameEng.hashCode() : 0);
        result = 31 * result + (gradeNameBng != null ? gradeNameBng.hashCode() : 0);
        result = 31 * result + createdBy;
        result = 31 * result + modifiedBy;
        result = 31 * result + (created != null ? created.hashCode() : 0);
        result = 31 * result + (modified != null ? modified.hashCode() : 0);
        return result;
    }
}
