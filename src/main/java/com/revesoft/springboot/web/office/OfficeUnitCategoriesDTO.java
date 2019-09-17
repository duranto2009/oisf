package com.revesoft.springboot.web.office;

import java.sql.Timestamp;

/**
 * Created by Bony on 11/5/2017.
 */
public class OfficeUnitCategoriesDTO {
    private int id;
    private String categoryNameBng;
    private String categoryNameEng;
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

    public String getCategoryNameBng() {
        return categoryNameBng;
    }

    public void setCategoryNameBng(String categoryNameBng) {
        this.categoryNameBng = categoryNameBng;
    }

    public String getCategoryNameEng() {
        return categoryNameEng;
    }

    public void setCategoryNameEng(String categoryNameEng) {
        this.categoryNameEng = categoryNameEng;
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

        OfficeUnitCategoriesDTO that = (OfficeUnitCategoriesDTO) o;

        if (id != that.id) return false;
        if (createdBy != that.createdBy) return false;
        if (modifiedBy != that.modifiedBy) return false;
        if (categoryNameBng != null ? !categoryNameBng.equals(that.categoryNameBng) : that.categoryNameBng != null)
            return false;
        if (categoryNameEng != null ? !categoryNameEng.equals(that.categoryNameEng) : that.categoryNameEng != null)
            return false;
        if (created != null ? !created.equals(that.created) : that.created != null) return false;
        if (modified != null ? !modified.equals(that.modified) : that.modified != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (categoryNameBng != null ? categoryNameBng.hashCode() : 0);
        result = 31 * result + (categoryNameEng != null ? categoryNameEng.hashCode() : 0);
        result = 31 * result + createdBy;
        result = 31 * result + modifiedBy;
        result = 31 * result + (created != null ? created.hashCode() : 0);
        result = 31 * result + (modified != null ? modified.hashCode() : 0);
        return result;
    }
}
