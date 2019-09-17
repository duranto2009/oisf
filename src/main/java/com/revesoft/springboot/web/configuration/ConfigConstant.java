package com.revesoft.springboot.web.configuration;

import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.stereotype.Component;

/**
 *
 * @author maruf
 */
@Component
public class ConfigConstant {

    public static final String HOME_PAGE_URL = "/";
    public static final String LOGIN_PAGE_URL = "/login";
    public static final String LOGGED_IN_SESSION_KEY = "isLoggedIn";
    public static final String LOGGED_IN_USER_NAME = "loggedInUserName";
    public static final String SSO_RESPONSE_DTO = "ssoResponseDTO";

    public static final AntPathRequestMatcher[] ALLOWED_URLS = {
        new AntPathRequestMatcher("/resources/**"),
        new AntPathRequestMatcher("/assets/**"), 
        new AntPathRequestMatcher("/static/**"),
        new AntPathRequestMatcher("/error/**"),
        new AntPathRequestMatcher("/jwtSSO"),
        new AntPathRequestMatcher("/portal/**"),
        new AntPathRequestMatcher("/serviceregistration/**"),
        new AntPathRequestMatcher("/loginWithIdp"),
        new AntPathRequestMatcher("/idpSSO"),
        new AntPathRequestMatcher("/getDashboardLoginInfo"),
        new AntPathRequestMatcher("/interapplogin"),
        new AntPathRequestMatcher("/iALoginReqInfoAjax"),
        new AntPathRequestMatcher("/applogin"),
        new AntPathRequestMatcher("/passrecovery"),
        new AntPathRequestMatcher("/recover/*"),
        new AntPathRequestMatcher("/api/**"),
        new AntPathRequestMatcher(ConfigConstant.HOME_PAGE_URL),
        new AntPathRequestMatcher(ConfigConstant.LOGIN_PAGE_URL)
    };
}