package com.revesoft.springboot.web.geo.citycorporationward;

import com.revesoft.springboot.web.geo.citycorporation.CityCorporationDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

/**
 * Created by Bony on 10/31/2017.
 */
@Service
public class CityCorporationWardService {
    @Autowired
    CityCorporationWardDAO cityCorporationWardDAO;

    public ArrayList<CityCorporationWardDTO> getAll(){

        ArrayList<CityCorporationWardDTO> data=new ArrayList<>();
        try{
            data=cityCorporationWardDAO.getAll();
        }catch (Exception e){
            e.printStackTrace();
        }
        return data;
    }
    public void addWardService(CityCorporationWardDTO cityCorporationWardDTO){
        try{
            cityCorporationWardDAO.add(cityCorporationWardDTO);
        }catch (Exception ex){
            ex.printStackTrace();
        }
    }
    public void updateWardService(CityCorporationWardDTO cityCorporationWardDTO){
        try{
            cityCorporationWardDAO.update(cityCorporationWardDTO);
        }catch (Exception ex){
            ex.printStackTrace();
        }
    }
    public int deleteWardService(CityCorporationWardDTO cityCorporationWardDTO){
        int success =0;
        try{
            success =cityCorporationWardDAO.delete(cityCorporationWardDTO);
        }catch (Exception ex){
            ex.printStackTrace();
        }
        return success;
    }
    public ArrayList<CityCorporationWardDTO> getAllById(int id){

        ArrayList<CityCorporationWardDTO> data=new ArrayList<>();
        try{
            data=cityCorporationWardDAO.getById(id);
        }catch (Exception e){
            e.printStackTrace();
        }
        return data;
    }


}
