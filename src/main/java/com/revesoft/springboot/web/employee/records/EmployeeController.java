package com.revesoft.springboot.web.employee.records;

import com.revesoft.springboot.web.appregistration.MailSender;
//import com.revesoft.springboot.web.employee.EmployeeOfficesDTO;
import com.revesoft.springboot.web.employee.employeeoffice.EmployeeOfficeService;
import com.revesoft.springboot.web.employee.employeeoffice.EmployeeOfficesDTO;
import com.revesoft.springboot.web.geo.thana.ThanaDTO;
import com.revesoft.springboot.web.geo.thana.ThanaService;
import com.revesoft.springboot.web.office.ministry.MinistryService;
import com.revesoft.springboot.web.util.DateFormatter;
import org.jose4j.json.internal.json_simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import com.revesoft.springboot.web.util.userObject;

/**
 * Created by Bony on 11/2/2017.
 */
@RestController
public class EmployeeController {


    @Autowired
    EmployeeService employeeService;

    @Autowired
    EmployeeOfficeService employeeOfficeService;

    @Autowired
    MinistryService ministryService;


    //-----------------------------------------------start Bishwajit Code ------------------------------------------------------------------------------

//    @RequestMapping(value="/getallposts")
//    ModelAndView empassign(@RequestParam String menuid){
//
//
//        ModelAndView modelAndView=new ModelAndView("employee/empassign");
//        modelAndView.addObject("menuid",menuid);
//        modelAndView.addObject("ministry",ministryService.getAll());
//        return modelAndView;
//    }
//

    @RequestMapping(value="/empassign")
    ModelAndView empassign(HttpServletRequest request,@RequestParam String menuid){


        ModelAndView modelAndView=new ModelAndView("employee/empassign");
        modelAndView.addObject("menuid",menuid);
        modelAndView.addObject("ministry",ministryService.getAll());
        request.getSession().setAttribute("empassignmenuid",menuid);
        return modelAndView;
    }


    @RequestMapping(value="/empadd")
    ModelAndView addemp(HttpServletRequest request,@RequestParam String menuid){


        ModelAndView modelAndView=new ModelAndView("employee/empadd");
        modelAndView.addObject("menuid",menuid);
        return modelAndView;
    }


    @RequestMapping(value="/editemp")
    ModelAndView editemp(@RequestParam String menuid,
                         @RequestParam String id,
                         @RequestParam String name_bng,
                         @RequestParam String name_eng,
                         @RequestParam String father_name_bng,
                         @RequestParam String father_name_eng,
                         @RequestParam String mother_name_bng,
                         @RequestParam String mother_name_eng,
                         @RequestParam String birth_date,
                         @RequestParam String nid,
                         @RequestParam String bcn,
                         @RequestParam String ppn,
                         @RequestParam String gender,
                         @RequestParam String religion,
                         @RequestParam String blood_group,
                         @RequestParam String maritalStatus,
                         @RequestParam String personal_email,
                         @RequestParam String personal_mobile,
                         @RequestParam String alternative_mobile,
                         @RequestParam String is_cadre,
                         @RequestParam String employee_cadre_id,
                         @RequestParam String employee_batch_id,
                         @RequestParam String identity_no,
                         @RequestParam String appointment_memo_no,
                         @RequestParam String joining_date

                        ){

        EmployeeDTO employeeDTO = new EmployeeDTO();

        employeeDTO.setId(Integer.parseInt(id));
        employeeDTO.setNameBng(name_bng);
        employeeDTO.setNameEng(name_eng);
        employeeDTO.setFatherNameBng(father_name_bng);
        employeeDTO.setFatherNameEng(father_name_eng);
        employeeDTO.setMotherNameBng(mother_name_bng);
        employeeDTO.setMotherNameEng(mother_name_eng);

        String fullDate =birth_date;
        if (fullDate == null || fullDate.isEmpty() || fullDate.equals("")  || fullDate.equals(" ")) {
            employeeDTO.setDateOfBirth(" ");
        } else {
            employeeDTO.setDateOfBirth(new DateFormatter().dateFormatWithOnlydate(fullDate));
        }

        employeeDTO.setNid(nid);
        employeeDTO.setBcn(bcn);
        employeeDTO.setPpn(ppn);
        employeeDTO.setGender(gender);
        employeeDTO.setReligion(religion);
        employeeDTO.setBloodGroup(blood_group);
        employeeDTO.setMaritalStatus(maritalStatus);
        employeeDTO.setPersonalEmail(personal_email);
        employeeDTO.setPersonalMobile(personal_mobile);
        employeeDTO.setAlternativeMobile(alternative_mobile);
        employeeDTO.setIsCadre(Short.parseShort(is_cadre));


        if(employee_cadre_id.equals("") || employee_cadre_id.equals(null)) employee_cadre_id="0";
        employeeDTO.setEmployeeCadreId(Integer.parseInt(employee_cadre_id));

        if(employee_batch_id.equals("") || employee_batch_id.equals(null)) employee_batch_id="0";
        employeeDTO.setEmployeeBatchId(Integer.parseInt(employee_batch_id));

        if(identity_no.equals("") || identity_no.equals(null)) identity_no=" ";
        employeeDTO.setIdentityNo(identity_no);

        if(appointment_memo_no.equals("") || appointment_memo_no.equals(null)) appointment_memo_no=" ";
        employeeDTO.setAppointmentMemoNo(appointment_memo_no);

        fullDate =joining_date;
        if (fullDate == null || fullDate.isEmpty() || fullDate.equals("") || fullDate.equals(" ")) {
            employeeDTO.setJoiningDate(" ");
        } else {
            employeeDTO.setJoiningDate(new DateFormatter().dateFormatWithOnlydate(fullDate));
        }


        ModelAndView modelAndView=new ModelAndView("employee/empedit");
        modelAndView.addObject("employee",employeeDTO);
        modelAndView.addObject("menuid",menuid);
        return modelAndView;
    }


    @RequestMapping(value="/deleteemp",method = RequestMethod.POST)
    int deleteemp(@RequestParam String id){
        int success = 0;

        try {
            employeeService.deleteEmployee(id);
            success = 1;
        } catch (SQLException e) {
            success =0;
            e.printStackTrace();
        }

        return success;
    }


    @RequestMapping(value = "employeeadd",method = RequestMethod.POST)
    RedirectView addEmployee(@RequestParam String menuid,
                             @RequestParam String name_bng,
                             @RequestParam String name_eng,
                             @RequestParam String father_name_bng,
                             @RequestParam String father_name_eng,
                             @RequestParam String mother_name_bng,
                             @RequestParam String mother_name_eng,
                             @RequestParam String birth_date,
                             @RequestParam String nid,
                             @RequestParam String bcn,
                             @RequestParam String ppn,
                             @RequestParam String gender,
                             @RequestParam String religion,
                             @RequestParam String blood_group,
                             @RequestParam String maritalStatus,
                             @RequestParam String personal_email,
                             @RequestParam String personal_mobile,
                             @RequestParam String alternative_mobile,
                             @RequestParam String is_cadre,
                             @RequestParam String employee_cadre_id,
                             @RequestParam String employee_batch_id,
                             @RequestParam String identity_no,
                             @RequestParam String appointment_memo_no,
                             @RequestParam String joining_date
                             ) throws SQLException, ParseException {
        EmployeeDTO employeeDTO = new EmployeeDTO();


        employeeDTO.setNameBng(name_bng);
        employeeDTO.setNameEng(name_eng);
        employeeDTO.setFatherNameBng(father_name_bng);
        employeeDTO.setFatherNameEng(father_name_eng);
        employeeDTO.setMotherNameBng(mother_name_bng);
        employeeDTO.setMotherNameEng(mother_name_eng);
        employeeDTO.setDateOfBirth(birth_date);
        employeeDTO.setNid(nid);
        employeeDTO.setBcn(bcn);
        employeeDTO.setPpn(ppn);
        employeeDTO.setGender(gender);
        employeeDTO.setReligion(religion);
        employeeDTO.setBloodGroup(blood_group);
        employeeDTO.setMaritalStatus(maritalStatus);
        employeeDTO.setPersonalEmail(personal_email);
        employeeDTO.setPersonalMobile(personal_mobile);
        employeeDTO.setAlternativeMobile(alternative_mobile);
        employeeDTO.setIsCadre(Short.parseShort(is_cadre));

        if(employee_cadre_id.equals("") || employee_cadre_id.equals(null)) employee_cadre_id="0";
        employeeDTO.setEmployeeCadreId(Integer.parseInt(employee_cadre_id));

        if(employee_batch_id.equals("") || employee_batch_id.equals(null)) employee_batch_id="0";
        employeeDTO.setEmployeeBatchId(Integer.parseInt(employee_batch_id));

        if(identity_no.equals("") || identity_no.equals(null)) identity_no=" ";
        employeeDTO.setIdentityNo(identity_no);

        if(appointment_memo_no.equals("") || appointment_memo_no.equals(null)) appointment_memo_no=" ";
        employeeDTO.setAppointmentMemoNo(appointment_memo_no);
        employeeDTO.setJoiningDate(joining_date);


        userObject user= employeeService.addEmployee(employeeDTO);

        String from = "oisf.reve@gmail.com";
        String to = personal_email;
        String Subject = "Secret Key(Confidential)";
        String Message = "Dear Recepient Your Username is " + user.username + " and password is " + user.password;
        try {

            new MailSender().sendEmail(from, to, Subject, Message);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return new RedirectView("empshow?menuid="+menuid);

    }



    @RequestMapping(value = "employeeedit",method = RequestMethod.POST)
    RedirectView editEmployee(@RequestParam String menuid,
                              @RequestParam String id,
                              @RequestParam String name_bng,
                             @RequestParam String name_eng,
                             @RequestParam String father_name_bng,
                             @RequestParam String father_name_eng,
                             @RequestParam String mother_name_bng,
                             @RequestParam String mother_name_eng,
                             @RequestParam String birth_date,
                             @RequestParam String nid,
                             @RequestParam String bcn,
                             @RequestParam String ppn,
                             @RequestParam String gender,
                             @RequestParam String religion,
                             @RequestParam String blood_group,
                             @RequestParam String maritalStatus,
                             @RequestParam String personal_email,
                             @RequestParam String personal_mobile,
                             @RequestParam String alternative_mobile,
                             @RequestParam String is_cadre,
                             @RequestParam String employee_cadre_id,
                             @RequestParam String employee_batch_id,
                             @RequestParam String identity_no,
                             @RequestParam String appointment_memo_no,
                             @RequestParam String joining_date
    ) throws SQLException, ParseException {
        EmployeeDTO employeeDTO = new EmployeeDTO();

        employeeDTO.setId(Integer.parseInt(id));
        employeeDTO.setNameBng(name_bng);
        employeeDTO.setNameEng(name_eng);
        employeeDTO.setFatherNameBng(father_name_bng);
        employeeDTO.setFatherNameEng(father_name_eng);
        employeeDTO.setMotherNameBng(mother_name_bng);
        employeeDTO.setMotherNameEng(mother_name_eng);
        employeeDTO.setDateOfBirth(birth_date);
        employeeDTO.setNid(nid);
        employeeDTO.setBcn(bcn);
        employeeDTO.setPpn(ppn);
        employeeDTO.setGender(gender);
        employeeDTO.setReligion(religion);
        employeeDTO.setBloodGroup(blood_group);
        employeeDTO.setMaritalStatus(maritalStatus);
        employeeDTO.setPersonalEmail(personal_email);
        employeeDTO.setPersonalMobile(personal_mobile);
        employeeDTO.setAlternativeMobile(alternative_mobile);
        employeeDTO.setIsCadre(Short.parseShort(is_cadre));

        if(employee_cadre_id.equals("") || employee_cadre_id.equals(null)) employee_cadre_id="0";
        employeeDTO.setEmployeeCadreId(Integer.parseInt(employee_cadre_id));

        if(employee_batch_id.equals("") || employee_batch_id.equals(null)) employee_batch_id="0";
        employeeDTO.setEmployeeBatchId(Integer.parseInt(employee_batch_id));

        if(identity_no.equals("") || identity_no.equals(null)) identity_no=" ";
        employeeDTO.setIdentityNo(identity_no);

        if(appointment_memo_no.equals("") || appointment_memo_no.equals(null)) appointment_memo_no=" ";
        employeeDTO.setAppointmentMemoNo(appointment_memo_no);
        employeeDTO.setJoiningDate(joining_date);


        employeeService.editEmployee(employeeDTO);


        return new RedirectView("empshow?menuid="+menuid);
    }


    @RequestMapping(path= "/getEmployeeInfoByUsername")
    @ResponseBody
    JSONObject getEmployeeInfoByUsername(@RequestParam String username)throws SQLException {

        EmployeeDTO employeeDTO = employeeService.getEmployeeInfoByUsername(username);

        ArrayList<EmployeeOfficesDTO> employeeOfficesDTOs = new ArrayList<EmployeeOfficesDTO>();
        employeeOfficesDTOs= employeeOfficeService.getEmployeeOfficeByEmployeeRecordId(employeeDTO.getId());

        JSONObject obj=new JSONObject();
        obj.put("employeeDTO",employeeDTO);
        obj.put("employeeOfficesDTOs",employeeOfficesDTOs);
        return obj;
    }



    //-----------------------------------------------end Bishwajit Code ------------------------------------------------------------------------------







//    @RequestMapping(value = "empadd",method = RequestMethod.POST)
//    public void addEmp(@Valid @ModelAttribute("employee") EmployeeDTO employeeDTO){
//        int i=01;
//    }





    @RequestMapping(path= "/emppage")
    @ResponseBody
    JSONObject empPage(HttpServletRequest request) {
        int displayLength=1;

        if(request.getParameter("iDisplayLength") !=null)
        {
            displayLength = Integer.valueOf(request.getParameter("iDisplayLength"));
        }

        Integer pageNumber = 0;

        if (null != request.getParameter("iDisplayStart"))
            pageNumber = (Integer.valueOf(request.getParameter("iDisplayStart"))/Integer.valueOf(request.getParameter("iDisplayLength")))+1;
        //Fetch search parameter
        String searchParameterEncode = request.getParameter("sSearch");
        ArrayList<EmployeeDTO> list=new ArrayList<>();
        int size;
        size=employeeService.getSize("employee_records");
        if(!searchParameterEncode.equals(";")&& searchParameterEncode.contains(";")) {
            String[] searchparameter = searchParameterEncode.split(";");

            int parameterSizeLength = searchparameter.length;
            if(parameterSizeLength>1){
                list = employeeService.getEmpByPage(pageNumber, displayLength,searchparameter);
            }
            else {
                list = employeeService.getEmpByPage(pageNumber, displayLength, searchparameter[0]);
            }
        }
        else {
            list = employeeService.getEmpByPage(pageNumber, displayLength);
        }
        JSONObject obj=new JSONObject();
        obj.put("iTotalRecords", employeeService.getCount());
        obj.put("iTotalDisplayRecords", employeeService.getCount());
        obj.put("aaData",list);
        //return list2;
        return obj;
    }

    @RequestMapping(value = "empshow",method = RequestMethod.GET)
    public ModelAndView showEmp(HttpServletRequest request,@RequestParam int menuid){
        ModelAndView modelAndView=new ModelAndView("employee/empshow");
        modelAndView.addObject("menuid",menuid);
        request.getSession().setAttribute("emprecmenuid",menuid);
        return modelAndView;
    }

    @RequestMapping(value = "empoffice", method = RequestMethod.GET)
    public ModelAndView delete(HttpServletRequest request,@RequestParam int menuid) {
        ModelAndView modelAndView=new ModelAndView("employee/empoffice");
        modelAndView.addObject("menuid",menuid);
//        modelAndView.addObject("officeid",id);
        request.getSession().setAttribute("empmenuid",menuid);
        return modelAndView;
    }

    @RequestMapping(path= "/empofficepage")
    @ResponseBody
    JSONObject empOfficePage(HttpServletRequest request) {
        int displayLength=1;

        if(request.getParameter("iDisplayLength") !=null)
        {
            displayLength = Integer.valueOf(request.getParameter("iDisplayLength"));
        }

        Integer pageNumber = 0;
        int officeId = (int) request.getSession().getAttribute("officeId");

        if (null != request.getParameter("iDisplayStart"))
            pageNumber = (Integer.valueOf(request.getParameter("iDisplayStart"))/Integer.valueOf(request.getParameter("iDisplayLength")))+1;
        //Fetch search parameter
        String searchParameterEncode = request.getParameter("sSearch");
        ArrayList<EmployeeDTO> list=new ArrayList<>();
//        int size;
//        size=employeeService.getSize("employee_records");
        if(!searchParameterEncode.equals(";")&& searchParameterEncode.contains(";")) {
            String[] searchparameter = searchParameterEncode.split(";");

            int parameterSizeLength = searchparameter.length;
            if(parameterSizeLength>1){
                list = employeeService.getEmpOfficeByPage(pageNumber, displayLength,searchparameter,officeId);
            }
            else {
                list = employeeService.getEmpOfficeByPage(pageNumber, displayLength, searchparameter[0],officeId);
            }
        }
        else {
            list = employeeService.getEmpOfficeByPage(pageNumber, displayLength,officeId);
        }
        JSONObject obj=new JSONObject();
        obj.put("iTotalRecords", employeeService.getCount());
        obj.put("iTotalDisplayRecords", employeeService.getCount());
        obj.put("aaData",list);
        //return list2;
        return obj;
    }





//    @RequestMapping(value = "empadd",method = RequestMethod.POST)
//    public void addEmp(@Valid @ModelAttribute("employee") EmployeeDTO employeeDTO){
//        int i=01;
//    }

}
