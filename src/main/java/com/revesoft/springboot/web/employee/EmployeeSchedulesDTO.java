package com.revesoft.springboot.web.employee;

import java.sql.Date;
import java.sql.Timestamp;

/**
 * Created by Bony on 11/2/2017.
 */
public class EmployeeSchedulesDTO {
    private int id;
    private int employeeRecordId;
    private String scheduleType;
    private String messageEng;
    private String messageBng;
    private int referenceId;
    private byte hasAlarm;
    private Timestamp alarmAt;
    private Timestamp snoozeAt;
    private byte status;
    private int createdBy;
    private int modifiedBy;
    private Date created;
    private Date modified;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getEmployeeRecordId() {
        return employeeRecordId;
    }

    public void setEmployeeRecordId(int employeeRecordId) {
        this.employeeRecordId = employeeRecordId;
    }

    public String getScheduleType() {
        return scheduleType;
    }

    public void setScheduleType(String scheduleType) {
        this.scheduleType = scheduleType;
    }

    public String getMessageEng() {
        return messageEng;
    }

    public void setMessageEng(String messageEng) {
        this.messageEng = messageEng;
    }

    public String getMessageBng() {
        return messageBng;
    }

    public void setMessageBng(String messageBng) {
        this.messageBng = messageBng;
    }

    public int getReferenceId() {
        return referenceId;
    }

    public void setReferenceId(int referenceId) {
        this.referenceId = referenceId;
    }

    public byte getHasAlarm() {
        return hasAlarm;
    }

    public void setHasAlarm(byte hasAlarm) {
        this.hasAlarm = hasAlarm;
    }

    public Timestamp getAlarmAt() {
        return alarmAt;
    }

    public void setAlarmAt(Timestamp alarmAt) {
        this.alarmAt = alarmAt;
    }

    public Timestamp getSnoozeAt() {
        return snoozeAt;
    }

    public void setSnoozeAt(Timestamp snoozeAt) {
        this.snoozeAt = snoozeAt;
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

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public Date getModified() {
        return modified;
    }

    public void setModified(Date modified) {
        this.modified = modified;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        EmployeeSchedulesDTO that = (EmployeeSchedulesDTO) o;

        if (id != that.id) return false;
        if (employeeRecordId != that.employeeRecordId) return false;
        if (referenceId != that.referenceId) return false;
        if (hasAlarm != that.hasAlarm) return false;
        if (status != that.status) return false;
        if (createdBy != that.createdBy) return false;
        if (modifiedBy != that.modifiedBy) return false;
        if (scheduleType != null ? !scheduleType.equals(that.scheduleType) : that.scheduleType != null) return false;
        if (messageEng != null ? !messageEng.equals(that.messageEng) : that.messageEng != null) return false;
        if (messageBng != null ? !messageBng.equals(that.messageBng) : that.messageBng != null) return false;
        if (alarmAt != null ? !alarmAt.equals(that.alarmAt) : that.alarmAt != null) return false;
        if (snoozeAt != null ? !snoozeAt.equals(that.snoozeAt) : that.snoozeAt != null) return false;
        if (created != null ? !created.equals(that.created) : that.created != null) return false;
        if (modified != null ? !modified.equals(that.modified) : that.modified != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + employeeRecordId;
        result = 31 * result + (scheduleType != null ? scheduleType.hashCode() : 0);
        result = 31 * result + (messageEng != null ? messageEng.hashCode() : 0);
        result = 31 * result + (messageBng != null ? messageBng.hashCode() : 0);
        result = 31 * result + referenceId;
        result = 31 * result + (int) hasAlarm;
        result = 31 * result + (alarmAt != null ? alarmAt.hashCode() : 0);
        result = 31 * result + (snoozeAt != null ? snoozeAt.hashCode() : 0);
        result = 31 * result + (int) status;
        result = 31 * result + createdBy;
        result = 31 * result + modifiedBy;
        result = 31 * result + (created != null ? created.hashCode() : 0);
        result = 31 * result + (modified != null ? modified.hashCode() : 0);
        return result;
    }
}
