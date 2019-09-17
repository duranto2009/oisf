package com.revesoft.sso2;

public class AppLoginRequest {
    SSOPropertyReader ssoPropertyReader;

    public AppLoginRequest()throws Exception{
        ssoPropertyReader = SSOPropertyReader.getInstance();
    }

    public String getLoginPageUrl(){
        return ssoPropertyReader.getIdpUrl() + "/" + ssoPropertyReader.getAppLoginEndPoint() +
                "?" + ssoPropertyReader.getAppNameQS() + "=" + ssoPropertyReader.getAppName();

    }

}
