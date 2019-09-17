package com.revesoft.springboot.web.office.layer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

/**
 * Created by Bony on 11/5/2017.
 */
@Service
public class LayerService {
    @Autowired
    LayerDAO layerDAO;

    public ArrayList<LayerDTO> getLayersByMinistries(int ministryId){
        ArrayList<LayerDTO> data=new ArrayList<>();
        try {
            data= layerDAO.getLayersByMinistries(ministryId);

        }catch (Exception ex){
            ex.printStackTrace();
        }
        return data;
    }

    public int add(LayerDTO layerDTO) {
        int success =0;
        try {
            success = layerDAO.add(layerDTO);;

        }catch (Exception ex){
            ex.printStackTrace();
        }
        return success;
    }

    public int edit(LayerDTO layerDTO) {
        int success =0;
        try {
            success = layerDAO.edit(layerDTO);

        }catch (Exception ex){
            ex.printStackTrace();
        }
        return success;
    }

    public int delete(LayerDTO layerDTO) {
        int success =0;
        try {
            success = layerDAO.delete(layerDTO);
        }catch (Exception ex){
            ex.printStackTrace();
        }
        return success;
    }


}
