/**
 * @(#)LoginAction.java
 * @author <>
 * @history
 *          created : <>  Date : MMM-DD-YYYY <venue>
 * @version <>
 *
 * Copyright <YYYY> <company>.
 *
 * All rights reserved.
 *
 * This software is the confidential and proprietdary information
 * of <company>("Confidential Information").
 * You shall not disclose such Confidential Information and shall use
 * it only in accordance with the terms of the license agreement
 * you entered into with <company>.
 *
 */

package com.revesoft.springboot.web.login;
import javax.servlet.http.HttpServletRequest;
import java.io.*;
import org.apache.log4j.*;

public class LoginAction
{

  static Logger logger = Logger.getLogger(LoginAction.class.getClass());
  private static boolean initializeStatus = false;
 
  
  public synchronized void initializeiTelBilling(HttpServletRequest p_request)
  {
    if (initializeStatus == false)
    {
    	
      PropertyConfigurator.configure("log4j.properties");
      
      String realContextPath = p_request.getSession().getServletContext().getRealPath("");
      File realContextPathFile = new File(realContextPath);
      initializeStatus = true;
    }
  }
  
  public void execute(String userName, String password)
  {
      System.out.println("--------------------------------------------------------------------------------------------------------------------------------------");
      System.out.println("inside login action class : " +  " userName : " + userName + "  password : " + password + " \n\n");

/*	if (initializeStatus == false)
    {
      initializeiTelBilling(p_request);
    }*/

    String target = "home";

/*    String mailPass = p_request.getParameter("mailPassword");
    if( mailPass != null && mailPass.equals("1"))
    {
      logger.debug("Value of mailPassword:" + mailPass);
      target = "mailPassword";
      return (p_mapping.findForward(target));
    }*/

    /*LoginForm form = (LoginForm) p_form;
    LoginService service = new LoginService();
    LoginDTO dto = new LoginDTO();

    dto.setLoginSourceIP(p_request.getRemoteAddr());
    dto.loginPort=p_request.getRemotePort();
    
    dto.setUsername(form.getUsername());
    dto.setPassword(form.getPassword());
    dto.setLoginURL(form.getLoginURL());
    
   // String languageID = p_request.getParameter("language");
    
    if(languageID == null)
      languageID = "2";
    dto.setLanguageID(Integer.parseInt(languageID));
    String webRoot = p_request.getParameter("web_root");
    if( webRoot != null)
    {
      dto.setWebRoot(webRoot);
    }

    String genericPage = p_request.getParameter("generic_page");
    if(genericPage != null)
    {
      dto.setGenericPage(genericPage);
    }


    try
    {
    	
*//*    boolean isBlackList=BlackAndWhiteListIpRepository.getInstance().isBlackListedIP(dto.getLoginSourceIP());
    if(isBlackList)
    {
    	logger.debug("Got Login Request from Black Listed ip:"+dto.getLoginSourceIP());
    
    	service.logUnAuthorizeRequest(dto.getLoginSourceIP(), dto.getUsername());
    	target = "actionError";
    	ActionErrors errors = new ActionErrors();
        errors.add("loginFailure", new ActionError("error.loginblocked"));
        saveErrors(p_request, errors);
            	 
    }
    else*//*
    
    	dto = service.validateUser(dto);


    	int useOTPToken = 1;
  	    try{
  	  	    useOTPToken = Integer.parseInt(RadiusConfiguration.getInstance().getConfigurationValue(RadiusConfigurationConstants.ENABLE_OTP_TOKEN));
  	    }catch(Exception ex){}
    	if (dto == null)
    	{
    		logger.debug("Invalid Login");

    		if( webRoot != null)
    		{
    			target = "web_root";
    			p_request.getSession(true).setAttribute("web_root",webRoot);
    		}
    		else
    			target = "actionError";
    
    		    if(useOTPToken==0)		
    		    {
    		    	UserDTO userDTO=UserRepository.getInstance().getUserByUserName(form.getUsername());
    		    	if(userDTO!=null)
    		    	{
    		    		logger.debug("Retry time left is"+userDTO.retryTimeLeft);
    		    		p_request.getSession(true).setAttribute("retryLeft",""+userDTO.retryTimeLeft);
    		    	}
    		    }
    		
    		ActionErrors errors = new ActionErrors();
    		errors.add("loginFailure", new ActionError("error.loginfailure"));
    		saveErrors(p_request, errors);
    		
    		 billingactivity.BillingActivityManager.getInstance().addBillingActivityLog(billingactivity.BillingActivityConstants.ACTION_INVALID_LOGIN,billingactivity.BillingActivityConstants.LOGIN_MODULE,form.getUsername(),form.getUsername(),System.currentTimeMillis(),"Login Failed",p_request.getRemoteAddr());
    		 try
    	      {
    	      	Thread.sleep(5000);
    	      }catch(Exception ex){}
    	}
    	else
    	{
    	  logger.debug("Login Accepted");
    	  
    	  if(dto.callShopID>-1)
    	  {
    		  target="operatorhome";
    		  p_request.getSession(true).setAttribute(SessionConstants.USER_LOGIN,dto);
    	  }
    	  else
    	  {

    	  logger.debug("get OTP serial :"+dto.getOTPSerial());

    	  if(useOTPToken ==1&&dto.getOTPSerial()!=null)
    	  {
    		  logger.debug("User have Token");
        	target = "getOTPToken";
        	p_request.getSession(true).setAttribute(SessionConstants.USER_OTP_TOKEN,dto);        	
    	  }
    	*//*   else if(BadUserNameRepository.getInstance().isBadUserName(dto.getUsername())||dto.getpasswordExpirationType()==UserDTO.PASSWORD_CHANGE_NEXT_LOGIN ||(dto.getpasswordExpirationType()==UserDTO.PASSWORD_CHANGE_AFTER_30_DAYS && dto.getpasswordExpirationTime()<=System.currentTimeMillis()) )
      	  {
          	
          	target="changePassword";
          	p_request.getSession(true).setAttribute(SessionConstants.USER_PASSWORD_CHANGE,dto);      
      	  }
      	*//*
    	  else
        	p_request.getSession(true).setAttribute(SessionConstants.USER_LOGIN,dto);
    	    
    	    if(dto.getRoleID()==1){
            	target="superHome";  // if login account is Superadmin then redirect to super admin home page
            }
    	    
    	  }
    	  billingactivity.BillingActivityManager.getInstance().addBillingActivityLog(billingactivity.BillingActivityConstants.ACTION_VALID_LOGIN,billingactivity.BillingActivityConstants.LOGIN_MODULE,form.getUsername(),form.getUsername(),System.currentTimeMillis(),"Login Successful",p_request.getRemoteAddr());

    	}
    
        logger.debug("Remote Address :" + p_request.getRemoteAddr());
    }
    catch (Exception e)
    {
      logger.fatal("Exception during login", e);
      target = "failure";
      SessionManager.setFailureMessage(p_request, e.toString());
     
    }
    
    return (p_mapping.findForward(target));*/
  }
}
