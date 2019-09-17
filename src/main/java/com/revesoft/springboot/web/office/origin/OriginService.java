package com.revesoft.springboot.web.office.origin;

import org.jose4j.json.internal.json_simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

/**
 * Created by Bony on 11/12/2017.
 */
@Service
public class OriginService {

    @Autowired
    OriginDAO originDAO ;

    public ArrayList<OriginDTO> getAll(int layerId){
        ArrayList<OriginDTO> data=null;
        try {
            data= originDAO.getOriginsByLayers(layerId);

        }catch (Exception ex){
            ex.printStackTrace();
        }
        return data;
    }

    public ArrayList<OriginDTO> getAll(){
        ArrayList<OriginDTO> data=null;
        try {
            data= originDAO.getOrigins();

        }catch (Exception ex){
            ex.printStackTrace();
        }
        return data;
    }


    public ArrayList<OriginDTO> originbyMinistry(int ministryid) {
        ArrayList<OriginDTO> data=null;
        try {
            data= originDAO.originbyMinistry(ministryid);

        }catch (Exception ex){
            ex.printStackTrace();
        }
        return data;
    }

    public void addOrigin(OriginDTO originDTO) {
        try {
             originDAO.addOrigin(originDTO);

        }catch (Exception ex){
            ex.printStackTrace();
        }
    }

    public void editOrigin(OriginDTO originDTO) {
        try {
             originDAO.editOrigin(originDTO);

        }catch (Exception ex){
            ex.printStackTrace();
        }
    }

    public int originDelete(OriginDTO originDTO) {
        int success =0;
        try {
          success = originDAO.originDelete(originDTO);

        }catch (Exception ex){
            ex.printStackTrace();
        }
        return success;
    }

    ArrayList<JSONObject> jsTreeFormat(ArrayList<OriginDTO>originDTOS){
        OriginDTO originDTO =null;
        ArrayList<JSONObject> jsTreeFormatList = new ArrayList<>();


        for(int i=0; i<originDTOS.size(); i++){
            originDTO = originDTOS.get(i);
            JSONObject js = new JSONObject();
            js.put("id","origin-"+originDTO.getId());
            js.put("text",originDTO.getOfficeNameBng());
            js.put("icon","fa fa-th-list");
            js.put("children",true);

            jsTreeFormatList.add(js);
        }
        return jsTreeFormatList;
    }
    public ArrayList<JSONObject> jOfficeOriginListDatabyMinistryid(int id) {
        ArrayList<JSONObject> originsDtos = null;
        try {
            originsDtos = jsTreeFormat(originDAO.originbyMinistry(id));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return originsDtos;
    }
}
