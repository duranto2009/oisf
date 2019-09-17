package com.revesoft.springboot.web.geo.postoffice;

import com.revesoft.springboot.web.geo.district.DistrictDTO;
import com.revesoft.springboot.web.geo.district.DistrictService;
import com.revesoft.springboot.web.geo.division.DivisionDTO;
import com.revesoft.springboot.web.geo.division.DivisionService;
import com.revesoft.springboot.web.geo.history.HistoryService;
import com.revesoft.springboot.web.geo.thana.ThanaDTO;
import com.revesoft.springboot.web.geo.thana.ThanaService;
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
public class PostOfficeController {
    @Autowired
    DivisionService divisionService;
    @Autowired
    DistrictService districtService;
    @Autowired
    UpazillaService upazillaService;
    @Autowired
    ThanaService thanaService;
    @Autowired
    PostOfficeService postOfficeService;
    @Autowired
    HistoryService historyService;

    @RequestMapping(value = "postofficelist", method = RequestMethod.GET)
    public ModelAndView postofficeList(HttpServletRequest request, @RequestParam int menuid) {

        ModelAndView postofficeList = new ModelAndView("geo/postoffice/postofficelist");
        request.getSession().setAttribute("postofficemenuid",menuid);
        postofficeList.addObject("menuid",menuid);
        return postofficeList;
    }


    @RequestMapping(value = "postofficepagedata", method = RequestMethod.GET)
    @ResponseBody
    JSONObject postofficePage(HttpServletRequest request, HttpServletResponse response) {

        int displayLength=1;
        if(request.getParameter("iDisplayLength") !=null)displayLength = Integer.valueOf(request.getParameter("iDisplayLength"));
        Integer pageNumber = 0;
        if (null != request.getParameter("iDisplayStart"))
            pageNumber = (Integer.valueOf(request.getParameter("iDisplayStart"))/displayLength)+1;


        //Fetch search parameter
        String searchParameterEncode = request.getParameter("sSearch");

        JSONObject listPostoffice = null;

        if(!searchParameterEncode.equals(";")&& searchParameterEncode.contains(";")) {
            String[] searchparameter = searchParameterEncode.split(";");

            int parameterSizeLength = searchparameter.length;
            if(parameterSizeLength>1){
                listPostoffice = postOfficeService.getPostOfficeListbyPage(pageNumber, displayLength,searchparameter);
            }
            else {
                listPostoffice = postOfficeService.getPostOfficeListbyPage(pageNumber, displayLength, searchparameter[0]);
            }
        }
        else {

            listPostoffice = postOfficeService.getPostOfficeListbyPage(pageNumber, displayLength);

        }

        JSONObject obj=new JSONObject();
        obj.put("iTotalRecords",listPostoffice.get("c"));
        obj.put("iTotalDisplayRecords",listPostoffice.get("c"));
        obj.put("aaData",listPostoffice.get("d"));
        return obj;
    }

    @RequestMapping(value = "postofficeadd", method = RequestMethod.GET)
    ModelAndView postofficeAdd (HttpServletRequest request){
        ModelAndView postofficeAdd = new ModelAndView("geo/postoffice/postofficeadd");
        ArrayList<DivisionDTO>divisionList=divisionService.getDivisionData();
        postofficeAdd.addObject("division", divisionList);
        String menuid = request.getSession().getAttribute("postofficemenuid").toString();
        postofficeAdd.addObject("menuid",menuid);
        return postofficeAdd;
    }
    @RequestMapping(value = "addpostoffice",method = RequestMethod.POST)
    RedirectView addPostoffice(HttpServletRequest request, Principal principal, @RequestParam String postofficenameeng,
                              @RequestParam String postofficenamebng,
                              @RequestParam String postofficebbscode,
                              @RequestParam String divisionbbscode,
                              @RequestParam String districtbbscode,
                              @RequestParam String upazillabbscode,
                              @RequestParam String thanabbscode,
                              @RequestParam int divdata,
                              @RequestParam int disdata,
                              @RequestParam int upadata,
                              @RequestParam int thadata   ){
        PostOfficeDTO postoffice = new PostOfficeDTO();
        postoffice.setPostOfficeNameEng(postofficenameeng);
        postoffice.setPostOfficeNameBng(postofficenamebng);
        postoffice.setBbsCode(postofficebbscode);
        postoffice.setGeoDivisionId(divdata);
        postoffice.setGeoDistrictId(disdata);
        postoffice.setGeoUpazilaId(upadata);
        postoffice.setGeoThanaId(thadata);
        postoffice.setDivisionBbsCode(divisionbbscode);
        postoffice.setDistrictBbsCode(districtbbscode);
        postoffice.setUpazilaBbsCode(upazillabbscode);
        postoffice.setThanaBbsCode(thanabbscode);
        postoffice.setCreatedBy(((Long) request.getSession().getAttribute("employeeId")).intValue());
        postoffice.setCreated(java.sql.Timestamp.from(java.time.Instant.now()));
        postOfficeService.addPostOffice(postoffice);

        RedirectView rd=new RedirectView("postofficelist?menuid="+request.getSession().getAttribute("postofficemenuid"));
        return rd;

    }




    @RequestMapping(value = "postofficeedit",method = RequestMethod.POST)
    ModelAndView postofficeEdit (HttpServletRequest request,
                                           @RequestParam int id,
                                           @RequestParam String postofficenameeng,
                                           @RequestParam String postofficenamebng,
                                           @RequestParam String postofficebbscode,
                                           @RequestParam String divisionbbscode,
                                           @RequestParam String districtbbscode,
                                           @RequestParam String upazillabbscode,
                                           @RequestParam String thanabbscode,
                                           @RequestParam int divId,
                                           @RequestParam int disId,
                                           @RequestParam int upaId,
                                           @RequestParam int thaId){
        ModelAndView editPostOfficeForm = new ModelAndView("geo/postoffice/postofficeedit");

        PostOfficeDTO postoffice = new PostOfficeDTO();
        postoffice.setId(id);
        postoffice.setPostOfficeNameEng(postofficenameeng);
        postoffice.setPostOfficeNameBng(postofficenamebng);
        postoffice.setBbsCode(postofficebbscode);
        postoffice.setDivisionBbsCode(divisionbbscode);
        postoffice.setDistrictBbsCode(districtbbscode);
        postoffice.setUpazilaBbsCode(upazillabbscode);
        postoffice.setThanaBbsCode(thanabbscode);
        postoffice.setGeoDivisionId(divId);
        postoffice.setGeoDistrictId(disId);
        postoffice.setGeoUpazilaId(upaId);
        postoffice.setGeoThanaId(thaId);


        ArrayList<DivisionDTO>divisionList=divisionService.getDivisionData();
        editPostOfficeForm.addObject("division", divisionList);

        ArrayList<DistrictDTO>districtList = districtService.getDivWiseDistrict(divId);
        editPostOfficeForm.addObject("district", districtList);

        ArrayList<UpazillaDTO>upazillaList = upazillaService.getUpazillaListbyDistrictId(disId);
        editPostOfficeForm.addObject("upazilla", upazillaList);

        ArrayList<ThanaDTO>thanaList = thanaService.getThanaListbyDistrictId(disId);
        editPostOfficeForm.addObject("thana", thanaList);

        editPostOfficeForm.addObject("postoffice", postoffice);
        String menuid = request.getSession().getAttribute("postofficemenuid").toString();
        editPostOfficeForm.addObject("menuid",menuid);
        return editPostOfficeForm;
    }

    @RequestMapping(value = "editpostoffice",method = RequestMethod.POST)
    RedirectView editPostoffice (HttpServletRequest request, Principal principal,
                                       @RequestParam int id,
                                       @RequestParam String postofficenameeng,
                                       @RequestParam String postofficenamebng,
                                       @RequestParam String postofficebbscode,
                                       @RequestParam String divisionbbscode,
                                       @RequestParam String districtbbscode,
                                       @RequestParam String upazillabbscode,
                                       @RequestParam String thanabbscode,
                                       @RequestParam int divdata,
                                       @RequestParam int disdata,
                                       @RequestParam int upadata,
                                       @RequestParam int thadata ) {


        PostOfficeDTO postoffice = new PostOfficeDTO();
        postoffice.setId(id);
        postoffice.setPostOfficeNameEng(postofficenameeng);
        postoffice.setPostOfficeNameBng(postofficenamebng);
        postoffice.setBbsCode(postofficebbscode);
        postoffice.setGeoDivisionId(divdata);
        postoffice.setGeoDistrictId(disdata);
        postoffice.setGeoUpazilaId(upadata);
        postoffice.setGeoThanaId(thadata);
        postoffice.setDivisionBbsCode(divisionbbscode);
        postoffice.setDistrictBbsCode(districtbbscode);
        postoffice.setUpazilaBbsCode(upazillabbscode);
        postoffice.setThanaBbsCode(thanabbscode);
        postoffice.setModifiedBy(((Long) request.getSession().getAttribute("employeeId")).intValue());
        postoffice.setModified(java.sql.Timestamp.from(java.time.Instant.now()));
        postOfficeService.editPostOffice(postoffice);
        RedirectView rd=new RedirectView("postofficelist?menuid="+request.getSession().getAttribute("postofficemenuid"));
        return rd;

    }

    @RequestMapping(value = "postofficedelete",method = RequestMethod.POST)
    int postofficeDelete (HttpServletRequest request,
                                         @RequestParam int id
    ) {
        PostOfficeDTO postOfficeDTO=new PostOfficeDTO();
        postOfficeDTO.setId(id);
        postOfficeDTO.setModifiedBy(((Long) request.getSession().getAttribute("employeeId")).intValue());
        postOfficeDTO.setModified(java.sql.Timestamp.from(java.time.Instant.now()));
        return postOfficeService.deletePostOffice(postOfficeDTO);


    }

    @RequestMapping(value = "postofficehistory",method = RequestMethod.GET)
    ModelAndView postofficeHistory(HttpServletRequest request, @RequestParam int id, @RequestParam String name){
        ModelAndView form = null;
        form = new ModelAndView("geo/postoffice/postofficehistory");
        form.addObject("id",id);
        form.addObject("name",name);
        String menuid = request.getSession().getAttribute("postofficemenuid").toString();
        form.addObject("menuid",menuid);
        return form;
    }

    @RequestMapping(value = "historypostoffice",method = RequestMethod.GET)
    JSONObject historyPostoffice(@RequestParam int id){

        JSONObject js  = new JSONObject();
        js.put("cc",historyService.currentChain(id, Policy.POST_OFFICE_TYPE));
        return js;
    }

    @RequestMapping(value = "postofficebydis",method = RequestMethod.GET)
    ArrayList<PostOfficeDTO>  postofficebyDis (Principal principal,
                           @RequestParam int id
    ) {

        return  postOfficeService.postofficebyDis(id);

    }

}
