package com.revesoft.springboot.web.geo.citycorporation;

import com.revesoft.springboot.web.geo.district.DistrictDTO;
import com.revesoft.springboot.web.geo.district.DistrictService;
import com.revesoft.springboot.web.geo.division.DivisionDTO;
import com.revesoft.springboot.web.geo.division.DivisionService;
import com.revesoft.springboot.web.geo.history.*;
import com.revesoft.springboot.web.util.Policy;
import org.jose4j.json.internal.json_simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import java.time.LocalDateTime;
import java.util.ArrayList;

/**
 * Created by Bony on 10/30/2017.
 */
@RestController
public class CityCorporationController {

    @Autowired
    CityCorporationService cityCorporationService;
    @Autowired
    DivisionService divisionService;
    @Autowired
    DistrictService districtService;
    @Autowired
    HistoryService historyService;

    @RequestMapping(value="/citycorporationlist",method = RequestMethod.GET)
    public ModelAndView citycorporationList(HttpServletRequest request, @RequestParam int menuid){
        ModelAndView citycorporation=new ModelAndView("geo/citycorporation/citycorporationlist");
        citycorporation.addObject("menuid",menuid);
        request.getSession().setAttribute("citycorporationmenuid",menuid);
        return citycorporation;
    }

    @RequestMapping(path="/citycorporationlistdata",method = RequestMethod.GET)
    public JSONObject citycorporationListData()
    {
        ArrayList<CityCorporationDTO> data=cityCorporationService.getAllCitycorporation();
        JSONObject obj=new JSONObject();
        obj.put("iTotalRecords",data.size());
        obj.put("iTotalDisplayRecords",data.size());
        obj.put("aaData",data);
        return obj;


    }

    @RequestMapping(path="citycorporationdata",method = RequestMethod.GET)
    public ArrayList<CityCorporationDTO> citycorporationData()
    {
        ArrayList<CityCorporationDTO> data=cityCorporationService.getAllCitycorporation();
        return data;


    }
    @RequestMapping(path= "/citycorporationlistbydis")
    @ResponseBody
    public ArrayList<CityCorporationDTO> citycorporationListDatabyDistrict(@RequestParam int id){
        ArrayList<CityCorporationDTO>data=cityCorporationService.getDisWiseCity(id);
        return data;
    }


    @RequestMapping(value="citycorporationadd",method = RequestMethod.GET)
    public ModelAndView citycorporationAdd(HttpServletRequest request){
        String menuid = request.getSession().getAttribute("citycorporationmenuid").toString();
        ModelAndView citycorporationadd=new ModelAndView();
        ArrayList<DivisionDTO>data=divisionService.getDivisionData();
        citycorporationadd.addObject("division",data);
        citycorporationadd.setViewName("geo/citycorporation/citycorporationadd");
        citycorporationadd.addObject("menuid",menuid);
        return  citycorporationadd;
    }
    @RequestMapping(value="addcitycorporation",method = RequestMethod.POST)
    @ResponseBody
    public RedirectView addCitycorporation(HttpServletRequest request, @RequestParam String citynameeng,
                                @RequestParam String citynamebng,
                                @RequestParam String bbscode,
                                @RequestParam int  divdata,
                                @RequestParam int disdata ,
                                @RequestParam String divisionbbscode,
                                @RequestParam String districtbbscode)
    {

        CityCorporationDTO cityCorporationDTO =new CityCorporationDTO();
        cityCorporationDTO.setDivisionId(divdata);
        cityCorporationDTO.setDistrictId(disdata);
        cityCorporationDTO.setNameEng(citynameeng);
        cityCorporationDTO.setNameBng(citynamebng);
        cityCorporationDTO.setBbsCode(bbscode);
        cityCorporationDTO.setStatus(1);
        cityCorporationDTO.setDivisionBbsCode(divisionbbscode);
        cityCorporationDTO.setDistrictBbsCode(districtbbscode);
        cityCorporationDTO.setCreatedBy(((Long) request.getSession().getAttribute("employeeId")).intValue());
        cityCorporationDTO.setCreated(java.sql.Timestamp.from(java.time.Instant.now()));
        cityCorporationService.addCityService(cityCorporationDTO);
        return new RedirectView("citycorporationlist?menuid="+request.getSession().getAttribute("citycorporationmenuid"));
    }

    @RequestMapping(value="citycorporationedit",method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView cityCorporationEdit(HttpServletRequest request,@RequestParam int id,
                                     @RequestParam String citynameeng,
                                @RequestParam String citynamebng,
                                @RequestParam String bbscode,
                                @RequestParam int  divdata,
                                @RequestParam int disdata ,
                                @RequestParam int status,
                                @RequestParam String divisionbbscode,
                                @RequestParam String districtbbscode)
    {
        ModelAndView modelAndView= new ModelAndView();
        String menuid = request.getSession().getAttribute("citycorporationmenuid").toString();
        CityCorporationDTO cityCorporationDTO =new CityCorporationDTO();
        cityCorporationDTO.setId(id);
        cityCorporationDTO.setDivisionId(divdata);
        cityCorporationDTO.setDistrictId(disdata);
        cityCorporationDTO.setNameEng(citynameeng);
        cityCorporationDTO.setNameBng(citynamebng);
        cityCorporationDTO.setBbsCode(bbscode);
        cityCorporationDTO.setStatus(status);
        cityCorporationDTO.setDivisionBbsCode(divisionbbscode);
        cityCorporationDTO.setDistrictBbsCode(districtbbscode);
        cityCorporationDTO.setCreatedBy(((Long) request.getSession().getAttribute("employeeId")).intValue());
        cityCorporationDTO.setCreated(java.sql.Timestamp.from(java.time.Instant.now()));
        ArrayList<DivisionDTO>data=divisionService.getDivisionData();
        modelAndView.addObject("division",data);

        ArrayList<DistrictDTO> dis=districtService.getDivWiseDistrict(divdata);

        modelAndView.addObject("district",dis);
        modelAndView.addObject("city",cityCorporationDTO);
        modelAndView.setViewName("geo/citycorporation/citycorporationedit");
        modelAndView.addObject("menuid",menuid);

        return modelAndView;

    }

    @RequestMapping(value="editcitycorporation",method = RequestMethod.POST)
    @ResponseBody
    public RedirectView editCitycorporation(HttpServletRequest request, @RequestParam int id,
                                 @RequestParam String citynameeng,
                                 @RequestParam String citynamebng,
                                 @RequestParam String bbscode,
                                 @RequestParam int  divdata,
                                 @RequestParam int disdata ,
                                 @RequestParam String divisionbbscode,
                                 @RequestParam String districtbbscode)
    {
        CityCorporationDTO cityCorporationDTO =new CityCorporationDTO();
        cityCorporationDTO.setId(id);
        cityCorporationDTO.setDivisionId(divdata);
        cityCorporationDTO.setDistrictId(disdata);
        cityCorporationDTO.setNameEng(citynameeng);
        cityCorporationDTO.setNameBng(citynamebng);
        cityCorporationDTO.setBbsCode(bbscode);
        cityCorporationDTO.setDivisionBbsCode(divisionbbscode);
        cityCorporationDTO.setDistrictBbsCode(districtbbscode);
        cityCorporationDTO.setModifiedBy(((Long) request.getSession().getAttribute("employeeId")).intValue());
        cityCorporationDTO.setModified(java.sql.Timestamp.from(java.time.Instant.now()));
        cityCorporationService.updateCityService(cityCorporationDTO);
        return new RedirectView("citycorporationlist?menuid="+request.getSession().getAttribute("citycorporationmenuid"));

    }
    @RequestMapping(value = "citycorporationdelete",method = RequestMethod.POST)
    public int deleteCity(HttpServletRequest request,@RequestParam int id){


        CityCorporationDTO cityCorporationDTO=new CityCorporationDTO();
        cityCorporationDTO.setId(id);
        cityCorporationDTO.setModifiedBy(((Long) request.getSession().getAttribute("employeeId")).intValue());
        cityCorporationDTO.setModified(java.sql.Timestamp.from(java.time.Instant.now()));
        return cityCorporationService.deleteCityService(cityCorporationDTO);

    }

    @RequestMapping(value = "citycorporationunionassign", method = RequestMethod.GET)
    ModelAndView citycorporationUnionAssign(HttpServletRequest request){
        String menuid = request.getSession().getAttribute("citycorporationmenuid").toString();
        ModelAndView citycorporationassaign = new ModelAndView("geo/citycorporation/citycorporationunionassign");
        citycorporationassaign.addObject("division",divisionService.getDivisionData());
        citycorporationassaign.addObject("menuid",menuid);
        return citycorporationassaign;
    }



    @RequestMapping(value = "assigncitycorporationunion",method = RequestMethod.POST)
    public RedirectView assignCitycorporationUnion(HttpServletRequest request,@RequestParam int divdata, @RequestParam int disdata, @RequestParam int citydata, @RequestParam(value = "parentid[]") int[] upazillaIds, @RequestParam(value = "childid[]") String[] childIds) {

        ArrayList<Integer> municipalityIds = new ArrayList<>();
        ArrayList<Integer> unionIds = new ArrayList<>();
        ArrayList<Integer> upaIds = new ArrayList<>();
        for(int i=0;i<childIds.length;i++){
            String content = childIds[i];
            String[] splited = content.split(":");
            int geotype = Integer.parseInt(splited[2]);
            int id = Integer.parseInt(splited[1]);
            if(geotype == Policy.UNION_TYPE)unionIds.add(id);
            else if(geotype == Policy.MUNICIPALITY_TYPE )municipalityIds.add(id);
        }
        for(int i=0;i<upazillaIds.length;i++){

            upaIds.add(upazillaIds[i]);
        }
        long desigid= (long) request.getSession().getAttribute("organogramId");

        cityCorporationService.changeTotalGeoUni(citydata, desigid, unionIds,upaIds);
        cityCorporationService.changeTotalGeoMuni(citydata, desigid, municipalityIds);
        return new RedirectView("citycorporationlist?menuid="+request.getSession().getAttribute("citycorporationmenuid"));
    }

    @RequestMapping(value = "citycorporationmunicipalityassign", method = RequestMethod.GET)
    ModelAndView citycorporationMunicipalityAssign(HttpServletRequest request){
        String menuid = request.getSession().getAttribute("citycorporationmenuid").toString();
        ModelAndView citycorporationassaign = new ModelAndView("geo/citycorporation/citycorporationmunicipalityassign");
        citycorporationassaign.addObject("division",divisionService.getDivisionData());
        citycorporationassaign.addObject("menuid",menuid);
        return citycorporationassaign;
    }



    @RequestMapping(value = "assigncitycorporationmunicipality",method = RequestMethod.POST)
    public RedirectView assignCitycorporationMunicipality(HttpServletRequest request,@RequestParam int divdata, @RequestParam int disdata, @RequestParam int citydata, @RequestParam(value = "parentid[]") int[] upazillaIds, @RequestParam(value = "childid[]") String[] childIds) {

        ArrayList<Integer> municipalityIds = new ArrayList<>();
        ArrayList<Integer> unionIds = new ArrayList<>();
        ArrayList<Integer> upaIds = new ArrayList<>();
        for(int i=0;i<childIds.length;i++){
            String content = childIds[i];
            String[] splited = content.split(":");
            int geotype = Integer.parseInt(splited[2]);
            int id = Integer.parseInt(splited[1]);
            if(geotype == Policy.UNION_TYPE)unionIds.add(id);
            else if(geotype == Policy.MUNICIPALITY_TYPE )municipalityIds.add(id);
        }
        for(int i=0;i<upazillaIds.length;i++){

            upaIds.add(upazillaIds[i]);
        }
        long desigid= (long) request.getSession().getAttribute("organogramId");

        cityCorporationService.changeTotalGeoUni(citydata, desigid, unionIds,upaIds);
        cityCorporationService.changeTotalGeoMuni(citydata, desigid, municipalityIds);
        return new RedirectView("citycorporationlist?menuid="+request.getSession().getAttribute("citycorporationmenuid"));
    }


    @RequestMapping(value = "citycorporationhistory", method = RequestMethod.GET)
    ModelAndView cityCorporationHistory(HttpServletRequest request,@RequestParam int id ,@RequestParam String name){
        String menuid = request.getSession().getAttribute("citycorporationmenuid").toString();
        ModelAndView history = new ModelAndView("geo/citycorporation/citycorporationhistory");
        history.addObject("id",id);
        history.addObject("name",name);
        history.addObject("menuid",menuid);
        return history;
    }

    @RequestMapping(value = "historycitycorporation", method = RequestMethod.GET)
    JSONObject historyCitycorporation(@RequestParam int id){
        JSONObject js = new JSONObject();
        js.put("cc",historyService.currentChain(id,4));
        js.put("cd",historyService.getChildDetail(id,4));
        return js;
    }


    @RequestMapping(value = "cityeroot", method = RequestMethod.POST)
    public JSONObject cityRoot(@RequestParam int id, @RequestParam int parenttype,@RequestParam String li_attr){
        JSONObject js = new JSONObject();
        js.put("id","root-0-"+id+"-1");
        js.put("text",li_attr);
        js.put("children",true);
        return js;
    }

}
