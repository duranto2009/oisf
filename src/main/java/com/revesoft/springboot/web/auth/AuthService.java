package com.revesoft.springboot.web.auth;

import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AuthService {

    public static final int DEFAULT_SECRET_LENGTH = 255;
    public static final int DEFAULT_API_TOKEN_LENGTH = 31;

    @Autowired
    private AuthDAO authDAO;

    public boolean isCredentialValid(String username, String passwordPlain) {
        Map idPasswordHash = authDAO.getIdPasswordByUsername(username);
        if (idPasswordHash != null) {
            return SecurityUtil.checkPassword(passwordPlain, (String) idPasswordHash.get("password"));
        }
        return false;
    }

    public int getValidUserId(String username, String passwordPlain) {
        Map idPasswordHash = authDAO.getIdPasswordByUsername(username);
        if (idPasswordHash != null) {
            if (SecurityUtil.checkPassword(passwordPlain, (String) idPasswordHash.get("password"))) {
                return (Integer) idPasswordHash.get("id");
            }
        }

        return -1;
    }

    public String requestLogin(HttpServletRequest request, String username, String password) {
        String loginSuccess;
        int id = getValidUserId(username, password);
        if (id > 0) {
            if (request != null) {
                SessionUtil.initSession(request, id);
            }
            loginSuccess = "1";
        } else {
            loginSuccess = "0";
        }
        return loginSuccess;
    }

    public Map getSystemInfo(HttpServletRequest request) {
        int uid = SessionUtil.getSessionUserId(request);
        if (uid < 1) {
            return null;
        }
        return authDAO.getSystemInfo(uid);
    }

    public String getSharedSecret(int uid) {
        return authDAO.getSharedSecret(uid);
    }

    public String updateSharedSecret(int uid) {
        String sharedSecret = SecurityUtil.generateRandomString(DEFAULT_SECRET_LENGTH);
        String updated;
        if (authDAO.updateSharedSecret(uid, sharedSecret)) {
            updated = "1";
        } else {
            updated = "0";
        }
        return updated;
    }

    public String generateAPIToken(int uid) {
        String api_token = SecurityUtil.generateRandomString(DEFAULT_API_TOKEN_LENGTH);
        String updated;
        if (authDAO.updateAPIToken(uid, api_token)) {
            updated = "1";
        } else {
            updated = "0";
        }
        return updated;
    }

    public String getAPIToken(int uid) {
        return authDAO.getAPIToken(uid);
    }
}
