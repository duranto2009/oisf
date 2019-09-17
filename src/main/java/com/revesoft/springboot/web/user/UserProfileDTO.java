package com.revesoft.springboot.web.user;

import com.revesoft.springboot.web.employee.records.EmployeeDTO;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Bony on 10/9/2017.
 */
public class UserProfileDTO {
    private Long id;

    private String username;
    private String securityQues;
    private String securityQuesAns;
    private String securityQues2;
    private String securityQuesAns2;
    private String password;

    private String designation;
    private int designationId;

    private EmployeeDTO employeeDTO;


    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getSecurityQues2() {
        return securityQues2;
    }

    public void setSecurityQues2(String securityQues2) {
        this.securityQues2 = securityQues2;
    }

    public String getSecurityQuesAns2() {
        return securityQuesAns2;
    }

    public void setSecurityQuesAns2(String securityQuesAns2) {
        this.securityQuesAns2 = securityQuesAns2;
    }

    public int getDesignationId() {
        return designationId;
    }

    public void setDesignationId(int designationId) {
        this.designationId = designationId;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }


    public EmployeeDTO getEmployeeDTO() {
        return employeeDTO;
    }

    public void setEmployeeDTO(EmployeeDTO employeeDTO) {
        this.employeeDTO = employeeDTO;
    }

    public String getDesignation() {
        return designation;
    }

    public void setDesignation(String designation) {
        this.designation = designation;
    }

    public String getSecurityQues() {
        return securityQues;
    }

    public void setSecurityQues(String securityQues) {
        this.securityQues = securityQues;
    }

    public String getSecurityQuesAns() {
        return securityQuesAns;
    }

    public void setSecurityQuesAns(String securityQuesAns) {
        this.securityQuesAns = securityQuesAns;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }








}
