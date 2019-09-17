package com.revesoft.springboot.web.office.offices;

import com.revesoft.springboot.web.geo.division.DivisionService;
import com.revesoft.springboot.web.office.ministry.MinistryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.jose4j.json.internal.json_simple.JSONObject;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.ReportAsSingleViolation;
import javax.validation.Valid;

import java.security.Principal;
import java.util.ArrayList;

/**
 * Created by Bony on 11/5/2017.
 */
@RestController
public class OfficeController {
    @Autowired
    DivisionService divisionService;
    @Autowired
    MinistryService ministryService;
    @Autowired
    OfficeService officeService;


    @RequestMapping(value="addoffice",method = RequestMethod.POST)
    public int addOffice(HttpServletRequest request, @RequestParam int office_ministry_id,
                          @RequestParam int office_layer_id,
                          @RequestParam int office_origin_id,
                          @RequestParam int inoutcountry,
                          @RequestParam int upacitycheck,
                          @RequestParam int unimunicheck,
                          @RequestParam String office_name_bng,
                          @RequestParam String office_name_eng,
                          @RequestParam String office_phone,
                          @RequestParam String office_mobile,
                          @RequestParam String office_fax,
                          @RequestParam String office_email,
                          @RequestParam String office_web,
                          @RequestParam String digital_nothi_code,
                          @RequestParam String ref_code,
                          @RequestParam String office_code,
                          @RequestParam int divisionid,
                          @RequestParam int districtid,
                          @RequestParam int thanaid,
                          @RequestParam int postid,
                          @RequestParam int upazilaid,
                          @RequestParam int cityid,
                          @RequestParam int unionid,
                          @RequestParam int municipalityid,
                          @RequestParam int wordno,
                          @RequestParam String address,
                          @RequestParam int  countryname,
                          @RequestParam String  detailaddress,
                          @RequestParam int  parent_office_id){

        OfficeDTO officeDTO = new OfficeDTO();
        officeDTO.setOfficeMinistryId(office_ministry_id);
        officeDTO.setOfficeLayerId(office_layer_id);
        officeDTO.setOfficeOriginId(office_origin_id);
        if(inoutcountry ==1){
            officeDTO.setCountryId(countryname);
            officeDTO.setOfficeAddress(detailaddress);
        }else if(inoutcountry ==0){
            officeDTO.setGeoDivisionId(divisionid);
            officeDTO.setGeoDistrictId(districtid);
            officeDTO.setGeoThanaId(thanaid);
            officeDTO.setGeoPostofficeId(postid);
            if(upacitycheck ==1){
                officeDTO.setGeoCityCorporationId(cityid);
                officeDTO.setGeoCityCorporationWardId(wordno);
            }
            else if(upacitycheck ==0){
                officeDTO.setGeoUpazilaId(upazilaid);
                if(unimunicheck ==0){
                    officeDTO.setGeoUnionId(unionid);
                }
                else if(unimunicheck ==1){
                    officeDTO.setGeoMunicipalityId(municipalityid);
                    officeDTO.setGeoMunicipalityWardId(wordno);
                }

            }

            officeDTO.setOfficeAddress(address);
        }
        else{
            return 0;
        }

        officeDTO.setOfficeNameBng(office_name_bng);
        officeDTO.setOfficeNameEng(office_name_eng);
        officeDTO.setOfficePhone(office_phone);
        officeDTO.setOfficeMobile(office_mobile);
        officeDTO.setOfficeFax(office_fax);
        officeDTO.setOfficeEmail(office_email);
        officeDTO.setDigitalNothiCode(digital_nothi_code);
        officeDTO.setOfficeWeb(office_web);
        officeDTO.setReferenceCode(ref_code);
        officeDTO.setOfficeCode(office_code);
        officeDTO.setParentOfficeId(parent_office_id);
        officeDTO.setCreatedBy(((Long) request.getSession().getAttribute("employeeId")).intValue());
        officeDTO.setCreated(java.sql.Timestamp.from(java.time.Instant.now()));
        return officeService.addOffice(officeDTO);



    }


    @RequestMapping(value="editoffice",method = RequestMethod.POST)
    public int editOffice(HttpServletRequest request,@RequestParam int id,
                          @RequestParam int office_ministry_id,
                          @RequestParam int office_layer_id,
                          @RequestParam int office_origin_id,
                          @RequestParam int inoutcountry,
                          @RequestParam int upacitycheck,
                          @RequestParam int unimunicheck,
                          @RequestParam String office_name_bng,
                          @RequestParam String office_name_eng,
                          @RequestParam String office_phone,
                          @RequestParam String office_mobile,
                          @RequestParam String office_fax,
                          @RequestParam String office_email,
                          @RequestParam String office_web,
                          @RequestParam String digital_nothi_code,
                          @RequestParam String ref_code,
                          @RequestParam String office_code,
                          @RequestParam int divisionid,
                          @RequestParam int districtid,
                          @RequestParam int thanaid,
                          @RequestParam int postid,
                          @RequestParam int upazilaid,
                          @RequestParam int cityid,
                          @RequestParam int unionid,
                          @RequestParam int municipalityid,
                          @RequestParam int wordno,
                          @RequestParam String address,
                          @RequestParam int  countryname,
                          @RequestParam String  detailaddress,
                          @RequestParam int  parent_office_id){

        OfficeDTO officeDTO = new OfficeDTO();
        officeDTO.setOfficeMinistryId(office_ministry_id);
        officeDTO.setOfficeLayerId(office_layer_id);
        officeDTO.setOfficeOriginId(office_origin_id);
        if(inoutcountry ==1){
            officeDTO.setCountryId(countryname);
            officeDTO.setOfficeAddress(detailaddress);
        }else if(inoutcountry ==0){
            officeDTO.setGeoDivisionId(divisionid);
            officeDTO.setGeoDistrictId(districtid);
            officeDTO.setGeoThanaId(thanaid);
            officeDTO.setGeoPostofficeId(postid);
            if(upacitycheck ==1){
                officeDTO.setGeoCityCorporationId(cityid);
                officeDTO.setGeoCityCorporationWardId(wordno);
            }
            else if(upacitycheck ==0){
                officeDTO.setGeoUpazilaId(upazilaid);
                if(unimunicheck ==0){
                    officeDTO.setGeoUnionId(unionid);
                }
                else if(unimunicheck ==1){
                    officeDTO.setGeoMunicipalityId(municipalityid);
                    officeDTO.setGeoMunicipalityWardId(wordno);
                }

            }

            officeDTO.setOfficeAddress(address);
        }
        else{
            return 0;
        }

        officeDTO.setId(id);
        officeDTO.setOfficeNameBng(office_name_bng);
        officeDTO.setOfficeNameEng(office_name_eng);
        officeDTO.setOfficePhone(office_phone);
        officeDTO.setOfficeMobile(office_mobile);
        officeDTO.setOfficeFax(office_fax);
        officeDTO.setOfficeEmail(office_email);
        officeDTO.setDigitalNothiCode(digital_nothi_code);
        officeDTO.setOfficeWeb(office_web);
        officeDTO.setReferenceCode(ref_code);
        officeDTO.setOfficeCode(office_code);
        officeDTO.setParentOfficeId(parent_office_id);
        officeDTO.setModifiedBy(((Long) request.getSession().getAttribute("employeeId")).intValue());
        officeDTO.setModified(java.sql.Timestamp.from(java.time.Instant.now()));
        return officeService.editOffice(officeDTO);



    }

    @RequestMapping(value="deleteoffice",method = RequestMethod.POST)
    public int deleteoffice(HttpServletRequest request,@RequestParam int id){

        OfficeDTO officeDTO = new OfficeDTO();
        officeDTO.setId(id);
        officeDTO.setModifiedBy(((Long) request.getSession().getAttribute("employeeId")).intValue());
        officeDTO.setModified(java.sql.Timestamp.from(java.time.Instant.now()));
       return officeService.deleteOffice(officeDTO);

    }
    @RequestMapping(value = "jstree", method = RequestMethod.POST)
    public ModelAndView jsTree(Principal principal, @RequestParam int id, @RequestParam int officeOriginId){
        ModelAndView jsTree = new ModelAndView("offices/office/jstree");
        jsTree.addObject("officeId",id);
        jsTree.addObject("officeOriginId",officeOriginId);
        return jsTree;
    }
    @RequestMapping(value = "officeroot", method = RequestMethod.POST)
    public JSONObject officeRoot(Principal principal, @RequestParam int id){
       JSONObject js = new JSONObject();
       js.put("id","root-"+id);
       js.put("icon","fa fa-tree");
       js.put("children",true);
        return js;
    }


    @RequestMapping(value = "getofficelist", method = RequestMethod.GET)
    @ResponseBody
    public ArrayList<OfficeDTO> getOfficeList(){
        ArrayList<OfficeDTO> officeDTOS =  null;
//        OfficeService officeService = new OfficeService();
        officeDTOS = officeService.getOfficeList();
        return officeDTOS;
    }

    @RequestMapping(value = "getofficelistbylayer", method = RequestMethod.POST)
    @ResponseBody
    public ArrayList<OfficeDTO> getOfficeListByLayer(@RequestParam int id){
        ArrayList<OfficeDTO> officeDTOS =  null;
//        OfficeService officeService = new OfficeService();
        officeDTOS = officeService.getOfficeList(id);
        return officeDTOS;
    }

    @RequestMapping(value = "officebyministry", method = RequestMethod.GET)
    @ResponseBody
    public ArrayList<OfficeDTO> officebyMinistry(@RequestParam int id){
        ArrayList<OfficeDTO> officeDTOS =  null;
//        OfficeService officeService = new OfficeService();
        officeDTOS = officeService.officebyMinistry(id);
        return officeDTOS;
    }

    @RequestMapping(value = "officebyministrylayerorigin", method = RequestMethod.GET)
    @ResponseBody
    public ArrayList<OfficeDTO> officebyMinistryLayerOrigin(@RequestParam int ministry, @RequestParam int layer, @RequestParam int origin){
        ArrayList<OfficeDTO> officeDTOS =  null;
//        OfficeService officeService = new OfficeService();
        officeDTOS = officeService.officebyMinistryLayerOrigin(ministry, layer, origin);
        return officeDTOS;
    }

    @RequestMapping(value = "getofficelistbylayeranddivisionanddistrict", method = RequestMethod.POST)
    @ResponseBody
    public ArrayList<OfficeDTO> getOfficeListByLayer(@RequestParam int id,@RequestParam int divisionid, @RequestParam int districtid){
        ArrayList<OfficeDTO> officeDTOS =  null;
//        OfficeService officeService = new OfficeService();
        officeDTOS = officeService.getOfficeList(id,divisionid,districtid);
        return officeDTOS;
    }

    @RequestMapping(value = "officelistview", method = RequestMethod.GET)
    public ModelAndView showOffice(Principal principal){
        ModelAndView officeShow = new ModelAndView("offices/office/officeshow");

        return officeShow;
    }
    @RequestMapping(value = "getsingleofffice",method = RequestMethod.GET)
   OfficeDTO getSingle(@RequestParam  int id){

        return officeService.getSingleOffice(id);
    }

    @RequestMapping(value = "getofficelistbypage", method = RequestMethod.GET)
    @ResponseBody
    public JSONObject getOfficeListbyPage(HttpServletRequest request, HttpServletResponse response) {

        int displayLength=1;
        if(request.getParameter("iDisplayLength") !=null)displayLength = Integer.valueOf(request.getParameter("iDisplayLength"));
        Integer pageNumber = 0;
        if (null != request.getParameter("iDisplayStart"))
            pageNumber = (Integer.valueOf(request.getParameter("iDisplayStart"))/displayLength)+1;

        //Fetch search parameter
        String searchParameterEncode = request.getParameter("sSearch");

//        OfficeService officeService = new OfficeService();
        ArrayList<OfficeDTO> listOffice = null;

        if(!searchParameterEncode.equals(";")&& searchParameterEncode.contains(";")) {
            String[] searchparameter = searchParameterEncode.split(";");

            int parameterSizeLength = searchparameter.length;
            if(parameterSizeLength>1){
                listOffice = officeService.getOfficeListbyPage(pageNumber, displayLength,searchparameter);
            }
            else {
                listOffice = officeService.getOfficeListbyPage(pageNumber, displayLength, searchparameter[0]);
            }
        }
        else {

            listOffice = officeService.getOfficeListbyPage(pageNumber, displayLength);

        }
        JSONObject obj = new JSONObject();
        obj.put("iTotalRecords", officeService.getCount());
        obj.put("iTotalDisplayRecords", officeService.getCount());
        obj.put("aaData", listOffice);

        return obj;
    }

    @RequestMapping(value = "officelist")
    ModelAndView officeList(HttpServletRequest request, @RequestParam int menuid){
        ModelAndView modelAndView = new ModelAndView("office/office_/officelist");
        request.getSession().setAttribute("officemenuid",menuid);
        modelAndView.addObject("ministry",ministryService.getAll());
        modelAndView.addObject("menuid",menuid);
        return modelAndView;
    }

    @RequestMapping (value = "officeinfocorrection",method = RequestMethod.GET)
    ModelAndView officeCorrection(HttpServletRequest request){

        ModelAndView modelAndView= new ModelAndView();
        modelAndView.addObject("office",officeService.getSingleOffice(53));
        modelAndView.setViewName("office/office_/officeedit");
        return modelAndView;

    }

}
