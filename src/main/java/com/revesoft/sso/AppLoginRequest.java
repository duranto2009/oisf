package com.revesoft.sso;

import org.springframework.web.util.UriComponentsBuilder;

import java.math.BigInteger;
import java.security.SecureRandom;

public class AppLoginRequest {
    SSOPropertyReader ssoPropertyReader;

    public AppLoginRequest()throws Exception{
        ssoPropertyReader = SSOPropertyReader.getInstance();
    }

    private String generateRandomHexToken(int byteLength) {
        SecureRandom secureRandom = new SecureRandom();
        byte[] token = new byte[byteLength];
        secureRandom.nextBytes(token);
        return new BigInteger(1, token).toString(16); //hex encoding
    }

    public String getLoginPageUrl(String landingPage){
        UriComponentsBuilder urlBuilder = UriComponentsBuilder.fromUriString(ssoPropertyReader.getIdpUrl() + "/" + "authorize" + "?");
        urlBuilder.queryParam("response_type","id_token");
        urlBuilder.queryParam("response_mode","form_post");
        urlBuilder.queryParam("client_id",ssoPropertyReader.getAppId());
        urlBuilder.queryParam("scope","openid");
        urlBuilder.queryParam("redirect_uri",ssoPropertyReader.getRedirectUri());
//        urlBuilder.queryParam("landing_page_uri",ssoPropertyReader.getLandingPageUri());
        urlBuilder.queryParam("landing_page_uri",landingPage);
        urlBuilder.queryParam("state",this.generateRandomHexToken(10));
        urlBuilder.queryParam("nonce",this.generateRandomHexToken(10));
        return urlBuilder.build().encode().toUriString();
    }
    public String getLoginPageUrl(){
        UriComponentsBuilder urlBuilder = UriComponentsBuilder.fromUriString(ssoPropertyReader.getIdpUrl() + "/" + "authorize" + "?");
        urlBuilder.queryParam("response_type","id_token");
        urlBuilder.queryParam("response_mode","form_post");
        urlBuilder.queryParam("client_id",ssoPropertyReader.getAppId());
        urlBuilder.queryParam("scope","openid");
        urlBuilder.queryParam("redirect_uri",ssoPropertyReader.getRedirectUri());
        urlBuilder.queryParam("landing_page_uri",ssoPropertyReader.getLandingPageUri());

        urlBuilder.queryParam("state",this.generateRandomHexToken(10));
        urlBuilder.queryParam("nonce",this.generateRandomHexToken(10));
        return urlBuilder.build().encode().toUriString();
    }
}
