package com.revesoft.springboot.web.feedback;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
@Service
public class FeedbackService {
    @Autowired FeedbackDAO feedbackDAO;

    public ArrayList<FeedbackDTO> getFeedback() throws Exception {
        ArrayList<FeedbackDTO> data = new ArrayList();
        try {
           data=feedbackDAO.getFeedback();
        }catch (Exception e){
            e.printStackTrace();
        }
        return data;

    }
}
