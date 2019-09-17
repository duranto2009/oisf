package com.revesoft.springboot.web.configuration;

import java.util.regex.Pattern;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.security.web.util.matcher.RequestMatcher;

/**
 *
 * @author maruf
 */
@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Value("${security.csrf}")
    public boolean CSRF_CHECK;

    @Override
    protected void configure(HttpSecurity http) {
        try {
            http.cors();
            if (!CSRF_CHECK) {
                http.headers().xssProtection();
                http.csrf().disable();
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    @Override
    public void configure(WebSecurity web) {
        web.ignoring().antMatchers("/resources/**", "/assets/**", "/static/**", "/error");
    }




    static class CSRFBypasstMatcher implements RequestMatcher {

        private Pattern allowedMethods = Pattern.compile("^GET$");
        private AntPathRequestMatcher[] requestMatchers = {
            new AntPathRequestMatcher("/api/**")
        };

        @Override
        public boolean matches(HttpServletRequest request) {
            if (allowedMethods.matcher(request.getMethod()).matches()) {
                return false;
            }

            for (AntPathRequestMatcher apm : requestMatchers) {
                if (apm.matches(request)) {
                    return false;
                }
            }

            return true;
        }
    }
}
