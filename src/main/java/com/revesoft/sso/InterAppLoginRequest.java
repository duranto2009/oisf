package com.revesoft.sso;

import io.jsonwebtoken.JwtBuilder;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import org.jose4j.json.internal.json_simple.JSONObject;

public class InterAppLoginRequest {
    private final SSOToken ssoToken;
    private final SSOPropertyReader ssoPropertyReader;
    private final String fromAppName;
    private final String username;

    public InterAppLoginRequest(String username, String fromAppName)throws Exception{
        ssoToken = new SSOToken();
        ssoPropertyReader = SSOPropertyReader.getInstance();
        this.username = username;
        this.fromAppName = fromAppName;
    }

    public String getIALoginReqInfoAjax(String toAppName, String landingPageUrl) throws Exception{
        if(toAppName == null || toAppName.equals("")){
            throw new Exception(" Invalid to app name .");
        }

        if(landingPageUrl == null || landingPageUrl.equals("")){
            throw new Exception(" Invalid landing page url ");
        }

        String token = this.getToken(toAppName,landingPageUrl);
        String action = this.getPostUrl();
        String appName = ssoPropertyReader.getAppName();

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("success",true);
        jsonObject.put("action",action);
        jsonObject.put("appName",appName);
        jsonObject.put("token",token);

        return jsonObject.toJSONString();
    }

    public String getToken(String toAppName, String landingPgUrl)throws Exception{
        String sharedSecret = ssoPropertyReader.getSecret();
        String fromAppName = ssoPropertyReader.getAppName();
        SignatureAlgorithm signatureAlgorithm = SignatureAlgorithm.HS256;

        JwtBuilder jwts = null;

        jwts = Jwts.builder()
                .claim(JwtSSOClaims.FROM_APP_NAME,fromAppName)
                .claim(JwtSSOClaims.TO_APP_NAME,toAppName)
                .claim(JwtSSOClaims.LANDING_PAGE_URL,landingPgUrl)
                .claim(JwtSSOClaims.USERNAME,username)
                .claim(JwtSSOClaims.EXPIRATION_TIME,this.ssoToken.getExpiryTime())
                .signWith(signatureAlgorithm,sharedSecret.getBytes("UTF-8"));

        return jwts.compact();
    }

    public String getPostUrl()throws Exception {
        return ssoPropertyReader.getIdpUrl() + "/" + "interapplogin";
    }
}
