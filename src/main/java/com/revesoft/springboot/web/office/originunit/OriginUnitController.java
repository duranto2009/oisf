package com.revesoft.springboot.web.office.originunit;

import com.revesoft.springboot.web.office.layer.LayerService;
import com.revesoft.springboot.web.office.ministry.MinistryService;
import com.revesoft.springboot.web.office.officeunit.OfficeUnitService;
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
public class OriginUnitController {

    @Autowired
    MinistryService ministryService;
    @Autowired
    OriginUnitService originUnitService;
    @Autowired
    OfficeUnitService officeUnitService;

    @RequestMapping(value = "getofficeoriginunitlistbyofficeoriginid", method = RequestMethod.POST)
    @ResponseBody
    ArrayList<OriginUnitDTO> getOfficeOriginUnitListByOfficeOriginId(Principal principal, @RequestParam int id){
        ArrayList<OriginUnitDTO> originUnitDTOS = null;
            OriginUnitService originUnitService = new OriginUnitService();
            originUnitDTOS = originUnitService.getOfficeOriginUnitListByOfficeOriginId(id);
        return originUnitDTOS;
    }

    @RequestMapping(value = "getofficeoriginunitlistforjstreebyofficeoriginid", method = RequestMethod.POST)
    @ResponseBody
    ArrayList<JSONObject> getOfficeOriginUnitListForJsTreeByOfficeOriginId(Principal principal, @RequestParam int id, @RequestParam String li_attr, @RequestParam String a_attr){
        ArrayList<JSONObject> officeOriginUnitDTOS = null;
        OriginUnitService originUnitService = new OriginUnitService();
        officeOriginUnitDTOS = originUnitService.getOfficeOriginUnitListForJsTreeByOfficeOriginId(id,li_attr,a_attr);

        return officeOriginUnitDTOS;
    }

    @RequestMapping(value = "originunitlist")
    ModelAndView originUnitList(HttpServletRequest request, @RequestParam int menuid){
        ModelAndView originUnitList = new ModelAndView("office/originunit/originunitlist");
        originUnitList.addObject("ministry",ministryService.getAll());
        originUnitList.addObject("menuid",menuid);
        request.getSession().setAttribute("originunitmenuid",menuid);
        return originUnitList;
    }

    @RequestMapping(value = "originunitlistla")
    ModelAndView originUnitListByLocalAdmin(HttpServletRequest request, @RequestParam int menuid){
        ModelAndView originUnitList = new ModelAndView("office/originunit/originunitlistla");

        int officeId = (Integer) request.getSession().getAttribute("officeId");
        int originId = officeUnitService.originIdByofficeId(officeId);

        originUnitList.addObject("ministry",ministryService.getAll());
        originUnitList.addObject("menuid",menuid);
        originUnitList.addObject("originId",originId);
        originUnitList.addObject("officeId",officeId);
//        request.getSession().setAttribute("originunitmenuid",menuid);
        return originUnitList;
    }


    @RequestMapping(value = "originunitsbyorigin")
    @ResponseBody
    ArrayList<OriginUnitDTO> originUnitbyOrigin( @RequestParam int id){

        return  originUnitService.originUnitsbyOrigin(id);

    }


    @RequestMapping(value = "joriginunitbyoriginid", method = RequestMethod.POST)
    @ResponseBody
    ArrayList<JSONObject> jOriginUnitbyOriginid( @RequestParam int id){

        return  originUnitService.jOriginUnitbyOriginid(id);

    }



    @RequestMapping(value = "addoriginunit")
    int addOriginUnit(HttpServletRequest request,
                      @RequestParam int ministryid,
                      @RequestParam int layerid,
                      @RequestParam int originid,
                      @RequestParam int unitlevel,
                      @RequestParam int parentunitid,
                      @RequestParam String officecategory,
                      @RequestParam String originunitbng,
                      @RequestParam String originuniteng){

        OriginUnitDTO originUnitDTO = new OriginUnitDTO();
        originUnitDTO.setOfficeMinistryId(ministryid);
        originUnitDTO.setOfficeLayerId(layerid);
        originUnitDTO.setOfficeOriginId(originid);
        originUnitDTO.setOfficeUnitCategory(officecategory);
        originUnitDTO.setUnitLevel(unitlevel);
        originUnitDTO.setParentUnitId(parentunitid);
        originUnitDTO.setUnitNameBng(originunitbng);
        originUnitDTO.setUnitNameEng(originuniteng);
        originUnitDTO.setCreatedBy(((Long) request.getSession().getAttribute("employeeId")).intValue());
        originUnitDTO.setCreated(java.sql.Timestamp.from(java.time.Instant.now()));


        return  originUnitService.add(originUnitDTO);
    }

    @RequestMapping(value = "editoriginunit")
    int editOriginUnit(HttpServletRequest request,
                       @RequestParam int id,
                       @RequestParam int unitlevel,
                       @RequestParam int parentunitid,
                       @RequestParam String officecategory,
                       @RequestParam String originunitbng,
                       @RequestParam String originuniteng){

        OriginUnitDTO originUnitDTO = new OriginUnitDTO();
        originUnitDTO.setId(id);
        originUnitDTO.setOfficeUnitCategory(officecategory);
        originUnitDTO.setUnitLevel(unitlevel);
        originUnitDTO.setParentUnitId(parentunitid);
        originUnitDTO.setUnitNameBng(originunitbng);
        originUnitDTO.setUnitNameEng(originuniteng);
        originUnitDTO.setModifiedBy(((Long) request.getSession().getAttribute("employeeId")).intValue());
        originUnitDTO.setModified(java.sql.Timestamp.from(java.time.Instant.now()));
        return originUnitService.edit(originUnitDTO);
    }

    @RequestMapping(value = "deleteoriginunit")
    int deleteOriginUnit(HttpServletRequest request,@RequestParam int id){

        OriginUnitDTO originUnitDTO = new OriginUnitDTO();
        originUnitDTO.setId(id);
        originUnitDTO.setModifiedBy(((Long) request.getSession().getAttribute("employeeId")).intValue());
        originUnitDTO.setModified(java.sql.Timestamp.from(java.time.Instant.now()));
        return originUnitService.delete(originUnitDTO);
    }
}
