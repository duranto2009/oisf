package com.revesoft.springboot.web.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class UserProfileService {
    @Autowired
    private UserProfileDAO  userProfileDAO;
    public ArrayList<String> allSecurityQuestions(){
        ArrayList<String>questions=new ArrayList<>();
        try {
            questions=userProfileDAO.securityTemplate();
        }catch (Exception e){
            e.printStackTrace();
        }
        return questions;
    }



    public UserProfileDTO allInfo(long userId){
        UserProfileDTO userProfileDTO=new UserProfileDTO();
        try {
            userProfileDTO=userProfileDAO.getUser(userId);
        }catch (Exception e){
            e.printStackTrace();
        }
        return userProfileDTO;
    }
    public UserProfileDTO allInfo(String userName){
        UserProfileDTO userProfileDTO=new UserProfileDTO();
        try {
            userProfileDTO=userProfileDAO.getUser(userName);
        }catch (Exception e){
            e.printStackTrace();
        }
        return userProfileDTO;
    }

    public String securityQuestion(String userName){
        String security="";
        try {
            security=userProfileDAO.getSecurityQuestion(userName);
        }catch (Exception e){
            e.printStackTrace();
        }
        return security;
    }


    public String securityQuestionAns(String userName){
        String securityAns="";
        try {
            securityAns=userProfileDAO.getSecurityQuestionAns(userName);
        }catch (Exception e){
            e.printStackTrace();
        }
        return securityAns;
    }


    public String getEmail(String userName) throws Exception {
        String email="";
        try {
            email=userProfileDAO.getEmail(userName);
        }catch (Exception e){
            e.printStackTrace();
        }
        return email;
    }
    public void setUid(String uid,String userName,String email) throws Exception {
        try {
           userProfileDAO.setUid(uid,userName,email);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    public UserPassRecoveryDTO getUserInfo(String uid) throws Exception {
        UserPassRecoveryDTO userPassRecoveryDTO=new UserPassRecoveryDTO();
        try {
            userPassRecoveryDTO=userProfileDAO.getUserInfo(uid);
        }catch (Exception e){
            e.printStackTrace();
        }
        return userPassRecoveryDTO;
    }

    public long getEmpId(long userId){
        long employeeId=-1;
        try {
            employeeId=userProfileDAO.getEmployeeId(userId);
        }catch (Exception e){
            e.printStackTrace();
        }
        return employeeId;
    }
    public long getEmpId(String userName){
        long employeeId=-100;
        try {
            employeeId=userProfileDAO.getEmployeeId(userName);
        }catch (Exception e){
            e.printStackTrace();
        }
        return employeeId;
    }

    public long getOrgId(long employeeId){
        long orgId=-1;
        try {
            orgId=userProfileDAO.getOrgId(employeeId);
        }catch (Exception e){
            e.printStackTrace();
        }
        return orgId;
    }


    public void setSecurityQuestions(long userId,String questions,String ans,String questions2,String ans2){

        try {
            userProfileDAO.setSecurityQues(userId,questions,ans,questions2,ans2);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    public void setImage(int userId,String path,int imageType){

        try {
            userProfileDAO.setImage(userId,path,imageType);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public void updateUserInfo(Long employeeId, String name, String value) {
        try{
            userProfileDAO.updateUserInfo(employeeId,name,value);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public void updateForgetPassword(String username, String password) {
        try {
            userProfileDAO.updateForgetPassword(username,password);
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    public void updatePassword(String username, String password) {
        try {
            userProfileDAO.updatePassword(username,password);
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}
