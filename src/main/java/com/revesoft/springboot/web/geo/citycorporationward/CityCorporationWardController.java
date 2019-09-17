package com.revesoft.springboot.web.geo.citycorporationward;

import com.revesoft.springboot.web.geo.citycorporation.CityCorporationDTO;
import com.revesoft.springboot.web.geo.citycorporation.CityCorporationService;
import com.revesoft.springboot.web.geo.district.DistrictDTO;
import com.revesoft.springboot.web.geo.district.DistrictService;
import com.revesoft.springboot.web.geo.division.DivisionDTO;
import com.revesoft.springboot.web.geo.division.DivisionService;
import com.revesoft.springboot.web.geo.history.HistoryService;
import com.revesoft.springboot.web.util.Policy;
import org.jose4j.json.internal.json_simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.time.LocalDateTime;
import java.util.ArrayList;

/**
 * Created by Bony on 10/31/2017.
 */
@RestController
public class CityCorporationWardController {

    @Autowired
    DivisionService divisionService;
    @Autowired
    DistrictService districtService;
    @Autowired
    CityCorporationService cityCorporationService;
    @Autowired
    CityCorporationWardService cityCorporationWardService;
    @Autowired
    HistoryService historyService;

    @RequestMapping(path = "wardlist", method = RequestMethod.GET)
    public ArrayList<CityCorporationWardDTO> getList() {
        ArrayList<CityCorporationWardDTO> data = cityCorporationWardService.getAll();
        return data;


    }


    @RequestMapping(path = "wardlistbyid")
    public ArrayList<CityCorporationWardDTO> getListById(@RequestParam int id) {
        ArrayList<CityCorporationWardDTO> data = cityCorporationWardService.getAllById(id);
        return data;


    }

    @RequestMapping(value = "citycorporationwardpagedata", method = RequestMethod.GET)
    @ResponseBody
    JSONObject citycorporationwardPageData(HttpServletRequest request, HttpServletResponse response) {


        ArrayList<CityCorporationWardDTO> cityCorporationWardDTOS = cityCorporationWardService.getAll();
        JSONObject obj=new JSONObject();
        obj.put("iTotalRecords",cityCorporationWardDTOS.size());
        obj.put("iTotalDisplayRecords",cityCorporationWardDTOS.size());
        obj.put("aaData",cityCorporationWardDTOS);
        return obj;
    }


    @RequestMapping(value = "citycorporationwardlist", method = RequestMethod.GET)
    public ModelAndView citycorporationWardList(HttpServletRequest request, @RequestParam int menuid) {
        ModelAndView citycorporationWardList = new ModelAndView("geo/citycorporationward/citycorporationwardlist");
        citycorporationWardList.addObject("menuid",menuid);
        request.getSession().setAttribute("citycorporationwardmenuid",menuid);
        return citycorporationWardList;
    }

    @RequestMapping(value = "citycorporationwardadd", method = RequestMethod.GET)
    public ModelAndView citycorporationWardAdd(HttpServletRequest request) {
        String menuid = request.getSession().getAttribute("citycorporationwardmenuid").toString();
        ModelAndView citycorporationWardAdd = new ModelAndView("geo/citycorporationward/citycorporationwardadd");
        ArrayList<DivisionDTO> data = divisionService.getDivisionData();
        citycorporationWardAdd.addObject("division", data);
        citycorporationWardAdd.addObject("menuid",menuid);
        return citycorporationWardAdd;
    }

    @RequestMapping(value = "addcitycorporationward", method = RequestMethod.POST)
    @ResponseBody
    public RedirectView addCityCorporationWard(HttpServletRequest request, @RequestParam String wardnameeng, @RequestParam String wardnamebng, @RequestParam String bbscode, @RequestParam int divdata, @RequestParam int disdata,
                                @RequestParam int citydata, @RequestParam String divisionbbscode, @RequestParam String districtbbscode, @RequestParam String citybbscode
                               ) {

        CityCorporationWardDTO cityCorporationWardDTO = new CityCorporationWardDTO();
        cityCorporationWardDTO.setDivisionId(divdata);
        cityCorporationWardDTO.setDistrictId(disdata);
        cityCorporationWardDTO.setCityCorporationId(citydata);
        cityCorporationWardDTO.setNameEng(wardnameeng);
        cityCorporationWardDTO.setNameBng(wardnamebng);
        cityCorporationWardDTO.setBbsCode(bbscode);
        cityCorporationWardDTO.setStatus(1);
        cityCorporationWardDTO.setDivisionBbsCode(divisionbbscode);
        cityCorporationWardDTO.setDistrictBbsCode(districtbbscode);
        cityCorporationWardDTO.setCityCorporationBbsCode(citybbscode);
        cityCorporationWardDTO.setCreatedBy(((Long) request.getSession().getAttribute("employeeId")).intValue());
        cityCorporationWardDTO.setCreated(java.sql.Timestamp.from(java.time.Instant.now()));

        cityCorporationWardService.addWardService(cityCorporationWardDTO);

        RedirectView rd=new RedirectView("citycorporationwardlist?menuid="+request.getSession().getAttribute("citycorporationwardmenuid"));
        return rd;


    }

    @RequestMapping(value = "citycorporationwardedit", method = RequestMethod.POST)
    public ModelAndView cityCorporationWardEdit(@RequestParam int id,@RequestParam String wardnameeng, @RequestParam String wardnamebng, @RequestParam String bbscode, @RequestParam int divdata, @RequestParam int disdata,
                                 @RequestParam int citydata, @RequestParam String divisionbbscode, @RequestParam String districtbbscode, @RequestParam String citybbscode,
                                 @RequestParam int status,HttpServletRequest request){
        ModelAndView modelAndView=new ModelAndView("geo/citycorporationward/citycorporationwordedit");
        String menuid = request.getSession().getAttribute("citycorporationwardmenuid").toString();
        ArrayList<DivisionDTO>data=divisionService.getDivisionData();
        modelAndView.addObject("division",data);


        ArrayList<DistrictDTO> dis=districtService.getDivWiseDistrictCity(divdata);

        modelAndView.addObject("district",dis);


        ArrayList<CityCorporationDTO> city =cityCorporationService.getDisWiseCity(disdata);
        modelAndView.addObject("city",city);



        CityCorporationWardDTO cityCorporationWardDTO = new CityCorporationWardDTO();
        cityCorporationWardDTO.setId(id);
        cityCorporationWardDTO.setDivisionId(divdata);
        cityCorporationWardDTO.setDistrictId(disdata);
        cityCorporationWardDTO.setCityCorporationId(citydata);
        cityCorporationWardDTO.setNameEng(wardnameeng);
        cityCorporationWardDTO.setNameBng(wardnamebng);
        cityCorporationWardDTO.setBbsCode(bbscode);
        cityCorporationWardDTO.setStatus(status);
        cityCorporationWardDTO.setDivisionBbsCode(divisionbbscode);
        cityCorporationWardDTO.setDistrictBbsCode(districtbbscode);
        cityCorporationWardDTO.setCityCorporationBbsCode(citybbscode);

        modelAndView.addObject("ward",cityCorporationWardDTO);
        modelAndView.addObject("menuid",menuid);

        return modelAndView;
    }
    @RequestMapping(value = "editcitycorporationward" ,method = RequestMethod.POST)
    public RedirectView editCityCorporationWard(HttpServletRequest request, @RequestParam int id,@RequestParam String wardnameeng, @RequestParam String wardnamebng, @RequestParam String bbscode, @RequestParam int divdata, @RequestParam int disdata,
                                   @RequestParam int citydata, @RequestParam String divisionbbscode, @RequestParam String districtbbscode, @RequestParam String citybbscode
                                   )
    {

        CityCorporationWardDTO cityCorporationWardDTO = new CityCorporationWardDTO();
        cityCorporationWardDTO.setId(id);
        cityCorporationWardDTO.setDivisionId(divdata);
        cityCorporationWardDTO.setDistrictId(disdata);
        cityCorporationWardDTO.setCityCorporationId(citydata);
        cityCorporationWardDTO.setNameEng(wardnameeng);
        cityCorporationWardDTO.setNameBng(wardnamebng);
        cityCorporationWardDTO.setBbsCode(bbscode);
        cityCorporationWardDTO.setDivisionBbsCode(divisionbbscode);
        cityCorporationWardDTO.setDistrictBbsCode(districtbbscode);
        cityCorporationWardDTO.setCityCorporationBbsCode(citybbscode);
        cityCorporationWardDTO.setModifiedBy(((Long) request.getSession().getAttribute("employeeId")).intValue());
        cityCorporationWardDTO.setModified(java.sql.Timestamp.from(java.time.Instant.now()));

        cityCorporationWardService.updateWardService(cityCorporationWardDTO);


        RedirectView rd=new RedirectView("citycorporationwardlist?menuid="+request.getSession().getAttribute("citycorporationwardmenuid"));
        return rd;


    }

    @RequestMapping(value = "citycorporationwarddelete",method = RequestMethod.POST)
    public int citycorporationwarDelete(HttpServletRequest request,@RequestParam int id){

        CityCorporationWardDTO cityCorporationWardDTO=new CityCorporationWardDTO();
        cityCorporationWardDTO.setId(id);
        cityCorporationWardDTO.setModifiedBy(((Long) request.getSession().getAttribute("employeeId")).intValue());
        cityCorporationWardDTO.setModified(java.sql.Timestamp.from(java.time.Instant.now()));
        return cityCorporationWardService.deleteWardService(cityCorporationWardDTO);


    }

    @RequestMapping(value = "citycorporationwardhistory",method = RequestMethod.GET)
    ModelAndView citycorporationwardHistory(HttpServletRequest request,@RequestParam int id, @RequestParam String name){
        ModelAndView form = null;
        form = new ModelAndView("geo/citycorporationward/citycorporationwardhistory");
        String menuid = request.getSession().getAttribute("citycorporationwardmenuid").toString();
        form.addObject("id",id);
        form.addObject("name",name);
        form.addObject("menuid",menuid);
        return form;
    }

    @RequestMapping(value = "historycitycorporationward",method = RequestMethod.GET)
    JSONObject historyCitycorporationward(@RequestParam int id){

        JSONObject js  = new JSONObject();
        js.put("cc",historyService.currentChain(id, Policy.CITY_WARD_TYPE));
        return js;
    }
}
