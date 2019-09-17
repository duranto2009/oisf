package com.revesoft.springboot.web.geo.district;

import com.revesoft.springboot.web.geo.division.DivisionDTO;
import com.revesoft.springboot.web.geo.division.DivisionService;
import com.revesoft.springboot.web.geo.history.HistoryService;
import org.jose4j.json.internal.json_simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;

/**
 * Created by Bony on 10/30/2017.
 */
@RestController
public class DistrictController {
    @Autowired
    DistrictService districtService;
    @Autowired
    DivisionService divisionService;
    @Autowired
    HistoryService historyService;

    @RequestMapping(path= "/districtlistdata")
    @ResponseBody
    public JSONObject getDistrictList(){
        ArrayList<DistrictDTO>data=districtService.getAllDistrict();
        JSONObject obj = new JSONObject();
        obj.put("iTotalRecords",data.size());
        obj.put("iTotalDisplayRecords",data.size());
        obj.put("aaData",data);
        return obj;
    }

    @RequestMapping(path= "/districtlistdatabydivision")
    @ResponseBody
    public JSONObject getDistrictByDivision(@RequestParam int id){
        ArrayList<DistrictDTO>data=districtService.getDivWiseDistrict(id);
        JSONObject obj = new JSONObject();
        obj.put("iTotalRecords",data.size());
        obj.put("iTotalDisplayRecords",data.size());
        obj.put("aaData",data);
        return obj;
    }

    @RequestMapping(path= "/districtlistbydiv")
    @ResponseBody
    public ArrayList<DistrictDTO> getDistrictListById(@RequestParam int id){
        ArrayList<DistrictDTO>data=districtService.getDivWiseDistrict(id);
        return data;
    }
    @RequestMapping(path= "/districtlistbydivcity")
    @ResponseBody
    public ArrayList<DistrictDTO> getDistrictListByCity(@RequestParam int id){
        ArrayList<DistrictDTO>data=districtService.getDivWiseDistrictCity(id);

        return data;
    }
    @RequestMapping(value="districtlist",method = RequestMethod.GET)
    @ResponseBody
    public ModelAndView getDistrictList(HttpServletRequest request, @RequestParam int menuid){

        ModelAndView modelAndView=new ModelAndView();
        request.getSession().setAttribute("districtmenuid",menuid);
        modelAndView.setViewName("geo/district/districtlist");
        modelAndView.addObject("menuid",menuid);
        return modelAndView;

    }
    @RequestMapping(value="districtadd",method = RequestMethod.GET)
    public ModelAndView addDistrictForm(HttpServletRequest request){
        DistrictDTO districtDTO=new DistrictDTO();
        ArrayList<DivisionDTO>data=divisionService.getDivisionData();


        ModelAndView modelAndView=new ModelAndView();
        modelAndView.addObject("division",data);
        modelAndView.setViewName("geo/district/districtadd");
        String menuid = request.getSession().getAttribute("districtmenuid").toString();
        modelAndView.addObject("menuid",menuid);
        return modelAndView;
    }
    @RequestMapping(value="districtadd",method = RequestMethod.POST)
    public RedirectView addDistrict(HttpServletRequest request,Principal principal, @RequestParam String disnameeng,
                                    @RequestParam String disnamebng,
                                    @RequestParam String bbscode,
                                    @RequestParam int divdata){

        ModelAndView modelAndView=new ModelAndView();
        DistrictDTO districtDTO=new DistrictDTO();
        districtDTO.setDistrictNameEng(disnameeng);
        districtDTO.setDistrictNameBng(disnamebng);
        districtDTO.setBbsCode(bbscode);
        districtDTO.setDivisionBBSCode(divisionService.getDivisionService(divdata).getBbsCode());
        districtDTO.setDivisionId(divdata);

        districtDTO.setStatus(1);
        districtDTO.setCreatedBy(((Long) request.getSession().getAttribute("employeeId")).intValue());
        districtDTO.setCreated(java.sql.Timestamp.from(java.time.Instant.now()));
        districtService.add(districtDTO);

        return new RedirectView("districtlist?menuid="+request.getSession().getAttribute("districtmenuid"));

    }
    @RequestMapping(value="/districtedit",method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView editDistrict(HttpServletRequest request,@RequestParam int id){
        ModelAndView modelAndView=new ModelAndView();
        int i=id;
        DistrictDTO districtDTO=districtService.getDistrict(id);
        ArrayList<DivisionDTO>data=divisionService.getDivisionData();
        modelAndView.addObject("division",data);
        modelAndView.addObject("district",districtDTO);
        modelAndView.setViewName("geo/district/districtedit");
        String menuid = request.getSession().getAttribute("districtmenuid").toString();
        modelAndView.addObject("menuid",menuid);
        return modelAndView;

    }

    @RequestMapping(value = "editdistrict",method =RequestMethod.POST)
    @ResponseBody
    public RedirectView districtEdit(HttpServletRequest request,@RequestParam int id,@RequestParam String  disnameeng ,@RequestParam String  disnamebng,
                                     @RequestParam String bbscode, @RequestParam int divdata){


        ModelAndView  modelAndView=new ModelAndView();
        DistrictDTO districtDTO=new DistrictDTO();
        districtDTO.setId(id);
        districtDTO.setDistrictNameEng(disnameeng);
        districtDTO.setDistrictNameBng(disnamebng);
        districtDTO.setBbsCode(bbscode);
        districtDTO.setDivisionId(divdata);
        districtDTO.setDivisionBBSCode(divisionService.getDivisionService(divdata).getBbsCode());
        districtDTO.setModified(java.sql.Timestamp.from(java.time.Instant.now()));
        districtDTO.setModifiedBy(((Long) request.getSession().getAttribute("employeeId")).intValue());
        districtService.update(districtDTO);



        return new RedirectView("districtlist?menuid="+request.getSession().getAttribute("districtmenuid"));
    }

    @RequestMapping(value="/districtedelete",method = RequestMethod.POST)
    @ResponseBody
    public int deleteDistrict(HttpServletRequest request, @RequestParam int id){
        DistrictDTO districtDTO=new DistrictDTO();
        districtDTO.setId(id);
        districtDTO.setModifiedBy(((Long) request.getSession().getAttribute("employeeId")).intValue());
        districtDTO.setModified(java.sql.Timestamp.from(java.time.Instant.now()));

        return districtService.delete(districtDTO);



    }


    @RequestMapping(value = "getdistrictlistbydivisionids",method = RequestMethod.POST)
    ArrayList<DistrictDTO> getDistrictListByDivisionIds(Principal principal,
    @RequestParam(value = "id[]") int[] ids
    ){
        return districtService.getDistrictListByDivisionIds(ids);
    }

    @RequestMapping(value = "districtupazillaassign", method = RequestMethod.GET)
    ModelAndView districtUpzillaAssign(HttpServletRequest request){
        ModelAndView form = new ModelAndView("geo/district/districtupazillaassign");
        form.addObject("division",divisionService.getDivisionData());
        String menuid = request.getSession().getAttribute("districtmenuid").toString();
        form.addObject("menuid",menuid);
        return form;
    }

    @RequestMapping(value = "assigndistrictupazilla", method = RequestMethod.POST)
    RedirectView assignDistrictUpazilla(HttpServletRequest request, @RequestParam int divdata, @RequestParam(value = "disdata")int target, @RequestParam(value = "parentid[]")int[] districtIds,@RequestParam(value = "childid[]")String[] childIds){


        ArrayList<Integer> thanaIds = new ArrayList<>();
        ArrayList<Integer> upazillaIds = new ArrayList<>();
        ArrayList<Integer> disIds = new ArrayList<>();
        for(int i=0;i<childIds.length;i++){
            String content = childIds[i];
            String[] splited = content.split(":");
            int geotype = Integer.parseInt(splited[2]);
            int id = Integer.parseInt(splited[1]);
            if(geotype == 5 )thanaIds.add(id);
            else if(geotype ==3 )upazillaIds.add(id);
        }
        for(int i=0;i<districtIds.length;i++){

            disIds.add(districtIds[i]);
        }
        districtService.changeUpazilla(target,1,upazillaIds,disIds,3,3);
        districtService.changeThana(target,1,thanaIds,disIds,5,5);
        return new RedirectView("districtlist?menuid="+request.getSession().getAttribute("districtmenuid"));
    }

    @RequestMapping(value = "districtthanaassign", method = RequestMethod.GET)
    ModelAndView districtThanaAssign(HttpServletRequest request){
        ModelAndView form = new ModelAndView("geo/district/districtthanaassign");
        form.addObject("division",divisionService.getDivisionData());
        String menuid = request.getSession().getAttribute("districtmenuid").toString();
        form.addObject("menuid",menuid);
        return form;
    }

    @RequestMapping(value = "assigndistrictthana", method = RequestMethod.POST)
    RedirectView assignDistrictThana(HttpServletRequest request, @RequestParam int divdata, @RequestParam(value = "disdata")int target, @RequestParam(value = "parentid[]")int[] districtIds,@RequestParam(value = "childid[]")String[] childIds){


        ArrayList<Integer> thanaIds = new ArrayList<>();
        ArrayList<Integer> upazillaIds = new ArrayList<>();
        ArrayList<Integer> disIds = new ArrayList<>();
        for(int i=0;i<childIds.length;i++){
            String content = childIds[i];
            String[] splited = content.split(":");
            int geotype = Integer.parseInt(splited[2]);
            int id = Integer.parseInt(splited[1]);
            if(geotype == 5 )thanaIds.add(id);
            else if(geotype ==3 )upazillaIds.add(id);
        }
        for(int i=0;i<districtIds.length;i++){

            disIds.add(districtIds[i]);
        }
        districtService.changeUpazilla(target,1,upazillaIds,disIds,3,3);
        districtService.changeThana(target,1,thanaIds,disIds,5,5);
        return new RedirectView("districtlist?menuid="+request.getSession().getAttribute("districtmenuid"));
    }



    @RequestMapping(value = "districthistory",method = RequestMethod.GET)
    ModelAndView districtHistory(HttpServletRequest request,@RequestParam int id, @RequestParam String name){
        ModelAndView form = null;
        form = new ModelAndView("geo/district/districthistory");
        form.addObject("id",id);
        form.addObject("name",name);
        String menuid = request.getSession().getAttribute("districtmenuid").toString();
        form.addObject("menuid",menuid);
        return form;
    }

    @RequestMapping(value = "historydistrict",method = RequestMethod.GET)
    JSONObject historyDistrict(@RequestParam int id){
        JSONObject js  = new JSONObject();
        js.put("cc",historyService.currentChain(id,2));
        js.put("cd",historyService.getChildDetail(id,2));
        js.put("pd",historyService.getParentDetail(id,2));
        return js;
    }



}
