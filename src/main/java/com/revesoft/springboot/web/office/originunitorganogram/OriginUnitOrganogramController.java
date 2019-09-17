package com.revesoft.springboot.web.office.originunitorganogram;

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
public class OriginUnitOrganogramController {

    @Autowired
    MinistryService ministryService;
    @Autowired
    OriginUnitOrganogramService originUnitOrganogramService;

    @RequestMapping(value = "getofficeoriginunitorganogramlistbyofficeoriginunitid", method = RequestMethod.POST)
    @ResponseBody
    ArrayList<OriginUnitOrganogramDTO> getOfficeOriginUnitOrganogramListByOfficeOriginUnitId(Principal principal, @RequestParam int id){
        ArrayList<OriginUnitOrganogramDTO> originUnitOrganogramDTOS = null;
        OriginUnitOrganogramService originUnitOrganogramService = new OriginUnitOrganogramService();
        originUnitOrganogramDTOS = originUnitOrganogramService.getOfficeOriginUnitOrganogramListByOfficeOriginUnitId(id);
        return originUnitOrganogramDTOS;
    }

//    @RequestMapping(value = "getofficeoriginunitlistforjstreebyofficeoriginunitid", method = RequestMethod.POST)
//    @ResponseBody
//    ArrayList<JSONObject> getOfficeOriginUnitOrganogramListForJsTreeByOfficeOriginUnitId(Principal principal, @RequestParam int id, @RequestParam String li_attr, @RequestParam String a_attr){
//        ArrayList<JSONObject> officeOriginUnitOrganogramDTOS = null;
//        OriginUnitOrganogramService originUnitOrganogramService = new OriginUnitOrganogramService();
//        officeOriginUnitOrganogramDTOS = originUnitOrganogramService.getOfficeOriginUnitOrganogramListForJsTreeByOfficeOriginUnitId(id,li_attr,a_attr);
//
//        return officeOriginUnitOrganogramDTOS;
//    }
    @RequestMapping(value = "originunitorganogramlist")
    ModelAndView originUnitOrganogramList(HttpServletRequest request, @RequestParam int menuid){
        ModelAndView originUnitOrganogramList = new ModelAndView("office/originunitorganogram/originunitorganogramlist");
        originUnitOrganogramList.addObject("ministry",ministryService.getAll());
        originUnitOrganogramList.addObject("menuid",menuid);
        request.getSession().setAttribute("originunitorganogrammenuid",menuid);
        return originUnitOrganogramList;
    }


    @RequestMapping(value = "originunitorganogramsbyoriginunits", method = RequestMethod.GET)
    @ResponseBody
    ArrayList<OriginUnitOrganogramDTO> originUnitOrganogramsbyOriginUnits( @RequestParam(value = "ids[]") int[] ids){
        ArrayList<OriginUnitOrganogramDTO> originUnitOrganogramDTOS = null;
       originUnitOrganogramDTOS = originUnitOrganogramService.originUnitOrganogramsbyOriginUnits(ids);
       return originUnitOrganogramDTOS;
    }

    @RequestMapping(value = "joriginorgbyoriginunit", method = RequestMethod.POST)
    @ResponseBody
    ArrayList<JSONObject> jOriginOrgbyOriginUnit( @RequestParam int id){
        return originUnitOrganogramService.jOriginOrgbyOriginUnit(id);
    }

    @RequestMapping(value = "addoriginunitorganogram")
    int addOriginUnitOrganogram(HttpServletRequest request, @RequestParam int officeoriginunitid,
                                 @RequestParam int superiorunitid,
                                 @RequestParam int superiordesignationid,
                                 @RequestParam String designationeng,
                                 @RequestParam String designationbng,
                                 @RequestParam String shortnameeng,
                                 @RequestParam String shortnamebng,
                                 @RequestParam int designationlevel,
                                 @RequestParam int designationsequence){

          OriginUnitOrganogramDTO originUnitOrganogramDTO = new OriginUnitOrganogramDTO();
          originUnitOrganogramDTO.setOfficeOriginUnitId(officeoriginunitid);
          originUnitOrganogramDTO.setSuperiorUnitId(superiorunitid);
          originUnitOrganogramDTO.setSuperiorDesignationId(superiordesignationid);
          originUnitOrganogramDTO.setDesignationEng(designationeng);
          originUnitOrganogramDTO.setDesignationBng(designationbng);
          originUnitOrganogramDTO.setShortNameEng(shortnameeng);
          originUnitOrganogramDTO.setShortNameBng(shortnamebng);
          originUnitOrganogramDTO.setDesignationLevel(designationlevel);
          originUnitOrganogramDTO.setDesignationSequence(designationsequence);
          originUnitOrganogramDTO.setCreatedBy(((Long) request.getSession().getAttribute("employeeId")).intValue());
          originUnitOrganogramDTO.setCreated(java.sql.Timestamp.from(java.time.Instant.now()));
          return originUnitOrganogramService.add(originUnitOrganogramDTO);
    }

    @RequestMapping(value = "editoriginunitorganogram")
    int editOriginUnitOrganogram(HttpServletRequest request,@RequestParam int id,
                                  @RequestParam int officeoriginunitid,
                                  @RequestParam int superiorunitid,
                                  @RequestParam int superiordesignationid,
                                  @RequestParam String designationeng,
                                  @RequestParam String designationbng,
                                  @RequestParam String shortnameeng,
                                  @RequestParam String shortnamebng,
                                  @RequestParam int designationlevel,
                                  @RequestParam int designationsequence){

        OriginUnitOrganogramDTO originUnitOrganogramDTO = new OriginUnitOrganogramDTO();
        originUnitOrganogramDTO.setId(id);
        originUnitOrganogramDTO.setOfficeOriginUnitId(officeoriginunitid);
        originUnitOrganogramDTO.setSuperiorUnitId(superiorunitid);
        originUnitOrganogramDTO.setSuperiorDesignationId(superiordesignationid);
        originUnitOrganogramDTO.setDesignationEng(designationeng);
        originUnitOrganogramDTO.setDesignationBng(designationbng);
        originUnitOrganogramDTO.setShortNameEng(shortnameeng);
        originUnitOrganogramDTO.setShortNameBng(shortnamebng);
        originUnitOrganogramDTO.setDesignationLevel(designationlevel);
        originUnitOrganogramDTO.setDesignationSequence(designationsequence);
        originUnitOrganogramDTO.setModifiedBy(((Long) request.getSession().getAttribute("employeeId")).intValue());
        originUnitOrganogramDTO.setModified(java.sql.Timestamp.from(java.time.Instant.now()));

        return originUnitOrganogramService.edit(originUnitOrganogramDTO);
    }

    @RequestMapping(value = "deleteoriginunitorganogram")
    int  deleteOriginUnitOraganogram(HttpServletRequest request,@RequestParam int id){

        OriginUnitOrganogramDTO originUnitOrganogramDTO = new OriginUnitOrganogramDTO();
        originUnitOrganogramDTO.setId(id);
        originUnitOrganogramDTO.setModifiedBy(((Long) request.getSession().getAttribute("employeeId")).intValue());
        originUnitOrganogramDTO.setModified(java.sql.Timestamp.from(java.time.Instant.now()));
        return originUnitOrganogramService.delete(originUnitOrganogramDTO);
    }
}
