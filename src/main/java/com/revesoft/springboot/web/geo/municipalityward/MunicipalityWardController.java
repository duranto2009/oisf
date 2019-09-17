package com.revesoft.springboot.web.geo.municipalityward;

import com.revesoft.springboot.web.geo.district.DistrictDTO;
import com.revesoft.springboot.web.geo.district.DistrictService;
import com.revesoft.springboot.web.geo.division.DivisionDTO;
import com.revesoft.springboot.web.geo.division.DivisionService;
import com.revesoft.springboot.web.geo.history.HistoryService;
import com.revesoft.springboot.web.geo.municipality.MunicipalityDTO;
import com.revesoft.springboot.web.geo.municipality.MunicipalityService;
import com.revesoft.springboot.web.geo.upazilla.UpazillaDTO;
import com.revesoft.springboot.web.geo.upazilla.UpazillaService;
import com.revesoft.springboot.web.util.Policy;
import org.jose4j.json.internal.json_simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.security.Principal;
import java.util.ArrayList;

/**
 * Created by reve on 10/31/2017.
 */
@RestController
public class MunicipalityWardController {
    @Autowired
    DivisionService divisionService;
    @Autowired
    DistrictService districtService;
    @Autowired
    UpazillaService upazillaService;
    @Autowired
    MunicipalityService municipalityService;
    @Autowired
    MunicipalityWardService municipalityWardService;
    @Autowired
    HistoryService historyService;

    @RequestMapping(value = "municipalitywardlist", method = RequestMethod.GET)
    public ModelAndView municipalitywardList(HttpServletRequest request, @RequestParam int menuid) {

        ModelAndView municipalitywardList = new ModelAndView("geo/municipalityward/municipalitywardlist");
        municipalitywardList.addObject("menuid",menuid);
        request.getSession().setAttribute("municipalitywardmenuid",menuid);
        return municipalitywardList;
    }


    @RequestMapping(value = "municipalitywardpagedata", method = RequestMethod.GET)
    @ResponseBody
    JSONObject municipalitywardPage(HttpServletRequest request, HttpServletResponse response) {

        ArrayList<MunicipalityWardDTO> municipalityWardDAOS = municipalityWardService.getMunicipalityWardList();
        JSONObject obj=new JSONObject();
        obj.put("iTotalRecords",municipalityWardDAOS.size());
        obj.put("iTotalDisplayRecords",municipalityWardDAOS.size());
        obj.put("aaData",municipalityWardDAOS);
        return obj;


    }

    @RequestMapping(value = "municipalitywardadd", method = RequestMethod.GET)
    ModelAndView municipalityWardAdd (HttpServletRequest request){
        ModelAndView addMunicipalityWardForm = new ModelAndView("geo/municipalityward/municipalitywardadd");
        ArrayList<DivisionDTO>divisionList=divisionService.getDivisionData();
        addMunicipalityWardForm.addObject("division", divisionList);
        String menuid = request.getSession().getAttribute("municipalitywardmenuid").toString();
        addMunicipalityWardForm.addObject("menuid",menuid);
        return addMunicipalityWardForm;
    }
    @RequestMapping(value = "addmunicipalityward",method = RequestMethod.POST)
    RedirectView addMunicipalityWard(HttpServletRequest request, Principal principal, @RequestParam String municipalitywardnameeng,
                                 @RequestParam String municipalitywardnamebng,
                                 @RequestParam String municipalitywardbbscode,
                                 @RequestParam String divisionbbscode,
                                 @RequestParam String districtbbscode,
                                 @RequestParam String upazillabbscode,
                                 @RequestParam String municipalitybbscode,
                                 @RequestParam int divdata,
                                 @RequestParam int disdata,
                                 @RequestParam int upadata,
                                 @RequestParam int mundata   ){
        MunicipalityWardDTO municipalityward = new MunicipalityWardDTO();
        municipalityward.setWardNameEng(municipalitywardnameeng);
        municipalityward.setWardNameBng(municipalitywardnamebng);
        municipalityward.setBbsCode(municipalitywardbbscode);
        municipalityward.setGeoDivisionId(divdata);
        municipalityward.setGeoDistrictId(disdata);
        municipalityward.setGeoUpazilaId(upadata);
        municipalityward.setGeoMunicipalityId(mundata);
        municipalityward.setDivisionBbsCode(divisionbbscode);
        municipalityward.setDistrictBbsCode(districtbbscode);
        municipalityward.setUpazilaBbsCode(upazillabbscode);
        municipalityward.setMunicipalityBbsCode(municipalitybbscode);
        municipalityward.setCreatedBy(((Long) request.getSession().getAttribute("employeeId")).intValue());
        municipalityward.setCreated(java.sql.Timestamp.from(java.time.Instant.now()));
        municipalityWardService.addMunicipalityWard(municipalityward);

        RedirectView rd=new RedirectView("municipalitywardlist?menuid="+request.getSession().getAttribute("municipalitywardmenuid"));
        return rd;

    }




    @RequestMapping(value = "municipalitywardedit",method = RequestMethod.POST)
    ModelAndView municipalityWardEdit (HttpServletRequest request,
                                       @RequestParam int id,
                                       @RequestParam String municipalitywardnameeng,
                                       @RequestParam String municipalitywardnamebng,
                                       @RequestParam String municipalitywardbbscode,
                                       @RequestParam String divisionbbscode,
                                       @RequestParam String districtbbscode,
                                       @RequestParam String upazillabbscode,
                                       @RequestParam String municipalitybbscode,
                                       @RequestParam int divId,
                                       @RequestParam int disId,
                                       @RequestParam int upaId,
                                       @RequestParam int munId){
        ModelAndView editMunicipalityWardForm = new ModelAndView("geo/municipalityward/municipalitywardedit");

        MunicipalityWardDTO municipalityward = new MunicipalityWardDTO();
        municipalityward.setId(id);
        municipalityward.setWardNameEng(municipalitywardnameeng);
        municipalityward.setWardNameBng(municipalitywardnamebng);
        municipalityward.setBbsCode(municipalitywardbbscode);
        municipalityward.setDivisionBbsCode(divisionbbscode);
        municipalityward.setDistrictBbsCode(districtbbscode);
        municipalityward.setUpazilaBbsCode(upazillabbscode);
        municipalityward.setMunicipalityBbsCode(municipalitybbscode);
        municipalityward.setGeoDivisionId(divId);
        municipalityward.setGeoDistrictId(disId);
        municipalityward.setGeoUpazilaId(upaId);
        municipalityward.setGeoMunicipalityId(munId);


        ArrayList<DivisionDTO>divisionList=divisionService.getDivisionData();
        editMunicipalityWardForm.addObject("division", divisionList);

        ArrayList<DistrictDTO>districtList = districtService.getDivWiseDistrict(divId);
        editMunicipalityWardForm.addObject("district", districtList);


        ArrayList<UpazillaDTO>upazillaList = upazillaService.getUpazillaListbyDistrictId(disId);
        editMunicipalityWardForm.addObject("upazilla", upazillaList);

        ArrayList<MunicipalityDTO>municipalityList = municipalityService.getMunicipalityListbyUpazillaId(upaId);
        editMunicipalityWardForm.addObject("municipality", municipalityList);

        editMunicipalityWardForm.addObject("municipalityward", municipalityward);
        String menuid = request.getSession().getAttribute("municipalitywardmenuid").toString();
        editMunicipalityWardForm.addObject("menuid",menuid);
        return editMunicipalityWardForm;
    }

    @RequestMapping(value = "editmunicipalityward",method = RequestMethod.POST)
    RedirectView editMunicipalityWard (HttpServletRequest request, Principal principal,
                                       @RequestParam int id,
                                       @RequestParam String municipalitywardnameeng,
                                       @RequestParam String municipalitywardnamebng,
                                       @RequestParam String municipalitywardbbscode,
                                       @RequestParam String divisionbbscode,
                                       @RequestParam String districtbbscode,
                                       @RequestParam String upazillabbscode,
                                       @RequestParam String municipalitybbscode,
                                       @RequestParam int divdata,
                                       @RequestParam int disdata,
                                       @RequestParam int upadata,
                                       @RequestParam int mundata ) {


        MunicipalityWardDTO municipalityward = new MunicipalityWardDTO();
        municipalityward.setId(id);
        municipalityward.setWardNameEng(municipalitywardnameeng);
        municipalityward.setWardNameBng(municipalitywardnamebng);
        municipalityward.setBbsCode(municipalitywardbbscode);
        municipalityward.setGeoDivisionId(divdata);
        municipalityward.setGeoDistrictId(disdata);
        municipalityward.setGeoUpazilaId(upadata);
        municipalityward.setGeoMunicipalityId(mundata);
        municipalityward.setDivisionBbsCode(divisionbbscode);
        municipalityward.setDistrictBbsCode(districtbbscode);
        municipalityward.setUpazilaBbsCode(upazillabbscode);
        municipalityward.setMunicipalityBbsCode(municipalitybbscode);
        municipalityward.setModifiedBy(((Long) request.getSession().getAttribute("employeeId")).intValue());
        municipalityward.setModified(java.sql.Timestamp.from(java.time.Instant.now()));
        municipalityWardService.editMunicipalityWard(municipalityward);
        RedirectView rd=new RedirectView("municipalitywardlist?menuid="+request.getSession().getAttribute("municipalitywardmenuid"));
        return rd;

    }

    @RequestMapping(value = "municipalitywarddelete",method = RequestMethod.POST)
    int deleteMunicipalityWard (HttpServletRequest request,
                                     @RequestParam int id
    ) {
        MunicipalityWardDTO municipalityWardDTO=new MunicipalityWardDTO();
        municipalityWardDTO.setId(id);
        municipalityWardDTO.setModifiedBy(((Long) request.getSession().getAttribute("employeeId")).intValue());
        municipalityWardDTO.setModified(java.sql.Timestamp.from(java.time.Instant.now()));

        return municipalityWardService.deleteMunicipalityWard(municipalityWardDTO);

    }

    @RequestMapping(value = "municipalitywardlistbymunicipalityid",method = RequestMethod.POST)
    @ResponseBody
    ArrayList<MunicipalityWardDTO> municipalityWardListByMunicipalityId (Principal principal,
                                                             @RequestParam int id) {

        ArrayList<MunicipalityWardDTO> municipalityWardListByMunicipalityId = municipalityWardService.getMunicipalityWardListByMunicipalityId(id);
        return municipalityWardListByMunicipalityId;

    }

    @RequestMapping(value = "municipalitywardlistbymunicipalityid",method = RequestMethod.GET)
    @ResponseBody
    ArrayList<MunicipalityWardDTO> municipalityWardListByMunicipalityIdget (Principal principal,
                                                                         @RequestParam int id) {

        ArrayList<MunicipalityWardDTO> municipalityWardListByMunicipalityId = municipalityWardService.getMunicipalityWardListByMunicipalityId(id);
        return municipalityWardListByMunicipalityId;

    }

    @RequestMapping(value = "municipalitywardhistory",method = RequestMethod.GET)
    ModelAndView municipalitywardHistory(HttpServletRequest request,@RequestParam int id, @RequestParam String name){
        ModelAndView form = null;
        form = new ModelAndView("geo/municipalityward/municipalitywordhistory");
        form.addObject("id",id);
        form.addObject("name",name);
        String menuid = request.getSession().getAttribute("municipalitywardmenuid").toString();
        form.addObject("menuid",menuid);
        return form;
    }

    @RequestMapping(value = "historymunicipalityward",method = RequestMethod.GET)
    JSONObject historyCitycorporationward(@RequestParam int id){

        JSONObject js  = new JSONObject();
        js.put("cc",historyService.currentChain(id, Policy.MUNI_WARD_TYPE));
        return js;
    }
}
