package com.revesoft.springboot.web.controller;

import com.revesoft.springboot.web.appregistration.ApplicationDAO;
import com.revesoft.springboot.web.configuration.ConfigConstant;
import com.revesoft.springboot.web.employee.records.EmployeeDAO;
import com.revesoft.springboot.web.geo.district.DistrictService;
import com.revesoft.springboot.web.geo.division.DivisionService;
import com.revesoft.springboot.web.menumanagement.EmployeeOrgDTO;
import com.revesoft.springboot.web.menumanagement.MenuDTO;
import com.revesoft.springboot.web.menumanagement.MenuService;
import com.revesoft.springboot.web.office.offices.OfficeDTO;
import com.revesoft.springboot.web.office.offices.OfficeService;
import com.revesoft.springboot.web.office.officeunitorganogram.OfficeUnitOrganogramService;
import com.revesoft.springboot.web.user.UserProfileDTO;
import com.revesoft.springboot.web.user.UserProfileService;
import com.revesoft.sso.*;
import com.revesoft.sso.InterAppLoginResponse;
import com.revesoft.sso.SSOResponseDTO;
import org.jose4j.json.internal.json_simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.revesoft.sso.dao.SSODAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;

@Controller
public class SSOLoginController {

    @Autowired
    private UserProfileService userProfileService;


    @Autowired
    private ApplicationDAO applicationDAO;
    @Autowired
    private MenuService menuService;

    @Autowired
    OfficeUnitOrganogramService officeUnitOrganogramService;
    @Autowired
    OfficeService officeService;
    @Autowired
    DivisionService divisionService;
    @Autowired
    DistrictService districtService;



    @RequestMapping(value = "/", method=RequestMethod.GET)
    public void showIdpLoginPage(HttpServletRequest request, HttpServletResponse response){
        try{
            AppLoginRequest appLoginRequest = new AppLoginRequest();
            String landingPageUri="";
           landingPageUri=request.getParameter("landing_page_uri");
            String loginPageUrl = appLoginRequest.getLoginPageUrl(landingPageUri);
            response.sendRedirect(loginPageUrl);
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }
//    @RequestMapping(value = "", method=RequestMethod.GET)
//    public void showIdpLoginPage(@RequestParam String landing_page_uri,  HttpServletRequest request, HttpServletResponse response){
//        try{
//            AppLoginRequest appLoginRequest = new AppLoginRequest();
//            String landingPageUri="";
//            landingPageUri=landing_page_uri;
//            String loginPageUrl = appLoginRequest.getLoginPageUrl(landingPageUri);
//            response.sendRedirect(loginPageUrl);
//        }
//        catch (Exception e){
//            e.printStackTrace();
//        }
//    }

    @RequestMapping(value = "iALoginReqInfoAjax", method = RequestMethod.POST, consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
    public @ResponseBody String iaLoginReqInfoAjax(HttpServletRequest request){
        try{
            String fromAppName = SSOPropertyReader.getInstance().getAppName();
            String toAppName = request.getParameter("toAppName");
            String landingPageUrl = request.getParameter("landingPageUrl");
            String username = (String)request.getSession().getAttribute(ConfigConstant.LOGGED_IN_USER_NAME);

            com.revesoft.sso.InterAppLoginRequest interAppLoginRequest = new com.revesoft.sso.InterAppLoginRequest(username,fromAppName);
            return interAppLoginRequest.getIALoginReqInfoAjax(toAppName,landingPageUrl);
        }
        catch (Exception ex){
            ex.printStackTrace();
            JSONObject obj = new JSONObject();
            obj.put("success", false);
            obj.put("message", "Cannot perform sso. Please contact with system admin ");
            return obj.toJSONString();
        }
    }

    @RequestMapping(value = "interapplogin", method = RequestMethod.POST)
    public ModelAndView interapplogin(HttpServletRequest request, HttpServletResponse response){
        ModelAndView modelAndView = new ModelAndView();
        try{
            String token = request.getParameter("token");
            LoginResponse loginResponse = new InterAppLoginResponse();
            SSOResponseDTO responseDTO = loginResponse.parseResponse(token);
            this.processUserAfterLogin(request,responseDTO);
            //String redirectUrl = "redirect:/" + responseDTO.getLandingPageUrl();
            modelAndView.setViewName("redirect:/userdashboard");
            //modelAndView.setViewName(redirectUrl);
            return modelAndView;
        }
        catch (Exception e){
            try{
                e.printStackTrace();
                request.getSession().invalidate();
                AppLoginRequest request1 = new AppLoginRequest();
                response.sendRedirect(request1.getLoginPageUrl());
                return null;
            }
            catch (Exception ex){
                ex.printStackTrace();
                return null;
            }
        }
    }

    @RequestMapping(value = "applogin", method = RequestMethod.POST)
    public ModelAndView performSSO(HttpServletRequest request, HttpServletResponse response){
        ModelAndView modelAndView = new ModelAndView();


        long employeeId = -1;

        boolean isNum = true;
        UserProfileDTO userProfileDTO = new UserProfileDTO();

        try{
            String response2 = request.getParameter("token");
            System.out.println("response : " + response2);
            LoginResponse loginResponse = new AppLoginResponse();

            SSOResponseDTO jwtSSOResponseDTO = loginResponse.parseResponse(response2);

            String name=jwtSSOResponseDTO.getUsername();
            employeeId = userProfileService.getEmpId(name);
            userProfileDTO = userProfileService.allInfo(name);

            LoginController.name = name;


            ArrayList<EmployeeOrgDTO> data=menuService.orgOfEmployee(employeeId);


            long orgId = userProfileService.getOrgId(employeeId);//by bony


            int officeId=officeUnitOrganogramService.getOfficeIdByOrganogramId(orgId);

            OfficeDTO officeDTO=officeService.getSingleOffice(officeId);


            HashMap<Integer,ArrayList<MenuDTO>> menuMap=new HashMap<>();


            for (EmployeeOrgDTO employeeOrgDTO:data) {
                ArrayList<MenuDTO>menuIds =menuService.getAllMenuData(employeeOrgDTO.getId());
                menuMap.put(employeeOrgDTO.getId(),menuIds);


            }

            request.getSession().setAttribute("menu",menuMap);

//            int districtId=officeDTO.getGeoDistrictId();
//            int divisionID=officeDTO.getGeoDivisionId();
            String officeName=officeDTO.getOfficeNameBng();

//            String districtName=districtService.getDistrict(districtId).getDistrictNameBng();
//            String divisionName=divisionService.getDivisionService(divisionID).getDivisionNameBng();
            String divisionName=officeDTO.getOfficeNameBng();
            request.getSession().setAttribute(ConfigConstant.LOGGED_IN_SESSION_KEY, "1");
            request.getSession().setAttribute(ConfigConstant.LOGGED_IN_USER_NAME, name);

            request.getSession().setAttribute("organogramId", orgId);//by bony

            request.getSession().setAttribute("employeeId", employeeId);//by bony


            request.getSession().setAttribute("organograms", data);//by bony
            request.getSession().setAttribute("organogramsize", data.size());//by bony

            request.getSession().setAttribute("officeId", officeId);//by forhad

            request.getSession().setAttribute("userInfo", userProfileDTO);//by bony

            request.getSession().setAttribute("office",officeName);



            //SSODAO ssoDAO = new SSODAO();
            //com.revesoft.sso.SSOResponseDTO ssoResponseDTO = ssoDAO.getSSOResponse(name);


            //this.processUserAfterLogin(request,jwtSSOResponseDTO);
            if(jwtSSOResponseDTO.getLandingPageUrl()==""){
                modelAndView.setViewName("redirect:/userdashboard");
            }else {
                modelAndView.setViewName("redirect:/"+jwtSSOResponseDTO.getLandingPageUrl());
            }

            return modelAndView;
        }
        catch (Exception ex){
            try{
                ex.printStackTrace();
                request.getSession().invalidate();
                AppLoginRequest request1 = new AppLoginRequest();
                response.sendRedirect(request1.getLoginPageUrl());
                return null;
            }
            catch (Exception e){
                e.printStackTrace();
                return null;
            }

        }
    }

    public void processUserAfterLogin(HttpServletRequest request, SSOResponseDTO ssoResponseDTO){
        UserProfileDTO userProfileDTO = new UserProfileDTO();

        userProfileDTO=userProfileService.allInfo(ssoResponseDTO.getUsername());

        //long orgId=userProfileService.getOrgId(jwtSSOResponseDTO.);//by bony
        request.getSession().setAttribute(ConfigConstant.LOGGED_IN_SESSION_KEY, "1");
        request.getSession().setAttribute(ConfigConstant.LOGGED_IN_USER_NAME, ssoResponseDTO.getUsername());

        request.getSession().setAttribute("organogramId",ssoResponseDTO.getOfficeUnitOrgId());//by bony

        request.getSession().setAttribute("employeeId",ssoResponseDTO.getEmployeeRecordId());//by bony

        request.getSession().setAttribute("userInfo",userProfileDTO);//by bony

//        SSODAO ssoDAO = new SSODAO();
//        SSOResponseDTO ssoResponseDTO2 = ssoDAO.getSSOResponse(ssoResponseDTO.getUsername());

        request.getSession().setAttribute(ConfigConstant.SSO_RESPONSE_DTO, ssoResponseDTO);
    }
}