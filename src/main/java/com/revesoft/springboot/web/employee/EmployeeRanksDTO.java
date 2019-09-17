package com.revesoft.springboot.web.employee;

import java.sql.Timestamp;

/**
 * Created by Bony on 11/2/2017.
 */
public class EmployeeRanksDTO {
    private int id;
    private int officeMinistryId;
    private String rankNameEng;
    private String rankNameBng;
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

    public String getRankNameEng() {
        return rankNameEng;
    }

    public void setRankNameEng(String rankNameEng) {
        this.rankNameEng = rankNameEng;
    }

    public String getRankNameBng() {
        return rankNameBng;
    }

    public void setRankNameBng(String rankNameBng) {
        this.rankNameBng = rankNameBng;
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

        EmployeeRanksDTO that = (EmployeeRanksDTO) o;

        if (id != that.id) return false;
        if (officeMinistryId != that.officeMinistryId) return false;
        if (createdBy != that.createdBy) return false;
        if (modifiedBy != that.modifiedBy) return false;
        if (rankNameEng != null ? !rankNameEng.equals(that.rankNameEng) : that.rankNameEng != null) return false;
        if (rankNameBng != null ? !rankNameBng.equals(that.rankNameBng) : that.rankNameBng != null) return false;
        if (created != null ? !created.equals(that.created) : that.created != null) return false;
        if (modified != null ? !modified.equals(that.modified) : that.modified != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + officeMinistryId;
        result = 31 * result + (rankNameEng != null ? rankNameEng.hashCode() : 0);
        result = 31 * result + (rankNameBng != null ? rankNameBng.hashCode() : 0);
        result = 31 * result + createdBy;
        result = 31 * result + modifiedBy;
        result = 31 * result + (created != null ? created.hashCode() : 0);
        result = 31 * result + (modified != null ? modified.hashCode() : 0);
        return result;
    }
}
