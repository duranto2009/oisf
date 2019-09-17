package com.revesoft.springboot.web.configurabledashboard;

import java.io.IOException;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author maruf
 */
@Controller
public class SSOClientController {

    @Value("${base.uri.oisf}")
    String baseUri;

    // http
    private static final String APP_PERMISSION_URL = "http://doptor.gov.bd:8090/identity/designation/%s/apps";
//    private static final String APP_PERMISSION_URL = "http://174.136.37.245:8090/identity/designation/%s/apps";

    private final OkHttpClient client = new OkHttpClient();

    @ResponseBody
    @GetMapping("/oisf/sso/user/apps")
    public String getPermittedApps(HttpServletRequest request) {

        // get the designation id from the session
//        int designationId = 137247;
        String out="";
        Long designationId = (Long) request.getSession().getAttribute("organogramId");

        try {
            out= client.newCall(new Request.Builder().url(String.format(APP_PERMISSION_URL, designationId)).build()).execute().body().string();
            return out;
        } catch (IOException ex) {
            return null;
        }
    }
}
