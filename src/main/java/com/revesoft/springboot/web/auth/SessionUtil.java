package com.revesoft.springboot.web.auth;

import com.revesoft.springboot.web.configuration.ConfigConstant;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Component;

/**
 * Provides HttpSession related utility functionalities
 *
 * @author maruf hamidi
 *
 */
@Component
public class SessionUtil {

    private static final String LOG_IN_KEY = ConfigConstant.LOGGED_IN_SESSION_KEY;
    private static final String SESSION_UID_KEY = "ssuid";

    /**
     * Checks if the use session is logged in
     *
     * @param request http request object
     * @return true if logged in, else false
     */
    public static boolean isLoggedIn(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session == null) {
            return false;
        }
        Object obj = session.getAttribute(LOG_IN_KEY);
        if (obj == null) {
            return false;
        }

        int login;
        try {
            //login = (Integer) obj;
            login = Integer.parseInt((String)obj);
            System.out.println(" ----------------  inside Session Util .java : value of login : " + login);
            if (login == 1) {
                return true;
            }
        } catch (ClassCastException ccex) {
            ccex.printStackTrace();
        }

        return false;
    }

    /**
     * Initializes the http session with the necessary session info
     *
     * @param request http request object
     */
    public static void initSession(HttpServletRequest request, int uid) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            destroySession(request);
        }

        session = request.getSession(true);
        session.setAttribute(LOG_IN_KEY, 1);
        session.setAttribute(SESSION_UID_KEY, uid);
    }

    /**
     * Destroys the current http session only
     *
     * @param request http request object
     */
    public static void destroySession(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
    }

    public static int getSessionUserId(HttpServletRequest request) {
        int uid = -1;
        HttpSession session = request.getSession(false);
        if (session != null) {
            Object uidObj = session.getAttribute(SESSION_UID_KEY);
            if (uidObj != null) {
                try {
                    uid = (Integer) uidObj;
                } catch (Exception ex) {
                    uid = -1;
                }
            }
        }

        return uid;
    }

    public static void setSessionVariable(HttpServletRequest request, String key, String value) {
        HttpSession session = request.getSession(true);
        session.setAttribute(key, value);
    }
}
