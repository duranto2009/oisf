package com.revesoft.springboot.web.APIConsumption;

public class UrlConfigurationAPI {

    private static int isLive=1;

    private static final String nothiTestTokenAPI="http://nothi.tappware.com/apiAccess";
    private static final String nothiLiveTokenAPI="http://nothi.gov.bd/apiAccess";
    private static final String nothiTestPassChangeAPI="http://nothi.tappware.com/api-change-user-password";
    private static final String nothiLivePassChangeAPI="http://nothi.gov.bd/api-change-user-password";
    private static final String nothiTestPassResetAPI="http://nothi.tappware.com/api-reset-user-password";
    private static final String nothiLivePassResetAPI="http://nothi.gov.bd/api-reset-user-password";


    public static String getNothiTokenAPI() {
        if(isLive==1){
            return nothiLiveTokenAPI;
        }
        else {
            return nothiTestTokenAPI;
        }
    }


    public static String getNothiPassChangeAPI() {
        if(isLive==1){
            return nothiLivePassChangeAPI;
        }
        else {
            return nothiTestPassChangeAPI;
        }
    }




    public static String getNothiPassResetAPI() {
        if(isLive==1){
            return nothiLivePassResetAPI;
        }
        else {
            return nothiTestPassResetAPI;
        }
    }
}
