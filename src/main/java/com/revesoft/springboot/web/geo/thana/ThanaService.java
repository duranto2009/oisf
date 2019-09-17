package com.revesoft.springboot.web.geo.thana;


import com.revesoft.springboot.web.geo.history.GenericDTO;
import com.revesoft.springboot.web.geo.history.HistoryService;
import org.jose4j.json.internal.json_simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

/**
 * Created by reve on 10/26/2017.
 */
@Service
public class ThanaService {
    @Autowired
    ThanaDAO thanaDAO =new ThanaDAO();


    public JSONObject getThanaListbyPage(int page, int pageSize) {
        JSONObject thanaDTOS = null;
        try {
            thanaDTOS = thanaDAO.getThanaListbyPage(page,pageSize);
        } catch (Exception e) {
           e.printStackTrace();
        }
        return thanaDTOS;
    }
    public JSONObject getThanaListbyPage(Integer pageNumber, int displayLength, String[] searchparameter) {
        JSONObject thanaDTOS = null;
        try {
            thanaDTOS = thanaDAO.getThanaListbyPage(pageNumber,displayLength,searchparameter);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return thanaDTOS;
    }

    public JSONObject getThanaListbyPage(Integer pageNumber, int displayLength, String searchparameter) {
        JSONObject thanaDTOS = null;
        try {
            thanaDTOS = thanaDAO.getThanaListbyPage(pageNumber,displayLength,searchparameter);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return thanaDTOS;
    }

    public void addThana(ThanaDTO thanaDTO) {
        try {

            // return upazillaDAO.add(upazillaDTO);

            // return upazillaDAO.add(upazillaDTO);

            thanaDAO.add(thanaDTO);

        } catch (Exception e) {
           e.printStackTrace();
        }

    }

    public ArrayList<ThanaDTO> getThanaListbyDistrictId(int districtId) {
        try {
            return thanaDAO.getThanaListbyDistrictId(districtId);
        } catch (Exception e) {
           e.printStackTrace();
        }
        return new ArrayList<>();
    }


    public void editThana(ThanaDTO thanaDTO) {
        try {
            thanaDAO.edit(thanaDTO);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public int deleteThana(ThanaDTO thanaDTO) {
        int success =0;
        try {
            success = thanaDAO.delete(thanaDTO);
        } catch (Exception e) {
           e.printStackTrace();
        }
        return success;

    }


    public ArrayList<ThanaDTO> getThanaListbyDistrictIds(int[] ids) {
        ArrayList<ThanaDTO> list = null;
        try {
            list = thanaDAO.getThanaListbyDistrictIds(ids);
        } catch (Exception e) {
          e.printStackTrace();
        }
        return list;
    }



}
