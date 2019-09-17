package com.revesoft.sso2;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.net.URL;
import java.util.Properties;

public class SSOPropertyReader {
    private static SSOPropertyReader ssoFileReader = null;
    private static String appName = "";
    private static String appId = "";
    private static String secret = "";
    private static String idpUrl = "";
    private static String appNameQS = "";
    private static String appLoginEndPoint = "";
    private static String iaLoginEndPoint = "";
    private static String etIntervalms = "";
    private static final String ssoPropertiesFileName = "sso.properties";

    private SSOPropertyReader() throws Exception{
        ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
        URL resource = classLoader.getResource(ssoPropertiesFileName);
        File file = new File(resource.toURI());
        FileInputStream fileInput = new FileInputStream(file);
        Properties properties = new Properties();
        properties.load(fileInput);
        fileInput.close();
        appId = properties.getProperty("appId");
        appName = properties.getProperty("appName");
        secret = properties.getProperty("sharedSecret");
        idpUrl = properties.getProperty("idpurl");
        appNameQS = properties.getProperty("appNameQS");
        appLoginEndPoint = properties.getProperty("apploginendpoint");
        iaLoginEndPoint = properties.getProperty("ialoginendpoint");
        etIntervalms = properties.getProperty("etintervalms");

        System.out.println(" app id : " + appId);
        if(appId == null || appId.equals("")){
            throw new Exception("App id is null or empty. Could not read app id from property file. Please set app id in properties file");
        }

        if(appName == null || appName.equals("")){
            throw new Exception("App name is null or empty. Could not read app name from property file. Please set ap pname in properties file.");
        }

        if(secret == null || secret.equals("")){
            throw new Exception("Shared secret is null or empty. Could not read shared secret from property file. Please set shared secret in properties file");
        }

        if(idpUrl == null || idpUrl.equals("")){
            throw new Exception("idpUrl is null or empty. Could not read idpUrl from property file. Please set idpUrl in properties file");
        }

        if(appNameQS == null || appNameQS.equals("")){
            throw new Exception("appNameQS is null or empty. Could not read appNameQS from property file. Please set appNameQS in properties file");
        }

        if(appLoginEndPoint == null || appLoginEndPoint.equals("")){
            throw new Exception("App login end point is null or empty. Could not read apploginendpoint from property file. Please set apploginendpoint in properties file");
        }

        if(iaLoginEndPoint == null || iaLoginEndPoint.equals("")){
            throw new Exception("Inter app login endpoint is null or empty. Could not read ialoginendpoint from property file. Please set up ialoginendpoint in properties file");
        }

        if(this.etIntervalms == null || etIntervalms.equals("")){
            throw new Exception("Expiry time interval is null or empty. Could not read etIntervalms from property file. Please set up etIntervalms in properties file");
        }
    }

    private synchronized static void createSSOFileReader() throws Exception{
        if (ssoFileReader == null) {
            ssoFileReader = new SSOPropertyReader();
        }
    }

    public synchronized static SSOPropertyReader getInstance() throws Exception{
        if (ssoFileReader == null) {
            createSSOFileReader();
        }

        return ssoFileReader;
    }

    public  String getAppId(){return appId;}
    public  String getAppName(){return appName;}
    public  String getSecret(){return secret;}
    public  String getIdpUrl(){return idpUrl;}
    public  String getAppNameQS(){return appNameQS;}
    public  String getAppLoginEndPoint(){return appLoginEndPoint;}
    public  String getIALoginEndPoint(){return iaLoginEndPoint;}
    public  String getEtIntervalms(){return etIntervalms;}

}
