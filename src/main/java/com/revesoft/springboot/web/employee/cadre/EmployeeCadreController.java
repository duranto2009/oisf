package com.revesoft.springboot.web.employee.cadre;

import com.revesoft.springboot.web.employee.records.EmployeeDTO;
import com.revesoft.springboot.web.employee.records.EmployeeService;
import com.revesoft.springboot.web.util.URLAccessController;
import org.jose4j.json.internal.json_simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * Created by Bony on 11/2/2017.
 */
@RestController
public class EmployeeCadreController {


    @Autowired
    EmployeeCadreService employeeCadreService;

    @Autowired
    URLAccessController urlAccessController;



    @RequestMapping(value = "empcadre",method = RequestMethod.GET)
    public ModelAndView showCadre(HttpServletRequest request, RedirectAttributes redirectAttributes,@RequestParam int menuid){
        ModelAndView caderShow =  new ModelAndView();
        boolean hasAccess=urlAccessController.hasAccessPermission(request,menuid,"empcadre");
        if(!hasAccess){
            // modelAndView.addObject("forbidden",1);
            redirectAttributes.addFlashAttribute("forbidden", 1);
            caderShow.setViewName("redirect:userdashboard");

        }else {
            caderShow.addObject("menuid",menuid);
            request.getSession().setAttribute("cadermenuid",menuid);
            caderShow.setViewName("employee/empcadre");

        }

        return caderShow;
    }

    @RequestMapping(path= "/cadrepage")
    @ResponseBody
    JSONObject empCadrePage(HttpServletRequest request, HttpServletResponse response) {

        Integer pageNumber = 0;
        if (null != request.getParameter("iDisplayStart"))
            pageNumber = (Integer.valueOf(request.getParameter("iDisplayStart"))/Integer.valueOf(request.getParameter("iDisplayLength")))+1;

        //Fetch search parameter
        String searchParameter = request.getParameter("sSearch");
        Integer pageDisplayLength =0;
        //Fetch Page display length
        if(request.getParameter("iDisplayLength") !=null)pageDisplayLength = Integer.valueOf(request.getParameter("iDisplayLength"));

        //EmployeeService employeeService = new EmployeeService();
        int size;
        size=employeeCadreService.getSize("employee_cadres");
        ArrayList<EmployeeCadreDTO> list=new ArrayList<>();

        if(pageDisplayLength == 0 || pageDisplayLength==null)
            list = employeeCadreService.getEmpCadreByPage(1,10);
        else list = employeeCadreService.getEmpCadreByPage(pageNumber,pageDisplayLength);

        EmployeeCadreDTO list2[] = new EmployeeCadreDTO[list.size()];
        list2 = list.toArray(list2);

        JSONObject obj=new JSONObject();
        obj.put("iTotalRecords", size);
        obj.put("iTotalDisplayRecords", size);
        obj.put("aaData",list.toArray());
        //return list2;

        return obj;
    }

    @RequestMapping(value = "empcadreadd",method = RequestMethod.GET)
    public ModelAndView empCadreAddGet(HttpServletRequest request,RedirectAttributes redirectAttributes){

        String menuid = request.getSession().getAttribute("cadermenuid").toString();
        ModelAndView mv = new ModelAndView();
        boolean hasAccess=urlAccessController.hasAccessPermission(request,null,"empcadreadd");
        if(!hasAccess){
            // modelAndView.addObject("forbidden",1);
            redirectAttributes.addFlashAttribute("forbidden", 1);
            mv.setViewName("redirect:userdashboard");

        }else {
            mv.addObject("menuid",menuid);
            mv.setViewName("employee/empcadreadd");
        }

        return mv;
    }


    @RequestMapping(value = "empcadreadd", method = RequestMethod.POST)
    public RedirectView empCaderAddPost(
            @RequestParam String cadreNameBng,
            @RequestParam String cadreNameEng,
            HttpServletRequest request

    ) throws Exception {
        EmployeeCadreDTO employeeCadreDTO = new EmployeeCadreDTO();
        employeeCadreDTO.setCadreNameBng(cadreNameBng);
        employeeCadreDTO.setCadreNameEng(cadreNameEng);
        employeeCadreService.addEmployeeCadre(employeeCadreDTO);

        return new RedirectView("empcadre?menuid="+request.getSession().getAttribute("cadermenuid"));
    }

    @RequestMapping(value = "editempcadre", method = RequestMethod.POST)
    public ModelAndView empCaderEditPage(
            @RequestParam int id,
            @RequestParam String cadreNameEng,
            @RequestParam String cadreNameBng,
            HttpServletRequest request
    ){

        String menuid = request.getSession().getAttribute("cadermenuid").toString();
        ModelAndView mv = new ModelAndView("employee/empcadreedit");
        mv.addObject("menuid",menuid);
        EmployeeCadreDTO employeeCadreDTO = new EmployeeCadreDTO();
        employeeCadreDTO.setCadreNameBng(cadreNameBng);
        employeeCadreDTO.setCadreNameEng(cadreNameEng);
        employeeCadreDTO.setId(id);
        mv.addObject("cadre",employeeCadreDTO);
        return mv;


    }
    @RequestMapping(value = "empcadreedit", method = RequestMethod.POST)
    public RedirectView empCaderEdit(
            @RequestParam int id,
            @RequestParam String cadreNameEng,
            @RequestParam String cadreNameBng,
            HttpServletRequest request
    ) throws Exception {

        EmployeeCadreDTO employeeCadreDTO = new EmployeeCadreDTO();
        employeeCadreDTO.setCadreNameBng(cadreNameBng);
        employeeCadreDTO.setCadreNameEng(cadreNameEng);
        employeeCadreDTO.setId(id);
        employeeCadreService.updateEmployeeCadre(employeeCadreDTO);




        return new RedirectView("empcadre?menuid="+request.getSession().getAttribute("cadermenuid"));


    }

    @RequestMapping(value = "empcadredelete", method = RequestMethod.POST)
    public RedirectView empCadreDelete(
            @RequestParam int id,
            HttpServletRequest request
    ) throws Exception {
        employeeCadreService.deleteEmployeeCadre(id);
        return new RedirectView("empcadre?menuid="+request.getSession().getAttribute("cadermenuid"));
    }





}
