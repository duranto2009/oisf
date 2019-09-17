package com.revesoft.springboot.web.employee.batch;

import com.revesoft.springboot.web.util.URLAccessController;
import org.jose4j.json.internal.json_simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

@RestController
public class EmployeeBatchController {


    @Autowired
    EmployeeBatchService employeeBatchService;
    @Autowired
    URLAccessController urlAccessController;


    @RequestMapping(value = "empbatch",method = RequestMethod.GET)
    public ModelAndView showBatch(HttpServletRequest request, RedirectAttributes redirectAttributes,
                                  @RequestParam int menuid){
        ModelAndView batchShow = new ModelAndView();
        boolean hasAccess=urlAccessController.hasAccessPermission(request,menuid,"empbatch");
        if(!hasAccess){
            // modelAndView.addObject("forbidden",1);
            redirectAttributes.addFlashAttribute("forbidden", 1);
            batchShow.setViewName("redirect:userdashboard");

        }else {
            batchShow.addObject("menuid",menuid);
            request.getSession().setAttribute("batchmenuid",menuid);
            batchShow.setViewName("employee/empbatch");
        }

        return batchShow;
    }


    @RequestMapping(path= "/batchpage")
    @ResponseBody
    JSONObject empBatchPage(HttpServletRequest request, HttpServletResponse response) {

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
        size=employeeBatchService.getSize("employee_batches");
        ArrayList<EmployeeBatchDTO> list=new ArrayList<>();

        if(pageDisplayLength == 0 || pageDisplayLength==null)
            list = employeeBatchService.getEmpBatchByPage(1,10);
        else list = employeeBatchService.getEmpBatchByPage(pageNumber,pageDisplayLength);

        EmployeeBatchDTO list2[] = new EmployeeBatchDTO[list.size()];
        list2 = list.toArray(list2);

        JSONObject obj=new JSONObject();
        obj.put("iTotalRecords", size);
        obj.put("iTotalDisplayRecords", size);
        obj.put("aaData",list.toArray());
        //return list2;

        return obj;
    }

    @RequestMapping(value = "empbatchadd", method = RequestMethod.GET)
    public ModelAndView empBatchAddGet(HttpServletRequest request,RedirectAttributes redirectAttributes){

        String menuid = request.getSession().getAttribute("batchmenuid").toString();
        ModelAndView mv = new ModelAndView();
        boolean hasAccess=urlAccessController.hasAccessPermission(request,null,"empbatchadd");
        if(!hasAccess){
            // modelAndView.addObject("forbidden",1);
            redirectAttributes.addFlashAttribute("forbidden", 1);
            mv.setViewName("redirect:userdashboard");

        }else {
            mv.addObject("menuid",menuid);
            mv.setViewName("employee/empbatchadd");
        }

        return mv;
    }


    @RequestMapping(value = "empbatchadd", method = RequestMethod.POST)
    public RedirectView empBatchAddPost(
            @RequestParam String batchNo,
            @RequestParam String batchYear,
            HttpServletRequest request
    ) throws Exception {
        EmployeeBatchDTO employeeBatchDTO = new EmployeeBatchDTO();
        employeeBatchDTO.setBatchNo(batchNo);
        employeeBatchDTO.setBatchYear(batchYear);
        employeeBatchService.addEmployeeBatch(employeeBatchDTO);
        return new RedirectView("empbatch?menuid="+request.getSession().getAttribute("batchmenuid"));
    }

    @RequestMapping(value = "editempbatch", method = RequestMethod.POST)
    public ModelAndView empBatchEditGetPage(RedirectAttributes redirectAttributes,
            @RequestParam int id,
            @RequestParam String batchNo,
            @RequestParam String batchYear,
            HttpServletRequest request

    ){
        String menuid = request.getSession().getAttribute("batchmenuid").toString();
        ModelAndView mv = new ModelAndView("employee/empbatchedit");

        boolean hasAccess=urlAccessController.hasAccessPermission(request,null,"editempbatch");
        if(!hasAccess){
            // modelAndView.addObject("forbidden",1);
            redirectAttributes.addFlashAttribute("forbidden", 1);
            mv.setViewName("redirect:userdashboard");

        }else {
            mv.addObject("menuid",menuid);
            EmployeeBatchDTO employeeBatchDTO = new EmployeeBatchDTO();
            int x = 0;
            employeeBatchDTO.setBatchNo(batchNo);
            employeeBatchDTO.setBatchYear(batchYear);
            employeeBatchDTO.setId(id) ;
            mv.addObject("batch",employeeBatchDTO);

        }


        return mv;
    }


    @RequestMapping(value = "empbatchedit", method = RequestMethod.POST)
    public RedirectView empBatchEdit(
            @RequestParam int id,
            @RequestParam String batchNo,
            @RequestParam String batchYear,
            HttpServletRequest request

    ) throws Exception {
        EmployeeBatchDTO employeeBatchDTO = new EmployeeBatchDTO();
        int x = 0;
        employeeBatchDTO.setBatchNo(batchNo);
        employeeBatchDTO.setBatchYear(batchYear);
        employeeBatchDTO.setId(id) ;
        employeeBatchService.updateEmployeeBatch(employeeBatchDTO);
        return new RedirectView("empbatch?menuid="+request.getSession().getAttribute("batchmenuid"));

    }

    @RequestMapping(value = "empbatchdelete", method = RequestMethod.POST)
    public RedirectView empBatchDelete(
            @RequestParam int id,
            HttpServletRequest request
    ) throws Exception {
        employeeBatchService.deleteEmployeeBatch(id);
        return new RedirectView("empbatch?menuid="+request.getSession().getAttribute("batchmenuid"));
    }

}



