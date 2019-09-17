package com.revesoft.springboot.web.model;

import org.jose4j.json.internal.json_simple.JSONObject;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * Created by reve on 11/15/2017.
 */
public class DataRedirection {
    public RedirectAttributes add(RedirectAttributes rattrs, JSONObject jsData,JSONObject jsId){
        rattrs.addAttribute("data",jsData);
        rattrs.addAttribute("id",jsId);
        return rattrs;
    }

}
