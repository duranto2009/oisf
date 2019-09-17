package com.revesoft.springboot.web.configuration;

import com.revesoft.springboot.web.auth.SessionUtil;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@Component
public class RequestInterceptor extends HandlerInterceptorAdapter {

    @Value("${security.authentication}")
    public boolean AUTH_CHECK;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object object) throws Exception {
        System.out.println(" ++++++++++++++++++++++++++++++++++ test 1234 URI: " + request.getRequestURI());
        System.out.println(" ++++++++++++++++++++++++++++++++++ test 1234 URI: " + request.getRequestURI());
        System.out.println(" ++++++++++++++++++++++++++++++++++ URL: " + request.getRequestURL().toString());

        if (!AUTH_CHECK) {
            System.out.println(" ++++++++++++++++++++++++++++++++++ not check auth");
            return true;
        }

        for (AntPathRequestMatcher allowed_url : ConfigConstant.ALLOWED_URLS) {
            if (allowed_url.matches(request)) {
                System.out.println(" ++++++++++++++++++++++++++++++++++ allowed url");
                return true;
            }
        }

        if (SessionUtil.isLoggedIn(request)) {
            System.out.println(" ++++++++++++++++++++++++++++++++++ logged in");
            return true;
        }

        System.out.println(" ++++++++++++++++++++++++++++++++++ redirect to login");
        response.sendRedirect(ConfigConstant.LOGIN_PAGE_URL);
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object object, ModelAndView model) throws Exception {
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object object, Exception arg3) throws Exception {
    }
}
