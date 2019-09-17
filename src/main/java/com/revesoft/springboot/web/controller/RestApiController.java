package com.revesoft.springboot.web.controller;

import org.jose4j.json.internal.json_simple.JSONObject;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by USER on 21-Oct-17.
 */
@RestController
public class RestApiController {
    @RequestMapping("/projectinfo")
    public JSONObject getCountries(){
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("name" , "Oisf");
        jsonObject.put("member" , 5);
        jsonObject.put("type" , "Government Project");
        return jsonObject;
    }
}