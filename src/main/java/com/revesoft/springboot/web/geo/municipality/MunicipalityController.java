package com.revesoft.springboot.web.geo.municipality;

import com.revesoft.springboot.web.geo.district.DistrictDTO;
import com.revesoft.springboot.web.geo.district.DistrictService;
import com.revesoft.springboot.web.geo.division.DivisionDTO;
import com.revesoft.springboot.web.geo.division.DivisionService;
import com.revesoft.springboot.web.geo.history.HistoryService;
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
public class MunicipalityController {
    @Autowired
    DivisionService divisionService;
    @Autowired
    DistrictService districtService;
    @Autowired
    UpazillaService upazillaService;
    @Autowired
    MunicipalityService municipalityService;
    @Autowired
    HistoryService historyService;

    @RequestMapping(value = "municipalitylist", method = RequestMethod.GET)
    public ModelAndView municipalityList(HttpServletRequest request, @RequestParam int menuid) {

        ModelAndView municipalityList = new ModelAndView("geo/municipality/municipalitylist");
        request.getSession().setAttribute("municipalitymenuid",menuid);
        municipalityList.addObject("menuid",menuid);
        return municipalityList;
    }


    @RequestMapping(value = "municipalitypagedata", method = RequestMethod.GET)
    @ResponseBody
    JSONObject municipalityPage(HttpServletRequest request, HttpServletResponse response) {


        ArrayList<MunicipalityDTO> municipalityDTOS = municipalityService.getMunicipalityList();
        JSONObject obj=new JSONObject();
        obj.put("iTotalRecords",municipalityDTOS.size());
        obj.put("iTotalDisplayRecords",municipalityDTOS.size());
        obj.put("aaData",municipalityDTOS);
        return obj;
    }

    @RequestMapping(value = "municipalityadd", method = RequestMethod.GET)
    ModelAndView municipalityAdd (HttpServletRequest request){
        ModelAndView municipalityAdd = new ModelAndView("geo/municipality/municipalityadd");
        ArrayList<DivisionDTO>divisionList=divisionService.getDivisionData();
        municipalityAdd.addObject("division", divisionList);
        String menuid = request.getSession().getAttribute("municipalitymenuid").toString();
        municipalityAdd.addObject("menuid",menuid);
        return municipalityAdd;
    }
    @RequestMapping(value = "addmunicipality",method = RequestMethod.POST)
    RedirectView addMunicipality(HttpServletRequest request, Principal principal, @RequestParam String municipalitynameeng,
                          @RequestParam String municipalitynamebng,
                          @RequestParam String municipalitybbscode,
                          @RequestParam String divisionbbscode,
                          @RequestParam String districtbbscode,
                          @RequestParam String upazillabbscode,
                          @RequestParam int divdata,
                          @RequestParam int disdata,
                          @RequestParam int upadata){
        MunicipalityDTO municipality = new MunicipalityDTO();
        municipality.setMunicipalityNameEng(municipalitynameeng);
        municipality.setMunicipalityNameBng(municipalitynamebng);
        municipality.setBbsCode(municipalitybbscode);
        municipality.setGeoDivisionId(divdata);
        municipality.setGeoDistrictId(disdata);
        municipality.setGeoUpazilaId(upadata);
        municipality.setDivisionBbsCode(divisionbbscode);
        municipality.setDistrictBbsCode(districtbbscode);
        municipality.setUpazilaBbsCode(upazillabbscode);
        municipality.setCreatedBy(((Long) request.getSession().getAttribute("employeeId")).intValue());
        municipality.setCreated(java.sql.Timestamp.from(java.time.Instant.now()));
        municipalityService.addMunicipality(municipality);

        RedirectView rd=new RedirectView("municipalitylist?menuid="+request.getSession().getAttribute("municipalitymenuid"));
        return rd;

    }




    @RequestMapping(value = "municipalityedit",method = RequestMethod.POST)
    ModelAndView municipalityEdit (HttpServletRequest request,
                                @RequestParam int id,
                                @RequestParam String municipalitynameeng,
                                @RequestParam String municipalitynamebng,
                                @RequestParam String municipalitybbscode,
                                @RequestParam String divisionbbscode,
                                @RequestParam String districtbbscode,
                                @RequestParam String upazillabbscode,
                                @RequestParam int divId,
                                @RequestParam int disId,
                                @RequestParam int upaId){
        ModelAndView municipalityEdit = new ModelAndView("geo/municipality/municipalityedit");

        MunicipalityDTO municipality = new MunicipalityDTO();
        municipality.setId(id);
        municipality.setMunicipalityNameEng(municipalitynameeng);
        municipality.setMunicipalityNameBng(municipalitynamebng);
        municipality.setBbsCode(municipalitybbscode);
        municipality.setDivisionBbsCode(divisionbbscode);
        municipality.setDistrictBbsCode(districtbbscode);
        municipality.setUpazilaBbsCode(upazillabbscode);
        municipality.setGeoDivisionId(divId);
        municipality.setGeoDistrictId(disId);
        municipality.setGeoUpazilaId(upaId);


        ArrayList<DivisionDTO>divisionList=divisionService.getDivisionData();
        municipalityEdit.addObject("division", divisionList);

        ArrayList<DistrictDTO>districtList = districtService.getDivWiseDistrict(divId);
        municipalityEdit.addObject("district", districtList);


        ArrayList<UpazillaDTO>upazillaList = upazillaService.getUpazillaListbyDistrictId(disId);
        municipalityEdit.addObject("upazilla", upazillaList);

        municipalityEdit.addObject("municipality", municipality);
        String menuid = request.getSession().getAttribute("municipalitymenuid").toString();
        municipalityEdit.addObject("menuid",menuid);
        return municipalityEdit;
    }

    @RequestMapping(value = "editmunicipality",method = RequestMethod.POST)
    RedirectView editMunicipality (HttpServletRequest request, Principal principal,
                            @RequestParam int id,
                            @RequestParam String municipalitynameeng,
                            @RequestParam String municipalitynamebng,
                            @RequestParam String municipalitybbscode,
                            @RequestParam String divisionbbscode,
                            @RequestParam String districtbbscode,
                            @RequestParam String upazillabbscode,
                            @RequestParam int divdata,
                            @RequestParam int disdata,
                            @RequestParam int upadata) {


        MunicipalityDTO municipality = new MunicipalityDTO();
        municipality.setId(id);
        municipality.setMunicipalityNameEng(municipalitynameeng);
        municipality.setMunicipalityNameBng(municipalitynamebng);
        municipality.setBbsCode(municipalitybbscode);
        municipality.setDivisionBbsCode(divisionbbscode);
        municipality.setDistrictBbsCode(districtbbscode);
        municipality.setUpazilaBbsCode(upazillabbscode);
        municipality.setGeoDivisionId(divdata);
        municipality.setGeoDistrictId(disdata);
        municipality.setGeoUpazilaId(upadata);
        municipality.setModifiedBy(((Long) request.getSession().getAttribute("employeeId")).intValue());
        municipality.setModified(java.sql.Timestamp.from(java.time.Instant.now()));
        municipalityService.editMunicipality(municipality);
        RedirectView rd=new RedirectView("municipalitylist?menuid="+request.getSession().getAttribute("municipalitymenuid"));
        return rd;

    }

    @RequestMapping(value = "municipalitydelete",method = RequestMethod.POST)
    int municipalityDelete (HttpServletRequest request,
                              @RequestParam int id
    ) {

        MunicipalityDTO municipalityDTO=new MunicipalityDTO();
        municipalityDTO.setId(id);
        municipalityDTO.setModifiedBy(((Long) request.getSession().getAttribute("employeeId")).intValue());
        municipalityDTO.setModified(java.sql.Timestamp.from(java.time.Instant.now()));
        return municipalityService.deleteMunicipality(municipalityDTO);


    }


    @RequestMapping(value = "municipalitylistbyupazillaid",method = RequestMethod.POST)
    @ResponseBody
    ArrayList<MunicipalityDTO> municipalityListbyUpazillaId (Principal principal,
                                                     @RequestParam int id) {

        ArrayList<MunicipalityDTO> municipalityListbyUpazillaId = municipalityService.getMunicipalityListbyUpazillaId(id);
        return municipalityListbyUpazillaId;

    }

    @RequestMapping(value = "municipalitylistbyupazillaid",method = RequestMethod.GET)
    @ResponseBody
    ArrayList<MunicipalityDTO> municipalityListbyUpazillaIdget (Principal principal,
                                                             @RequestParam int id) {

        ArrayList<MunicipalityDTO> municipalityListbyUpazillaId = municipalityService.getMunicipalityListbyUpazillaId(id);
        return municipalityListbyUpazillaId;

    }


    @RequestMapping(value = "getmunicipalitylistbyupazillaids",method = RequestMethod.POST)
    @ResponseBody
    ArrayList<MunicipalityDTO> municipalityListbyUpazillaIds (Principal principal,
                                                             @RequestParam (value = "id[]")int[] ids) {

        ArrayList<MunicipalityDTO> municipalityListbyUpazillaId = municipalityService.getMunicipalityListbyUpazillaIds(ids);
        return municipalityListbyUpazillaId;

    }

    @RequestMapping(value = "municipalityassign", method = RequestMethod.GET)
    ModelAndView municipalityAssignForm(HttpServletRequest request){
        ModelAndView form =new ModelAndView("geo/municipality/municipalityassign");
        form.addObject("division",divisionService.getDivisionData());
        String menuid = request.getSession().getAttribute("municipalitymenuid").toString();
        form.addObject("menuid",menuid);
        return form;
    }
    @RequestMapping(value = "assignmunicipality", method = RequestMethod.POST)
    RedirectView upazillaAssign(HttpServletRequest request, @RequestParam int munidata,  @RequestParam(value = "parentid[]")int[] upazillaIds,@RequestParam(value = "childid[]")String[] childIds) {
        ArrayList<Integer> municipalityIds = new ArrayList<>();
        ArrayList<Integer> unionIds = new ArrayList<>();
        ArrayList<Integer> upaIds = new ArrayList<>();
        for (int i = 0; i < childIds.length; i++) {
            String content = childIds[i];
            String[] splited = content.split(":");
            int geotype = Integer.parseInt(splited[2]);
            int id = Integer.parseInt(splited[1]);
            if (geotype == 6) unionIds.add(id);
            else if (geotype == 7) municipalityIds.add(id);
        }
        for (int i = 0; i < upazillaIds.length; i++) {

            upaIds.add(upazillaIds[i]);
        }
        municipalityService.assignUnion(upaIds.get(0),1,unionIds, munidata);
        RedirectView rd=new RedirectView("municipalitylist?menuid="+request.getSession().getAttribute("municipalitymenuid"));
        return rd;
    }

    @RequestMapping(value = "municipalityhistory",method = RequestMethod.GET)
    ModelAndView municipalityHistory(HttpServletRequest request,@RequestParam int id, @RequestParam String name){
        ModelAndView form = null;
        form = new ModelAndView("geo/municipality/muncipalityhistory");
        form.addObject("id",id);
        form.addObject("name",name);
//        form.addObject("label","<h3><span class=\"label label-info\">"+name+"</span>\n" +
//                "                                        <span class=\"label label-danger\">"+":"+"</span>\n" +
//                "                                        <span class=\"label label-default\">"+"\n" +
//                "উপজেলা"+"</span></h3>");
//        form.addObject("currentchain",upazillaService.currentChain(id,name));
//        form.addObject("childdetail",upazillaService.childDetail(id,name));
//        form.addObject("parentdetail",upazillaService.parentDetail(id,name));
        String menuid = request.getSession().getAttribute("municipalitymenuid").toString();
        form.addObject("menuid",menuid);

        return form;
    }

    @RequestMapping(value = "historymunicipality",method = RequestMethod.GET)
    JSONObject historyMunicipality(@RequestParam int id){
//        ModelAndView form = null;
//        form = new ModelAndView("geo/upazilla/upazillahistory");
//        form.addObject("label","<h3><span class=\"label label-info\">"+name+"</span>\n" +
//                "                                        <span class=\"label label-danger\">"+":"+"</span>\n" +
//                "                                        <span class=\"label label-default\">"+"\n" +
//                "উপজেলা"+"</span></h3>");
//        form.addObject("currentchain",upazillaService.currentChain(id,name));
//        form.addObject("childdetail",upazillaService.childDetail(id,name));
//        form.addObject("parentdetail",upazillaService.parentDetail(id,name));
        JSONObject js  = new JSONObject();
        js.put("cc",historyService.currentChain(id, Policy.MUNICIPALITY_TYPE));
        js.put("cd",historyService.getChildDetail(id, Policy.MUNICIPALITY_TYPE));
        return js;

    }


}
