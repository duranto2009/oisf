package com.revesoft.springboot.web.office;

import java.sql.Timestamp;

/**
 * Created by Bony on 11/5/2017.
 */
public class OfficeDomainsDTO {
    private int id;
    private int officeId;
    private String domainUrl;
    private String domainPrefix;
    private String domainHost;
    private String officeDb;
    private String domainUsername;
    private String domainPassword;
    private byte status;
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

    public int getOfficeId() {
        return officeId;
    }

    public void setOfficeId(int officeId) {
        this.officeId = officeId;
    }

    public String getDomainUrl() {
        return domainUrl;
    }

    public void setDomainUrl(String domainUrl) {
        this.domainUrl = domainUrl;
    }

    public String getDomainPrefix() {
        return domainPrefix;
    }

    public void setDomainPrefix(String domainPrefix) {
        this.domainPrefix = domainPrefix;
    }

    public String getDomainHost() {
        return domainHost;
    }

    public void setDomainHost(String domainHost) {
        this.domainHost = domainHost;
    }

    public String getOfficeDb() {
        return officeDb;
    }

    public void setOfficeDb(String officeDb) {
        this.officeDb = officeDb;
    }

    public String getDomainUsername() {
        return domainUsername;
    }

    public void setDomainUsername(String domainUsername) {
        this.domainUsername = domainUsername;
    }

    public String getDomainPassword() {
        return domainPassword;
    }

    public void setDomainPassword(String domainPassword) {
        this.domainPassword = domainPassword;
    }

    public byte getStatus() {
        return status;
    }

    public void setStatus(byte status) {
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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        OfficeDomainsDTO that = (OfficeDomainsDTO) o;

        if (id != that.id) return false;
        if (officeId != that.officeId) return false;
        if (status != that.status) return false;
        if (createdBy != that.createdBy) return false;
        if (modifiedBy != that.modifiedBy) return false;
        if (domainUrl != null ? !domainUrl.equals(that.domainUrl) : that.domainUrl != null) return false;
        if (domainPrefix != null ? !domainPrefix.equals(that.domainPrefix) : that.domainPrefix != null) return false;
        if (domainHost != null ? !domainHost.equals(that.domainHost) : that.domainHost != null) return false;
        if (officeDb != null ? !officeDb.equals(that.officeDb) : that.officeDb != null) return false;
        if (domainUsername != null ? !domainUsername.equals(that.domainUsername) : that.domainUsername != null)
            return false;
        if (domainPassword != null ? !domainPassword.equals(that.domainPassword) : that.domainPassword != null)
            return false;
        if (created != null ? !created.equals(that.created) : that.created != null) return false;
        if (modified != null ? !modified.equals(that.modified) : that.modified != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + officeId;
        result = 31 * result + (domainUrl != null ? domainUrl.hashCode() : 0);
        result = 31 * result + (domainPrefix != null ? domainPrefix.hashCode() : 0);
        result = 31 * result + (domainHost != null ? domainHost.hashCode() : 0);
        result = 31 * result + (officeDb != null ? officeDb.hashCode() : 0);
        result = 31 * result + (domainUsername != null ? domainUsername.hashCode() : 0);
        result = 31 * result + (domainPassword != null ? domainPassword.hashCode() : 0);
        result = 31 * result + (int) status;
        result = 31 * result + createdBy;
        result = 31 * result + modifiedBy;
        result = 31 * result + (created != null ? created.hashCode() : 0);
        result = 31 * result + (modified != null ? modified.hashCode() : 0);
        return result;
    }
}
