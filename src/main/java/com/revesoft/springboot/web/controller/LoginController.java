package com.revesoft.springboot.web.controller;

import com.revesoft.springboot.web.appregistration.ApplicationDAO;
import com.revesoft.springboot.web.auth.SessionUtil;
import com.revesoft.springboot.web.configuration.ConfigConstant;
import com.revesoft.springboot.web.employee.records.EmployeeDAO;
import com.revesoft.springboot.web.employee.records.EmployeeService;
import com.revesoft.springboot.web.geo.district.DistrictService;
import com.revesoft.springboot.web.geo.division.DivisionService;
import com.revesoft.springboot.web.menumanagement.EmployeeOrgDTO;
import com.revesoft.springboot.web.menumanagement.MenuDTO;
import com.revesoft.springboot.web.menumanagement.MenuService;
import com.revesoft.springboot.web.office.offices.OfficeDTO;
import com.revesoft.springboot.web.office.offices.OfficeService;
import com.revesoft.springboot.web.office.officeunitorganogram.OfficeUnitOrganogramDTO;
import com.revesoft.springboot.web.office.officeunitorganogram.OfficeUnitOrganogramService;
import com.revesoft.springboot.web.user.UserProfileDTO;
import com.revesoft.springboot.web.user.UserProfileService;

import com.revesoft.springboot.web.util.PasswordService;
import com.revesoft.sso.AppLoginRequest;
import com.revesoft.sso.AppLogoutRequest;
import databasemanager.DatabaseManager;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

//import com.revesoft.springboot.web.service.LoginService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import com.revesoft.sso.dao.SSODAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.HashMap;

import org.apache.log4j.Logger;

@Controller
@SessionAttributes("name")
public class LoginController {

    public static String name = "";
    private static final String USER_AGENT = "Mozilla/5.0";
    public String loginTo = "";
    public Connection connection = null;
    public ResultSet resultSet = null;
    public PreparedStatement preparedStatement = null;
    Logger logger = Logger.getLogger(LoginController.class);
    public String username = "";
    public String sessionId = "";
    public String domainName = "";

//    @Value("${server.ip.oisf}")
//    private String oisfIp;
//
//    @Value("${server.ip.grs}")
//    private String grsIp;
//
//    @Value("${server.port.oisf}")
//    private int oisfPort;
//
//    @Value("${server.port.grs}")
//    private int grsPort;
//
//    @Autowired
//    LoginService service;

    @Autowired
    private ApplicationDAO applicationDAO;
    @Autowired
    private MenuService menuService;

    @Autowired
    private UserProfileService userProfileService;

    @Autowired
    OfficeUnitOrganogramService officeUnitOrganogramService;
    @Autowired
    OfficeService officeService;
    @Autowired
    DivisionService divisionService;
    @Autowired
    DistrictService districtService;

    @RequestMapping(value = {"/login"}, method = RequestMethod.GET)
    public ModelAndView showLoginPage(HttpServletRequest request,ModelMap model) {

//        String redirectUrl=request.getHeader("Referer");
//        //String context=request.getContextPath();
//        if(redirectUrl!=null){
//
//            redirectUrl.replaceAll(request.getContextPath(),"");
//            request.getSession().setAttribute("redirectUrl",redirectUrl);
//        }


//        request.getSession().removeAttribute("organogramId");
//        request.getSession().removeAttribute("employeeId");
//        request.getSession().removeAttribute("organograms");
//        request.getSession().removeAttribute("organogramsize");
//        request.getSession().removeAttribute("officeId");
//        request.getSession().removeAttribute("userInfo");

       // request.getSession().invalidate();

       // SessionUtil.destroySession(request);
        


        ModelAndView modelAndView = new ModelAndView("login");
        return modelAndView;
    }

//    @RequestMapping(value = "logout", method = RequestMethod.GET)
//    public void jwtLogout(HttpServletRequest request, HttpServletResponse response) {
//        try {
//            String username = (String) request.getSession().getAttribute("userName");
//            request.getSession().invalidate();
//            AppLoginRequest appLoginRequest = new AppLoginRequest();
//            response.sendRedirect(appLoginRequest.getLoginPageUrl());
//        } catch (Exception ex) {
//            ex.printStackTrace();
//            System.out.println(" Exception : " + ex);
//        }
//    }

    @RequestMapping(value = "logout", method = RequestMethod.GET)
    public void jwtLogout(HttpServletRequest request, HttpServletResponse response) {
        try {
            String username = (String) request.getSession().getAttribute("userName");
            request.getSession().invalidate();
            //AppLoginRequest appLoginRequest = new AppLoginRequest();
            //response.sendRedirect(appLoginRequest.getLoginPageUrl());

            AppLogoutRequest appLogoutRequest = new AppLogoutRequest();
            response.sendRedirect(appLogoutRequest.buildLogoutRequest());
        } catch (Exception ex) {
            ex.printStackTrace();
            System.out.println(" Exception : " + ex);
        }
    }

    @RequestMapping(value = "login", method = RequestMethod.POST)
    public ModelAndView showWelcomePage(
            HttpServletRequest request,
            ModelMap model,
            @RequestParam String name,
            @RequestParam int optradio,
            @RequestParam String password,
            HttpSession httpSession
    ) throws Exception {
//        LoginAction loginAction = new LoginAction();
//        loginAction.execute(name,password);
        ModelAndView modelAndView = new ModelAndView();
        LoginController.name = name;
        UserProfileDTO userProfileDTO = new UserProfileDTO();

        System.out.println(" name : " + name);

        long employeeId = -1;

        boolean isNum = true;

        try {
            int id = Integer.parseInt(name);
        } catch (NumberFormatException nfe) {
            isNum = false;
        }
        System.out.println(" name : " + name);
        employeeId = userProfileService.getEmpId(name);
        userProfileDTO = userProfileService.allInfo(name);



        ArrayList<EmployeeOrgDTO> data=menuService.orgOfEmployee(employeeId);

        HashMap<Integer,ArrayList<MenuDTO>> menuMap=new HashMap<>();


        for (EmployeeOrgDTO employeeOrgDTO:data) {
            ArrayList<MenuDTO>menuIds =menuService.getAllMenuData(employeeOrgDTO.getId());
            menuMap.put(employeeOrgDTO.getId(),menuIds);


        }


        long orgId = userProfileService.getOrgId(employeeId);//by bony



        int officeId=officeUnitOrganogramService.getOfficeIdByOrganogramId(orgId);

        OfficeDTO officeDTO=officeService.getSingleOffice(officeId);

        int districtId=officeDTO.getGeoDistrictId();
        int divisionID=officeDTO.getGeoDivisionId();
        //String districtName=districtService.getDistrict(districtId).getDistrictNameBng();
//        String divisionName=divisionService.getDivisionService(divisionID).getDivisionNameBng();
        String officeName=officeDTO.getOfficeNameBng();



        //OfficeUnitOrganogramDTO officeUnitOrganogramDTO=officeUnitOrganogramService.;
        boolean isValidUser = false;

        if(!(userProfileDTO.getPassword()==null)){
            if(PasswordService.checkPassword(password,userProfileDTO.getPassword())){
                isValidUser = true;
            }else{
                isValidUser = false;
            }
        }else{
            isValidUser = false;
        }


        //must change for validation
//        service.validateUser(name, password);
        String hashedPass = PasswordService.getInstance().encrypt(password);
//        if(PasswordService.checkPassword(password,userProfileDTO.getPassword())){
//            isValidUser = true;
//        }else{
//            isValidUser = false;
//        }
        System.out.println(" is valid user : " + isValidUser);
//        isValidUser = true;

        if (!isValidUser) {
            System.out.println(" ----------------------------------- invalidating sessions ... ");
            request.getSession().invalidate();
            modelAndView = new ModelAndView();
            modelAndView.addObject("wrong",1);
            modelAndView.setViewName("redirect:/login");
            return modelAndView;
        }


        System.out.println(" ----------------------------------- giving user sessions ... ");
        request.getSession().setAttribute(ConfigConstant.LOGGED_IN_SESSION_KEY, "1");
        request.getSession().setAttribute(ConfigConstant.LOGGED_IN_USER_NAME, name);


        request.getSession().setAttribute("organogramId", orgId);//by bony

        request.getSession().setAttribute("employeeId", employeeId);//by bony


        request.getSession().setAttribute("organograms", data);//by bony
        request.getSession().setAttribute("organogramsize", data.size());//by bony

        request.getSession().setAttribute("officeId", officeId);//by forhad

        request.getSession().setAttribute("userInfo", userProfileDTO);//by bony


        request.getSession().setAttribute("office",officeName);

        request.getSession().setAttribute("menu",menuMap);
//        request.getSession().setAttribute("district",districtName);




        SSODAO ssoDAO = new SSODAO();
        com.revesoft.sso.SSOResponseDTO ssoResponseDTO = ssoDAO.getSSOResponse(name);

//        request.getSession().setAttribute(ConfigConstant.SSO_RESPONSE_DTO, ssoResponseDTO);
        String redirectUrl= (String) request.getSession().getAttribute("redirectUrl");
        if(redirectUrl!=null){
            modelAndView.setViewName(redirectUrl);
        }else{
            modelAndView.setViewName("redirect:/userdashboard");
        }


        //modelAndView.setViewName("configurabledashboard/userdashboard");
        return modelAndView;
    }
}
