package com.revesoft.springboot.web.geo.postoffice;

import com.revesoft.springboot.web.geo.upazilla.UpazillaDTO;
import org.jose4j.json.internal.json_simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

/**
 * Created by reve on 10/31/2017.
 */
@Service
public class PostOfficeService {

    @Autowired
    PostOfficeDAO postofficeDAO;

    public JSONObject getPostOfficeListbyPage(int page, int pageSize) {
       JSONObject postOfficeDTOS = null;
        try {
            postOfficeDTOS = postofficeDAO.getPostOfficeListbyPage(page,pageSize);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return postOfficeDTOS;
    }

    public JSONObject getPostOfficeListbyPage(Integer pageNumber, int displayLength, String searchparameter) {
        JSONObject postOfficeDTOS = null;
        try {
            postOfficeDTOS = postofficeDAO.getPostOfficeListbyPage(pageNumber,displayLength,searchparameter);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return postOfficeDTOS;
    }

    public JSONObject getPostOfficeListbyPage(Integer pageNumber, int displayLength, String[] searchparameter) {
        JSONObject postOfficeDTOS = null;
        try {
            postOfficeDTOS = postofficeDAO.getPostOfficeListbyPage(pageNumber,displayLength,searchparameter);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return postOfficeDTOS;
    }


    public void addPostOffice(PostOfficeDTO postofficeDTO) {
        try {

            // return postofficeDAO.add(postofficeDTO);

            // return postofficeDAO.add(postofficeDTO);

            postofficeDAO.add(postofficeDTO);

        } catch (Exception e) {
            e.printStackTrace();
        }

    }



    public void editPostOffice(PostOfficeDTO postofficeDTO) {
        try {
            postofficeDAO.edit(postofficeDTO);
        } catch (Exception e) {
           e.printStackTrace();
        }

    }

    public int deletePostOffice(PostOfficeDTO postOfficeDTO) {
        int success =0;
        try {
            success = postofficeDAO.delete(postOfficeDTO);
        } catch (Exception e) {
           e.printStackTrace();
        }
        return  success;
    }


    public  ArrayList<PostOfficeDTO>  postofficebyDis(int id) {
        ArrayList<PostOfficeDTO> postOfficeDTOS =null;
        try {
           postOfficeDTOS = postofficeDAO.postofficebyDis(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return postOfficeDTOS;
    }
}
