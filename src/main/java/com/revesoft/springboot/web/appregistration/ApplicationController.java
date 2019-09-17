package com.revesoft.springboot.web.appregistration;
import javax.servlet.ServletContext;
import com.revesoft.springboot.web.auth.SecurityUtil;
import com.revesoft.springboot.web.util.AllTable;
import com.revesoft.springboot.web.util.ImageUploader;
import com.revesoft.springboot.web.util.PathBuilder;
import com.revesoft.springboot.web.util.URLAccessController;
import org.apache.commons.text.RandomStringGenerator;
import org.jose4j.json.internal.json_simple.JSONArray;
import org.jose4j.json.internal.json_simple.JSONObject;
import org.jose4j.json.internal.json_simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.ApplicationContext;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import java.io.File;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Optional;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;

import javax.persistence.criteria.CriteriaBuilder;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

/**
 * Created by Bony on 9/18/2017.
 */
@RestController
public class ApplicationController {

    @Value("${spring.mail.username}")
    private String fromMail;

    @Value("${base.uri.applicationLogo}")
    private String applicationLogeLocation;

    @Value("${base.uri.applicationLogoURL}")
    private String applicatonLogoUrl;

    @Autowired
    private ApplicationService applicationService;
    @Autowired
    private ImageUploader imageUploader;

    @Autowired

    ServletContext context;

    @Autowired
    URLAccessController urlAccessController;
    public static final String MODULE_NAME = "applications";


    private static String UPLOADED_FOLDER = "F:\\OISF\\svn OISF\\src\\main\\resources\\" + "\\static\\assets\\img\\dashboardicon\\";

    @RequestMapping(value = "appregistration", method = RequestMethod.GET)
    public ModelAndView appReg(HttpServletRequest request,Model model, RedirectAttributes redirectAttributes) {
        ApplicationDTO applicationDTO = new ApplicationDTO();
        model.addAttribute("appMenuDTO", applicationDTO);
        ModelAndView modelAndView = new ModelAndView();

        boolean hasAccess=urlAccessController.hasAccessPermission(request,null,"appregistration");
        if(!hasAccess){
            // modelAndView.addObject("forbidden",1);
            redirectAttributes.addFlashAttribute("forbidden", 1);
            modelAndView.setViewName("redirect:userdashboard");

        }else {
            String menuid = request.getSession().getAttribute("listmenuid").toString();
            modelAndView.addObject("menuid",menuid);
            modelAndView.setViewName("appRegister/registration");
        }


        return modelAndView;
    }

    private ApplicationDTO imageUpload(MultipartFile file, String moduelName, ApplicationDTO applicationDTO) {

        HashMap<Integer, String> mappedPath = new PathBuilder().buildPath(context, moduelName, "webapp");
        //String relativepath=System.getProperty("catalina.base")+ File.separator+

        String fileName = imageUploader.upload(file, applicationLogeLocation, Long.toString(applicationDTO.getId()));
        String filepath = applicatonLogoUrl+fileName;

//       pathToDB = pathToDB.replaceAll("\\\\", File.separator);
        if (fileName.equals("invalid")) {


        } else {
            applicationDTO.setLogoUrl(filepath);
        }
        return applicationDTO;

    }

    @RequestMapping(value = "appregistration", method = RequestMethod.POST)
    public ModelAndView appInsert(HttpServletRequest request,
                                  @RequestParam String appname,
                                  @RequestParam("file") MultipartFile file,
                                  @RequestParam String appnamebng,
                                  @RequestParam String link,
                                  @RequestParam String mobile,
                                  @RequestParam String email,
                                  @RequestParam int mechanism,
                                  @RequestParam String redirect_url,
                                  @RequestParam String default_page_url,
                                  @RequestParam String logout_url
    ) {


        // HashMap<Integer,String> uploadPath=new PathBuilder().buildPath(context,MODULE_NAME,"webapp");


        //String pa=absoulatePart;


        ApplicationDTO applicationDTO = new ApplicationDTO();
        applicationDTO.setId(applicationService.idGenaretor());

        applicationDTO = imageUpload(file, MODULE_NAME, applicationDTO);

        applicationDTO.setName(appname);

        applicationDTO.setNameBng(appnamebng);
        applicationDTO.setLink(link);
        applicationDTO.setRedirect(redirect_url);
        applicationDTO.setStatus(1);
        applicationDTO.setIs_framework(0);
        applicationDTO.setAllowedIP("0");
        applicationDTO.setAppDomainEmail(email);
        applicationDTO.setMobileNo(mobile);
        applicationDTO.setFrameworkID(1);
        if (mechanism == 0) {
            applicationDTO.setNotificationFlag("sms");

        } else {
            applicationDTO.setNotificationFlag("email");
        }

        applicationDTO.setDashShareFlag(1);
        applicationDTO.setCreateDate(LocalDateTime.now().toString());
        applicationDTO.setUpadateDate(LocalDateTime.now().toString());
        applicationDTO.setDefaultPageURL(default_page_url);
        applicationDTO.setLogoutURL(logout_url);
        applicationDTO.setUpdatedBy(1);
        applicationDTO.setCreatedBy(1);
        applicationDTO.setApplicationSecret(SecurityUtil.generateRandomString());

        Long desig = (Long) request.getSession().getAttribute("organogramId");

        try {
            applicationService.addApplicationService(applicationDTO, desig);
        } catch (Exception e) {
            e.printStackTrace();
        }

        ModelAndView modelAndView = new ModelAndView(new RedirectView("list?menuid="+request.getSession().getAttribute("listmenuid"), true));
        modelAndView.addObject("success", "true");

//        return new RedirectView("list");
        return modelAndView;
    }


    @RequestMapping(path = "approvelist")
    public ArrayList<ApplicationDTO> approveApp() {
        return applicationService.getApprovalMenuService();
    }

    @RequestMapping(path = "applist")
    public ArrayList<ApplicationDTO> allApp() {
        return applicationService.getAppData();
    }

    @ResponseBody
    @RequestMapping(value = "list", method = RequestMethod.GET)
    public ModelAndView appList(RedirectAttributes redirectAttributes,HttpServletRequest request, @RequestParam (value = "menuid",required = false) Integer menuid) {
        ModelAndView modelAndView = new ModelAndView();
            boolean hasAccess=urlAccessController.hasAccessPermission(request,menuid,"list");
            if(!hasAccess){
               // modelAndView.addObject("forbidden",1);
                redirectAttributes.addFlashAttribute("forbidden", 1);
                modelAndView.setViewName("redirect:userdashboard");

            }else {

                modelAndView.setViewName("appRegister/list");
                modelAndView.addObject("menuid",menuid);
                request.getSession().setAttribute("listmenuid",menuid);

            }


        return modelAndView;
    }

    @ResponseBody
    @RequestMapping(value = "approval", method = RequestMethod.GET)
    public ModelAndView appApprovalList(HttpServletRequest request,RedirectAttributes redirectAttributes,@RequestParam int menuid) {
        ModelAndView modelAndView = new ModelAndView();
        List<ApplicationDTO> data = new ArrayList<>();
        boolean hasAccess=urlAccessController.hasAccessPermission(request,menuid,"approval");
        if(!hasAccess){
            // modelAndView.addObject("forbidden",1);
            redirectAttributes.addFlashAttribute("forbidden", 1);
            modelAndView.setViewName("redirect:userdashboard");

        }else {
            try {
                data = applicationService.getApprovalMenuService();
            } catch (Exception e) {
                e.printStackTrace();
            }
            modelAndView.addObject("list", data);
            modelAndView.setViewName("appRegister/approve");
            modelAndView.addObject("menuid",menuid);

        }

        return modelAndView;
    }

    @RequestMapping(value = "editapp")
    public ModelAndView editApp(HttpServletRequest request,RedirectAttributes  redirectAttributes,@RequestParam int id) {
        ApplicationDTO applicationDTO = new ApplicationDTO();
        String menuid = request.getSession().getAttribute("listmenuid").toString();
        ModelAndView modelAndView = new ModelAndView();
        boolean hasAccess=urlAccessController.hasAccessPermission(request,null,"editapp");
        if(!hasAccess){
            // modelAndView.addObject("forbidden",1);
            redirectAttributes.addFlashAttribute("forbidden", 1);
            modelAndView.setViewName("redirect:userdashboard");

        }else {
            try {
                applicationDTO = applicationService.getSingleMenuService(id);
            } catch (Exception e) {
                e.printStackTrace();
            }


            modelAndView.addObject("data", applicationDTO);
            modelAndView.addObject("menuid",menuid);
            modelAndView.setViewName("appRegister/update");

        }

        return modelAndView;

    }

    @RequestMapping(value = "appupdate", method = RequestMethod.POST)
    public RedirectView updateApp(
            HttpServletRequest request,
            @RequestParam Integer id,
            @RequestParam int file_changed,
            @RequestParam String appname,
            @RequestParam String appnamebng,
            @RequestParam("file") MultipartFile file,
            @RequestParam String link,
            @RequestParam String email,
            @RequestParam String mobile,
            @RequestParam int mechanism,
            @RequestParam String redirect_url,
            @RequestParam String default_page_url,
            @RequestParam String logout_url
    ) {

        ApplicationDTO applicationDTO = new ApplicationDTO();
        applicationDTO.setId(id);



        if(file_changed==1){
            applicationDTO = imageUpload(file, MODULE_NAME, applicationDTO);
        }else{
            applicationDTO.setLogoUrl(applicationService.getSingleMenuService(id).getLogoUrl());
        }


        applicationDTO.setName(appname);
        applicationDTO.setNameBng(appnamebng);
        applicationDTO.setLink(link);
        applicationDTO.setAppDomainEmail(email);
        applicationDTO.setMobileNo(mobile);
        if (mechanism == 0) {
            applicationDTO.setNotificationFlag("sms");
        } else {
            applicationDTO.setNotificationFlag("email");
        }

        applicationDTO.setUpadateDate(LocalDateTime.now().toString());
        applicationDTO.setUpdatedBy(2);

        applicationDTO.setRedirect(redirect_url);
        applicationDTO.setDefaultPageURL(default_page_url);
        applicationDTO.setLogoutURL(logout_url);
//        applicationDTO.setLogoUrl(file);

        try {
            applicationService.updateApplicationService(applicationDTO);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new RedirectView("list?menuid="+request.getSession().getAttribute("listmenuid"));
    }

    @RequestMapping(value = "deleteapp", method = RequestMethod.POST)
    public int deleteApp(@RequestParam int id) {
        int truthValue = 1;
        boolean success;
        try {
            success = applicationService.deleteApplicationService(id);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return truthValue;
    }


    @RequestMapping(value = "declineapp", method = RequestMethod.POST)
    public int declineApp(@RequestParam Long id) {
        int success = 1;
        try {
            applicationService.declineApplicationService(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return success;
    }

    @RequestMapping(path = "/sendmail", method = RequestMethod.GET)
    public String sendMail() {
        MailSender mailSender = new MailSender();
        String from = "oisf.reve@gmail.com";
        String to = "hamidimaruf@gmail.com";
        String Subject = "Secret Key(Confidential)";
        String Message = "Dear Recepient Your Secret is ";
        try {
            mailSender.sendEmail(from, to, Subject, Message);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "ok";
    }

    @RequestMapping(value = "addmodule", method = RequestMethod.GET)
    public ModelAndView addModuleForm(HttpServletRequest request,RedirectAttributes redirectAttributes) {

        ModelAndView modelAndView = new ModelAndView();
        boolean hasAccess=urlAccessController.hasAccessPermission(request,null,"addmodule");
        if(!hasAccess){
            // modelAndView.addObject("forbidden",1);
            redirectAttributes.addFlashAttribute("forbidden", 1);
            modelAndView.setViewName("redirect:userdashboard");

        }else {
            modelAndView.setViewName("appRegister/addmodule");

        }

        return modelAndView;
    }


    @RequestMapping(value = "addmodule", method = RequestMethod.POST)
    public ModelAndView moduleForm(HttpServletRequest request, @RequestParam int id, @RequestParam String name, @RequestParam String url) {

        ModelAndView modelAndView = new ModelAndView("appRegister/addmodule");
        String referrer = request.getHeader("referer");
        modelAndView.addObject("refererurl", referrer);
        modelAndView.addObject("id", id);
        modelAndView.addObject("name", name);
        modelAndView.addObject("url", url);
        return modelAndView;
    }

    @RequestMapping(value = "editmoduleform", method = RequestMethod.GET)
    public ModelAndView moduleEditForm(HttpServletRequest request,RedirectAttributes redirectAttributes,  @RequestParam int id, @RequestParam String name, @RequestParam String nameBng, @RequestParam String url
    ) {

        ModelAndView modelAndView = new ModelAndView();

        boolean hasAccess=urlAccessController.hasAccessPermission(request,null,"addmodule");
        if(!hasAccess){
            // modelAndView.addObject("forbidden",1);
            redirectAttributes.addFlashAttribute("forbidden", 1);
            modelAndView.setViewName("redirect:userdashboard");

        }else {
            String referrer = request.getHeader("referer");

            modelAndView.addObject("refererurl", referrer);
            modelAndView.addObject("id", id);
            modelAndView.addObject("name", name);
            modelAndView.addObject("nameBng", nameBng);
            modelAndView.addObject("url", url);
            modelAndView.setViewName("appRegister/editmodule");
        }

        return modelAndView;
    }

    @ResponseBody
    @RequestMapping(value = "editmodule", method = RequestMethod.POST)
    public RedirectView moduleEdit(HttpServletRequest request,RedirectAttributes redirectAttributes,
                                   @RequestParam int id, @RequestParam String name,
                                   @RequestParam String nameBng,
                                   @RequestParam String url,
                                   @RequestParam int moduleId,
                                   @RequestParam String moduleUrl,
                                   @RequestParam String moduleName,
                                   @RequestParam String refererurl
    ) {

//        ModelAndView modelAndView = new ModelAndView("appRegister/editmodule");
//        modelAndView.addObject("id", id);
//        modelAndView.addObject("name", name);
//        modelAndView.addObject("nameBng", nameBng);
//        modelAndView.addObject("url", url);

        ApplicationModuleDTO applicationModuleDTO = new ApplicationModuleDTO();
        applicationModuleDTO.setNameEng(name);
        applicationModuleDTO.setNameBng(nameBng);
        applicationModuleDTO.setUrl(url);
        applicationModuleDTO.setCreatedBy(1);
        applicationModuleDTO.setApplicationId(id);
        applicationService.editMopduleService(applicationModuleDTO);

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("appRegister/modulelist");
        modelAndView.addObject("id", moduleId);
        modelAndView.addObject("name", moduleName);
        modelAndView.addObject("url", moduleUrl);
//        return modelAndView;


        return new RedirectView(refererurl);


//        return modelAndView;
    }


    @RequestMapping(value = "module", method = RequestMethod.POST)
    public RedirectView moduleAdd(@RequestParam int parentid,
                                  @RequestParam String modulenameeng,
                                  @RequestParam String modulenamebng,
                                  @RequestParam String moduleurl,
                                  @RequestParam int moduleId,
                                  @RequestParam String moduleUrl,
                                  @RequestParam String moduleName,
                                  @RequestParam String refererurl


    ) {

        ApplicationModuleDTO applicationModuleDTO = new ApplicationModuleDTO();
        applicationModuleDTO.setNameEng(modulenameeng);
        applicationModuleDTO.setNameBng(modulenamebng);
        applicationModuleDTO.setUrl(moduleurl);
        applicationModuleDTO.setCreatedBy(1);
        applicationModuleDTO.setApplicationId(parentid);
        applicationService.addMopduleService(applicationModuleDTO);

//
//        ModelAndView modelAndView = new ModelAndView();
//        modelAndView.setViewName("appRegister/modulelist");
//        modelAndView.addObject("id", moduleId);
//        modelAndView.addObject("name", moduleName);
//        modelAndView.addObject("url", moduleUrl);
//        return modelAndView;
        return new RedirectView(refererurl);
    }


    //    start:added by forhad
    @ResponseBody
    @RequestMapping(value = "modulelist", method = RequestMethod.GET)
    public ModelAndView moduleList(RedirectAttributes redirectAttributes,
            @RequestParam int id,
            @RequestParam String name,
            @RequestParam String url,
            HttpServletRequest request

    ) {
        ModelAndView modelAndView = new ModelAndView();
        String menuid = request.getSession().getAttribute("listmenuid").toString();

        boolean hasAccess=urlAccessController.hasAccessPermission(request,null,"modulelist");
        if(!hasAccess){
            // modelAndView.addObject("forbidden",1);
            redirectAttributes.addFlashAttribute("forbidden", 1);
            modelAndView.setViewName("redirect:userdashboard");

        }else {

            modelAndView.setViewName("appRegister/modulelist");
            modelAndView.addObject("id", id);
            modelAndView.addObject("name", name);
            modelAndView.addObject("url", url);
            modelAndView.addObject("menuid",menuid);

        }

        return modelAndView;
    }

    @RequestMapping(value = "modulelistdata", method = RequestMethod.GET)
    public ArrayList<ApplicationModuleDTO> allModule(
            @RequestParam int id

    ) {
        int x = id;
        return applicationService.getModuleData(x);
    }




    @RequestMapping(value = "deletemodule", method = RequestMethod.POST)
    public int deleteModule(@RequestParam int id) {
        int success = 1;
        try {
            success = applicationService.deleteModuleService(id) ? 1 : 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return success;

    }


    @RequestMapping(value = "getowners", method = RequestMethod.POST)
    public ArrayList<JSONObject> getServices(@RequestParam int type) throws Exception {
        return applicationService.getOwnerList(type);
    }
    @RequestMapping(value = "asprovider", method = RequestMethod.POST)
    public ArrayList<JSONObject> getServicesForProvider(@RequestParam int type) throws Exception {
        return applicationService.getOwnerListForProvide(type);
    }

    @RequestMapping(value = "getownersbyapp", method = RequestMethod.POST)
    public ArrayList<JSONObject> getServicesbyApp(@RequestParam int appid) throws Exception {

        int type;
        ApplicationDTO applicationDTO = applicationService.getSingleMenuService(appid);
        if (applicationDTO.getIsCurrent() == 1) {
            type = 0;
        } else {
            type = 1;
        }
        return applicationService.getOwnerListbyApp(appid, type);
    }

    @RequestMapping(value = "approvetest", method = RequestMethod.GET)
    public String check() throws Exception {
        int[] origin = {51, 52};
        int systemid = 2;
        applicationService.appMapperWithOriginOgranogram(origin, systemid);
        return "ok";
    }

    public HashMap<String,String> listFilesForFolder(final File folder) {
        HashMap<String,String>files=new HashMap<>();
        for (final File fileEntry : folder.listFiles()) {
            if (fileEntry.isDirectory()) {
                listFilesForFolder(fileEntry);
            } else {
                files.put(fileEntry.getName(),folder.getAbsolutePath()+File.separator+fileEntry.getName());
                System.out.println(fileEntry.getName());
            }
        }
        return files;
    }


    @RequestMapping(value = "systempermissionassign", method = RequestMethod.POST)
    public RedirectView systemPermissionAssign(HttpServletRequest request,@RequestBody String data) throws Exception {

//        int success =0;

        JSONParser parser = new JSONParser();
        JSONObject obj = null;
        ArrayList<HashMap> ExceptionLists = new ArrayList<>();

        try {
            obj = (JSONObject) parser.parse(data);
            String appid = (String) obj.get("appid");
            Integer systemId = Integer.parseInt(appid);
            JSONArray coreservice = (JSONArray) obj.get("coreservice");
            int[] coreService = applicationService.convertJsonArraytoIntegerArray(coreservice);
            JSONArray providercoreservice = (JSONArray) obj.get("providercoreservice");
            int[] ProviderCoreService = applicationService.convertJsonArraytoIntegerArray(providercoreservice);

            JSONArray shareservice = (JSONArray) obj.get("shareservice");
            int[] shareService = applicationService.convertJsonArraytoIntegerArray(shareservice);
            JSONArray originorg = (JSONArray) obj.get("originorg");
            int[] originOrg = applicationService.convertJsonArraytoIntegerArray(originorg);
            JSONArray exception = (JSONArray) obj.get("exception");
            String[] exceptionList = applicationService.convertJsonArraytoStringArray(exception);
            System.out.println("aadsasdasdasd");
            for (int i = 0; i < exceptionList.length; i++) {
                HashMap<Integer, Integer> orgs = new HashMap<>();
                String[] exp = exceptionList[i].split("_");
                orgs.put(Integer.parseInt(exp[1]), Integer.parseInt(exp[0]));
                ExceptionLists.add(orgs);
            }

            boolean success = applicationService.appMapping(coreService,ProviderCoreService, shareService, systemId, originOrg, ExceptionLists);


            if (success) {
                MailSender mailSender = new MailSender();
                ApplicationDTO applicationDTO = new ApplicationDTO();
                RandomStringGenerator generator = new RandomStringGenerator.Builder().withinRange('A', 'z').build();
                String key = SecurityUtil.generateRandomString();
                String clientId=SecurityUtil.generateRandomString(32);
                try {
                    applicationDTO = applicationService.getSingleMenuService(Math.toIntExact(systemId));
                } catch (Exception e) {
                    e.printStackTrace();
                }
//                HashMap<String,String >fileMap=listFilesForFolder(new File(baseuri));
                HashMap<String,String >fileMap=new HashMap<>();

                String from = fromMail;
                String to = applicationDTO.getAppDomainEmail();
                String Subject = "Secret Key(Confidential)";
                String Message = "<p>Dear Recepient Your Secret is  : </p><p><b>"+key+ "</b></p>" ;
                Message+="<p> Your Client id is: </p><p><b>"+clientId+ "</b></p>";
                Message+="<p> please read the following attachments to integrate single sign on to your system with OISF</p>";
                Message+="<p><a href=\"https://drive.google.com/open?id=1NDVf6BMZpnB4l807hWgUAt1Vi2GnIM5M\">SSO Archiecture Diagram</a></p>";
                Message+="<p><a href=\"https://drive.google.com/open?id=1rvkCm6tiMHUkSGBSIF1Np2jIbXJE231L\">SSO Integration Manual</a></p>";
                Message+="<p><a href=\"https://drive.google.com/open?id=12M0_14uAsifs15pxVzgqDhlHHDJeXjL7\">SSO User Manual</a></p>";
                Message+="<p><a href=\"https://drive.google.com/open?id=1xdfg9rhV_6faUYbEqOjschG_Dp-1NIXE\">Java integration Library</a></p>";
                Message+="<p><a href=\"https://drive.google.com/open?id=1yfXdx8mXeoG7wzQoSL5WXmVbbqnzM1DR\">Laravel integration Library</a></p>";
                Message+="<p><a href=\"https://drive.google.com/open?id=1lr2UYwMCtNQemIQ7hZwScY0iWrKCHpMH\">Cake PHP integration Library</a></P>";
                try {

                    boolean isSend=mailSender.sendMail(from, to, Subject, Message,fileMap);
                    if(isSend){
                        applicationService.approveApplicationService(systemId, key,clientId, 1);
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else {

            }


        } catch (org.jose4j.json.internal.json_simple.parser.ParseException e) {
            e.printStackTrace();
        }


        return new RedirectView("list");

    }

    @RequestMapping(value = "systempermissionedit", method = RequestMethod.POST)
    public boolean systemPermissionEdit(@RequestBody String data) throws Exception {

        boolean success = false;

        JSONParser parser = new JSONParser();
        JSONObject obj = null;


        try {
            obj = (JSONObject) parser.parse(data);
            String appid = (String) obj.get("appid");
            Integer systemId = Integer.parseInt(appid);

            JSONArray insertedCoreservice = (JSONArray) obj.get("coreserviceinsert");
            int[] insertedcoreService = applicationService.convertJsonArraytoIntegerArray(insertedCoreservice);
            JSONArray deletedCoreservice = (JSONArray) obj.get("coreservicedelete");
            int[] deletedCoreService = applicationService.convertJsonArraytoIntegerArray(deletedCoreservice);

            JSONArray inseretedShareservice = (JSONArray) obj.get("shareserviceinsert");
            int[] insertedShareService = applicationService.convertJsonArraytoIntegerArray(inseretedShareservice);
            JSONArray deletedShareservice = (JSONArray) obj.get("shareservicedelete");
            int[] deletedShareService = applicationService.convertJsonArraytoIntegerArray(deletedShareservice);

            JSONArray insertedOriginorg = (JSONArray) obj.get("originorginsert");
            int[] insertedoriginOrg = applicationService.convertJsonArraytoIntegerArray(insertedOriginorg);
            JSONArray deletedOriginorg = (JSONArray) obj.get("originorgdelete");
            int[] deletedoriginOrg = applicationService.convertJsonArraytoIntegerArray(deletedOriginorg);

            ArrayList<HashMap> insertedExceptionLists = new ArrayList<>();
            JSONArray insertedException = (JSONArray) obj.get("exceptioninsert");
            String[] insertedexceptionList = applicationService.convertJsonArraytoStringArray(insertedException);
            for (int i = 0; i < insertedexceptionList.length; i++) {
                HashMap<Integer, Integer> orgs = new HashMap<>();
                String[] exp = insertedexceptionList[i].split("_");
                orgs.put(Integer.parseInt(exp[1]), Integer.parseInt(exp[0]));
                insertedExceptionLists.add(orgs);
            }

            ArrayList<HashMap> deletedExceptionLists = new ArrayList<>();
            JSONArray deletedException = (JSONArray) obj.get("exceptiondelete");
            String[] deletedexceptionList = applicationService.convertJsonArraytoStringArray(deletedException);
            for (int i = 0; i < deletedexceptionList.length; i++) {
                HashMap<Integer, Integer> orgs = new HashMap<>();
                String[] exp = deletedexceptionList[i].split("_");
                orgs.put(Integer.parseInt(exp[1]), Integer.parseInt(exp[0]));
                deletedExceptionLists.add(orgs);
            }

            success = applicationService.appRemapping
                    (insertedcoreService, deletedCoreService, insertedShareService, deletedShareService, systemId,
                            insertedoriginOrg, deletedoriginOrg, insertedExceptionLists, deletedExceptionLists);


        } catch (org.jose4j.json.internal.json_simple.parser.ParseException e) {
            e.printStackTrace();
        }


        return success;

    }

    @RequestMapping(value = "selectedservice", method = RequestMethod.GET)
    public JSONObject getSelectedService(@RequestParam int id) throws Exception {
        return applicationService.getSelecteForApp(id);
    }

    @RequestMapping(value = "systempermissioneditpage")
    public ModelAndView permissionEdit(HttpServletRequest request,RedirectAttributes redirectAttributes,@RequestParam int id, @RequestParam String name) {

        ModelAndView modelAndView = new ModelAndView();

        boolean hasAccess=urlAccessController.hasAccessPermission(request,null,"systempermissioneditpage");
        if(!hasAccess){
            // modelAndView.addObject("forbidden",1);
            redirectAttributes.addFlashAttribute("forbidden", 1);
            modelAndView.setViewName("redirect:userdashboard");

        }else {
            String menuid = request.getSession().getAttribute("listmenuid").toString();
            modelAndView.addObject("appname", name);
            modelAndView.addObject("appid", id);
            modelAndView.addObject("menuid",menuid);
            modelAndView.setViewName("appRegister/permissionedit");
        }



        return modelAndView;
    }



    @RequestMapping(value = "ispublished", method = RequestMethod.POST)
    public int isPublish(@RequestParam int id) throws Exception {
        return applicationService.isPublished(id);
    }

    @RequestMapping(value = "publish", method = RequestMethod.POST)
    public boolean appPublishPost(@RequestParam int id, @RequestParam int publish) throws Exception {


        boolean success = false;

        success = applicationService.publishApplication(id, publish);

        return success;


    }

    //region service CRUD

    @RequestMapping(value = "servicelist", method = RequestMethod.GET)
    public ModelAndView serviceList(HttpServletRequest request,RedirectAttributes redirectAttributes,@RequestParam int id) {
        ModelAndView modelAndView = new ModelAndView();
        boolean hasAccess=urlAccessController.hasAccessPermission(request,null,"servicelist");
        if(!hasAccess){
            // modelAndView.addObject("forbidden",1);
            redirectAttributes.addFlashAttribute("forbidden", 1);
            modelAndView.setViewName("redirect:userdashboard");

        }else {
            String menuid = request.getSession().getAttribute("listmenuid").toString();
            modelAndView.addObject("appid", id);
            modelAndView.addObject("menuid",menuid);

            modelAndView.setViewName("appRegister/servicelist");

        }


        return modelAndView;


    }

    @RequestMapping(value = "editserviceowner", method = RequestMethod.POST)
    public ModelAndView editServiceOwner(HttpServletRequest request,
                                         @RequestParam int id,
                                         @RequestParam int appid,
                                         @RequestParam String service_name_bng,
                                         @RequestParam String service_name_eng,
                                         @RequestParam String service_description
    ) throws Exception {
        ModelAndView modelAndView = new ModelAndView();

        ServiceDTO serviceDTO = new ServiceDTO();
        serviceDTO.setId(id);
        serviceDTO.setNameBng(service_name_bng);
        serviceDTO.setNameEng(service_name_eng);
        serviceDTO.setDescription(service_description);
        applicationService.updateOwner(serviceDTO);

        modelAndView.addObject("appid", appid);

        modelAndView.setViewName("appRegister/servicelist");
        return modelAndView;


    }

    @RequestMapping(value = "addserviceowner", method = RequestMethod.POST)
    public ModelAndView addServiceOwner(HttpServletRequest request,
                                        @RequestParam int appid,
                                        @RequestParam String service_name_bng,
                                        @RequestParam String service_name_eng,
                                        @RequestParam String service_description
    ) throws Exception {
        ModelAndView modelAndView = new ModelAndView();

        int type;
        ApplicationDTO applicationDTO = applicationService.getSingleMenuService(appid);
        if (applicationDTO.getIsCurrent() == 1) {
            type = 0;
        } else {
            type = 1;
        }

        ServiceDTO serviceDTO = new ServiceDTO();
        serviceDTO.setNameBng(service_name_bng);
        serviceDTO.setNameEng(service_name_eng);
        serviceDTO.setDescription(service_description);
        serviceDTO.setAppId(appid);
        serviceDTO.setType(type);
        applicationService.insertOwner(serviceDTO);

        modelAndView.addObject("appid", appid);

        modelAndView.setViewName("appRegister/servicelist");
        return modelAndView;


    }

    @RequestMapping(value = "deleteserviceowner", method = RequestMethod.POST)
    public ModelAndView deleteServiceOwner(@RequestParam int id

    ) throws Exception {
        ModelAndView modelAndView = new ModelAndView();


        applicationService.delete(id, AllTable.TBL_SERVICE_OWNER);

        modelAndView.setViewName("appRegister/servicelist");
        return modelAndView;


    }
    @RequestMapping(value = "deleteservice", method = RequestMethod.POST)
    public ModelAndView deleteService(@RequestParam int id

    ) throws Exception {
        ModelAndView modelAndView = new ModelAndView();

        applicationService.delete(id, AllTable.TBL_SERVICE_LIST);


        modelAndView.setViewName("appRegister/servicelist");
        return modelAndView;


    }
    @RequestMapping(value = "deleteservicefield", method = RequestMethod.POST)
    public ModelAndView deleteServiceFiled(@RequestParam int id

    ) throws Exception {
        ModelAndView modelAndView = new ModelAndView();


        applicationService.delete(id, AllTable.TBL_SERVICE_FIELDS);

        modelAndView.setViewName("appRegister/servicelist");
        return modelAndView;


    }

    @RequestMapping(value = "editservices", method = RequestMethod.POST)
    public ModelAndView editServices(HttpServletRequest request,
                                     @RequestParam int id,
                                     @RequestParam int owner_id,
                                     @RequestParam int appid,
                                     @RequestParam String service_name_bng,
                                     @RequestParam String service_name_eng,
                                     @RequestParam String service_description,
                                     @RequestParam String service_metadata_ref,
                                     @RequestParam String service_db_ref,
                                     @RequestParam String service_int_ref,
                                     @RequestParam String owner_sub_sys,
                                     @RequestParam String request_uri,
                                     @RequestParam String invoking_uri,
                                     @RequestParam String example_req,
                                     @RequestParam String example_response,
                                     @RequestParam String output_type) throws Exception
    {
        ModelAndView modelAndView = new ModelAndView();

        ServiceDetailsDTO serviceDTO = new ServiceDetailsDTO();
        serviceDTO.setId(id);
        serviceDTO.setNameBng(service_name_bng);
        serviceDTO.setNameEng(service_name_eng);
        serviceDTO.setDescription(service_description);
        serviceDTO.setServiceOwnerId(owner_id);
        serviceDTO.setMetaDataRef(service_metadata_ref);
        serviceDTO.setDataStanRef(service_db_ref);
        serviceDTO.setIntStanRef(service_int_ref);
        serviceDTO.setOwnerSubSystem(owner_sub_sys);
        serviceDTO.setRequestUri(request_uri);
        serviceDTO.setInvokingUri(invoking_uri);
        serviceDTO.setExampleRequest(example_req);
        serviceDTO.setExampleResponse(example_response);
        serviceDTO.setOutputType(output_type);
         applicationService.updateService(serviceDTO);

        modelAndView.addObject("appid", appid);

        modelAndView.setViewName("appRegister/servicelist");
        return modelAndView;


    }
    @RequestMapping(value = "addservices", method = RequestMethod.POST)
    public RedirectView addServices(HttpServletRequest request,
                                     @RequestParam int owner_id,
                                     @RequestParam int appid,
                                     @RequestParam String service_name_bng,
                                     @RequestParam String service_name_eng,
                                     @RequestParam String service_description,
                                     @RequestParam String service_metadata_ref,
                                     @RequestParam String service_db_ref,
                                     @RequestParam String service_int_ref,
                                     @RequestParam String owner_sub_sys,
                                     @RequestParam String request_uri,
                                     @RequestParam String invoking_uri,
                                     @RequestParam String example_req,
                                     @RequestParam String example_response,
                                     @RequestParam String output_type) throws Exception {
        int type;
        ApplicationDTO applicationDTO = applicationService.getSingleMenuService(appid);
        if (applicationDTO.getIsCurrent() == 1) {
            type = 0;
        } else {
            type = 1;
        }

        ServiceDetailsDTO serviceDTO = new ServiceDetailsDTO();
        serviceDTO.setNameBng(service_name_bng);
        serviceDTO.setNameEng(service_name_eng);
        serviceDTO.setDescription(service_description);
        serviceDTO.setServiceOwnerId(owner_id);
        serviceDTO.setMetaDataRef(service_metadata_ref);
        serviceDTO.setDataStanRef(service_db_ref);
        serviceDTO.setIntStanRef(service_int_ref);
        serviceDTO.setOwnerSubSystem(owner_sub_sys);
        serviceDTO.setRequestUri(request_uri);
        serviceDTO.setInvokingUri(invoking_uri);
        serviceDTO.setExampleRequest(example_req);
        serviceDTO.setExampleResponse(example_response);
        serviceDTO.setOutputType(output_type);
        serviceDTO.setServiceType(type);
        applicationService.addService(serviceDTO);

//        modelAndView.addObject("appid", appid);

        return new RedirectView("list");


    }


    @RequestMapping(value = "editservicefields", method = RequestMethod.POST)
    public ModelAndView editServiceFields(HttpServletRequest request,
                                     @RequestParam int id,
                                     @RequestParam String field_name_bng,
                                     @RequestParam String field_name_eng,
                                     @RequestParam String field_description,
                                     @RequestParam String field_type,
                                     @RequestParam int type,
                                     @RequestParam int mandatory) throws Exception
    {
        ModelAndView modelAndView = new ModelAndView();

        ServiceFieldsDTO serviceDTO = new ServiceFieldsDTO();
        serviceDTO.setId(id);
        serviceDTO.setNameBng(field_name_bng);
        serviceDTO.setNameEng(field_name_eng);
        serviceDTO.setDescription(field_description);
        serviceDTO.setFieldType(field_type);
        serviceDTO.setType(type);
        serviceDTO.setIsMandatory(mandatory);

        applicationService.updateFiledsService(serviceDTO);


        modelAndView.setViewName("appRegister/servicelist");
        return modelAndView;


    }


    @RequestMapping(value = "addservicefields", method = RequestMethod.POST)
    public ModelAndView addServiceFields(HttpServletRequest request,
                                          @RequestParam int service_id,
                                          @RequestParam String field_name_bng,
                                          @RequestParam String field_name_eng,
                                          @RequestParam String field_description,
                                          @RequestParam String field_type,
                                          @RequestParam int type,
                                          @RequestParam int mandatory) throws Exception
    {
        ModelAndView modelAndView = new ModelAndView();

        ServiceFieldsDTO serviceDTO = new ServiceFieldsDTO();
        serviceDTO.setServiceId(service_id);
        serviceDTO.setNameBng(field_name_bng);
        serviceDTO.setNameEng(field_name_eng);
        serviceDTO.setDescription(field_description);
        serviceDTO.setFieldType(field_type);
        serviceDTO.setType(type);
        serviceDTO.setIsMandatory(mandatory);

        applicationService.addFiledsService(serviceDTO);


        modelAndView.setViewName("appRegister/servicelist");
        return modelAndView;


    }



    //endregion
}
