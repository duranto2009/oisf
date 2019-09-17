package com.revesoft.springboot.web.auth;

import java.util.Map;

public interface AuthDAO {

    public Map getIdPasswordByUsername(String username);

    public Map getSystemInfo(int userId);

    public Map getSystemInfo(String username);

    public String getSharedSecret(int userId);

    public String getSharedSecret(String userName);

    public boolean updateSharedSecret(int userId, String sharedSecret);

    public String getAPIToken(String userName);

    public String getAPIToken(int uid);

    public boolean updateAPIToken(String username, String api_token);

    public boolean updateAPIToken(int uid, String api_token);
}
