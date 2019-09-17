package com.revesoft.springboot.web.geo.thana;

import com.revesoft.springboot.web.geo.district.DistrictDTO;
import com.revesoft.springboot.web.geo.district.DistrictService;
import com.revesoft.springboot.web.geo.division.DivisionDTO;
import com.revesoft.springboot.web.geo.division.DivisionService;
import com.revesoft.springboot.web.geo.history.HistoryService;
import com.revesoft.springboot.web.util.Policy;
import com.revesoft.springboot.web.util.URLAccessController;
import org.jose4j.json.internal.json_simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.security.Principal;
import java.time.LocalDateTime;
import java.util.ArrayList;

/**
 * Created by Bony on 10/31/2017.
 */
@RestController
public class ThanaController {

    @Autowired
    DivisionService divisionService;
    @Autowired
    DistrictService districtService;
    @Autowired
    ThanaService thanaService;
    @Autowired
    HistoryService historyService;
    @Autowired
    URLAccessController urlAccessController;

    @RequestMapping(value = "thanalist", method = RequestMethod.GET)
    public ModelAndView thanaList(RedirectAttributes redirectAttributes,HttpServletRequest request, @RequestParam int menuid) {
        ModelAndView thanaList = new ModelAndView();
        boolean hasAccess=urlAccessController.hasAccessPermission(request,menuid,"thanalist");
        if(!hasAccess){
            // modelAndView.addObject("forbidden",1);
            redirectAttributes.addFlashAttribute("forbidden", 1);
            thanaList.setViewName("redirect:userdashboard");

        }else {


            request.getSession().setAttribute("thanamenuid", menuid);
            thanaList.addObject("menuid", menuid);
            thanaList.setViewName("geo/thana/thanalist");
        }
        return thanaList;

    }


    @RequestMapping(value = "thanapagedata", method = RequestMethod.GET)
    @ResponseBody
    JSONObject thanaPageData(HttpServletRequest request, HttpServletResponse response) {

        int displayLength=1;
        if(request.getParameter("iDisplayLength") !=null)displayLength = Integer.valueOf(request.getParameter("iDisplayLength"));
        Integer pageNumber = 0;
        if (null != request.getParameter("iDisplayStart"))
            pageNumber = (Integer.valueOf(request.getParameter("iDisplayStart"))/displayLength)+1;


        //Fetch search parameter
        String searchParameterEncode = request.getParameter("sSearch");

       JSONObject listThana = null;

        if(!searchParameterEncode.equals(";")&& searchParameterEncode.contains(";")) {
            String[] searchparameter = searchParameterEncode.split(";");

            int parameterSizeLength = searchparameter.length;
            if(parameterSizeLength>1){
                listThana = thanaService.getThanaListbyPage(pageNumber, displayLength,searchparameter);
            }
            else {
                listThana = thanaService.getThanaListbyPage(pageNumber, displayLength, searchparameter[0]);
            }
        }
        else {

            listThana = thanaService.getThanaListbyPage(pageNumber, displayLength);

        }

        JSONObject obj=new JSONObject();
        obj.put("iTotalRecords",listThana.get("c"));
        obj.put("iTotalDisplayRecords", listThana.get("c"));
        obj.put("aaData", listThana.get("d"));
        return obj;
    }



    @RequestMapping(value = "thanaadd", method = RequestMethod.GET)
    ModelAndView addThanaView (RedirectAttributes redirectAttributes,HttpServletRequest request){


        ModelAndView modelAndView = new ModelAndView();

        boolean hasAccess=urlAccessController.hasAccessPermission(request,null,"thanaadd");
        if(!hasAccess){
            // modelAndView.addObject("forbidden",1);
            redirectAttributes.addFlashAttribute("forbidden", 1);
            modelAndView.setViewName("redirect:userdashboard");

        }else {

            ArrayList<DivisionDTO> divisionList = divisionService.getDivisionData();
            modelAndView.addObject("division", divisionList);
            String menuid = request.getSession().getAttribute("thanamenuid").toString();
            modelAndView.addObject("menuid", menuid);
            modelAndView.setViewName("geo/thana/thanaadd");
        }
        return modelAndView;
    }

    @RequestMapping(value = "addthana",method = RequestMethod.POST)
    RedirectView addThana( HttpServletRequest request, @RequestParam String thananameeng,
                             @RequestParam String thananamebng,
                             @RequestParam String bbscode,
                             @RequestParam String divisionbbscode,
                             @RequestParam String districtbbscode,
                             @RequestParam int divdata,
                             @RequestParam int disdata){
        ThanaDTO thanaDTO = new ThanaDTO();
        thanaDTO.setThanaNameEng(thananameeng);
        thanaDTO.setThanaNameBng(thananamebng);
        thanaDTO.setBbsCode(bbscode);
        thanaDTO.setGeoDivisionId(divdata);
        thanaDTO.setGeoDistrictId(disdata);
        thanaDTO.setDivisionBbsCode(divisionbbscode);
        thanaDTO.setDistrictBbsCode(districtbbscode);
        thanaDTO.setCreatedBy(1);
        ThanaService thanaService = new ThanaService();
        thanaService.addThana(thanaDTO);

        RedirectView rd = new RedirectView("thanalist?menuid="+request.getSession().getAttribute("thanamenuid"));
        return rd;

    }




    @RequestMapping(value = "thanaedit",method = RequestMethod.POST)
    ModelAndView thanaEdit (RedirectAttributes  redirectAttributes,
                                    HttpServletRequest request,
                                   @RequestParam int id,
                                   @RequestParam String thananameeng,
                                   @RequestParam String thananamebng,
                                   @RequestParam String bbscode,
                                   @RequestParam String divisionbbscode,
                                   @RequestParam String districtbbscode,
                                   @RequestParam int divId,
                                   @RequestParam int disId){
        ModelAndView modelAndView = new ModelAndView("geo/thana/thanaedit");

        boolean hasAccess=urlAccessController.hasAccessPermission(request,null,"thanaedit");
        if(!hasAccess){
            // modelAndView.addObject("forbidden",1);
            redirectAttributes.addFlashAttribute("forbidden", 1);
            modelAndView.setViewName("redirect:userdashboard");

        }else {

            ThanaDTO thanaDTO = new ThanaDTO();
            thanaDTO.setId(id);
            thanaDTO.setThanaNameEng(thananameeng);
            thanaDTO.setThanaNameBng(thananamebng);
            thanaDTO.setBbsCode(bbscode);
            thanaDTO.setDivisionBbsCode(divisionbbscode);
            thanaDTO.setDistrictBbsCode(districtbbscode);
            thanaDTO.setGeoDivisionId(divId);
            thanaDTO.setGeoDistrictId(disId);


            ArrayList<DivisionDTO> divisionList = divisionService.getDivisionData();
            modelAndView.addObject("division", divisionList);

            ArrayList<DistrictDTO> districtList = districtService.getDivWiseDistrict(divId);
            modelAndView.addObject("district", districtList);
            modelAndView.addObject("thana", thanaDTO);
            String menuid = request.getSession().getAttribute("thanamenuid").toString();
            modelAndView.addObject("menuid", menuid);
        }
        return modelAndView;
    }

    @RequestMapping(value = "editthana",method = RequestMethod.POST)
    RedirectView editThana (HttpServletRequest request, Principal principal,
                               @RequestParam int id,
                               @RequestParam String thananameeng,
                               @RequestParam String thananamebng,
                               @RequestParam String bbscode,
                               @RequestParam String divisionbbscode,
                               @RequestParam String districtbbscode,
                               @RequestParam int divdata,
                               @RequestParam int disdata) {


        ThanaDTO thanaDTO = new ThanaDTO();
        thanaDTO.setId(id);
        thanaDTO.setThanaNameEng(thananameeng);
        thanaDTO.setThanaNameBng(thananamebng);
        thanaDTO.setBbsCode(bbscode);
        thanaDTO.setDivisionBbsCode(divisionbbscode);
        thanaDTO.setDistrictBbsCode(districtbbscode);
        thanaDTO.setGeoDivisionId(divdata);
        thanaDTO.setGeoDistrictId(disdata);
        thanaDTO.setModifiedBy(1);
        ThanaService thanaService = new ThanaService();
        thanaService.editThana(thanaDTO);
        RedirectView rd = new RedirectView("thanalist?menuid="+request.getSession().getAttribute("thanamenuid"));
        return rd;

    }

    @RequestMapping(value = "thanadelete",method = RequestMethod.POST)
    int deleteUpazilla (HttpServletRequest request,
                                 @RequestParam int id
    ) {
        ThanaDTO thanaDTO=new ThanaDTO();
        thanaDTO.setId(id);
        thanaDTO.setModifiedBy(((Long) request.getSession().getAttribute("employeeId")).intValue());
        thanaDTO.setModified(java.sql.Timestamp.from(java.time.Instant.now()));

       return thanaService.deleteThana(thanaDTO);



    }

    @RequestMapping(value = "thanalistbydistrictid",method = RequestMethod.POST)
    @ResponseBody
    ArrayList<ThanaDTO> thanaListByDistrictId (Principal principal,
                                                     @RequestParam int id) {

        ThanaService thanaService = new ThanaService();
        ArrayList<ThanaDTO> thanaListbyDistrictId = thanaService.getThanaListbyDistrictId(id);
        return thanaListbyDistrictId;

    }


    @RequestMapping(value = "thanalistbydistrictid",method = RequestMethod.GET)
    @ResponseBody
    ArrayList<ThanaDTO> thanaListByDistrictIdget (Principal principal,
                                               @RequestParam int id) {

        ThanaService thanaService = new ThanaService();
        ArrayList<ThanaDTO> thanaListbyDistrictId = thanaService.getThanaListbyDistrictId(id);
        return thanaListbyDistrictId;

    }


    @RequestMapping(value = "getthanalistbydistrictids",method = RequestMethod.POST)
    @ResponseBody
    ArrayList<ThanaDTO> thanaListByDistrictIds (Principal principal,
                                               @RequestParam(value = "id[]") int[] ids) {

        ThanaService thanaService = new ThanaService();
        ArrayList<ThanaDTO> thanaListbyDistrictIds = thanaService.getThanaListbyDistrictIds(ids);
        return thanaListbyDistrictIds;

    }

    @RequestMapping(value = "thanahistory",method = RequestMethod.GET)
    ModelAndView upzillahistoryHistory(RedirectAttributes redirectAttributes,HttpServletRequest request,@RequestParam int id, @RequestParam String name){
        ModelAndView form = new ModelAndView();
        boolean hasAccess=urlAccessController.hasAccessPermission(request,null,"thanahistory");
        if(!hasAccess){
            // modelAndView.addObject("forbidden",1);
            redirectAttributes.addFlashAttribute("forbidden", 1);
            form.setViewName("redirect:userdashboard");

        }else {

            form.addObject("id", id);
            form.addObject("name", name);
            String menuid = request.getSession().getAttribute("thanamenuid").toString();
            form.addObject("menuid", menuid);
            form.setViewName("geo/thana/thanahistory");
        }
        return form;
    }

    @RequestMapping(value = "historythana",method = RequestMethod.GET)
    JSONObject historyThana(@RequestParam int id){

        JSONObject js  = new JSONObject();
        js.put("cc",historyService.currentChain(id, Policy.THANA_TYPE));
        js.put("pd",historyService.getParentDetail(id,Policy.THANA_TYPE));

        return js;
    }
}
