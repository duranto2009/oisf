package com.revesoft.springboot.web.geo.history;

import org.jose4j.json.internal.json_simple.JSONObject;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Random;

/**
 * Created by Bony on 11/22/2017.
 */
@Service
public class HistoryService {

    HistoryDAO geoHistoryDAO=new HistoryDAO();

    String geoType(int id){

        switch (id){
            case 1:return " বিভাগ ";
            case 2:return " জেলা ";
            case 3:return " উপজেলা ";
            case 4:return " সিটি কর্পোরেশন ";
            case 5:return " থানা ";
            case 6:return " ইউনিয়ন ";
            case 7:return " পৌরসভা ";
            case 8:return " পোস্ট অফিস ";
            case 9:return " সিটি কর্পোরেশন ওয়ার্ড ";
            case 10:return " পৌরসভা ওয়ার্ড ";
        }
        return "";
    }


    public ArrayList<HistoryDTO> getCityHistoryDetails(int parentId, int parentType){

        ArrayList<HistoryDTO> detailsDTO= new ArrayList<>();

        try {
            detailsDTO=geoHistoryDAO.allhistoryCityDetails(parentId,parentType);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return detailsDTO;

    }

//    ArrayList<JSONObject> jsTreeFormat(ArrayList<HistoryDTO> geoHistoryDTOS, String li_attr, String a_attr, String what){
//        HistoryDTO geoHistoryDTO =new HistoryDTO();
//        ArrayList<JSONObject> jsTreeFormatList = new ArrayList<>();
//        JSONObject liattr = new JSONObject();
//        JSONObject aattr = new JSONObject();
//        liattr.put("class",li_attr);
//        aattr.put("class",a_attr);
//        for(int i=0; i<geoHistoryDTOS.size(); i++){
//            geoHistoryDTO = geoHistoryDTOS.get(i);
//            JSONObject js = new JSONObject();
//            js.put("id",what+"-"+geoHistoryDTO.getSourcType()+"-"+geoHistoryDTO.getParentId()+"-"+geoHistoryDTO.getParentType()+"-"+new Random().nextInt()+"-"+new Random().nextInt());
//            js.put("text",geoHistoryDTO.getNameBng()+" "+geoType(geoHistoryDTO.getSourcType())+" nicher "+geoType(geoHistoryDTO.getParentType())+"er under e chilo");
//            js.put("icon","fa fa-th-large");
//           js.put("children", true);
//            js.put("li_attr",liattr);
//            js.put("a_attr",aattr);
//            jsTreeFormatList.add(js);
//        }
//        return jsTreeFormatList;
//    }
//    ArrayList<JSONObject> getHistoryListForJsTreeById(int id, String li_attr, String a_attr){
//        ArrayList<HistoryDTO> data =getCityHistory(id);
//
//        return jsTreeFormat(data,li_attr,a_attr,"city");
//    }
//    ArrayList<JSONObject> getHistoryListParentId(int parentid, int parenttype, String li_attr, String a_attr){
//        ArrayList<HistoryDTO> data =getCityHistoryDetails(parentid,parenttype);
//
//        return jsTreeFormat(data,li_attr,a_attr,"dis");
//    }
//
//    public ArrayList<JSONObject> getHistoryListParentParentId(int parentid, int parenttype, String li_attr, String a_attr) {
//        ArrayList<HistoryDTO> data = getCityHistoryDetails(parentid, parenttype);
//
//        return jsTreeFormat(data,li_attr,a_attr,"div");
//    }

    public GenericDTO currentChain(int id, int type){
        GenericDTO genericDTO = null;
        try {
            genericDTO = geoHistoryDAO.currentChain(id, type);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return genericDTO;
    }
    public ArrayList<GenericDTO> getChildDetail(int id, int type){
        ArrayList<GenericDTO> genericDTOS = null;
        try {
            genericDTOS = geoHistoryDAO.childDetail(id, type);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return genericDTOS;
    }

    public ArrayList<GenericDTO> getParentDetail(int id,int type){
        ArrayList<GenericDTO> genericDTOS = null;
        try {
            genericDTOS = geoHistoryDAO.allPreviousHistory(id, type);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return genericDTOS;
    }
}
