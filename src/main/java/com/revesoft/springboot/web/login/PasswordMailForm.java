package com.revesoft.springboot.web.login;

/**
* @(#)PasswordMailForm.java
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






public class PasswordMailForm
{
        private String m_username;
        private String m_mailAddress;
        private String m_phoneNumber;

        public PasswordMailForm()
        {
        }

        public String getUsername()
        {
                return m_username;
        }

        public void setUsername(String p_username)
        {
                m_username = p_username;
        }

        public String getMailAddress()
        {
                return m_mailAddress;
        }

    
        public void setMailAddress(String p_mailAddress)
        {
                m_mailAddress = p_mailAddress;
        }
        public void setPhoneNumber(String p_phoneNumber)
        {
                m_phoneNumber = p_phoneNumber;
        }
        public String getPhoneNumber()
        {
                return m_phoneNumber;
        }

/*        public void reset(ActionMapping p_mapping,HttpServletRequest p_request)
        {
        }

        public ActionErrors validate(ActionMapping p_mapping,HttpServletRequest p_request)
        {
                ActionErrors errors = new ActionErrors();

                if(false)
                {
                        errors.add("  ", new ActionError("error.key.  "));
                }
                return errors;
        }*/
}
