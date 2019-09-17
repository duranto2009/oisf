package com.revesoft.springboot.web.appregistration;

/**
 * Created by Bony on 9/12/2017.
 */
public class ApplicationDTO {

    private long id;
    private String name;
    private String nameBng;
    private String link;
    private String redirect;
    private String defaultPageURL;
    private String logoutURL;



    private int status;
    private int is_framework;
    private String allowedIP;
    private String appDomainEmail;
    private String mobileNo;
    private String applicationSecret;
    private String createDate;
    private String upadateDate;
    private long createdBy;
    private long updatedBy;
    private String notificationFlag;
    private int dashShareFlag;
    private int frameworkID;
    private long rejected_by;
    private String logoUrl;
    private int isCurrent;

    public int getIsCurrent() {
        return isCurrent;
    }

    public void setIsCurrent(int isCurrent) {
        this.isCurrent = isCurrent;
    }

    public String getDefaultPageURL() {
        return defaultPageURL;
    }

    public void setDefaultPageURL(String defaultPageURL) {
        this.defaultPageURL = defaultPageURL;
    }

    public String getLogoutURL() {
        return logoutURL;
    }

    public void setLogoutURL(String logoutURL) {
        this.logoutURL = logoutURL;
    }

    public String getLogoUrl() {
        return logoUrl;
    }

    public void setLogoUrl(String logoUrl) {
        this.logoUrl = logoUrl;
    }

    public static enum Field {
        SECRET("application_secret"),
        REDIRECT_URL("redirect_url");
        public final String string;

        private Field(String name) {
            this.string = name;
        }
    }

    public long getRejected_by() {
        return rejected_by;
    }

    public void setRejected_by(long rejected_by) {
        this.rejected_by = rejected_by;
    }

    public ApplicationDTO() {
    }

    public String getNameBng() {
        return nameBng;
    }

    public void setNameBng(String nameBng) {
        this.nameBng = nameBng;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMobileNo() {
        return mobileNo;
    }

    public void setMobileNo(String mobileNo) {
        this.mobileNo = mobileNo;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public String getRedirect() {
        return redirect;
    }

    public void setRedirect(String redirect) {
        this.redirect = redirect;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getAllowedIP() {
        return allowedIP;
    }

    public void setAllowedIP(String allowedIP) {
        this.allowedIP = allowedIP;
    }

    public String getAppDomainEmail() {
        return appDomainEmail;
    }

    public void setAppDomainEmail(String appDomainEmail) {
        this.appDomainEmail = appDomainEmail;
    }

    public String getNotificationFlag() {
        return notificationFlag;
    }

    public void setNotificationFlag(String notificationFlag) {
        this.notificationFlag = notificationFlag;
    }

    public int getDashShareFlag() {
        return dashShareFlag;
    }

    public void setDashShareFlag(int dashShareFlag) {
        this.dashShareFlag = dashShareFlag;
    }

    public int getFrameworkID() {
        return frameworkID;
    }

    public void setFrameworkID(int frameworkID) {
        this.frameworkID = frameworkID;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public int getIs_framework() {
        return is_framework;
    }

    public void setIs_framework(int is_framework) {
        this.is_framework = is_framework;
    }

    public String getApplicationSecret() {
        return applicationSecret;
    }

    public void setApplicationSecret(String applicationSecret) {
        this.applicationSecret = applicationSecret;
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    public String getUpadateDate() {
        return upadateDate;
    }

    public void setUpadateDate(String upadateDate) {
        upadateDate = upadateDate;
    }

    public long getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(long createdBy) {
        this.createdBy = createdBy;
    }

    public long getUpdatedBy() {
        return updatedBy;
    }

    public void setUpdatedBy(long updatedBy) {
        this.updatedBy = updatedBy;
    }
}
