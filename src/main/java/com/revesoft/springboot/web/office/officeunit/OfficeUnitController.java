package com.revesoft.springboot.web.office.officeunit;

import com.revesoft.springboot.web.office.ministry.MinistryService;
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
public class OfficeUnitController {

    @Autowired
    MinistryService ministryService;
    @Autowired
    OfficeUnitService officeUnitService;

    @RequestMapping(value = "getofficeunitlistbyofficeid", method = RequestMethod.POST)
    @ResponseBody
    ArrayList<OfficeUnitDTO> getOfficeUnitListByOfficeIdPOST(Principal principal, @RequestParam int id){
        ArrayList<OfficeUnitDTO> officeUnitDTOS = null;

            officeUnitDTOS = officeUnitService.getOfficeUnitListByOfficeId(id);
        return officeUnitDTOS;
    }
//
//
//
//    @RequestMapping(value = "getofficeunitlistforjstreebyofficeid", method = RequestMethod.POST)
//    @ResponseBody
//    ArrayList<JSONObject> getOfficeUnitListForJsTreeByOfficeId(Principal principal, @RequestParam int id, @RequestParam String li_attr, @RequestParam String a_attr){
//        ArrayList<JSONObject> officeUnitDTOS = null;
//        officeUnitDTOS = officeUnitService.getOfficeUnitListForJsTreeByOfficeId(id,li_attr,a_attr);
//
//        return officeUnitDTOS;
//    }
    @RequestMapping(value = "officeunitlist")
    ModelAndView officeUnitList(HttpServletRequest request, @RequestParam int menuid){
        ModelAndView modelAndView = new ModelAndView("office/officeunit_/officeunitlist");
        request.getSession().setAttribute("officeunitmenuid",menuid);
        modelAndView.addObject("ministry",ministryService.getAll());
        modelAndView.addObject("menuid",menuid);
        return modelAndView;
    }

    @RequestMapping(value = "officeunitbyoffice")
    ArrayList<OfficeUnitDTO> officeUnitbyOffice(@RequestParam int id){
      return officeUnitService.officeUnitbyOffice(id);
    }

    @RequestMapping(value = "deleteunitlist")
    int deleteUnit(HttpServletRequest request, @RequestParam(value = "id[]") int[] id){
        return officeUnitService.deleteUnit(id,((Long) request.getSession().getAttribute("employeeId")).intValue());
        //return -1;
    }

    @RequestMapping(value = "transferunit")
    int transferUnit(HttpServletRequest request,@RequestParam(value = "id[]") int[]id,@RequestParam int officeid){
        return  officeUnitService.transferUnit(id,officeid,((Long) request.getSession().getAttribute("employeeId")).intValue());
    }


    @RequestMapping(value = "officeunitlistla")
    ModelAndView officeUnitListForLocalAdmin(HttpServletRequest request, @RequestParam int menuid){
        ModelAndView modelAndView = new ModelAndView("office/officeunit_/officeunitlistla");
        request.getSession().setAttribute("officeunitmenuid",menuid);
        int officeId = (Integer) request.getSession().getAttribute("officeId");
        int originId = officeUnitService.originIdByofficeId(officeId);
        modelAndView.addObject("ministry",ministryService.getAll());
        modelAndView.addObject("officeId",officeId);
        modelAndView.addObject("originId",originId);
        return modelAndView;
    }
    @RequestMapping(value = "officeunitlistchangela")
    ModelAndView officeUnitListChangeForLocalAdmin(HttpServletRequest request, @RequestParam int menuid){
        ModelAndView modelAndView = new ModelAndView("office/officeunit_/officeunitlistchangela");
//        request.getSession().setAttribute("officeunitmenuid",menuid);
        int officeId = (Integer) request.getSession().getAttribute("officeId");
        int originId = officeUnitService.originIdByofficeId(officeId);

        modelAndView.addObject("ministry",ministryService.getAll());
        modelAndView.addObject("officeId",officeId);
        modelAndView.addObject("originId",originId);
        modelAndView.addObject("menuid",menuid);

        return modelAndView;
    }

    @RequestMapping(value = "editofficeunit")
    void editOriginUnit(HttpServletRequest request,@RequestParam int id,@RequestParam int unitlevel, @RequestParam int parentunitid, @RequestParam String officecategory, @RequestParam String originunitbng,@RequestParam String originuniteng){
        OfficeUnitDTO officeUnitDTO = new OfficeUnitDTO();
        officeUnitDTO.setId(id);
        officeUnitDTO.setOfficeUnitCategory(officecategory);
        officeUnitDTO.setUnitLevel(unitlevel);
        officeUnitDTO.setParentUnitId(parentunitid);
        officeUnitDTO.setUnitNameBng(originunitbng);
        officeUnitDTO.setUnitNameEng(originuniteng);
        officeUnitDTO.setModifiedBy(((Long) request.getSession().getAttribute("employeeId")).intValue());
        officeUnitDTO.setModified(java.sql.Timestamp.from(java.time.Instant.now()));
        officeUnitService.edit(officeUnitDTO);
    }


}
