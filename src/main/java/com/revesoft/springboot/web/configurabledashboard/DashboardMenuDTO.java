package com.revesoft.springboot.web.configurabledashboard;

import com.revesoft.springboot.web.menumanagement.MenuDTO;

import java.util.List;

public class DashboardMenuDTO {
    int id =-1;
    String nameEng = "";
    String nameBng = "";
    String url = "";
    int parentId = -1;
    int menuType = -1;
    int status = -1;
    int createdBy = -1;
    int modifiedBy = -1;
    String modified = "";
    String created = "";
    String logoUrl="#";
    int rowId=-1;
    int columnId=-1;
    String default_page="";

    public String getDefaultPage(){ return default_page; }

    public void setDefaultPage(String defaultPage){this.default_page=defaultPage;}


    public int getRowId() {
        return rowId;
    }

    public void setRowId(int rowId) {
        this.rowId = rowId;
    }

    public int getColumnId() {
        return columnId;
    }

    public void setColumnId(int columnId) {
        this.columnId = columnId;
    }

    List<DashboardMenuDTO>child;

    public List<DashboardMenuDTO> getChild() {
        return child;
    }

    public String getLogoUrl() {
        return logoUrl;
    }

    public void setLogoUrl(String logoUrl) {
        this.logoUrl = logoUrl;
    }

    public void setChild(List<DashboardMenuDTO> child) {
        this.child = child;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNameEng() {
        return nameEng;
    }

    public void setNameEng(String nameEng) {
        this.nameEng = nameEng;
    }

    public String getNameBng() {
        return nameBng;
    }

    public void setNameBng(String nameBng) {
        this.nameBng = nameBng;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public int getParentId() {
        return parentId;
    }

    public void setParentId(int parentId) {
        this.parentId = parentId;
    }

    public int getMenuType() {
        return menuType;
    }

    public void setMenuType(int menuType) {
        this.menuType = menuType;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
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

    public String getModified() {
        return modified;
    }

    public void setModified(String modified) {
        this.modified = modified;
    }

    public String getCreated() {
        return created;
    }

    public void setCreated(String created) {
        this.created = created;
    }
}
