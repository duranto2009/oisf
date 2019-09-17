package com.revesoft.springboot.web.appregistration;

public class ServiceDetailsDTO {
    int id;
    String nameBng;
    String nameEng;
    int status;
    int serviceOwnerId;
    String outputType;
    String Description;
    String metaDataRef;
    String dataStanRef;
    String intStanRef;
    String ownerSubSystem;
    String invokingUri;
    String requestUri;
    String exampleRequest;
    String exampleResponse;

    int serviceType;

    public int getServiceType() {
        return serviceType;
    }

    public void setServiceType(int serviceType) {
        this.serviceType = serviceType;
    }

    public String getMetaDataRef() {
        return metaDataRef;
    }

    public void setMetaDataRef(String metaDataRef) {
        this.metaDataRef = metaDataRef;
    }

    public String getDataStanRef() {
        return dataStanRef;
    }

    public void setDataStanRef(String dataStanRef) {
        this.dataStanRef = dataStanRef;
    }

    public String getIntStanRef() {
        return intStanRef;
    }

    public void setIntStanRef(String intStanRef) {
        this.intStanRef = intStanRef;
    }

    public String getOwnerSubSystem() {
        return ownerSubSystem;
    }

    public void setOwnerSubSystem(String ownerSubSystem) {
        this.ownerSubSystem = ownerSubSystem;
    }

    public String getInvokingUri() {
        return invokingUri;
    }

    public void setInvokingUri(String invokingUri) {
        this.invokingUri = invokingUri;
    }

    public String getRequestUri() {
        return requestUri;
    }

    public void setRequestUri(String requestUri) {
        this.requestUri = requestUri;
    }

    public String getExampleRequest() {
        return exampleRequest;
    }

    public void setExampleRequest(String exampleRequest) {
        this.exampleRequest = exampleRequest;
    }

    public String getExampleResponse() {
        return exampleResponse;
    }

    public void setExampleResponse(String exampleResponse) {
        this.exampleResponse = exampleResponse;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNameBng() {
        return nameBng;
    }

    public void setNameBng(String nameBng) {
        this.nameBng = nameBng;
    }

    public String getNameEng() {
        return nameEng;
    }

    public void setNameEng(String nameEng) {
        this.nameEng = nameEng;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getServiceOwnerId() {
        return serviceOwnerId;
    }

    public void setServiceOwnerId(int serviceOwnerId) {
        this.serviceOwnerId = serviceOwnerId;
    }

    public String getOutputType() {
        return outputType;
    }

    public void setOutputType(String outputType) {
        this.outputType = outputType;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String description) {
        Description = description;
    }
}
