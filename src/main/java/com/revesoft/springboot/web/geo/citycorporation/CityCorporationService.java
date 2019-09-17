package com.revesoft.springboot.web.geo.citycorporation;

import com.revesoft.springboot.web.geo.history.GenericDTO;
import com.revesoft.springboot.web.geo.history.HistoryDTO;
import com.revesoft.springboot.web.geo.history.HistoryService;
import com.revesoft.springboot.web.util.Policy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

/**
 * Created by Bony on 10/30/2017.
 */
@Service
public class CityCorporationService {

    @Autowired
     CityCorporationDAO cityCorporationDAO;

    public ArrayList<CityCorporationDTO> getAllCitycorporation(){

        ArrayList<CityCorporationDTO> data=new ArrayList<>();
        try{
            data=cityCorporationDAO.getAllCitycorporation();
        }catch (Exception e){
            e.printStackTrace();
        }
        return data;
    }

    public ArrayList<CityCorporationDTO> getDisWiseCity(int districtId){
        ArrayList<CityCorporationDTO>data=new ArrayList<>();
        try{
            data=cityCorporationDAO.get(districtId);
        }catch (Exception e){
            e.printStackTrace();
        }
        return data;

    }
    public void addCityService(CityCorporationDTO cityCorporationDTO){
        try{
            cityCorporationDAO.add(cityCorporationDTO);
        }catch (Exception ex){
            ex.printStackTrace();
        }
    }
    public void updateCityService(CityCorporationDTO cityCorporationDTO){
        try{
            cityCorporationDAO.update(cityCorporationDTO);
        }catch (Exception ex){
            ex.printStackTrace();
        }
    }
    public int deleteCityService(CityCorporationDTO cityCorporationDTO){
        int success =0;
        try{
            success = cityCorporationDAO.delete(cityCorporationDTO);
        }catch (Exception ex){
            ex.printStackTrace();
        }
        return success;
    }

    public void changeTotalGeoMuni
            (int currentId, long userId, ArrayList<Integer> muniListId)
    {
        try {
            cityCorporationDAO.changeTotalGeoMuni(currentId, userId, muniListId);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
    public void changeTotalGeoUni
            (int currentId, long userId, ArrayList<Integer> uniListId,ArrayList<Integer>upazilaIds){

        try {
            cityCorporationDAO.changeTotalGeoUni(currentId, userId, uniListId,upazilaIds);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }


    String presentCondition(int cityId, String name){
        HistoryService historyService = new HistoryService();
        GenericDTO genericDTO = historyService.currentChain(cityId, Policy.CITY_TYPE);
        String presentCondition ="বর্তমান অবস্থা : <br/><br/> সিটি কর্পোরেশনটি <a href=\"#\">"+genericDTO.getDistrictName()+"</a>";
        presentCondition += "জেলার অধীনে আছে এবং <a href=\"#\">"+genericDTO.getDivisionName()+" </a>";
        presentCondition += " বিভাগের অন্তর্ভুক্ত।";
        return presentCondition;
    }

    String fromWhomCityBuildUp(int cityId, String name){
        HistoryService historyService = new HistoryService();
        ArrayList<HistoryDTO> geoHistoryDTOS= null;//historyService.getCityHistory(cityId);

        String fromWhomCityBuildUp ="সিটি কর্পোরেশনটি <br/><ul style=margin-left:5px;>";
        for(int i=0;i<geoHistoryDTOS.size();i++){
            HistoryDTO geoHistoryDTO = geoHistoryDTOS.get(i);
            if(geoHistoryDTO.getSourcType()== Policy.UNION_TYPE){
                fromWhomCityBuildUp+="<li>"+geoHistoryDTO.getNameBng()+"</li>";
            }
        }
        fromWhomCityBuildUp +="</ul>ইউনিয়ন এবং <br/><ul style=margin-left:5px;>";
        for(int i=0;i<geoHistoryDTOS.size();i++){
            HistoryDTO geoHistoryDTO = geoHistoryDTOS.get(i);
            if(geoHistoryDTO.getSourcType()== Policy.MUNICIPALITY_TYPE){
                fromWhomCityBuildUp+="<li>"+geoHistoryDTO.getNameBng()+"</li>";
            }
        }
        fromWhomCityBuildUp +="</ul>পৌরসভা ";
        fromWhomCityBuildUp +=" নিয়ে গঠিত হয়েছিল।";
        return fromWhomCityBuildUp;
    }






}
