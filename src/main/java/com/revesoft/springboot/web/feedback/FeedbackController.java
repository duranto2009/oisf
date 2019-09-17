package com.revesoft.springboot.web.feedback;

import com.revesoft.springboot.web.model.SQLStatementCreator;
import com.revesoft.springboot.web.util.AllTable;
import org.jose4j.json.internal.json_simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

@RestController
public class FeedbackController {

    @Autowired FeedbackService feedbackService;

    @RequestMapping(value = "feedback")
    public ModelAndView feddbackPage(@RequestParam int menuid){
        ModelAndView modelAndView = new ModelAndView("feedback/feedbacklist");
        modelAndView.addObject("menuid",menuid);
        return modelAndView;
    }

    @RequestMapping(path = "/feedbackdata")
    public JSONObject feddbackData(HttpServletRequest request, HttpServletResponse response) throws Exception {

        Integer pageNumber = 0;
        if (null != request.getParameter("iDisplayStart"))
            pageNumber = (Integer.valueOf(request.getParameter("iDisplayStart"))/10)+1;

        //Fetch search parameter
        String searchParameter = request.getParameter("sSearch");
        Integer pageDisplayLength =0;
        //Fetch Page display length
        if(request.getParameter("iDisplayLength") !=null)pageDisplayLength = Integer.valueOf(request.getParameter("iDisplayLength"));

        ArrayList<FeedbackDTO> List;

        List = feedbackService.getFeedback();


        int i=new SQLStatementCreator().tableDatacount(AllTable.TBL_PORTAL_FEEDBACK);
        JSONObject obj=new JSONObject();
        obj.put("iTotalRecords",i);
        obj.put("iTotalDisplayRecords",i);
        obj.put("aaData",List.toArray());



        return obj;
    }
}
