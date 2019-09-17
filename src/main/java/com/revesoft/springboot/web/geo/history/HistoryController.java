package com.revesoft.springboot.web.geo.history;

import org.jose4j.json.internal.json_simple.JSONObject;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.ArrayList;

/**
 * Created by Bony on 11/22/2017.
 */
@RestController
public class HistoryController {

//    @RequestMapping(value = "gethistoryid", method = RequestMethod.POST)
//    @ResponseBody
//    ArrayList<JSONObject> gethistoryId(Principal principal, @RequestParam int id, @RequestParam String li_attr, @RequestParam String a_attr){
//        ArrayList<JSONObject> historyDto = null;
//       HistoryService historyService = new HistoryService();
//        historyDto = historyService.getHistoryListForJsTreeById(id,li_attr,a_attr);
//        return historyDto;
//    }
//    @RequestMapping(value = "gethistoryid", method = RequestMethod.POST)
//    @ResponseBody
//    ArrayList<JSONObject> gethistoryId(Principal principal, @RequestParam int id, @RequestParam String li_attr, @RequestParam String a_attr){
//        ArrayList<JSONObject> historyDto = null;
//       HistoryService historyService = new HistoryService();
//        //historyDto = historyService.getHistoryListForJsTreeById(id,li_attr,a_attr);
//        return historyDto;
//    }
//
//    @RequestMapping(value = "gethistorydetails1", method = RequestMethod.POST)
//    @ResponseBody
//    ArrayList<JSONObject> getHistoryDetails1(Principal principal, @RequestParam int id,@RequestParam int parenttype, @RequestParam String li_attr, @RequestParam String a_attr){
//        HistoryService historyService = new HistoryService();
//        return historyService.getHistoryListParentId(id,parenttype,li_attr,a_attr);
//
//    }
//
//    @RequestMapping(value = "gethistorydetails2", method = RequestMethod.POST)
//    @ResponseBody
//    ArrayList<JSONObject> getHistoryDetails2(Principal principal, @RequestParam int id,@RequestParam int parenttype, @RequestParam String li_attr, @RequestParam String a_attr){
//        HistoryService historyService = new HistoryService();
//        return historyService.getHistoryListParentParentId(id,parenttype,li_attr,a_attr);
//
//    }

    @RequestMapping(path = "getdetailshistory")
    public ArrayList<HistoryDTO> test(){
       ArrayList<HistoryDTO> data=new ArrayList<>();
        HistoryService historyService =new HistoryService();


        try{
            data= historyService.getCityHistoryDetails(18,2);

        }catch (Exception e){
            e.printStackTrace();
        }
        return data;
    }
//    @RequestMapping(path = "test0001")
//    @ResponseBody
//    public ArrayList<HistoryDTO> test0001(){
//        HistoryService historyService = new HistoryService();
//        ArrayList<HistoryDTO> geoHistoryDTOS = null;
//        geoHistoryDTOS = historyService.getCityHistory(13);
//        return geoHistoryDTOS;
//    }

    @RequestMapping(path = "test0002")
    @ResponseBody
    public ArrayList<GenericDTO> test0002(){
        HistoryService historyService = new HistoryService();
        ArrayList<GenericDTO> geoHistoryDTOS = null;
        geoHistoryDTOS = historyService.getChildDetail(13,4);
        return geoHistoryDTOS;
    }

}
