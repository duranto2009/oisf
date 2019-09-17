package com.revesoft.springboot.web.office.offices;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

/**
 * Created by reve on 11/12/2017.
 */
@Service
public class OfficeService {

    @Autowired
    OfficeDAO officeDAO ;



    public ArrayList<OfficeDTO> getOfficeList(){
        ArrayList<OfficeDTO> officeDTOS =  null;
        try {
            officeDTOS = officeDAO.getOfficeList();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return officeDTOS;
    }

    public OfficeDTO getSingleOffice(int id){
        OfficeDTO officeDTOS =  new OfficeDTO();
        try {
            officeDTOS = officeDAO.getSingleOffice(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return officeDTOS;
    }

    public ArrayList<OfficeDTO> getOfficeList(int id){
        ArrayList<OfficeDTO> officeDTOS =  null;
        try {
            officeDTOS = officeDAO.getOfficeList(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return officeDTOS;
    }
    public ArrayList<OfficeDTO> officebyMinistry(int id){
        ArrayList<OfficeDTO> officeDTOS =  null;
        try {
            officeDTOS = officeDAO.officebyMinistry(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return officeDTOS;
    }




    public ArrayList<OfficeDTO> getOfficeListbyPage(Integer page, int pageSize, String searchMsg) {
        ArrayList<OfficeDTO> officeDTOS =  null;
        try {
            officeDTOS = officeDAO.getOfficeListbyPage(page,pageSize,searchMsg);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return officeDTOS;
    }

    public ArrayList<OfficeDTO> getOfficeListbyPage(Integer page, int pageSize, String[] searchParam) {
        ArrayList<OfficeDTO> officeDTOS =  null;
        try {
            officeDTOS = officeDAO.getOfficeListbyPage(page,pageSize,searchParam);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return officeDTOS;
    }

    public ArrayList<OfficeDTO> getOfficeListbyPage(Integer page, int pageSize) {
        ArrayList<OfficeDTO> officeDTOS =  null;
        try {
            officeDTOS = officeDAO.getOfficeListbyPage(page, pageSize);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return officeDTOS;
    }
    int getCount(){
        return officeDAO.getCount();
    }

    public ArrayList<OfficeDTO> getOfficeList(int id, int divisionId, int districtId) {
        ArrayList<OfficeDTO> officeDTOS =  null;
        try {
            officeDTOS = officeDAO.getOfficeList(id,divisionId,districtId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return officeDTOS;
    }

    public int addOffice(OfficeDTO officeDTO){
        int succcess =0;
        try {
            succcess =officeDAO.addOffice(officeDTO);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return  succcess;
    }

    public int editOffice(OfficeDTO officeDTO) {
        int success = 0;
        try {
            success = officeDAO.editOffice(officeDTO);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return  success;
    }

    public int deleteOffice(OfficeDTO officeDTO) {
        int success =0;
        try {
            success =officeDAO.deleteOffice(officeDTO);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return  success;
    }

    public ArrayList<OfficeDTO> officebyMinistryLayerOrigin(int ministry, int layer, int origin) {
        ArrayList<OfficeDTO> officeDTOS =  null;
        try {
           officeDTOS=  officeDAO.officebyMinistryLayerOrigin(ministry, layer, origin);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return officeDTOS;
    }
}
