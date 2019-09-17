package com.revesoft.springboot.web.employee.records;

import java.util.Date;

/**
 * Created by Bony on 11/2/2017.
 */
public class EmployeeDTO {
    private Integer id;

    private String nameEng;

    private String nameBng;
    private String fatherNameEng;

    private String fatherNameBng;

    private String motherNameEng;

    private String motherNameBng;

    private String dateOfBirth;

    private String placeOfBirth;

    private  String natioanality;

    private String presentAddress;
    private String permanentAddress;
    private String occupation;



    private String gender;

    private String religion;

    private String bloodGroup;

    private String maritalStatus;

    private String spouseNameEng;
    private String spouseNameBng;

    private String nid;

    private boolean nidValid;

    private String bcn;

    private String ppn;

    private String personalEmail;

    private String personalMobile;
    private String alternativeMobile;

    private short isCadre;
    private Integer employeeCadreId;
    private Integer employeeBatchId;

    private String identityNo;

    private String appointmentMemoNo;
    private String joiningDate;

    private String educationalQualifications;
    private Integer serviceRankId;
    private Integer serviceGradeId;
    private Integer serviceMinistryId;
    private Integer serviceOfficeId;

    private Integer currentOfficeMinistryId;

    private Integer currentOfficeLayerId;

    private Integer currentOfficeId;

    private Integer currentOfficeUnitId;

    private Date currentOfficeJoiningDate;

    private Integer currentOfficeDesignationId;

    private String currentOfficeAddress;

    private String eSign;

    private String dSign;

    private String imageFileName;

    private boolean status;

    private int createdBy;

    private int modifiedBy;

    private Date created;

    private Date modified;

    private int tableDataCount;

    private String designation;
    private String section;

    public String getDesignation() {
        return designation;
    }

    public void setDesignation(String designation) {
        this.designation = designation;
    }

    public String getSection() {
        return section;
    }

    public void setSection(String section) {
        this.section = section;
    }

    public String getEducationalQualifications() {
        return educationalQualifications;
    }

    public void setEducationalQualifications(String educationalQualifications) {
        this.educationalQualifications = educationalQualifications;
    }

    public String getPlaceOfBirth() {
        return placeOfBirth;
    }

    public void setPlaceOfBirth(String placeOfBirth) {
        this.placeOfBirth = placeOfBirth;
    }

    public String getNatioanality() {
        return natioanality;
    }

    public void setNatioanality(String natioanality) {
        this.natioanality = natioanality;
    }

    public String getPresentAddress() {
        return presentAddress;
    }

    public void setPresentAddress(String presentAddress) {
        this.presentAddress = presentAddress;
    }

    public String getPermanentAddress() {
        return permanentAddress;
    }

    public void setPermanentAddress(String permanentAddress) {
        this.permanentAddress = permanentAddress;
    }

    public String getOccupation() {
        return occupation;
    }

    public String getSpouseNameEng() {
        return spouseNameEng;
    }

    public void setSpouseNameEng(String spouseNameEng) {
        this.spouseNameEng = spouseNameEng;
    }

    public String getSpouseNameBng() {
        return spouseNameBng;
    }

    public void setSpouseNameBng(String spouseNameBng) {
        this.spouseNameBng = spouseNameBng;
    }

    public void setOccupation(String occupation) {
        this.occupation = occupation;
    }

    public boolean isNidValid() {
        return nidValid;
    }

    public String geteSign() {
        return eSign;
    }

    public void seteSign(String eSign) {
        this.eSign = eSign;
    }

    public String getdSign() {
        return dSign;
    }

    public void setdSign(String dSign) {
        this.dSign = dSign;
    }

    public boolean isStatus() {
        return status;
    }

    public int getTableDataCount() {
        return tableDataCount;
    }

    public void setTableDataCount(int tableDataCount) {
        this.tableDataCount = tableDataCount;
    }

    public EmployeeDTO() {
    }

    public EmployeeDTO(Integer id) {
        this.id = id;
    }

    public EmployeeDTO(Integer id, String nameEng, String nameBng, String dateOfBirth,
                       String nid, boolean nidValid, String personalMobile,
                       short isCadre, boolean status, int createdBy, int modifiedBy,
                       Date created, Date modified) {
        this.id = id;
        this.nameEng = nameEng;
        this.nameBng = nameBng;
        this.dateOfBirth = dateOfBirth;
        this.nid = nid;
        this.nidValid = nidValid;
        this.personalMobile = personalMobile;
        this.isCadre = isCadre;
        this.status = status;
        this.createdBy = createdBy;
        this.modifiedBy = modifiedBy;
        this.created = created;
        this.modified = modified;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
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

    public String getFatherNameEng() {
        return fatherNameEng;
    }

    public void setFatherNameEng(String fatherNameEng) {
        this.fatherNameEng = fatherNameEng;
    }

    public String getFatherNameBng() {
        return fatherNameBng;
    }

    public void setFatherNameBng(String fatherNameBng) {
        this.fatherNameBng = fatherNameBng;
    }

    public String getMotherNameEng() {
        return motherNameEng;
    }

    public void setMotherNameEng(String motherNameEng) {
        this.motherNameEng = motherNameEng;
    }

    public String getMotherNameBng() {
        return motherNameBng;
    }

    public void setMotherNameBng(String motherNameBng) {
        this.motherNameBng = motherNameBng;
    }

    public String getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(String dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getNid() {
        return nid;
    }

    public void setNid(String nid) {
        this.nid = nid;
    }

    public boolean getNidValid() {
        return nidValid;
    }

    public void setNidValid(boolean nidValid) {
        this.nidValid = nidValid;
    }

    public String getBcn() {
        return bcn;
    }

    public void setBcn(String bcn) {
        this.bcn = bcn;
    }

    public String getPpn() {
        return ppn;
    }

    public void setPpn(String ppn) {
        this.ppn = ppn;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getReligion() {
        return religion;
    }

    public void setReligion(String religion) {
        this.religion = religion;
    }

    public String getBloodGroup() {
        return bloodGroup;
    }

    public void setBloodGroup(String bloodGroup) {
        this.bloodGroup = bloodGroup;
    }

    public String getMaritalStatus() {
        return maritalStatus;
    }

    public void setMaritalStatus(String maritalStatus) {
        this.maritalStatus = maritalStatus;
    }

    public String getPersonalEmail() {
        return personalEmail;
    }

    public void setPersonalEmail(String personalEmail) {
        this.personalEmail = personalEmail;
    }

    public String getPersonalMobile() {
        return personalMobile;
    }

    public void setPersonalMobile(String personalMobile) {
        this.personalMobile = personalMobile;
    }

    public String getAlternativeMobile() {
        return alternativeMobile;
    }

    public void setAlternativeMobile(String alternativeMobile) {
        this.alternativeMobile = alternativeMobile;
    }

    public short getIsCadre() {
        return isCadre;
    }

    public void setIsCadre(short isCadre) {
        this.isCadre = isCadre;
    }

    public Integer getEmployeeCadreId() {
        return employeeCadreId;
    }

    public void setEmployeeCadreId(Integer employeeCadreId) {
        this.employeeCadreId = employeeCadreId;
    }

    public Integer getEmployeeBatchId() {
        return employeeBatchId;
    }

    public void setEmployeeBatchId(Integer employeeBatchId) {
        this.employeeBatchId = employeeBatchId;
    }

    public String getIdentityNo() {
        return identityNo;
    }

    public void setIdentityNo(String identityNo) {
        this.identityNo = identityNo;
    }

    public String getAppointmentMemoNo() {
        return appointmentMemoNo;
    }

    public void setAppointmentMemoNo(String appointmentMemoNo) {
        this.appointmentMemoNo = appointmentMemoNo;
    }

    public String getJoiningDate() {
        return joiningDate;
    }

    public void setJoiningDate(String joiningDate) {
        this.joiningDate = joiningDate;
    }

    public Integer getServiceRankId() {
        return serviceRankId;
    }

    public void setServiceRankId(Integer serviceRankId) {
        this.serviceRankId = serviceRankId;
    }

    public Integer getServiceGradeId() {
        return serviceGradeId;
    }

    public void setServiceGradeId(Integer serviceGradeId) {
        this.serviceGradeId = serviceGradeId;
    }

    public Integer getServiceMinistryId() {
        return serviceMinistryId;
    }

    public void setServiceMinistryId(Integer serviceMinistryId) {
        this.serviceMinistryId = serviceMinistryId;
    }

    public Integer getServiceOfficeId() {
        return serviceOfficeId;
    }

    public void setServiceOfficeId(Integer serviceOfficeId) {
        this.serviceOfficeId = serviceOfficeId;
    }

    public Integer getCurrentOfficeMinistryId() {
        return currentOfficeMinistryId;
    }

    public void setCurrentOfficeMinistryId(Integer currentOfficeMinistryId) {
        this.currentOfficeMinistryId = currentOfficeMinistryId;
    }

    public Integer getCurrentOfficeLayerId() {
        return currentOfficeLayerId;
    }

    public void setCurrentOfficeLayerId(Integer currentOfficeLayerId) {
        this.currentOfficeLayerId = currentOfficeLayerId;
    }

    public Integer getCurrentOfficeId() {
        return currentOfficeId;
    }

    public void setCurrentOfficeId(Integer currentOfficeId) {
        this.currentOfficeId = currentOfficeId;
    }

    public Integer getCurrentOfficeUnitId() {
        return currentOfficeUnitId;
    }

    public void setCurrentOfficeUnitId(Integer currentOfficeUnitId) {
        this.currentOfficeUnitId = currentOfficeUnitId;
    }

    public Date getCurrentOfficeJoiningDate() {
        return currentOfficeJoiningDate;
    }

    public void setCurrentOfficeJoiningDate(Date currentOfficeJoiningDate) {
        this.currentOfficeJoiningDate = currentOfficeJoiningDate;
    }

    public Integer getCurrentOfficeDesignationId() {
        return currentOfficeDesignationId;
    }

    public void setCurrentOfficeDesignationId(Integer currentOfficeDesignationId) {
        this.currentOfficeDesignationId = currentOfficeDesignationId;
    }

    public String getCurrentOfficeAddress() {
        return currentOfficeAddress;
    }

    public void setCurrentOfficeAddress(String currentOfficeAddress) {
        this.currentOfficeAddress = currentOfficeAddress;
    }

    public String getESign() {
        return eSign;
    }

    public void setESign(String eSign) {
        this.eSign = eSign;
    }

    public String getDSign() {
        return dSign;
    }

    public void setDSign(String dSign) {
        this.dSign = dSign;
    }

    public String getImageFileName() {
        return imageFileName;
    }

    public void setImageFileName(String imageFileName) {
        this.imageFileName = imageFileName;
    }

    public boolean getStatus() {
        return status;
    }

    public void setStatus(boolean status) {
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

}
