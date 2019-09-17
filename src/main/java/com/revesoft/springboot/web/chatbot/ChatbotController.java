package com.revesoft.springboot.web.chatbot;

import com.revesoft.springboot.web.appregistration.MailSender;
import com.revesoft.springboot.web.auth.SecurityUtil;
import com.revesoft.springboot.web.user.UserProfileService;
import org.jose4j.json.internal.json_simple.JSONObject;
import org.jose4j.json.internal.json_simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;

@RestController
public class ChatbotController {

    @Autowired
    UserProfileService userProfileService;

    @Value("${base.uri.oisf}")
    private String baseUri;

    @RequestMapping(value = "passrecovery",method = RequestMethod.POST)
    public JSONObject passRecover(@RequestBody JSONObject request){

        //JSONParser parser = new JSONParser();
       // JSONObject obj = null;
        JSONObject response=new JSONObject();
        try {
            //obj = (JSONObject) parser.parse(request);
            String userText = (String) request.get("user_text");
            LinkedHashMap<String ,ArrayList<String>> mem=(LinkedHashMap) request.get("memory");
//            System.out.println(mem.get("email"));
            ArrayList<String> email=mem.get("email");
            String actionString=(String) request.get("action_string");
            String actionStringSlot="";

            if(request.get("action_requested_slot")!=null){
                LinkedHashMap<String ,String> actString=(LinkedHashMap) request.get("action_requested_slot");

                actionStringSlot =actString.get("name");
            }


            String userName=email.get(0).trim();
            if(actionStringSlot==null|| actionStringSlot==""){


                String securityQues=userProfileService.securityQuestion(userName);
                if(securityQues==""){

                    String[]mail={"email"};

                    response.put("response", "The username you provided does not exist.Please try again!");
                    response.put("invalid_slots",mail );

                }else {
                    response.put("response", "Dear user please answer the following secret question to recover your password : "
                            +securityQues);
                    response.put("action_requested_slot", "secret_question");
                }


            }else if(actionStringSlot.equals("secret_question")){
                String ans=userText;
                String presettedAns=userProfileService.securityQuestionAns(userName);
                if(ans.trim().equals(presettedAns.trim())){
                    String uid= SecurityUtil.generateRandomLengthedString(64);
                    String uri="http://"+baseUri+"/recover?uid="+uid;
                    MailSender mailSender = new MailSender();

                    String from = "oisf.reve@gmail.com";
                    String Subject = "Password recovery mail";


                    String Message = "Dear user a password recovery request is received with " +
                            "your mail please go the following link to recover your passward :\n" ;
                    Message+="<p><a href=\""+uri+"\">Link</a></p>";
//                    Message+="<p><a href=\"https://drive.google.com/open?id=1lr2UYwMCtNQemIQ7hZwScY0iWrKCHpMH\">Cake PHP integration Library</a></P>";




                    try {

                        String to =userProfileService.getEmail(userName) ;
                        if(to!=""){
                            userProfileService.setUid(uid,userName,to);

                            HashMap<String,String > fileMap=new HashMap<>();


                            mailSender.sendMail(from, to, Subject, Message,fileMap);
//                            mailSender.sendMail(from, to, Subject, Message,files);
                            response.put("response","A password recovery link has been send to your mail." +
                                    "Please click the link that are forwarded to your mail");
                        }else
                        {
                            response.put("response", "Can not sent mail because no mail address found for provided username");
                        }

                    } catch (Exception e) {
                        e.printStackTrace();
                    }


                }else{
                    response.put("response", "The security question ans does not match");


                    response.put("action_requested_slot", "secret_question");
                }

            }

            int x=0;
        }catch (Exception e){
            e.printStackTrace();
        }




        return response;
    }

}
