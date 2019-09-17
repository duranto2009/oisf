package com.revesoft.springboot.web.office.ministry;



import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

/**
 * Created by Bony on 11/5/2017.
 */
@Service
public class MinistryService {

    @Autowired
    MinistryDAO officeministryDAO;

    public ArrayList<MinistryDTO> getAll(){
        ArrayList<MinistryDTO> data=new ArrayList<>();
        try {
             data=officeministryDAO.getAllministry();

        }catch (Exception ex){
            ex.printStackTrace();
        }
        return data;
    }

//    public ArrayList<MinistryDTO> getOfficeMinistryListbyPage(int page, int pageSize) {
//        ArrayList<MinistryDTO> officeministryList = null;
//        try {
//            officeministryList =  officeministryDAO.getOfficeMinistryListbyPage(page,pageSize);
//        } catch (Exception e) {
//            System.out.println("excep:Problem in officeministryService getOfficeMinistryListbyPage method ");
//        }
//        return officeministryList;
//    }
//    public ArrayList<MinistryDTO> getOfficeMinistryListbyPage(int page, int pageSize, String searchMsg) {
//        ArrayList<MinistryDTO> officeministryList = null;
//        try {
//            officeministryList =  officeministryDAO.getOfficeMinistryListbyPage(page,pageSize,searchMsg);
//        } catch (Exception e) {
//            System.out.println("excep:Problem in officeministryService getOfficeMinistryListbyPage method ");
//        }
//        return officeministryList;
//    }
//    public ArrayList<MinistryDTO> getOfficeMinistryListbyPage(int page, int pageSize, String[] searchParam) {
//        ArrayList<MinistryDTO> officeministryList = null;
//        try {
//            officeministryList = officeministryDAO.getOfficeMinistryListbyPage(page,pageSize,searchParam);
//        } catch (Exception e) {
//            System.out.println("excep:Problem in officeministryService getOfficeMinistryListbyPage method ");
//        }
//        return officeministryList;
//    }

    public void add( MinistryDTO ministryDTO){
        try {
            officeministryDAO.add(ministryDTO);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public void edit( MinistryDTO ministryDTO){
        try {
            officeministryDAO.edit(ministryDTO);
        } catch (Exception e) {
           e.printStackTrace();
        }

    }
    public int delete( MinistryDTO ministryDTO ){
        int success =0;
        try {
            success =officeministryDAO.delete(ministryDTO);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return success;
    }

    ArrayList<JSONObject> jsTreeFormat(ArrayList<MinistryDTO> ministryDTOS){
        MinistryDTO ministryDTO =null;
        ArrayList<JSONObject> jsTreeFormatList = new ArrayList<>();


        for(int i=0; i<ministryDTOS.size(); i++){
            ministryDTO = ministryDTOS.get(i);
            JSONObject js = new JSONObject();
            js.put("id","ministry-"+ministryDTO.getId());
            js.put("text",ministryDTO.getNameBng());
            js.put("icon","fa fa-th-list");
            js.put("children",true);

            jsTreeFormatList.add(js);
        }
        return jsTreeFormatList;
    }

    public ArrayList<JSONObject> jMinistryListData(){
        ArrayList<JSONObject> jsTreeFormatList = null;
        try {
            jsTreeFormatList =  jsTreeFormat(officeministryDAO.getAllministry());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsTreeFormatList;
    }
//    public int getCount() {
//
//        return officeministryDAO.getCount();
//
//
//    }
}
