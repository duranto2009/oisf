package com.revesoft.springboot.web.user;

import com.revesoft.springboot.web.APIConsumption.APIAccessController;
import com.revesoft.springboot.web.util.ImageUploader;
import com.revesoft.springboot.web.util.PasswordService;
import com.revesoft.springboot.web.util.PathBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.*;
import java.util.concurrent.TimeUnit;

/**
 * Created by Bony on 10/8/2017.
 */
@RestController
public class UserController {
    @Value("${base.uri.profileimageURL}")
    private String profileURI;

    @Value("${base.uri.signimageURL}")
    private String signURI;
    @Value("${base.uri.profileimage}")
    private String profileFolder;


    @Value("${base.uri.signimage}")
    private String signFolder;



    @Autowired
    UserProfileService userProfileService;

    @Autowired
    private ImageUploader imageUploader;
    @Autowired
    APIAccessController apiAccessController;

    public static final String MODULE_NAME = "profile";
    public static final String MODULE_SIGN = "sign";

    private static final int imageTypeProfile = 1;
    private static final int imageTypeSign = 2;


    @Autowired
    ServletContext context;


    @RequestMapping(path = "questions")
    public ArrayList<String> allQuestions() {
        return userProfileService.allSecurityQuestions();
    }

    @RequestMapping(path = "user")
    public UserProfileDTO user() {
        return userProfileService.allInfo(1);
    }

    @RequestMapping(value = "profile", method = RequestMethod.GET)
    public ModelAndView userProfile(HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        Long employeeId = (Long) request.getSession().getAttribute("employeeId");
        UserProfileDTO profileDTO = (UserProfileDTO) request.getSession().getAttribute("userInfo");
        //
        UserProfileDTO userProfileDTO = userProfileService.allInfo(profileDTO.getId());


//        String name=userProfileDTO.getEmployeeDTO().getNameBng();
//       UserProfileDTO userProfileDTO=userProfileService.allInfo(1);
        modelAndView.addObject("userinfo", userProfileDTO);
        modelAndView.setViewName("userProfile/profile");
        return modelAndView;
    }

    @RequestMapping(value = "employee_records/profileEdit", method = RequestMethod.GET)
    public ModelAndView userProfileEdit(HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        Long employeeId = (Long) request.getSession().getAttribute("employeeId");
        UserProfileDTO userProfileDTO = (UserProfileDTO) request.getSession().getAttribute("userInfo");
        String name = userProfileDTO.getEmployeeDTO().getNameBng();
        //UserProfileDTO userProfileDTO=userProfileService.allInfo(1);
        modelAndView.addObject("userinfo", userProfileDTO);
        modelAndView.setViewName("employee_records/profileEdit");
        return modelAndView;
    }

    @PostMapping(value = "securityques")
    public RedirectView add(HttpServletRequest request,
                            @RequestParam String securityques1,
                            @RequestParam String ans1,
                            @RequestParam String securityques2,
                            @RequestParam String ans2
    ) {




        userProfileService.setSecurityQuestions(((UserProfileDTO) request.getSession().getAttribute("userInfo")).getId(), securityques1, ans1, securityques2, ans2);
        UserProfileDTO userProfileDTO = userProfileService.allInfo(((UserProfileDTO) request.getSession().getAttribute("userInfo")).getUsername());
        request.getSession().removeAttribute("userInfo");
        request.getSession().setAttribute("userInfo",userProfileDTO);

        return new RedirectView("profile");
    }

    @PostMapping(value = "imagechange")
    public RedirectView imagechange(HttpServletRequest request, @RequestParam("file") MultipartFile file) {

        Long filename = ((UserProfileDTO) request.getSession().getAttribute("userInfo")).getId();
        imageUpload(request,file, imageTypeProfile, filename);

        UserProfileDTO userProfileDTO = userProfileService.allInfo(((UserProfileDTO) request.getSession().getAttribute("userInfo")).getUsername());
        request.getSession().removeAttribute("userInfo");
        request.getSession().setAttribute("userInfo",userProfileDTO);


         return new RedirectView("profile");

    }

    @PostMapping(value = "employee_records/passwordChange")
    public RedirectView passwordChange(
            HttpServletRequest request,
            @RequestParam String current_password,
            @RequestParam String password,
            @RequestParam String cpassword
    ) throws Exception {
//        ModelAndView modelAndView = new ModelAndView();
        UserProfileDTO userProfileDTO = userProfileService.allInfo(((UserProfileDTO) request.getSession().getAttribute("userInfo")).getId());
        if (PasswordService.checkPassword(current_password, userProfileDTO.getPassword())) {
            // change the password

            boolean success=apiAccessController.changePassward(userProfileDTO.getUsername(),current_password,password);
//            boolean success=true;
            System.out.println("is Success:"+success);
            if(success){
                userProfileService.updatePassword(userProfileDTO.getUsername(), password);
                System.out.println("Changed passward to :"+password);
            }else{
                //send error message that password update not success in nothi..
            }

        } else {
            //send error message that password not matched..
        }

        return new RedirectView("/profile");
    }

    @PostMapping(value = "checkpass")
    public int passwordCheck(
            HttpServletRequest request,
            @RequestParam String pass
    ) throws Exception {
//        ModelAndView modelAndView = new ModelAndView();
        UserProfileDTO userProfileDTO = userProfileService.allInfo(((UserProfileDTO) request.getSession().getAttribute("userInfo")).getId());
        if (PasswordService.checkPassword(pass, userProfileDTO.getPassword())) {
            // change the password
            return 1;

        } else {
            return 0;
            //send error message that password not matched..
        }

    }


    private void imageUpload(HttpServletRequest request,MultipartFile file, int type, long filename) {

        String filepath="";
        String pathToDB="";
        if(type==1){
            filepath = imageUploader.profileImageupload(file, profileFolder, filename + "");
             pathToDB = profileURI + filepath;
        }else{
            filepath = imageUploader.profileImageupload(file, signFolder, filename + "");
             pathToDB = signURI + filepath;
        }

        String employeeID=request.getSession().getAttribute("employeeId").toString();
        if (filepath.equals("invalid")) {

        } else {
            userProfileService.setImage(Integer.parseInt(employeeID), pathToDB, type);
        }

    }

    @PostMapping(value = "signchange")
    public RedirectView signchange(HttpServletRequest request, @RequestParam("file") MultipartFile file) {

        Long filename = ((UserProfileDTO) request.getSession().getAttribute("userInfo")).getId();
        imageUpload(request,file, imageTypeSign, filename);

        UserProfileDTO userProfileDTO = userProfileService.allInfo(((UserProfileDTO) request.getSession().getAttribute("userInfo")).getUsername());
        request.getSession().removeAttribute("userInfo");
        request.getSession().setAttribute("userInfo",userProfileDTO);

        return new RedirectView("profile");

    }


//    start: code added by forhad
//    private static final String NAME_ENG ="nameEng";

    @PostMapping(value = "postValue")
    public void postValue(HttpServletRequest request) {


        int i = 0;
//        System.out.println("REQUEST PARAM: name: " + request.getParameter("name").toString());
//        System.out.println("REQUEST PARAM: value: " + request.getParameter("value").toString());
        Long employeeId = (Long) request.getSession().getAttribute("employeeId");
        String name = request.getParameter("name").toString();
        String value = request.getParameter("value").toString();

        //updating profile information
        userProfileService.updateUserInfo(employeeId, name, value);
        UserProfileDTO profileDTO = (UserProfileDTO) request.getSession().getAttribute("userInfo");
        //
        UserProfileDTO userProfileDTO = userProfileService.allInfo(profileDTO.getId());

        long id = profileDTO.getId();

        UserProfileDTO dto = userProfileService.allInfo(id);
        System.out.println("Name: " + name + " , " + value);
        request.getSession().setAttribute("userInfo", dto);
//        UserProfileDTO profileDTO=userProfileService.allInfo ();//UserProfileDTO) request.getSession().getAttribute("userInfo");
        System.out.println("session: " + (UserProfileDTO) request.getSession().getAttribute("userInfo"));


        System.out.println(request.toString());

//        return new RedirectView("profile");
//    start: code added by forhad

    }

    public static Map<TimeUnit, Long> computeDiff(Date date1, Date date2) {
        long diffInMillies = date2.getTime() - date1.getTime();
        List<TimeUnit> units = new ArrayList<TimeUnit>(EnumSet.allOf(TimeUnit.class));
        Collections.reverse(units);
        Map<TimeUnit, Long> result = new LinkedHashMap<TimeUnit, Long>();
        long milliesRest = diffInMillies;
        for (TimeUnit unit : units) {
            long diff = unit.convert(milliesRest, TimeUnit.MILLISECONDS);
            long diffInMilliesForUnit = unit.toMillis(diff);
            milliesRest = milliesRest - diffInMilliesForUnit;
            result.put(unit, diff);
        }
        return result;
    }

    @RequestMapping(value = "recover", method = RequestMethod.GET)
    public ModelAndView passRecoveryForm(@RequestParam String uid) throws Exception {

        ModelAndView modelAndView = new ModelAndView();

        UserPassRecoveryDTO userPassRecoveryDTO = userProfileService.getUserInfo(uid);
        String email=userPassRecoveryDTO.getEmail();
        modelAndView.addObject("email",email);
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss", Locale.ENGLISH);
        Date date1 = format.parse(userPassRecoveryDTO.getCreated());
        LocalDateTime nowdate = LocalDateTime.now();
        String Date = nowdate.toString();

        SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS", Locale.ENGLISH);
        Date date2 = format2.parse(Date);

        Map<TimeUnit, Long> diff = computeDiff(date1, date2);
        Long days = null;
        Long hours=null;

        for (Map.Entry<TimeUnit, Long> entry : diff.entrySet()) {
            TimeUnit key = entry.getKey();
            if (key.toString().equals("DAYS")) {
                days = entry.getValue();
                continue;
            } else if (key.toString().equals("HOURS")) {
                hours = entry.getValue();
                break;
            }
        }
            // Long value =
            // now work with key and value...


        if (userPassRecoveryDTO.getUsername() == "") {

            modelAndView.setViewName("userProfile/invalidreq");

        } else {
            if ( days<=0 && hours<=12) {
                modelAndView.addObject("username", userPassRecoveryDTO.getUsername());
                modelAndView.setViewName("userProfile/passrecover");
                return modelAndView;

            } else {

                modelAndView.setViewName("userProfile/invalidreq");

            }

        }


        return modelAndView;


    }

    @RequestMapping(value = "recover")
    public RedirectView passRecovery(@RequestParam String password, @RequestParam String username,@RequestParam String email) throws Exception {


        String hashpass = PasswordService.getInstance().hashPassword(password);

        boolean success=apiAccessController.resetPassward(username,email,password);
        if(success){
            userProfileService.updateForgetPassword(username, hashpass);
        }else{
            //error for pass reset fail
        }


        return new RedirectView("/");

    }
}
