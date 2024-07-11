package com.store.meonggae.user.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.store.meonggae.user.login.domain.LoginDomain;
import com.store.meonggae.user.login.service.LoginService;

@Controller
public class SocialLoginController {
    @Autowired
    private LoginService loginService;

    @GetMapping("/login_page/kakao_test.do")
    public String kakaoLogin(@RequestParam("code") String code, HttpServletRequest request, RedirectAttributes redirectAttributes) throws Exception {
        Map<String, Object> tokenResponse = loginService.getKaKaoAccessToken(code, request);
        String accessToken = (String) tokenResponse.get("access_token");
        LoginDomain user = loginService.getKaKaoUserInfo(accessToken);
        
        HttpSession session = request.getSession();
        session.setAttribute("user", user);
        session.setAttribute("user_nick", user.getNick());
        session.setAttribute("access_token", accessToken);

        redirectAttributes.addFlashAttribute("user", user);

        return "redirect:/index.do";
    }
    
    @GetMapping("/logout.do")
    public String logout(HttpSession session, SessionStatus ss, HttpServletRequest request) {
        String accessToken = (String) session.getAttribute("access_token");
        if (accessToken != null) {
            try {
                loginService.kakaoLogOut(accessToken, request);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        session.invalidate();
        ss.setComplete();
        return "redirect:/index.do";
    }
}