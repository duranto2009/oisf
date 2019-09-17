package com.revesoft.springboot.web.employee.cadre;

import java.sql.Timestamp;

/**
 * Created by Bony on 11/2/2017.
 */
public class EmployeeCadreDTO {
    private int id;
    private String cadreNameEng;
    private String cadreNameBng;
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

    public String getCadreNameEng() {
        return cadreNameEng;
    }

    public void setCadreNameEng(String cadreNameEng) {
        this.cadreNameEng = cadreNameEng;
    }

    public String getCadreNameBng() {
        return cadreNameBng;
    }

    public void setCadreNameBng(String cadreNameBng) {
        this.cadreNameBng = cadreNameBng;
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

        EmployeeCadreDTO that = (EmployeeCadreDTO) o;

        if (id != that.id) return false;
        if (createdBy != that.createdBy) return false;
        if (modifiedBy != that.modifiedBy) return false;
        if (cadreNameEng != null ? !cadreNameEng.equals(that.cadreNameEng) : that.cadreNameEng != null) return false;
        if (cadreNameBng != null ? !cadreNameBng.equals(that.cadreNameBng) : that.cadreNameBng != null) return false;
        if (created != null ? !created.equals(that.created) : that.created != null) return false;
        if (modified != null ? !modified.equals(that.modified) : that.modified != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (cadreNameEng != null ? cadreNameEng.hashCode() : 0);
        result = 31 * result + (cadreNameBng != null ? cadreNameBng.hashCode() : 0);
        result = 31 * result + createdBy;
        result = 31 * result + modifiedBy;
        result = 31 * result + (created != null ? created.hashCode() : 0);
        result = 31 * result + (modified != null ? modified.hashCode() : 0);
        return result;
    }
}
