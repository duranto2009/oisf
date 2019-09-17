package com.revesoft.springboot.web.geo.policy;

import org.springframework.stereotype.Service;

import java.util.ArrayList;

/**
 * Created by Bony on 11/21/2017.
 */
@Service
public class GeoPolicyService {
    GeoPolicyDAO geoPolicyDAO =new GeoPolicyDAO();

    public ArrayList<GeoPolicyDTO> get(){
        ArrayList<GeoPolicyDTO> data=new ArrayList<>();
        try{
            data=geoPolicyDAO.get();


        }catch (Exception e){
            e.printStackTrace();
        }
        return data;
    }
}
