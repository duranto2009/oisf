package com.revesoft.springboot.web.model;

import org.jose4j.json.internal.json_simple.JSONObject;

import java.sql.Timestamp;

/**
 * Created by reve on 11/5/2017.
 */
public class SQLJsonData {
    private  JSONObject data ;
    private JSONObject where;
    private JSONObject OR;
    private JSONObject AND;

    public JSONObject getData() {
        return data;
    }

    public SQLJsonData() {
        this.data = new JSONObject();
        where = new JSONObject();
        OR = new JSONObject();
        AND = new JSONObject();
    }

    public void add(String key, Integer a){
        data.put(key,a);
    }
    public void add(String key, String a){
        data.put(key,a);
    }
    public void add(String key, Byte a){
        data.put(key,a);
    }
    public void add(String key, Timestamp a){
        data.put(key,a);
    }
    public void addtoConditionORLike(String key, JSONObject a){
        JSONObject js = new JSONObject();
        js.put("what",0);
        js.put("orclause",a);
        OR.put(key,js);
    }
    public void addtoConditionOREqual(String key, JSONObject a){
        JSONObject js = new JSONObject();
        js.put("what",1);
        js.put("orclause",a);
        OR.put(key,js);
    }
    public void addtoConditionANDEquall(String key, String a){
        JSONObject js = new JSONObject();
        js.put("what",1);
        js.put("andclause",a);
        AND.put(key,js);
    }
    public void addtoConditionANDEquall(String key, Integer a){
        JSONObject js = new JSONObject();
        js.put("what",1);
        js.put("andclause",a);
        AND.put(key,js);
    }
    public void addtoConditionANDLike(String key, String a){
        JSONObject js = new JSONObject();
        js.put("what",0);
        js.put("andclause",a);
        AND.put(key,js);
    }
    public void addtoConditionANDLike(String key, Byte a){
        JSONObject js = new JSONObject();
        js.put("what",0);
        js.put("andclause",a);
        AND.put(key,js);
    }
    public void addtoConditionANDLike(String key, Timestamp a){
        JSONObject js = new JSONObject();
        js.put("what",0);
        js.put("andclause",a);
        AND.put(key,js);
    }

    public void addPage(String key, int pagenumber, int pagelength){
        JSONObject page = new JSONObject();
        page.put("pagenum",pagenumber);
        page.put("pagelen",pagelength);
        data.put("page",page);
    }
    public void autoConfig(){
        where.put("or",OR);
        where.put("and",AND);
        data.put("where",where);

    }
}
