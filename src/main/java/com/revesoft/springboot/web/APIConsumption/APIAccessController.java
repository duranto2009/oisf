package com.revesoft.springboot.web.APIConsumption;

import org.jose4j.json.internal.json_simple.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import java.net.HttpURLConnection;

@RestController
@RequestMapping("/api")
public class APIAccessController {
    @Value("${nothi.api.username}")
    private String nothiApiUsername;
    @Value("${nothi.api.password}")
    private String nothiApiPassword;

    public ResponseEntity<?> callAPI(String Url,  MultiValueMap<String, String> map){

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
        HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<MultiValueMap<String, String>>(map, headers);

        RestTemplate restTemplate=new RestTemplate();
        ResponseEntity<?> response=restTemplate.postForEntity(Url,request,JSONObject.class);

        System.out.println("API Called in Nothi : "+Url);
        System.out.println("Response from Nothi : "+response.getBody().toString());

        return response;

    }

    public String getToken( String username , String password){


        MultiValueMap<String, String> map= new LinkedMultiValueMap<String, String>();
        map.add("username", username);
        map.add("password", password);
        ResponseEntity<?> response=callAPI(UrlConfigurationAPI.getNothiTokenAPI(),map) ;
        JSONObject jsonObject=(JSONObject)response.getBody();
        System.out.println(response.toString());
        String status=(String)jsonObject.get("status") ;
         String token;
        if(status.equals("success")){
             token= (String) jsonObject.get("token");
        }else{
            token="";
        }

        return token;
    }

    public boolean changePassward( String username , String currentPassword,String newPassword){


        String token=getToken(nothiApiUsername,nothiApiPassword);
        boolean success;
        if(token!="") {

            MultiValueMap<String, String> map = new LinkedMultiValueMap<String, String>();
            map.add("username", username);
            map.add("current_password", currentPassword);
            map.add("new_password", newPassword);
            map.add("token", token);
            ResponseEntity<?> response = callAPI(UrlConfigurationAPI.getNothiPassChangeAPI(), map);
            JSONObject jsonObject = (JSONObject) response.getBody();
            String status = (String) jsonObject.get("status");

            if (status.equals("success")) {
                success = true;
            } else {
                success = false;
            }
        }else{
            success=false;
        }

        return success;
    }

    public boolean resetPassward( String username , String email,String newPassword){


        String token=getToken(nothiApiUsername,nothiApiPassword);
        boolean success;
        if(token!="") {


            MultiValueMap<String, String> map = new LinkedMultiValueMap<String, String>();
            map.add("username", username);
            map.add("email", email);
            map.add("new_password", newPassword);
            map.add("token", token);
            ResponseEntity<?> response = callAPI(UrlConfigurationAPI.getNothiPassResetAPI(), map);
            JSONObject jsonObject = (JSONObject) response.getBody();
            String status = (String) jsonObject.get("status");

            if (status.equals("success")) {
                success = true;
            } else {
                success = false;
            }
        }else{
            success=false;
        }

        return success;
    }


    @RequestMapping(value = "/test",method = RequestMethod.GET)
    public String getResponse(){

        getToken("oisf","team-oisf-a2i");
        resetPassward("200000000003","raziul.hasan57@gmail.com","abc123");
        return "ok";

    }
}
