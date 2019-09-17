package com.revesoft.springboot.web.datamigratortool.DataMigration;

import com.revesoft.springboot.web.datamigratortool.DataMigrator.DataMigrator;
import com.revesoft.springboot.web.datamigratortool.DatabaseFrom.DatabaseFromAnalyzer;
import com.revesoft.springboot.web.datamigratortool.DatabaseTo.DatabaseToAnalyzer;
import com.revesoft.springboot.web.datamigratortool.ReportManager.ReportManager;
import org.jose4j.json.internal.json_simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;

/**
 * Created by reve on 4/18/2018.
 */
@RestController
public class MigrationController {
    @Autowired
    DataMigrator dataMigrator;
    @RequestMapping(value = "test",method = RequestMethod.GET)
    ModelAndView test(){
        return  new ModelAndView("test");
    }

    @RequestMapping(value = "migrationreport",method = RequestMethod.GET)
    ModelAndView migrationReport(@RequestParam int menuid){
        ModelAndView menuShow =  new ModelAndView("migrationreport/migrationreport");
        menuShow.addObject("menuid",menuid);
        return menuShow;
    }

    @RequestMapping(value = "migrate",method = RequestMethod.GET)
    int migrate(){
        return  1;
    }

    @RequestMapping(value = "migrationTimeList",method = RequestMethod.POST)
    public String[] getMigrationTimeList(@RequestParam String date){
        ReportManager reportManager = new ReportManager();
        String[] dataList = new String[100];
        dataList = reportManager.getTime(date);
        return dataList;
    }

    @RequestMapping(value = "getReport",method = RequestMethod.POST)
    public JSONObject[] getReport(@RequestParam String date, @RequestParam String time){
        ReportManager reportManager = new ReportManager();
        JSONObject[] dataList = new JSONObject[1000];
        dataList = reportManager.getReport(date,time);
        return dataList;
    }

    @RequestMapping(value = "deleteAllTable",method = RequestMethod.GET)
    public void testDeleteAllMappedTable(){
        HashMap<String,String> tableTableMapping = dataMigrator.getSameSameTableMapping(new DatabaseFromAnalyzer().getTableList(),new DatabaseToAnalyzer().getTableList());
        for(String key:tableTableMapping.keySet()){
            new DatabaseToAnalyzer().deleteDestinationContent(tableTableMapping.get(key));
        }
    }


    @RequestMapping(value = "refreshAllTable",method = RequestMethod.GET)
    public void testAllMappedTable(){
        dataMigrator.migrate();
    }
}
