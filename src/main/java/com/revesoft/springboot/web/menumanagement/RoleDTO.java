package com.revesoft.springboot.web.menumanagement;

import org.springframework.stereotype.Component;

/**
 * Created by Bony on 11/30/2017.
 */
@Component
public class RoleDTO {

    int id;
    int menuId;
    int deSignationId;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getMenuId() {
        return menuId;
    }

    public void setMenuId(int menuId) {
        this.menuId = menuId;
    }

    public int getDeSignationId() {
        return deSignationId;
    }

    public void setDeSignationId(int deSignationId) {
        this.deSignationId = deSignationId;
    }
}
