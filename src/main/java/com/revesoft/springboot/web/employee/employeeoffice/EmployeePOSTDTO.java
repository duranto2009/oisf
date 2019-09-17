package com.revesoft.springboot.web.employee.employeeoffice;

import java.util.ArrayList;

public class EmployeePOSTDTO {
    int unitId;
    String UnitName;
    ArrayList<EmployeeOrgDTO> employeeOrgDTO;

    public int getUnitId() {
        return unitId;
    }

    public void setUnitId(int unitId) {
        this.unitId = unitId;
    }

    public String getUnitName() {
        return UnitName;
    }

    public void setUnitName(String unitName) {
        UnitName = unitName;
    }

    public ArrayList<EmployeeOrgDTO> getEmployeeOrgDTO() {
        return employeeOrgDTO;
    }

    public void setEmployeeOrgDTO(ArrayList<EmployeeOrgDTO> employeeOrgDTO) {
        this.employeeOrgDTO = employeeOrgDTO;
    }
}
