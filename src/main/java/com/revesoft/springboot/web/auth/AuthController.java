package com.revesoft.springboot.web.auth;

import java.util.Map;
import org.springframework.ui.Model;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping({"/auth"})
public class AuthController {

    private final String MOD = "/auth/";

    @Autowired
    private AuthService authService;

    @GetMapping({"/", "", "/index", "/home"})
    public String index(HttpServletRequest request, Model model) {
        if (!SessionUtil.isLoggedIn(request)) {
            //return "redirect:" + MOD + "login";
        }

        Map map = authService.getSystemInfo(request);
        if (map != null) {
            model.addAllAttributes(map);
        }
        return MOD + "index";
    }

    @RequestMapping(value = "login", method = RequestMethod.GET)
    public String login(HttpServletRequest request) {
        if (SessionUtil.isLoggedIn(request)) {
            return "redirect:" + MOD;
        } else {
            return MOD + "login";
        }
    }

//    @RequestMapping(value = "logout", method = RequestMethod.GET)
//    public String logout(HttpServletRequest request) {
//        SessionUtil.destroySession(request);
//        return "redirect:" + MOD + "login";
//    }

    @ResponseBody
    @RequestMapping(value = "verifyLogin", method = RequestMethod.POST)
    public String verifyLogin(HttpServletRequest request) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        return authService.requestLogin(request, username, password);
    }

    @ResponseBody
    @RequestMapping(value = "getSharedSecret", method = RequestMethod.GET)
    public String getSharedSecret(HttpServletRequest request) {
        if (!SessionUtil.isLoggedIn(request)) {
            return null;
        }

        int uid = SessionUtil.getSessionUserId(request);
        if (uid < 1) {
            return null;
        }

        return authService.getSharedSecret(uid);
    }

    @ResponseBody
    @RequestMapping(value = "updateSharedSecret", method = RequestMethod.POST)
    public String updateSharedSecret(HttpServletRequest request) {
        if (!SessionUtil.isLoggedIn(request)) {
            return null;
        }

        int uid = SessionUtil.getSessionUserId(request);
        if (uid < 1) {
            return null;
        }

        return authService.updateSharedSecret(uid);
    }
}
