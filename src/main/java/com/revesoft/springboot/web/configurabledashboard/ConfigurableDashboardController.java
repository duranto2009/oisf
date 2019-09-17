package com.revesoft.springboot.web.configurabledashboard;

import com.revesoft.springboot.web.controller.LoginController;
import com.revesoft.springboot.web.menumanagement.MenuDAO;
import com.revesoft.springboot.web.menumanagement.MenuDTO;
import org.jose4j.json.internal.json_simple.JSONObject;
import org.jose4j.json.internal.json_simple.parser.JSONParser;
import org.json.simple.JSONArray;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;

/**
 * Created by Acer on 9/26/2017.
 */
@RestController
public class ConfigurableDashboardController {
    @Autowired
    private ConfigurableDashboardService configurableDashboardService;
    @RequestMapping(value = "userdashboard",method = RequestMethod.GET)
    public ModelAndView getDashboard(HttpServletRequest request) throws Exception {

        ModelAndView modelAndView=new ModelAndView();
//        if(LoginController.name.equals("superman")){
//            modelAndView.addObject("admin",1);
//        }else{
//            modelAndView.addObject("officer",1);
//        }
        Long orgId=(Long)request.getSession().getAttribute("organogramId");
        modelAndView.addObject("list",configurableDashboardService.allDashItem(orgId));
        modelAndView.setViewName("configurabledashboard/userdashboard");
        return  modelAndView;
    }

    @RequestMapping(value = "userdashboard2",method = RequestMethod.GET)
    public ModelAndView getDashboard2() throws Exception {

        ModelAndView modelAndView=new ModelAndView();
        modelAndView.addObject("list",configurableDashboardService.allDashItem(1));
        modelAndView.setViewName("configurabledashboard/imagerz");
        return  modelAndView;
    }

    @RequestMapping(value="dashitem",method = RequestMethod.POST)
    public ArrayList<DashboardMenuDTO> allList(HttpServletRequest request,@RequestParam int id) throws Exception{


//        Long orgId=(Long)request.getSession().getAttribute("organogramId");
        return new ConfigurableDashboardDAO().dashboardItem(id);



    }
    @PostMapping(value="dashitemmodal")
    public ArrayList<DashboardMenuDTO> allModalList(HttpServletRequest request,
                                                    @RequestParam("id") String id) throws Exception{


//        Long orgId=(Long)request.getSession().getAttribute("organogramId");
//        String id = request.getParameter("id");
        return new ConfigurableDashboardDAO().dashboardModalItem(id);
    }
        @PostMapping(value="dashitemmodalbyorgid")
    public ArrayList<Integer> allModalListByOrgId(HttpServletRequest request
               ,    @RequestParam(value = "modalId") int modalId

        ) throws Exception{


        Long orgId=(Long)request.getSession().getAttribute("organogramId");
//        String id = request.getParameter("id");
        return new ConfigurableDashboardDAO().dashboardModalItemByOrgId(orgId,modalId);
    }





    @PostMapping(value="savedashitem")
    public boolean saveallModalList(HttpServletRequest request,
                                                    @RequestParam(value = "id[]") int[] result,
                                                    @RequestParam(value = "modalId") int modalId
    ) throws Exception{


        Long orgId=(Long)request.getSession().getAttribute("organogramId");
//        String id = request.getParameter("result");
        int x = 0;
        return new ConfigurableDashboardDAO().saveDashboardModalMenuItem(result,orgId,modalId);
//        return null;
    }




    @RequestMapping(path="appall")
    public ArrayList<MenuDTO> allappList(HttpServletRequest request) throws Exception{

        int orgId=Integer.parseInt((String)request.getSession().getAttribute("organogramId"));
        return new MenuDAO().getAppByDesignation(orgId);
    }

    @RequestMapping(path = "savedashboard")
    public void saveDashboard(@RequestBody String data) throws Exception {
        JSONParser parser = new JSONParser();
        Object obj = null;

        try {
            obj = parser.parse(data);
        } catch (org.jose4j.json.internal.json_simple.parser.ParseException e) {
            e.printStackTrace();
            return;
        }
        configurableDashboardService.addMap((JSONObject) obj);






    }


}
