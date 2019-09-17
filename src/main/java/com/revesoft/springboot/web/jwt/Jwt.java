package com.revesoft.springboot.web.jwt;

/**
 * Created by USER on 02-Oct-17.
 */
public class Jwt {
    private String _secretKey;

    public Jwt(String secretKey){
        this._secretKey = secretKey;
    }

    public void addPayload(String key, String value){

    }

    public String getJwtToken(){

        return "";
    }

    public JwtToken parseJwtToken(){
        return null;
    }


}
