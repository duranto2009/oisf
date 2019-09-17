package com.revesoft.springboot.web.util;

import org.springframework.boot.context.embedded.*;
import org.springframework.boot.web.servlet.ErrorPage;
import org.springframework.boot.web.servlet.ServletContextInitializer;

import java.io.File;
import java.net.InetAddress;
import java.nio.charset.Charset;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.concurrent.TimeUnit;

public class DateFormatter {
    public String dateFormat(String dateString){
        SimpleDateFormat dt = new SimpleDateFormat("yyyy-MM-dd");

        Date date=null;
        try {
             date = dt.parse(dateString);
        } catch (ParseException e) {
            e.printStackTrace();
        }




        // *** same for the format String below
        SimpleDateFormat dt1 = new SimpleDateFormat("EEE, d MMM yyyy");
        return dt1.format(date);
    }
    public String dateFormatWithOnlydate(String dateString){
        SimpleDateFormat dt = new SimpleDateFormat("EEE, d MMM yyyy");

        Date date=null;
        try {
            date = dt.parse(dateString);
        } catch (ParseException e) {
            e.printStackTrace();
        }




        // *** same for the format String below
        SimpleDateFormat dt1 = new SimpleDateFormat(" yyyy-MM-dd");
        return dt1.format(date);
    }
    public String dateFormatWithoutDay(String dateString){
        SimpleDateFormat dt = new SimpleDateFormat("yyyy-MM-dd");

        Date date=null;
        try {
            date = dt.parse(dateString);
        } catch (ParseException e) {
            e.printStackTrace();
        }




        // *** same for the format String below
        SimpleDateFormat dt1 = new SimpleDateFormat(" d MMM yyyy");
        return dt1.format(date);
//        new ConfigurableEmbeddedServletContainer().
    }
}
