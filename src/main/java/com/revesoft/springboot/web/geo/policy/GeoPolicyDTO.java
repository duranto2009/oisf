package com.revesoft.springboot.web.geo.policy;

/**
 * Created by Bony on 11/21/2017.
 */
public class GeoPolicyDTO {

    int id;
    String typeNameEng;
    String typeNameBng;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String  getTypeNameEng() {
        return typeNameEng;
    }

    public void setTypeNameEng(String  typeNameEng) {
        this.typeNameEng = typeNameEng;
    }

    public String  getTypeNameBng() {
        return typeNameBng;
    }

    public void setTypeNameBng(String  typeNameBng) {
        this.typeNameBng = typeNameBng;
    }
}
