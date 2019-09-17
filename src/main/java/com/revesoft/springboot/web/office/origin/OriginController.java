package com.revesoft.springboot.web.office.origin;

import com.revesoft.springboot.web.office.layer.LayerService;
import com.revesoft.springboot.web.office.ministry.MinistryService;
import org.jose4j.json.internal.json_simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;
import java.util.ArrayList;

/**
 * Created by Bony on 11/12/2017.
 */
@RestController
public class OriginController {

    @Autowired
    OriginService originService;
    @Autowired
    MinistryService ministryService;
    @Autowired
    LayerService layerService;

    @RequestMapping(path = "originlistdata")
    public ArrayList<OriginDTO> getOrigins(){
        return originService.getAll();
    }




    @RequestMapping(path = "jofficeoriginlistdatabyministryid")
    public ArrayList<JSONObject> jOfficeOriginListDatabyMinistryid(@RequestParam int id){

        return originService.jOfficeOriginListDatabyMinistryid(id);
    }


    @RequestMapping(path = "originbyministry")
    public ArrayList<OriginDTO> originbyMinistry(@RequestParam int ministryid){

        return originService.originbyMinistry(ministryid);
    }

    @RequestMapping(value = "originlist", method = RequestMethod.GET)
    public ModelAndView originList(HttpServletRequest request, @RequestParam int menuid) {

        ModelAndView originList = new ModelAndView("office/origin/originlist");
        originList.addObject("menuid",menuid);
        request.getSession().setAttribute("originmenuid",menuid);
        return originList;
    }


    @RequestMapping(value = "originpagedata", method = RequestMethod.GET)
    @ResponseBody
    JSONObject originPageData() {
        ArrayList<OriginDTO> originDTOS = originService.getAll();

        JSONObject obj = new JSONObject();
        obj.put("iTotalRecords", originDTOS.size());
        obj.put("iTotalDisplayRecords", originDTOS.size());
        obj.put("aaData", originDTOS);
        return obj;
    }

    @RequestMapping(value = "originadd", method = RequestMethod.GET)
    ModelAndView originAdd (HttpServletRequest request){
        ModelAndView originAdd = new ModelAndView("office/origin/originadd");
        String menuid = request.getSession().getAttribute("originmenuid").toString();
        originAdd.addObject("ministry",ministryService.getAll());
        originAdd.addObject("menuid",menuid);
        return originAdd;
    }
    @RequestMapping(value = "addorigin",method = RequestMethod.POST)
    RedirectView addOrigin(HttpServletRequest request, Principal principal,
                           @RequestParam String officeoriginnameeng,
                           @RequestParam String officeoriginnamebng,
                           @RequestParam int officeoriginlevel,
                           @RequestParam int officeoriginsequence,
                           @RequestParam int ministrydata,
                           @RequestParam int layerdata,
                           @RequestParam int superiordata){
        OriginDTO originDTO = new OriginDTO();
        originDTO.setOfficeMinistryId(ministrydata);
        originDTO.setOfficeLayerId(layerdata);
        originDTO.setOfficeNameEng(officeoriginnameeng);
        originDTO.setOfficeNameBng(officeoriginnamebng);
        originDTO.setOfficeLevel(officeoriginlevel);
        originDTO.setOfficeSequence(officeoriginsequence);
        originDTO.setParentOfficeId(superiordata);
        originDTO.setCreatedBy(((Long) request.getSession().getAttribute("employeeId")).intValue());
        originDTO.setCreated(java.sql.Timestamp.from(java.time.Instant.now()));
        originService.addOrigin(originDTO);
        RedirectView rd=new RedirectView("originlist?menuid="+request.getSession().getAttribute("originmenuid"));
        return rd;

    }

    @RequestMapping(value = "originedit",method = RequestMethod.POST)
    ModelAndView originEdit (HttpServletRequest request,
                             @RequestParam int id,
                             @RequestParam String officeoriginnameeng,
                             @RequestParam String officeoriginnamebng,
                             @RequestParam int officeoriginlevel,
                             @RequestParam int officeoriginsequence,
                             @RequestParam int officeoriginsuperior,
                             @RequestParam int ministrydata,
                             @RequestParam int layerdata){
        ModelAndView originEdit = new ModelAndView("office/origin/originedit");

        String menuid = request.getSession().getAttribute("originmenuid").toString();
        OriginDTO originDTO = new OriginDTO();
        originDTO.setId(id);
        originDTO.setOfficeMinistryId(ministrydata);
        originDTO.setOfficeLayerId(layerdata);
        originDTO.setOfficeNameEng(officeoriginnameeng);
        originDTO.setOfficeNameBng(officeoriginnamebng);
        originDTO.setOfficeLevel(officeoriginlevel);
        originDTO.setOfficeSequence(officeoriginsequence);
        originDTO.setParentOfficeId(officeoriginsuperior);
        originEdit.addObject("origin", originDTO);
        originEdit.addObject("ministry",ministryService.getAll());
        originEdit.addObject("layer",layerService.getLayersByMinistries(ministrydata));
        originEdit.addObject("origins",originService.originbyMinistry(ministrydata));
        originEdit.addObject("menuid",menuid);
        return  originEdit;
    }

    @RequestMapping(value = "editorigin",method = RequestMethod.POST)
    RedirectView editOrigin (HttpServletRequest request, Principal principal,
                             @RequestParam int id,
                             @RequestParam String officeoriginnameeng,
                             @RequestParam String officeoriginnamebng,
                             @RequestParam int officeoriginlevel,
                             @RequestParam int officeoriginsequence,
                             @RequestParam int ministrydata,
                             @RequestParam int layerdata,
                             @RequestParam int superiordata){

        OriginDTO originDTO = new OriginDTO();
        originDTO.setId(id);
        originDTO.setOfficeMinistryId(ministrydata);
        originDTO.setOfficeLayerId(layerdata);
        originDTO.setOfficeNameEng(officeoriginnameeng);
        originDTO.setOfficeNameBng(officeoriginnamebng);
        originDTO.setOfficeLevel(officeoriginlevel);
        originDTO.setOfficeSequence(officeoriginsequence);
        originDTO.setParentOfficeId(superiordata);
        originDTO.setModifiedBy(((Long) request.getSession().getAttribute("employeeId")).intValue());
        originDTO.setModified(java.sql.Timestamp.from(java.time.Instant.now()));

        originService.editOrigin(originDTO);
        RedirectView rd=new RedirectView("originlist?menuid="+request.getSession().getAttribute("originmenuid"));
        return rd;
    }

    @RequestMapping(value = "origindelete",method = RequestMethod.POST)
    int originDelete (HttpServletRequest request,
                         @RequestParam int id
    ) {

        OriginDTO originDTO = new OriginDTO();
        originDTO.setId(id);
        originDTO.setModifiedBy(((Long) request.getSession().getAttribute("employeeId")).intValue());
        originDTO.setModified(java.sql.Timestamp.from(java.time.Instant.now()));
      return   originService.originDelete(originDTO);

    }

    @RequestMapping(value = "origindetail",method = RequestMethod.POST)
    ModelAndView originDetail (HttpServletRequest request,
                             @RequestParam int id,
                             @RequestParam String officeoriginnameeng,
                             @RequestParam String officeoriginnamebng,
                             @RequestParam int officeoriginlevel,
                             @RequestParam int officeoriginsequence,
                             @RequestParam int officeoriginsuperior,
                             @RequestParam int ministrydata,
                             @RequestParam int layerdata){
        ModelAndView originEdit = new ModelAndView("office/origin/origindetail");
        String menuid = request.getSession().getAttribute("originmenuid").toString();
        OriginDTO originDTO = new OriginDTO();
        originDTO.setId(id);
        originDTO.setOfficeMinistryId(ministrydata);
        originDTO.setOfficeLayerId(layerdata);
        originDTO.setOfficeNameEng(officeoriginnameeng);
        originDTO.setOfficeNameBng(officeoriginnamebng);
        originDTO.setOfficeLevel(officeoriginlevel);
        originDTO.setOfficeSequence(officeoriginsequence);
        originDTO.setParentOfficeId(officeoriginsuperior);
        originEdit.addObject("origin", originDTO);
        originEdit.addObject("ministry",ministryService.getAll());
        originEdit.addObject("layer",layerService.getLayersByMinistries(ministrydata));
        originEdit.addObject("origins",originService.originbyMinistry(ministrydata));
        originEdit.addObject("menuid",menuid);
        return  originEdit;
    }

    @RequestMapping(path = "originsbylayer")
    public ArrayList<OriginDTO> getOrigins(@RequestParam int id){
        return originService.getAll(id);
    }

    @RequestMapping(value = "officeoriginroot", method = RequestMethod.POST)
    public JSONObject officeRoot(Principal principal, @RequestParam int id){
        JSONObject js = new JSONObject();
        js.put("id","originroot-"+id);
        js.put("icon","fa fa-tree");
        js.put("children",true);
        return js;
    }
    
    
}
