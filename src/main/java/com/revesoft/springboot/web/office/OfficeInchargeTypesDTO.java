package com.revesoft.springboot.web.office;

/**
 * Created by Bony on 11/5/2017.
 */
public class OfficeInchargeTypesDTO {
    private int id;
    private String nameBng;
    private String nameEng;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNameBng() {
        return nameBng;
    }

    public void setNameBng(String nameBng) {
        this.nameBng = nameBng;
    }

    public String getNameEng() {
        return nameEng;
    }

    public void setNameEng(String nameEng) {
        this.nameEng = nameEng;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        OfficeInchargeTypesDTO that = (OfficeInchargeTypesDTO) o;

        if (id != that.id) return false;
        if (nameBng != null ? !nameBng.equals(that.nameBng) : that.nameBng != null) return false;
        if (nameEng != null ? !nameEng.equals(that.nameEng) : that.nameEng != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (nameBng != null ? nameBng.hashCode() : 0);
        result = 31 * result + (nameEng != null ? nameEng.hashCode() : 0);
        return result;
    }
}
