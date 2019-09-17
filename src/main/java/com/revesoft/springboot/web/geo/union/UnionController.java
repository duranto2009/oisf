package com.revesoft.springboot.web.geo.union;

import com.revesoft.springboot.web.geo.district.DistrictDTO;
import com.revesoft.springboot.web.geo.district.DistrictService;
import com.revesoft.springboot.web.geo.division.DivisionDTO;
import com.revesoft.springboot.web.geo.division.DivisionService;
import com.revesoft.springboot.web.geo.history.HistoryService;
import com.revesoft.springboot.web.geo.upazilla.UpazillaDTO;
import com.revesoft.springboot.web.geo.upazilla.UpazillaService;
import org.jose4j.json.internal.json_simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.constraints.Null;
import java.security.Principal;
import java.util.ArrayList;

/**
 * Created by reve on 10/30/2017.
 */
@RestController
public class UnionController {
    @Autowired
    DivisionService divisionService;
    @Autowired
    DistrictService districtService;
    @Autowired
    UpazillaService upazillaService;
    @Autowired
    UnionService unionService;
    @Autowired
    HistoryService historyService;

    @RequestMapping(value = "unionlist", method = RequestMethod.GET)
    public ModelAndView unionShow(HttpServletRequest request,@RequestParam int menuid) {

        ModelAndView unionShow = new ModelAndView("geo/union/unionlist");
        unionShow.addObject("menuid",menuid);
        request.getSession().setAttribute("unionmenuid",menuid);
        return unionShow;
    }


    @RequestMapping(value = "unionpagedata", method = RequestMethod.GET)
    @ResponseBody
    JSONObject unionPage(HttpServletRequest request) {
        int displayLength=1;
        if(request.getParameter("iDisplayLength") !=null)displayLength = Integer.valueOf(request.getParameter("iDisplayLength"));
        Integer pageNumber = 0;
        if (null != request.getParameter("iDisplayStart"))
            pageNumber = (Integer.valueOf(request.getParameter("iDisplayStart"))/displayLength)+1;

        //Fetch search parameter
        String searchParameterEncode = request.getParameter("sSearch");

        JSONObject listUnion = null;

        if(!searchParameterEncode.equals(";")&& searchParameterEncode.contains(";")) {
            String[] searchparameter = searchParameterEncode.split(";");

            int parameterSizeLength = searchparameter.length;
            if(parameterSizeLength>1){
                listUnion = unionService.getUnionListbyPage(pageNumber, displayLength,searchparameter);
            }
            else {
                listUnion = unionService.getUnionListbyPage(pageNumber, displayLength, searchparameter[0]);
            }
        }
        else {

            listUnion = unionService.getUnionListbyPage(pageNumber, displayLength);

        }
        JSONObject obj = new JSONObject();
        obj.put("iTotalRecords",  listUnion.get("c"));
        obj.put("iTotalDisplayRecords", listUnion.get("c"));
        obj.put("aaData", listUnion.get("d"));

         return obj;
    }

    @RequestMapping(value = "unionadd", method = RequestMethod.GET)
    ModelAndView addUnionView (HttpServletRequest request){
        ModelAndView addUnionForm = new ModelAndView("geo/union/unionadd");
        ArrayList<DivisionDTO>divisionList=divisionService.getDivisionData();
        addUnionForm.addObject("division", divisionList);
        String menuid = request.getSession().getAttribute("unionmenuid").toString();
        addUnionForm.addObject("menuid",menuid);
        return addUnionForm;
    }
    @RequestMapping(value = "addunion",method = RequestMethod.POST)
    public RedirectView addUnion( HttpServletRequest request,  @RequestParam String unionnameeng,
                                 @RequestParam String unionnamebng,
                                 @RequestParam String unionbbscode,
                                 @RequestParam String divisionbbscode,
                                 @RequestParam String districtbbscode,
                                 @RequestParam String upazillabbscode,
                                 @RequestParam int divdata,
                                 @RequestParam int disdata,
                                 @RequestParam int upadata){
        UnionDTO union = new UnionDTO();
        union.setUnionNameEng(unionnameeng);
        union.setUnionNameBng(unionnamebng);
        union.setBbsCode(unionbbscode);
        union.setGeoDivisionId(divdata);
        union.setGeoDistrictId(disdata);
        union.setGeoUpazilaId(upadata);
        union.setDivisionBbsCode(divisionbbscode);
        union.setDistrictBbsCode(districtbbscode);
        union.setUpazilaBbsCode(upazillabbscode);
        union.setCreatedBy(((Long) request.getSession().getAttribute("employeeId")).intValue());
        union.setCreated(java.sql.Timestamp.from(java.time.Instant.now()));
        unionService.addUnion(union);

        RedirectView rd=new RedirectView("unionlist?menuid="+request.getSession().getAttribute("unionmenuid"));
        return rd;

    }




    @RequestMapping(value = "unionedit",method = RequestMethod.POST)
    ModelAndView editUnionView (HttpServletRequest request,
                                   @RequestParam int id,
                                   @RequestParam String unionnameeng,
                                   @RequestParam String unionnamebng,
                                   @RequestParam String unionbbscode,
                                   @RequestParam String divisionbbscode,
                                   @RequestParam String districtbbscode,
                                   @RequestParam String upazillabbscode,
                                   @RequestParam int divId,
                                   @RequestParam int disId,
                                   @RequestParam int upaId){
        ModelAndView editUnionForm = new ModelAndView("geo/union/unionedit");

       UnionDTO union = new UnionDTO();
        union.setId(id);
        union.setUnionNameEng(unionnameeng);
        union.setUnionNameBng(unionnamebng);
        union.setBbsCode(unionbbscode);
        union.setDivisionBbsCode(divisionbbscode);
        union.setDistrictBbsCode(districtbbscode);
        union.setUpazilaBbsCode(upazillabbscode);
        union.setGeoDivisionId(divId);
        union.setGeoDistrictId(disId);
        union.setGeoUpazilaId(upaId);


        ArrayList<DivisionDTO>divisionList=divisionService.getDivisionData();
        editUnionForm.addObject("division", divisionList);


        ArrayList<DistrictDTO>districtList = districtService.getDivWiseDistrict(divId);
        editUnionForm.addObject("district", districtList);

        ArrayList<UpazillaDTO>upazillaList = upazillaService.getUpazillaListbyDistrictId(disId);
        editUnionForm.addObject("upazilla", upazillaList);

        editUnionForm.addObject("union", union);
        String menuid = request.getSession().getAttribute("unionmenuid").toString();
        editUnionForm.addObject("menuid",menuid);
        return editUnionForm;
    }

    @RequestMapping(value = "editunion",method = RequestMethod.POST)
    RedirectView editUnion (HttpServletRequest request, Principal principal,
                               @RequestParam int id,
                               @RequestParam String unionnameeng,
                               @RequestParam String unionnamebng,
                               @RequestParam String unionbbscode,
                               @RequestParam String divisionbbscode,
                               @RequestParam String districtbbscode,
                               @RequestParam String upazillabbscode,
                               @RequestParam int divdata,
                               @RequestParam int disdata,
                               @RequestParam int upadata) {


        UnionDTO union = new UnionDTO();
        union.setId(id);
        union.setUnionNameEng(unionnameeng);
        union.setUnionNameBng(unionnamebng);
        union.setBbsCode(unionbbscode);
        union.setDivisionBbsCode(divisionbbscode);
        union.setDistrictBbsCode(districtbbscode);
        union.setUpazilaBbsCode(upazillabbscode);
        union.setGeoDivisionId(divdata);
        union.setGeoDistrictId(disdata);
        union.setGeoUpazilaId(upadata);
        union.setModifiedBy(((Long) request.getSession().getAttribute("employeeId")).intValue());
        union.setModified(java.sql.Timestamp.from(java.time.Instant.now()));
        unionService.editUnion(union);
        RedirectView rd=new RedirectView("unionlist?menuid="+request.getSession().getAttribute("unionmenuid"));
        return rd;

    }

    @RequestMapping(value = "uniondelete",method = RequestMethod.POST)
    int deleteUnion (HttpServletRequest request,
                                 @RequestParam int id
    ) {
        UnionDTO unionDTO=new UnionDTO();
        unionDTO.setId(id);
        unionDTO.setModifiedBy(((Long) request.getSession().getAttribute("employeeId")).intValue());
        unionDTO.setModified(java.sql.Timestamp.from(java.time.Instant.now()));

        return unionService.deleteUnion(unionDTO);


    }

    @RequestMapping(value = "getunionlistbyupazillaid",method = RequestMethod.POST)
    @ResponseBody
    ArrayList<UnionDTO> getUnionListByUpazillaId (Principal principal,
                              @RequestParam int id
    ){
        return  unionService.getUnionListByUpazillaId(id);
    }

    @RequestMapping(value = "getunionlistbyupazillaid",method = RequestMethod.GET)
    @ResponseBody
    ArrayList<UnionDTO> getUnionListByUpazillaIdget (Principal principal,
                                                  @RequestParam int id
    ){
        return  unionService.getUnionListByUpazillaId(id);
    }


    @RequestMapping(value = "getunionlistbyupazillaids",method = RequestMethod.POST)
    @ResponseBody
    ArrayList<UnionDTO> getUnionListByUpazillaIds (Principal principal,
                                                  @RequestParam(value = "id[]") int[] ids
    ){
        return  unionService.getUnionListByUpazillaIds(ids);
    }


    @RequestMapping(value = "unionhistory",method = RequestMethod.GET)
    ModelAndView upzillahistoryHistory(HttpServletRequest request,@RequestParam int id, @RequestParam String name){
        ModelAndView form = null;
        form = new ModelAndView("geo/union/unionhistory");
        form.addObject("id",id);
        form.addObject("name",name);
        String menuid = request.getSession().getAttribute("unionmenuid").toString();
        form.addObject("menuid",menuid);
        return form;
    }

    @RequestMapping(value = "historyunion",method = RequestMethod.GET)
    JSONObject historyUnion(@RequestParam int id){
        JSONObject js  = new JSONObject();
        js.put("cc",historyService.currentChain(id,6));
        js.put("pd",historyService.getParentDetail(id,6));
        return js;
    }

}
