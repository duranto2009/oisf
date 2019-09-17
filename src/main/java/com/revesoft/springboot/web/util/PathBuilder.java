package com.revesoft.springboot.web.util;

import com.revesoft.springboot.web.appregistration.ApplicationController;
import com.revesoft.springboot.web.user.UserController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import javax.servlet.ServletContext;
import java.util.HashMap;
import java.util.regex.Pattern;
@Component
public class PathBuilder {

    private static final String appIconPath="static\\assets\\img\\dashboardicon\\";
    private static final String relativeAppIconPath="assets\\img\\dashboardicon\\";
    public static final String profilePicPath="static\\assets\\img\\profile\\";
    public static final String relativeProfilePicPath="assets\\img\\profile\\";
    public static final String signaturePath="static\\assets\\img\\signature\\";
    public static final String docs="static\\assets\\img\\signature\\";




    public HashMap<Integer,String> buildPath(ServletContext servletContext,String moduleName,String ignorablePath){
        String path="";
        HashMap<Integer,String>mappedPath=new HashMap<>();
        String absoulatePart=servletContext.getRealPath("resources").toString();
        String [] patharray=absoulatePart.split(Pattern.quote("\\"));
        for (String paths:patharray) {
            if(!(paths.equals(ignorablePath)))
            {
                path=path+paths+"\\";
            }

        }
        if(moduleName.equals(ApplicationController.MODULE_NAME)){
            path=path+appIconPath;
            mappedPath.put(1,path);
            mappedPath.put(2,relativeAppIconPath);
        }else if(moduleName.equals(UserController.MODULE_NAME)){
            path=path+profilePicPath;
            mappedPath.put(1,path);
            mappedPath.put(2,relativeProfilePicPath);
        }else if(moduleName.equals(UserController.MODULE_SIGN)){
            path=path+signaturePath;
            mappedPath.put(1,path);
            mappedPath.put(2,signaturePath);
        }

        return mappedPath;
    }
}
