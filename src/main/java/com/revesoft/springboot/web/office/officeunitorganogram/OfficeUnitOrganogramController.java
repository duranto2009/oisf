package com.revesoft.springboot.web.office.officeunitorganogram;

import com.revesoft.springboot.web.office.ministry.MinistryService;
import com.revesoft.springboot.web.office.officeunit.OfficeUnitDTO;
import org.jose4j.json.internal.json_simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;
import java.util.ArrayList;

/**
 * Created by reve on 11/8/2017.
 */
@RestController
public class OfficeUnitOrganogramController {
    @Autowired
    MinistryService ministryService;
    @Autowired
    OfficeUnitOrganogramService officeUnitOrganogramService;

    @RequestMapping(value = "officeorganogramlist")
    ModelAndView officeUnitList(HttpServletRequest request, @RequestParam int menuid){
        ModelAndView modelAndView = new ModelAndView("office/officeunitorganogram_/organogramlist");
        request.getSession().setAttribute("officeunitmenuid",menuid);
        modelAndView.addObject("ministry",ministryService.getAll());
        modelAndView.addObject("menuid",menuid);
        return modelAndView;
    }

    @RequestMapping(value = "officeunitorganogrambyoffice")
    ArrayList<OfficeUnitOrganogramDTO> officeUnitOrganogrambyOffice(@RequestParam int id){
        return officeUnitOrganogramService.officeUnitOrganogrambyOffice(id);
    }

    @RequestMapping( value = "/getofficeunitorganogramlistbyofficeunitid")
    ArrayList<OfficeUnitOrganogramDTO> getofficeunitorganogramlistbyofficeunitid(
            @RequestParam int id
    ){
        return officeUnitOrganogramService.getOfficeUnitOrganogramListByOfficeUnitId(id);
    }



    @RequestMapping(value = "orgbyoriginorg")
    ArrayList<JSONObject> orgbyOriginOrg(@RequestParam int id){
        return officeUnitOrganogramService.orgbyOriginOrg(id);
    }


    @RequestMapping(value = "transferorganogram")
    int transferOrganogram(HttpServletRequest request,@RequestParam(value = "id[]") String[]id,@RequestParam int officeid){
        return  officeUnitOrganogramService.transferOrganogram(id,officeid,((Long) request.getSession().getAttribute("employeeId")).intValue());
    }

    @RequestMapping(value = "deleteorganogramlist" , method = RequestMethod.POST)
    int deleteOrganogramList(HttpServletRequest request,@RequestParam (value = "id[]")int[] id){
        return officeUnitOrganogramService.deleteOrganogramList(id,((Long) request.getSession().getAttribute("employeeId")).intValue());
    }





}
