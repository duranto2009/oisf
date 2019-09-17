package com.revesoft.springboot.web.configurabledashboard;

import org.jose4j.json.internal.json_simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

/**
 * Created by Acer on 9/26/2017.
 */
@Service
public class ConfigurableDashboardService {
    @Autowired
    ConfigurableDashboardDAO configurableDashboardDAO;
    public ArrayList<DashboardMenuDTO> allDashItem(long desigId)throws Exception
    {
        ArrayList<DashboardMenuDTO> data=new ArrayList<>();

        try {
            data=configurableDashboardDAO.dashboardItem(desigId);
        }catch (Exception e){
            e.printStackTrace();
        }
        return data;
    }

    public void addMap(JSONObject obj) throws Exception {
        try {
            configurableDashboardDAO.addDashMap(obj);
         }catch (Exception e){
            e.printStackTrace();
        }
    }
}
