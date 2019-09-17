package com.revesoft.springboot.web.office.ministry;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;
import java.util.ArrayList;

/**
 * Created by Bony on 11/5/2017.
 */
@RestController
public class MinistryController {

    @Autowired
    MinistryService ministryService;

    @RequestMapping(path = "ministrylistdata")
    public ArrayList<MinistryDTO> getMinistries(){
        return ministryService.getAll();
    }

    @RequestMapping(path = "jministrylistdata")
    public ArrayList<JSONObject> jMinistryListData(){
        return ministryService.jMinistryListData();
    }

    @RequestMapping(value = "ministrylist", method = RequestMethod.GET)
    public ModelAndView ministryList(HttpServletRequest request, @RequestParam int menuid) {

        ModelAndView ministryList = new ModelAndView("office/ministry/ministrylist");
        ministryList.addObject("menuid",menuid);
        request.getSession().setAttribute("ministrymenuid",menuid);
        return ministryList;
    }


    @RequestMapping(value = "ministrypagedata", method = RequestMethod.GET)
    @ResponseBody
    JSONObject ministryPageData() {
        ArrayList<MinistryDTO> ministryDTOS = ministryService.getAll();

        JSONObject obj = new JSONObject();
        obj.put("iTotalRecords", ministryDTOS.size());
        obj.put("iTotalDisplayRecords", ministryDTOS.size());
        obj.put("aaData", ministryDTOS);
        return obj;
    }

    @RequestMapping(value = "ministryadd", method = RequestMethod.GET)
    ModelAndView ministryAdd (){
        ModelAndView ministryAdd = new ModelAndView("office/ministry/ministryadd");
        return ministryAdd;
    }
    @RequestMapping(value = "addministry",method = RequestMethod.POST)
    RedirectView addMinistry(HttpServletRequest request, Principal principal,
                          @RequestParam byte officetype,
                          @RequestParam String officeministrynameeng,
                          @RequestParam String officeministrynamebng,
                          @RequestParam String officeministryengshort,
                          @RequestParam String referencecode){
        MinistryDTO ministryDTO = new MinistryDTO();
        ministryDTO.setOfficeType(officetype);
        ministryDTO.setNameEng(officeministrynameeng);
        ministryDTO.setNameBng(officeministrynamebng);
        ministryDTO.setNameEngShort(officeministryengshort);
        ministryDTO.setReferenceCode(referencecode);
        ministryDTO.setCreatedBy(((Long) request.getSession().getAttribute("employeeId")).intValue());
        ministryDTO.setCreated(java.sql.Timestamp.from(java.time.Instant.now()));
        ministryService.add(ministryDTO);

        RedirectView rd=new RedirectView("ministrylist?menuid="+request.getSession().getAttribute("ministrymenuid"));
        return rd;

    }

    @RequestMapping(value = "ministryedit",method = RequestMethod.POST)
    ModelAndView ministryEdit (Principal principal,
                                @RequestParam int id,
                                @RequestParam byte officetype,
                                @RequestParam String officeministrynameeng,
                                @RequestParam String officeministrynamebng,
                                @RequestParam String officeministryengshort,
                                @RequestParam String referencecode){
        ModelAndView ministryEdit = new ModelAndView("office/ministry/ministryedit");

        MinistryDTO ministryDTO = new MinistryDTO();
        ministryDTO.setId(id);
        ministryDTO.setOfficeType(officetype);
        ministryDTO.setNameEng(officeministrynameeng);
        ministryDTO.setNameBng(officeministrynamebng);
        ministryDTO.setNameEngShort(officeministryengshort);
        ministryDTO.setReferenceCode(referencecode);
        ministryEdit.addObject("officeministry", ministryDTO);
        return  ministryEdit;
    }

    @RequestMapping(value = "editministry",method = RequestMethod.POST)
    RedirectView editMinistry (HttpServletRequest request, Principal principal,
                                         @RequestParam int id,
                                         @RequestParam byte officetype,
                                         @RequestParam String officeministrynameeng,
                                         @RequestParam String officeministrynamebng,
                                         @RequestParam String officeministryengshort,
                                         @RequestParam String referencecode){

        MinistryDTO ministryDTO = new MinistryDTO();
        ministryDTO.setId(id);
        ministryDTO.setOfficeType(officetype);
        ministryDTO.setNameEng(officeministrynameeng);
        ministryDTO.setNameBng(officeministrynamebng);
        ministryDTO.setNameEngShort(officeministryengshort);
        ministryDTO.setReferenceCode(referencecode);
        ministryDTO.setModifiedBy(((Long) request.getSession().getAttribute("employeeId")).intValue());
        ministryDTO.setModified(java.sql.Timestamp.from(java.time.Instant.now()));
        ministryService.edit(ministryDTO);
        RedirectView rd=new RedirectView("ministrylist?menuid="+request.getSession().getAttribute("ministrymenuid"));
        return rd;
    }

    @RequestMapping(value = "ministrydelete",method = RequestMethod.POST)
    int ministryDelete (HttpServletRequest request,
                                       @RequestParam int id
    ) {

        MinistryDTO ministryDTO = new MinistryDTO();
        ministryDTO.setId(id);
        ministryDTO.setModifiedBy(((Long) request.getSession().getAttribute("employeeId")).intValue());
        ministryDTO.setModified(java.sql.Timestamp.from(java.time.Instant.now()));
        return ministryService.delete(ministryDTO);

    }
}
