package com.revesoft.springboot.web.login;

/**
 * Created by Bony on 10/29/2017.
 */
public class LoginDTOByBony {

    private int id;
    private String username;
    private int userRole;
    private int employeeeRecordId;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getUserRole() {
        return userRole;
    }

    public void setUserRole(int userRole) {
        this.userRole = userRole;
    }

    public int getEmployeeeRecordId() {
        return employeeeRecordId;
    }

    public void setEmployeeeRecordId(int employeeeRecordId) {
        this.employeeeRecordId = employeeeRecordId;
    }
}
