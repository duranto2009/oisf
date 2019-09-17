package com.revesoft.springboot.web.employee;

import java.sql.Timestamp;

/**
 * Created by Bony on 11/2/2017.
 */
public class EmployeeAdditionalRolesDTO {
    private int id;
    private int officeUnitOrganogramId;
    private int mappedOfficeUnitOrganogramId;
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

    public int getOfficeUnitOrganogramId() {
        return officeUnitOrganogramId;
    }

    public void setOfficeUnitOrganogramId(int officeUnitOrganogramId) {
        this.officeUnitOrganogramId = officeUnitOrganogramId;
    }

    public int getMappedOfficeUnitOrganogramId() {
        return mappedOfficeUnitOrganogramId;
    }

    public void setMappedOfficeUnitOrganogramId(int mappedOfficeUnitOrganogramId) {
        this.mappedOfficeUnitOrganogramId = mappedOfficeUnitOrganogramId;
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



}
