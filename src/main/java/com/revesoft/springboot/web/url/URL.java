package com.revesoft.springboot.web.url;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by USER on 12-Dec-17.
 */
public class URL {
    private HttpServletRequest request;
    private String host;
    private String protocol;
    private int port;

    public URL(HttpServletRequest request)throws Exception{
        this.request = request;

        init();
    }

    private void init()throws Exception{
        java.net.URL url = new java.net.URL(request.getRequestURL().toString());
        this.host = url.getHost();
        this.protocol = url.getProtocol();
        this.port = url.getPort();
    }


    public String getUrl(String urlForPath)throws Exception{
        return protocol + "://" + host + ":" + port + "/" + urlForPath;
    }

    public int getPort(){
        return this.port;
    }

    public String getHost(){
        return this.host;
    }

    public String getProtocol(){
        return this.protocol;
    }
}
