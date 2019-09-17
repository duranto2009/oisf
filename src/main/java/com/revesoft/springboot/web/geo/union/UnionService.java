package com.revesoft.springboot.web.geo.union;

import com.revesoft.springboot.web.geo.history.GenericDTO;
import com.revesoft.springboot.web.geo.history.HistoryService;
import org.jose4j.json.internal.json_simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

/**
 * Created by reve on 10/30/2017.
 */
@Service
public class UnionService {
    @Autowired
    UnionDAO unionDAO;

    public JSONObject getUnionListbyPage(int page, int pageSize) {
        JSONObject unionList = null;
        try {
            unionList =  unionDAO.getUnionListbyPage(page,pageSize);
        } catch (Exception e) {
           e.printStackTrace();
        }
        return unionList;
    }
    public JSONObject getUnionListbyPage(int page, int pageSize, String searchMsg) {
        JSONObject unionList = null;
        try {
            unionList =  unionDAO.getUnionListbyPage(page,pageSize,searchMsg);
        } catch (Exception e) {
           e.printStackTrace();
        }
        return unionList;
    }
    public JSONObject getUnionListbyPage(int page, int pageSize, String[] searchParam) {
        JSONObject unionList = null;
        try {
            unionList = unionDAO.getUnionListbyPage(page,pageSize,searchParam);
        } catch (Exception e) {
           e.printStackTrace();
        }
        return unionList;
    }

    public ArrayList<UnionDTO> getUnionListByUpazillaId(int id){
        ArrayList<UnionDTO> unionList = null;
        try {
            unionList = unionDAO.getUnionListByUpazillaId(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return unionList;
    }
    public ArrayList<UnionDTO> getUnionListByUpazillaIds(int[] id){
        ArrayList<UnionDTO> unionList = null;
        try {
            unionList = unionDAO.getUnionListByUpazillaIds(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return unionList;
    }

    public void addUnion(UnionDTO unionDTO) {
        try {

            // return unionDAO.add(unionDTO);

            // return unionDAO.add(unionDTO);

            unionDAO.add(unionDTO);

        } catch (Exception e) {
           e.printStackTrace();
        }

    }



    public void editUnion(UnionDTO unionDTO) {
        try {
            unionDAO.edit(unionDTO);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }


    public int deleteUnion(UnionDTO unionDTO) {
        int success = 0;
        try {
           success =  unionDAO.delete(unionDTO);
        } catch (Exception e) {
           e.printStackTrace();
        }
        return success;

    }

    public String currentChain(int id, String name) {
        HistoryService historyService = new HistoryService();
        GenericDTO genericDTO = historyService.currentChain(id,6 );
        String presentCondition ="বর্তমান অবস্থা : <br/><br/> ইউনিয়নটি <a href=\"#\">"+genericDTO.getUpazilaName()+"</a>";
        presentCondition += " উপজেলার অধীনে আছে এবং <a href=\"#\">"+genericDTO.getDivisionName()+" </a>";
        presentCondition += " বিভাগের "+genericDTO.getDistrictName()+" জেলার অন্তর্ভুক্ত। ";
        return presentCondition;
    }

    String makeSentence(GenericDTO previous, GenericDTO current){ // based on division,name,bbscode
        String binarySentence = "";
        String exactSentence = current.getFromDate()+" থেকে "+current.getToDate()+" পর্যন্ত ";
        if(previous.getDivisionName().equals(current.getDistrictName()))binarySentence +="1";
        else binarySentence +="0";

        if(previous.getDistrictName().equals(current.getDistrictName()))binarySentence +="1";
        else binarySentence +="0";

        if(previous.getUpazilaName().equals(current.getUpazilaName()))binarySentence +="1";
        else binarySentence +="0";

        if(previous.getUnionName().equals(current.getUnionName()))binarySentence +="1";
        else binarySentence +="0";





        if(binarySentence.contains("0")){
            exactSentence += current.getDivisionName()+" বিভাগের "+current.getDistrictName() + " জেলার অন্তর্ভুক্ত "+ current.getUpazilaName()+" উপজেলার অধীনে " + current.getUnionName()+" নামে ";
        }

        exactSentence += "ছিল। ";

        return exactSentence;

    }

    public String parentDetail(int id, String name) {
        String parentDetail ="ইউনিয়নটি ";
        HistoryService historyService = new HistoryService();
        GenericDTO currentinfo = historyService.currentChain(id,6 );
        ArrayList<GenericDTO> genericDTOS= historyService.getParentDetail(id,6);
        GenericDTO previousinfo = null;
        int len = genericDTOS.size();
        for(int i=0;i<len;i++){
            previousinfo = genericDTOS.get(i);
            if(i==len-1)parentDetail += makeSentence(currentinfo,previousinfo);
            else  parentDetail += makeSentence(currentinfo,previousinfo)+"<br/> এটার আগে  ";
            currentinfo = previousinfo;
        }
        return parentDetail;
    }
}
