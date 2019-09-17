package com.revesoft.springboot.web.geo.municipality;

import com.revesoft.springboot.web.geo.union.UnionDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

/**
 * Created by reve on 10/31/2017.
 */
@Service
public class MunicipalityService {
    @Autowired
    MunicipalityDAO municipalityDAO;

    public ArrayList<MunicipalityDTO> getMunicipalityListbyPage(int page, int pageSize) {
        try {
            return municipalityDAO.getMunicipalityListbyPage(page,pageSize);
        } catch (Exception e) {
           e.printStackTrace();
        }
        return new ArrayList<>();
    }
    public ArrayList<MunicipalityDTO> getMunicipalityList() {
        try {
            return municipalityDAO.getMunicipalityList();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new ArrayList<>();
    }
    public ArrayList<MunicipalityDTO> getMunicipalityListbyUpazillaId(int upazillaId) {
        try {
            return municipalityDAO.getMunicipalityListbyUpazillaId(upazillaId);
        } catch (Exception e) {
           e.printStackTrace();
        }
        return new ArrayList<>();
    }
    public void addMunicipality(MunicipalityDTO municipalityDTO) {
        try {

            // return municipalityDAO.add(municipalityDTO);

            // return municipalityDAO.add(municipalityDTO);

            municipalityDAO.add(municipalityDTO);

        } catch (Exception e) {
           e.printStackTrace();
        }

    }

    public void assignUnion(int parentId, int userId, ArrayList<Integer> sourceListId, int currentId) {
        try {

            municipalityDAO.assignUniToMuni(parentId,userId,sourceListId,currentId);

        } catch (Exception e) {
           e.printStackTrace();
        }

    }


    public void editMunicipality(MunicipalityDTO municipalityDTO) {
        try {
            municipalityDAO.edit(municipalityDTO);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public int deleteMunicipality(MunicipalityDTO municipalityDTO) {
        int success =0;
        try {
            success = municipalityDAO.delete(municipalityDTO);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return success;

    }

    public ArrayList<MunicipalityDTO> getMuniListByUpazillaId(int id){
        ArrayList<MunicipalityDTO> List = null;
        try {
            List = municipalityDAO.getMuniListByUpazillaId(id);
        } catch (Exception e) {
           e.printStackTrace();
        }
        return List;
    }

    public ArrayList<MunicipalityDTO> getMunicipalityListbyUpazillaIds(int[] ids) {
        ArrayList<MunicipalityDTO> List = null;
        try {
            List = municipalityDAO.getMuniListByUpazillaIds(ids);
        } catch (Exception e) {
           e.printStackTrace();
        }
        return List;
    }
}
