package com.revesoft.springboot.web.employee.employeeoffice;

public class EmployeeOrgDTO {
    int orgId;
    String designationName;
    int designationLevel;
    int DesignationSequence;
    String employeeName="";
    String identity_no="";
    int isEmpty;


    public int getDesignationLevel() {
        return designationLevel;
    }

    public void setDesignationLevel(int designationLevel) {
        this.designationLevel = designationLevel;
    }

    public int getDesignationSequence() {
        return DesignationSequence;
    }

    public void setDesignationSequence(int designationSequence) {
        DesignationSequence = designationSequence;
    }
    public String getIdentity_no() {
        return identity_no;
    }

    public void setIdentity_no(String identity_no) {
        this.identity_no = identity_no;
    }

    public int getOrgId() {
        return orgId;
    }

    public void setOrgId(int orgId) {
        this.orgId = orgId;
    }

    public String getDesignationName() {
        return designationName;
    }

    public void setDesignationName(String designationName) {
        this.designationName = designationName;
    }

    public String getEmployeeName() {
        return employeeName;
    }

    public void setEmployeeName(String employeeName) {
        this.employeeName = employeeName;
    }

    public int getIsEmpty() {
        return isEmpty;
    }

    public void setIsEmpty(int isEmpty) {
        this.isEmpty = isEmpty;
    }
}
