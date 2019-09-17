package com.revesoft.springboot.web.geo.municipalityward;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

/**
 * Created by reve on 10/31/2017.
 */
@Service
public class MunicipalityWardService {
    @Autowired
    MunicipalityWardDAO municipalitywardDAO;


    public ArrayList<MunicipalityWardDTO> getMunicipalityWardListbyPage(int page, int pageSize) {
        ArrayList<MunicipalityWardDTO> municipalityWardDTOS = null;
        try {
            municipalityWardDTOS = municipalitywardDAO.getMunicipalityWardListbyPage(page, pageSize);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return municipalityWardDTOS;
    }

    public ArrayList<MunicipalityWardDTO> getMunicipalityWardList() {
        ArrayList<MunicipalityWardDTO> municipalityWardDTOS = null;
        try {
            municipalityWardDTOS = municipalitywardDAO.getMunicipalityWardList();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return municipalityWardDTOS;
    }


    public void addMunicipalityWard(MunicipalityWardDTO municipalitywardDTO) {
        try {
            municipalitywardDAO.add(municipalitywardDTO);

        } catch (Exception e) {
          e.printStackTrace();
        }

    }


    public void editMunicipalityWard(MunicipalityWardDTO municipalitywardDTO) {
        try {
            municipalitywardDAO.edit(municipalitywardDTO);
        } catch (Exception e) {
           e.printStackTrace();
        }

    }

    public int deleteMunicipalityWard(MunicipalityWardDTO municipalityWardDTO) {
        int success = 0;
        try {
            success  = municipalitywardDAO.delete(municipalityWardDTO);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return  success;
    }

    public ArrayList<MunicipalityWardDTO> getMunicipalityWardListByMunicipalityId(int id) {
        try {
            return municipalitywardDAO.getMunicipalityWardListByMunicipalityId(id);
        } catch (Exception e) {
           e.printStackTrace();
        }
        return new ArrayList<>();
    }
}


