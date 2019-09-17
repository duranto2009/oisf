package com.revesoft.springboot.web.menumanagement;

import org.springframework.stereotype.Component;

/**
 * Created by Bony on 11/30/2017.
 */
@Component
public class MenuDTO {

    int id =-1;
    String nameEng = "";
    String nameBng = "";
    String url = "#";
    int parentId = -1;
    int menuType = -1;
    int status = -1;

//    @Override
//    public String toString() {
//        final StringBuffer sb = new StringBuffer("MenuDTO{");
//        sb.append("\n                id=").append(id);
//        sb.append(",\n                 nameEng='").append(nameEng).append('\'');
//        sb.append(",\n                 nameBng='").append(nameBng).append('\'');
//        sb.append(",\n                 url='").append(url).append('\'');
//        sb.append(",\n                 parentId=").append(parentId);
//        sb.append(",\n                 menuType=").append(menuType);
//        sb.append(",\n                 status=").append(status);
//        sb.append(",\n                 createdBy=").append(createdBy);
//        sb.append(",\n                 modifiedBy=").append(modifiedBy);
//        sb.append(",\n                 modified='").append(modified).append('\'');
//        sb.append(",\n                 created='").append(created).append('\'');
//        sb.append(",\n                 iconUrl='").append(iconUrl).append('\'');
//        sb.append(",\n                 isAssigned=").append(isAssigned);
//        sb.append("\n}");
//        return sb.toString();
//    }

    int createdBy = -1;
    int modifiedBy = -1;
    String modified = "";
    String created = "";
    String iconUrl="";

    int isAssigned=0;

    public int getIsAssigned() {
        return isAssigned;
    }

    public void setIsAssigned(int isAssigned) {
        this.isAssigned = isAssigned;
    }

    public String getIconUrl() {
        return iconUrl;
    }

    public void setIconUrl(String iconUrl) {
        this.iconUrl = iconUrl;
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
